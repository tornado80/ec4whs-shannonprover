#!/usr/bin/env bash
# Send4, third try: handed over after 42 commands, memory cap raised to 3 GB (2.5 GB run was OOM-killed at 12:57).
cd /home/amir/shannon-prover || exit 1
B=full4whs-H6_1_1-H7_0-domino-admits
SN=artifacts/ec4whs/$B/snapshot_0feab1d/Full4WHS
Q=artifacts/ec4whs/queue_domino.log
mark() { echo "=== $(date '+%F %T') $*" | tee -a "$Q"; }
for T in Eq_H6_1_1_H7_0_Send4; do
mark "START pass7 $B TARGET $T"
START=$(stat -c %s "$Q")
systemd-run --user --scope -q -p MemoryHigh=2700M -p MemoryMax=3000M -p MemorySwapMax=0 \
  uv run python artifacts/ec4whs/drivers/fill_admits.py \
    --snapshot $SN --out artifacts/ec4whs/$B/runs \
    --model claude-opus-5-5 --effort high --timeout 80 --stop-after 42 $T.ec:$T \
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
mark "DONE pass7 $B"
