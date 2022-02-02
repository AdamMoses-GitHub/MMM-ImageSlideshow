#!/bin/sh
# Zum vorbereiten für das "fortune_Image.sh" Script und Umbenenn von zufälligen Namen xy.png in Foto_zahl.png
PWD=`pwd`

ab=16 # Wenn die erste Datei aus dem script "Fotos_16.png" produziert wird
#       Und die Eigenen Bilder ab 17 aufwärts werden sollen, sollte ab=16 sein.

for f in *.png; do 
ab=`expr $ab + 1`
echo $f " vorbereitet für:"$ab
mv $f Fotos_$ab.png
done

exit 0
