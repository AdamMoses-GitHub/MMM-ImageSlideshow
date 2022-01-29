#!/bin/bash
pfad=$(echo `pwd` | cut -d ' ' -f 2)
echo "Das Script >erzeuge_webcam_bilder_mit_zeitstempel.sh< wurde zuletze Ausgeführt: "$(date '+%Y-%m-%d_%H:%M:%S') >> /home/pi/MagicMirror/LOG-DATEI_cronjob-FORTUNSCRIPT.txt
BENUTZER="admin" 
PASSWORT="passwort" 
CAMIP="192.168.0.xx" 
name="Hof-Cam"
sleep=25 # das script sollte unter den Minuten im cronjob bleiben inclusive der Konvertierung in GIF ! (unter 15min)
timestamp=$(date '+%Y%m%d-%H%M%S') 
#1.Bild mit Text
wget -O $pfad/animated_cam_gif/snapshot.cgi http://$BENUTZER:$PASSWORT@$CAMIP/snapshot.cgi 
convert $pfad/animated_cam_gif/snapshot.cgi $pfad/animated_cam_gif/_cam.png
composite -gravity Center $pfad/animated_cam_gif/_cam.png $pfad/exampleImages_null/_Basis.gif $pfad/animated_cam_gif/cam.png
time=$(date '+%d.%m %H:%M:%S') 
convert $pfad/animated_cam_gif/cam.png -gravity South -font adventure -pointsize 70 -fill yellow -draw "text 10,0 '$name $time'" $pfad/animated_cam_gif/$timestamp.png
sleep $sleep
timestamp=$(date '+%Y%m%d-%H%M%S') 
#2.Bild ohn Text
wget -O $pfad/animated_cam_gif/snapshot.cgi http://$BENUTZER:$PASSWORT@$CAMIP/snapshot.cgi 
convert $pfad/animated_cam_gif/snapshot.cgi $pfad/animated_cam_gif/_cam.png
composite -gravity Center $pfad/animated_cam_gif/_cam.png $pfad/exampleImages_null/_Basis.gif $pfad/animated_cam_gif/$timestamp.png
sleep $sleep
timestamp=$(date '+%Y%m%d-%H%M%S') 
#3.Bild ohn Text
wget -O $pfad/animated_cam_gif/snapshot.cgi http://$BENUTZER:$PASSWORT@$CAMIP/snapshot.cgi 
convert $pfad/animated_cam_gif/snapshot.cgi $pfad/animated_cam_gif/_cam.png
composite -gravity Center $pfad/animated_cam_gif/_cam.png $pfad/exampleImages_null/_Basis.gif $pfad/animated_cam_gif/$timestamp.png
sleep $sleep
timestamp=$(date '+%Y%m%d-%H%M%S') 
#4.Bild ohn Text
wget -O $pfad/animated_cam_gif/snapshot.cgi http://$BENUTZER:$PASSWORT@$CAMIP/snapshot.cgi 
convert $pfad/animated_cam_gif/snapshot.cgi $pfad/animated_cam_gif/_cam.png
composite -gravity Center $pfad/animated_cam_gif/_cam.png $pfad/exampleImages_null/_Basis.gif $pfad/animated_cam_gif/$timestamp.png
timestamp=$(date '+%Y%m%d-%H%M%S') 
sleep $sleep
#5.Bild ohn Text
wget -O $pfad/animated_cam_gif/snapshot.cgi http://$BENUTZER:$PASSWORT@$CAMIP/snapshot.cgi 
convert $pfad/animated_cam_gif/snapshot.cgi $pfad/animated_cam_gif/_cam.png
composite -gravity Center $pfad/animated_cam_gif/_cam.png $pfad/exampleImages_null/_Basis.gif $pfad/animated_cam_gif/$timestamp.png
sleep $sleep
timestamp=$(date '+%Y%m%d-%H%M%S') 
#6.Bild ohn Text
wget -O $pfad/animated_cam_gif/snapshot.cgi http://$BENUTZER:$PASSWORT@$CAMIP/snapshot.cgi 
convert $pfad/animated_cam_gif/snapshot.cgi $pfad/animated_cam_gif/_cam.png
composite -gravity Center $pfad/animated_cam_gif/_cam.png $pfad/exampleImages_null/_Basis.gif $pfad/animated_cam_gif/$timestamp.png
timestamp=$(date '+%Y%m%d-%H%M%S') 
sleep $sleep
#7.Bild ohn Text
wget -O $pfad/animated_cam_gif/snapshot.cgi http://$BENUTZER:$PASSWORT@$CAMIP/snapshot.cgi 
convert $pfad/animated_cam_gif/snapshot.cgi $pfad/animated_cam_gif/_cam.png
composite -gravity Center $pfad/animated_cam_gif/_cam.png $pfad/exampleImages_null/_Basis.gif $pfad/animated_cam_gif/$timestamp.png
timestamp=$(date '+%Y%m%d-%H%M%S') 
sleep $sleep
#8.Bild ohn Text
wget -O $pfad/animated_cam_gif/snapshot.cgi http://$BENUTZER:$PASSWORT@$CAMIP/snapshot.cgi 
convert $pfad/animated_cam_gif/snapshot.cgi $pfad/animated_cam_gif/_cam.png
composite -gravity Center $pfad/animated_cam_gif/_cam.png $pfad/exampleImages_null/_Basis.gif $pfad/animated_cam_gif/$timestamp.png
timestamp=$(date '+%Y%m%d-%H%M%S') 
sleep $sleep
#9.Bild ohn Text
wget -O $pfad/animated_cam_gif/snapshot.cgi http://$BENUTZER:$PASSWORT@$CAMIP/snapshot.cgi 
convert $pfad/animated_cam_gif/snapshot.cgi $pfad/animated_cam_gif/_cam.png
composite -gravity Center $pfad/animated_cam_gif/_cam.png $pfad/exampleImages_null/_Basis.gif $pfad/animated_cam_gif/$timestamp.png
#-------------------- Reinigen
rm $pfad/animated_cam_gif/snapshot.cgi 
rm $pfad/animated_cam_gif/_cam.png 
rm $pfad/animated_cam_gif/cam.png 
#-------------------- GIF
echo "beginne mit GIF-Animation ..."
convert -delay 125 -loop 0 $pfad/animated_cam_gif/*.png $pfad/exampleImages/Animation_1.gif
# convert -resize 768x576 -delay 500 -loop 0 $pfad/animated_cam_gif/*.png $pfad/exampleImages/Animation_1.gif
#-------------------- Reinige
rm $pfad/animated_cam_gif/*.png
exit 0
