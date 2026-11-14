#!/usr/bin/env bash
# Rerun after the OAuth failure: Send4, then Reveal (snapshot 0feab1d), then compile-check Send3 with -timeout 10.
cd /home/amir/shannon-prover || exit 1
B=full4whs-H6_1_1-H7_0-domino-admits
SN=artifacts/ec4whs/$B/snapshot_0feab1d/Full4WHS
Q=artifacts/ec4whs/queue_domino.log
mark() { echo "=== $(date '+%F %T') $*" | tee -a "$Q"; }
for T in Eq_H6_1_1_H7_0_Send4 Eq_H6_1_1_H7_0_Reveal; do
mark "START pass5 $B TARGET $T"
START=$(stat -c %s "$Q")
systemd-run --user --scope -q -p MemoryMax=2500M -p MemorySwapMax=0 \
  uv run python artifacts/ec4whs/drivers/fill_admits.py \
    --snapshot $SN --out artifacts/ec4whs/$B/runs \
    --model claude-opus-5-5 --effort high --timeout 80 $T.ec:$T \
    2>&1 | tee -a artifacts/ec4whs/$B/fill_admits.log | tee -a "$Q" &
PIPE=$!
while kill -0 $PIPE 2>/dev/null; do
  sleep 30
  if tail -c +$((START+1)) "$Q" | grep -q "Argument list too long"; then
    mark "ABORT $T: prompt exceeds argv limit"
    for p in $(pgrep -f "fill_admits.py.* $T.ec:$T"); do kill $p; done
    sleep 20; break
  fi
done
wait $PIPE
mark "TARGET DONE $T"
done
mark "COMPILE CHECK Eq_H6_1_1_H7_0_Send3 (snapshot 0feab1d, -timeout 10)"
eval "$(uv run python tools/bootstrap_easycrypt.py --print-env)"
( cd $SN && /usr/bin/time -f "%e s, %M KB" systemd-run --user --scope -q -p MemoryMax=2500M -p MemorySwapMax=0 \
    easycrypt compile -timeout 10 -why3 "$SHANNON_WHY3_CONFIG" -I . -I /home/amir/shannon-prover/easycrypt-src/theories Eq_H6_1_1_H7_0_Send3.ec ) \
  > artifacts/ec4whs/$B/send3_compile_0feab1d_t10.log 2>&1
mark "COMPILE DONE Eq_H6_1_1_H7_0_Send3 exit $?"
mark "DONE pass5 $B"
