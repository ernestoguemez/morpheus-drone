#!/usr/bin/env bash
# Lists every placeholder that still needs real content before the site goes public.
# Usage: bash tools/check-placeholders.sh   (run from the repository root)
cd "$(dirname "$0")/.." || exit 1

echo "== Bracketed placeholders =="
grep -rnE "\[(PHOTO|MACRO PHOTO|SCREENSHOT|VIDEO|GITHUB|EMAIL|WEBSITE|GITHUB PAGES)[^]]*\]" docs/index.html README.md

echo
echo "== YouTube embed =="
grep -n 'var FIRST_FLIGHT_ID' docs/index.html

echo
echo "== Photos found in docs/assets/photos =="
for n in frame solder stack config log1_motors log2_menu log2_module log3_cli log3_modes log4_noLift log5_bulb; do
  if [ -f "docs/assets/photos/$n.jpg" ]; then echo "ok       $n.jpg"; else echo "MISSING  $n.jpg"; fi
done

echo
echo "== Betaflight exports =="
for f in betaflight-diff-all.txt betaflight-status.txt; do
  if [ -f "firmware/$f" ]; then echo "ok       firmware/$f"; else echo "MISSING  firmware/$f"; fi
done
