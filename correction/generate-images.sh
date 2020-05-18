mkdir -p ../figs/

MCAMODE=mca
for METHOD in EXPANDED FACTORED HORNER COMPHORNER; do
  REAL="DOUBLE"
  for PREC in 24 53; do
    make clean
    ./run-images.sh $METHOD $REAL $PREC $MCAMODE
    cp $METHOD-$REAL-$PREC.pdf ../figs/
  done
  REAL="FLOAT"
  PREC=24
  make clean
  ./run-images.sh $METHOD $REAL $PREC $MCAMODE
  cp $METHOD-$REAL-$PREC.pdf ../figs/
done

for METHOD in EXPANDED FACTORED HORNER; do
  REAL="DOUBLE"
  for PREC in 24 53; do
    make clean
    ./run-zoomed-images.sh $METHOD $REAL $PREC $MCAMODE
    cp $METHOD-$REAL-$PREC.pdf ../figs/$METHOD-$REAL-$PREC-zoom.pdf
  done
done

MCAMODE=RR
METHOD=COMPHORNER
REAL="FLOAT"
PREC=24
make clean
./run-images.sh $METHOD $REAL $PREC $MCAMODE 
cp $METHOD-$REAL-$PREC.pdf ../figs/

REAL="DOUBLE" 
for PREC in 24 53; do 
	make clean
    	./run-images.sh $METHOD $REAL $PREC $MCAMODE
    	cp $METHOD-$REAL-$PREC.pdf ../figs/
done


