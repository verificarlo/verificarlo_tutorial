#!/bin/bash
# Compile tchebychev.c using Verificarlo
# Tchebychev polynomial becomes unstable around 1, when computed with
# single precision

set -e
export LC_ALL=C

# Check all arguments
if [ "$#" -ne 4 ]; then
  echo "usage: run.sh [EXPANDED | FACTORED | HORNER | COMPHORNER] [FLOAT | DOUBLE] vprecision mode"
  echo "      vprecision is the MCA Virtual Precision (a positive integer)"
  echo "      mode is MCA Mode, one of [ mca | pb | rr ]"
  exit 1
fi

METHOD=$1
REAL=$2
VERIFICARLO_PRECISION=$3
VERIFICARLO_MCAMODE=$4

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

# Check real
case "${REAL}" in
    FLOAT) ;;
    DOUBLE) ;;
    *)
	echo "Inexisting precision "${REAL}", choose between [FLOAT | DOUBLE]"
	exit 1
esac

# Print options
echo "Verificarlo Precision = $VERIFICARLO_PRECISION, Real Type = $REAL, Method = $METHOD"

# Compile source code with verificarlo (BONUS EXERCICE: for COMPHORNER include eft.c here)
verificarlo -D ${REAL} tchebychev.c -o tchebychev

# Run 20 iterations of tchebychev for all values x in [.5:1.0:.001]
# producing a .tab file with three columns:
#   - i: sample number
#   - x: input value
#   - T: polynomial evaluation on x, T(x)
export VFC_BACKENDS="libinterflop_mca.so --precision-binary32=$VERIFICARLO_PRECISION --precision-binary64=$VERIFICARLO_PRECISION --mode $VERIFICARLO_MCAMODE"


echo "i x t" > ${METHOD}-${REAL}.tab
for x in $(seq 0.0 0.01 1.0); do
    for i in $(seq 1 20); do
      echo $i $(./tchebychev $x $METHOD) >> ${METHOD}-${REAL}.tab
    done
done

# Plot the samples
./plot.py ${METHOD}-${REAL}.tab $VERIFICARLO_PRECISION&
exit
