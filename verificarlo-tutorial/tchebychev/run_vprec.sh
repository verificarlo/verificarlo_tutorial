#!/bin/bash
# Script to run VPREC backend on polynomial benchmarks

set -e
export LC_ALL=C

# Check all arguments
if [ "$#" -ne 2 ]; then
  echo "usage: run_vprec.sh [EXPANDED | FACTORED | HORNER | COMPHORNER] preset"
  echo "      preset is one of the VPREC presets"
  exit 1
fi

METHOD=$1
VPREC_PRESET=$2
REAL="DOUBLE"

# Check method
case "${METHOD}" in
    EXPANDED) ;;
    FACTORED) ;;
    HORNER) ;;
    COMPHORNER) ;;
    *)
	echo "Inexisting method "$1", choose between [EXPANDED | FACTORED | HORNER | COMPHORNER]"
	exit 1
esac

# Print options
echo "VPREC preset = $VPREC_PRESET, Real Type = $REAL, Method = $METHOD"

# Compile source code with verificarlo (BONUS EXERCICE: for COMPHORNER include eft.c here)
verificarlo -D ${REAL} tchebychev.c -o tchebychev

# Run tchebychev for all values x in [.5:1.0:.001]
# producing a .tab file with three columns:
#   - i: sample number
#   - x: input value
#   - T: polynomial evaluation on x, T(x)
export VFC_BACKENDS="libinterflop_vprec.so $VPREC_PRESET"

echo "i x t" > ${METHOD}-${REAL}.tab
for x in $(seq 0.0 0.01 1.0); do
    # Since VPREC is a deterministic backend only a single run is needed
    echo 1 $(./tchebychev $x $METHOD) >> ${METHOD}-${REAL}.tab
done

# Plot the samples
./plot_vprec.py ${METHOD}-${REAL}.tab $VPREC_PRESET &
exit
