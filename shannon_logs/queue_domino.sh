#!/usr/bin/env bash
# 2026-11-14: fill Domino's admits (outer-proof handoff), one lemma at a time.
cd /home/amir/shannon-prover || exit 1
B=full4whs-H6_1_1-H7_0-domino-admits
Q=artifacts/ec4whs/queue_domino.log
echo "=== $(date '+%F %T') START $B" | tee -a "$Q"
uv run python artifacts/ec4whs/drivers/fill_admits.py \
  --snapshot artifacts/ec4whs/$B/snapshot/Full4WHS --out artifacts/ec4whs/$B/runs \
  --model claude-opus-5-5 --effort high --timeout 80 \
  Eq_H6_1_1_H7_0_AtLeast.ec:Eq_H6_1_1_H7_0_AtLeast \
  SideInv_H6_Reveal.ec:SideInv_H6_Reveal \
  SideInv_H6_Test.ec:SideInv_H6_Test \
  Eq_H6_1_1_H7_0_Reveal.ec:Eq_H6_1_1_H7_0_Reveal \
  Eq_H6_1_1_H7_0_Send2.ec:Eq_H6_1_1_H7_0_Send2 \
  Eq_H6_1_1_H7_0_Send4.ec:Eq_H6_1_1_H7_0_Send4 \
  Eq_H6_1_1_H7_0_Send3.ec:Eq_H6_1_1_H7_0_Send3 \
  2>&1 | tee artifacts/ec4whs/$B/fill_admits.log | tee -a "$Q"
echo "=== $(date '+%F %T') DONE $B (exit ${PIPESTATUS[0]})" | tee -a "$Q"
