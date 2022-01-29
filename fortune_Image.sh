#!/bin/bash
pfad=$(echo `pwd` | cut -d ' ' -f 2)
# Zählen von 1 bis x 
#  ©2020 
# Nils-Oliver Surowietz
#########################################################################################################
#         
#
#         z.B. für die Modulanwendung MMM-ImageSlideshow
#         dieses script fortune_Image.sh,
#         den Ordner exampleImages_null (alle zukünftigen Bilder müssen chronologisch Foto_15.png bis z.B Foto_888.png)
#         und den Ordner Fonts in den funktions-Ordners des Moduls kopieren:
#         /home/pi/MagicMirror/modules/MMM-ImageSlideshow/fotune.sh
#         /home/pi/MagicMirror/modules/MMM-ImageSlideshow/font
#         /home/pi/MagicMirror/modules/MMM-ImageSlideshow/exampleImages_null
#
#         Die ersten 14 Bilder können von eigenen Webcams oder z.B. aus dem Internet geladen werden.
#         Die im script geschriebene Links sind nur beispiele und sollten nicht verwendet werden.
#
#         Bild1: weiter unten eine Aldi Webcam das Modell Maginon IPC-100AC.

news="https://img.welt.de/img/vermischtes/bilder-des-tages/mobile236400119/3901626827-ci23x11-w780/APTOPIX-Germany-Daily-Life.jpg" # Bild 2
paris="https://cs3.wettercomassets.com/thumbnails/variants/58b6c68dcebfc036028b457d/700_394.jpg?_=1642941280" # Bild 3
Ahlbeck="https://www.seetel.de/typo3temp/_processed_/csm_13_30_92d06f2b10.jpg" # Bild 4
Hamburg="https://cs3.wettercomassets.com/thumbnails/variants/5153e17054358/16x9_player.jpg" # Bild 5
Bremen="https://cs3.wettercomassets.com/thumbnails/variants/53c90e90d610f/16x9_player.jpg" # Bild 6
Kiel="https://cs3.wettercomassets.com/thumbnails/variants/5be95c73a5b4b9063b02eb34/16x9_player.jpg" # Bild 7
Mallorca="https://cs3.wettercomassets.com/thumbnails/variants/560d142b92220/16x9_player.jpg" # Bild 8
Berlin="https://cs3.wettercomassets.com/thumbnails/variants/6101d5490b52e/700_394.jpg?_=1642944963" # Bild 9
Oldenburg="https://cs3.wettercomassets.com/thumbnails/variants/5cae6850a5b4b91c502cfa81/16x9_player.jpg" # Bild 10
Dangast="https://cs3.wettercomassets.com/thumbnails/variants/5da59a3aa5b4b9160a3016a7/16x9_player.jpg" # Bild 11
Friedrichskoog="https://cs3.wettercomassets.com/thumbnails/variants/5d645757a5b4b937b3186c2f/16x9_player.jpg" # Bild 12
Wien="https://cs3.wettercomassets.com/thumbnails/variants/b2cd96bc97e44737ad5efe51b1d748fd/16x9_player.jpg" # Bild 13
Heidelberg="https://cs3.wettercomassets.com/thumbnails/variants/535f4eb6daf6f/16x9_player.jpg" # Bild 14

#         Im original Ordner können alle Bilder gelöscht werden.
#         Das script erstellt eigene Bilder aus den Original vorlagen des Ordners: exampleImages_null
#
#         Beispiel: /home/pi/MagicMirror/modules/MMM-ImageSlideshow/exampleImages/Fotos_$zaehler.png
#
#         Installation:
#
#       > 1.
#         sudo apt-get update
#         sudo apt install imagemagick fortunes-de
#
#       > 2.
#         Bei bedarf die Schriften...
#         sudo cp -r $pfad/font/* /usr/share/fonts/truetype/
#
#  
#       > 3.
#         Um alle 15 Minuten neue Texte unter Fortune zu generieren
#         und diese in die Bilder zu schreiben,
#         diesen cronjob einrichten.
#
#         sudo crontab -e
#
#         " mit nano letzte Zeile"  
#         */15 * * * * sudo --user=pi sh $pfad/fortune_Image.sh
#         "speichern str x"
#
#         sudo crontab -l
#         sudo service cron reload
#
#########################################################################################################
# -----------Texte aus Fortunes de -------------
# ls /usr/share/games/fortunes-de/ | grep .dat # zeigt alle Einträge
#     fortune -f zeigt alle fortune Möglichkeiten
# Mehr Möglichkeiten viel Text als Bild zu generieren wäre:
# apt install cowsay
# cowsay -f "$(ls /usr/share/cowsay/cows/ | sort -R | head -1)" "$(fortune -s)"
# dieserbefehl sollten unten angepasst werden ...
#
#fortune="" && sedvar=""# alle
#fortune="sprichwortev" && sedvar=""
#fortune="sprichworte" && sedvar=""
#fortune="sprueche" && sedvar=""
#fortune="zitate" && sedvar=""
#fortune="anekdoten" && sedvar=""
#fortune="wusstensie" && sedvar=""
#fortune="sicherheitshinweise" && sedvar=""
fortune="warmduscher " && sedvar="s/Hallo*/Du bist ein/"
#fortune="woerterbuch" && sedvar=""
# -----------Schriften für alle Bilder umwandlung -------------
# https://freefontsdownload.net/free-republica_minor-font-42514.htm 
# https://fonts2u.com/extenda-40-hecto.font
#SCHRIFT="Razterhunch" # https://www.1001freefonts.com/
#SCHRIFT="Ewert"
#SCHRIFT="Flubber"
#SCHRIFT="adventure" # https://www.pixelsagas.com/?download=adventure
#SCHRIFT="Echelon"
#SCHRIFT="Alex" 
#SCHRIFT="Aaram"
#SCHRIFT="Coolvetica"
SCHRIFT="NimbusSans-Bold"
# -- Schriftgrösse --
Grosse=23 #26
#-------------------------------------------------------------------
# -----------Schriften für Cam-Namen Bilder umwandlung -------------
SCHRIFT2="NimbusSansNarrow-Bold"
#SCHRIFT2="adventure"
# -- Schriftgrösse --
Grosse2=80 #26
#-------------------------------------------------------------------
#
# Aldi Kamera "Das Modell Maginon IPC-100AC" Bild import start ***********************************************************************************************************************************************

BENUTZER="admin" 
PASSWORT="asswort"
CAMIP="192.168.1.xx" # IP der Maginon IPC-100AC

# Bild holden und conventieren in png

wget -O $pfad/exampleImages_null/snapshot.cgi http://$BENUTZER:$PASSWORT@$CAMIP/snapshot.cgi && convert $pfad/exampleImages_null/snapshot.cgi $pfad/exampleImages_null/_cam.png
composite -gravity Center $pfad/exampleImages_null/_cam.png $pfad/exampleImages_null/_Basis.gif $pfad/exampleImages_null/Fotos_Kamera.png

# Beschriftung

convert $pfad/exampleImages_null/Fotos_Kamera.png -gravity South -font $SCHRIFT2 -pointsize 50 -fill yellow -draw "text 0,0 'IP der Maginon IPC-100AC'" $pfad/exampleImages_null/Fotos_1.png

# erhötes Zeigen start ##### ACHTUNG Zahlen sollten auf Fotos angepasst werden !!!
# cp $pfad/exampleImages_null/Fotos_1.png $pfad/exampleImages_null/Fotos_16.png 
#-------------------------------------------------
# cp $pfad/exampleImages_null/Fotos_1.png $pfad/exampleImages_null/Fotos_17.png 
#-------------------------------------------------
# Löschen der Bearbeitungsdatein
sleep 1 && rm $pfad/exampleImages_null/snapshot.cgi && rm $pfad/exampleImages_null/_cam.png && rm $pfad/exampleImages_null/Fotos_Kamera.png
# Kamera import ende      ***********************************************************************************************************************************************
#
# Bild des Tages import start ***********************************************************************************************************************************************
# news

wget -O $pfad/exampleImages_null/APTOPIX-Germany-Daily-Life.jpg $news && convert $pfad/exampleImages_null/APTOPIX-Germany-Daily-Life.jpg $pfad/exampleImages_null/_bilddestages.png
composite -gravity Center $pfad/exampleImages_null/_bilddestages.png $pfad/exampleImages_null/_Basis2.gif $pfad/exampleImages_null/Fotos_Tages.png
convert $pfad/exampleImages_null/Fotos_Tages.png -gravity South -font $SCHRIFT2 -pointsize $Grosse2 -fill yellow -draw "text 0,0 'Bild des Tages'" $pfad/exampleImages_null/Fotos_2.png
sleep 2 && rm $pfad/exampleImages_null/APTOPIX-Germany-Daily-Life.jpg && rm $pfad/exampleImages_null/_bilddestages.png && rm $pfad/exampleImages_null/Fotos_Tages.png

# Bild des Tages import ende      
#
# Bild Paris import start 
# Paris

wget -O $pfad/exampleImages_null/paris.jpg $paris && convert $pfad/exampleImages_null/paris.jpg $pfad/exampleImages_null/_paris.png
composite -gravity Center $pfad/exampleImages_null/_paris.png $pfad/exampleImages_null/_Basis2.gif $pfad/exampleImages_null/Fotos_paris.png
convert $pfad/exampleImages_null/Fotos_paris.png -gravity South -font $SCHRIFT2 -pointsize $Grosse2 -fill yellow -draw "text 0,0 'Paris'" $pfad/exampleImages_null/Fotos_3.png
sleep 2 && rm $pfad/exampleImages_null/paris.jpg && rm $pfad/exampleImages_null/_paris.png && rm $pfad/exampleImages_null/Fotos_paris.png

# Bild Paris import ende  
# Bild Ahlbeck import start 
# Ahlbeck 

wget -O $pfad/exampleImages_null/Ahlbeck.jpg $Ahlbeck && convert $pfad/exampleImages_null/Ahlbeck.jpg $pfad/exampleImages_null/_Ahlbeck.png
composite -gravity Center $pfad/exampleImages_null/_Ahlbeck.png $pfad/exampleImages_null/_Basis3.gif $pfad/exampleImages_null/Fotos_Ahlbeck.png
convert $pfad/exampleImages_null/Fotos_Ahlbeck.png -gravity South -font $SCHRIFT2 -pointsize $Grosse2 -fill yellow -draw "text 0,0 'Ahlbeck'" $pfad/exampleImages_null/Fotos_4.png
sleep 2 && rm $pfad/exampleImages_null/Ahlbeck.jpg && rm $pfad/exampleImages_null/_Ahlbeck.png && rm $pfad/exampleImages_null/Fotos_Ahlbeck.png

# Bild Ahlbeck import ende      
# Bild Hamburg import start 
# Hamburg 

wget -O $pfad/exampleImages_null/Hamburg.jpg $Hamburg && convert $pfad/exampleImages_null/Hamburg.jpg $pfad/exampleImages_null/_Hamburg.png
composite -gravity Center $pfad/exampleImages_null/_Hamburg.png $pfad/exampleImages_null/_Basis4.gif $pfad/exampleImages_null/Fotos_Hamburg.png
convert $pfad/exampleImages_null/Fotos_Hamburg.png -gravity South -font $SCHRIFT2 -pointsize $Grosse2 -fill yellow -draw "text 0,0 'Hamburg'" $pfad/exampleImages_null/Fotos_5.png
sleep 2 && rm $pfad/exampleImages_null/Hamburg.jpg && rm $pfad/exampleImages_null/_Hamburg.png && rm $pfad/exampleImages_null/Fotos_Hamburg.png

# Bild Hamburg import ende  
# Bild Bremen import start 
# Bremen 

wget -O $pfad/exampleImages_null/Bremen.jpg $Bremen && convert $pfad/exampleImages_null/Bremen.jpg $pfad/exampleImages_null/_Bremen.png
composite -gravity Center $pfad/exampleImages_null/_Bremen.png $pfad/exampleImages_null/_Basis4.gif $pfad/exampleImages_null/Fotos_Bremen.png
convert $pfad/exampleImages_null/Fotos_Bremen.png -gravity South -font $SCHRIFT2 -pointsize $Grosse2 -fill yellow -draw "text 0,0 'Bremen'" $pfad/exampleImages_null/Fotos_6.png
sleep 2 && rm $pfad/exampleImages_null/Bremen.jpg && rm $pfad/exampleImages_null/_Bremen.png && rm $pfad/exampleImages_null/Fotos_Bremen.png

# Bild Bremen import ende  
# Bild Berlin import start 
# Berlin 

wget -O $pfad/exampleImages_null/Berlin.jpg $Berlin && convert $pfad/exampleImages_null/Berlin.jpg $pfad/exampleImages_null/_Berlin.png
composite -gravity Center $pfad/exampleImages_null/_Berlin.png $pfad/exampleImages_null/_Basis4.gif $pfad/exampleImages_null/Fotos_Berlin.png
convert $pfad/exampleImages_null/Fotos_Berlin.png -gravity South -font $SCHRIFT2 -pointsize $Grosse2 -fill yellow -draw "text 0,0 'Berlin'" $pfad/exampleImages_null/Fotos_7.png
sleep 2 && rm $pfad/exampleImages_null/Berlin.jpg && rm $pfad/exampleImages_null/_Berlin.png && rm $pfad/exampleImages_null/Fotos_Berlin.png

# Bild Berlin import ende  
# Bild Kiel import start 
# Kiel 

wget -O $pfad/exampleImages_null/Kiel.jpg $Kiel && convert $pfad/exampleImages_null/Kiel.jpg $pfad/exampleImages_null/_Kiel.png
composite -gravity Center $pfad/exampleImages_null/_Kiel.png $pfad/exampleImages_null/_Basis4.gif $pfad/exampleImages_null/Fotos_Kiel.png
convert $pfad/exampleImages_null/Fotos_Kiel.png -gravity South -font $SCHRIFT2 -pointsize $Grosse2 -fill yellow -draw "text 0,0 'Kiel'" $pfad/exampleImages_null/Fotos_8.png
sleep 2 && rm $pfad/exampleImages_null/Kiel.jpg && rm $pfad/exampleImages_null/_Kiel.png && rm $pfad/exampleImages_null/Fotos_Kiel.png

# Bild Kiel import ende  
# Bild Mallorca import start 
# Mallorca 

wget -O $pfad/exampleImages_null/Mallorca.jpg $Mallorca && convert $pfad/exampleImages_null/Mallorca.jpg $pfad/exampleImages_null/_Mallorca.png
composite -gravity Center $pfad/exampleImages_null/_Mallorca.png $pfad/exampleImages_null/_Basis4.gif $pfad/exampleImages_null/Fotos_Mallorca.png
convert $pfad/exampleImages_null/Fotos_Mallorca.png -gravity South -font $SCHRIFT2 -pointsize $Grosse2 -fill yellow -draw "text 0,0 'Mallorca'" $pfad/exampleImages_null/Fotos_9.png
sleep 2 && rm $pfad/exampleImages_null/Mallorca.jpg && rm $pfad/exampleImages_null/_Mallorca.png && rm $pfad/exampleImages_null/Fotos_Mallorca.png

# Bild Mallorca import ende  
# Bild Oldenburg import start 
# Oldenburg

wget -O $pfad/exampleImages_null/Oldenburg.jpg $Oldenburg && convert $pfad/exampleImages_null/Oldenburg.jpg $pfad/exampleImages_null/_Oldenburg.png
composite -gravity Center $pfad/exampleImages_null/_Oldenburg.png $pfad/exampleImages_null/_Basis2.gif $pfad/exampleImages_null/Fotos_Oldenburg.png
convert $pfad/exampleImages_null/Fotos_Oldenburg.png -gravity South -font $SCHRIFT2 -pointsize $Grosse2 -fill yellow -draw "text 0,0 'Oldenburg'" $pfad/exampleImages_null/Fotos_10.png
sleep 2 && rm $pfad/exampleImages_null/Oldenburg.jpg && rm $pfad/exampleImages_null/_Oldenburg.png && rm $pfad/exampleImages_null/Fotos_Oldenburg.png

# Bild Oldenburg import ende  
# Bild Dangast import start 
# Dangast

wget -O $pfad/exampleImages_null/Dangast.jpg $Dangast && convert $pfad/exampleImages_null/Dangast.jpg $pfad/exampleImages_null/_Dangast.png
composite -gravity Center $pfad/exampleImages_null/_Dangast.png $pfad/exampleImages_null/_Basis2.gif $pfad/exampleImages_null/Fotos_Dangast.png
convert $pfad/exampleImages_null/Fotos_Dangast.png -gravity South -font $SCHRIFT2 -pointsize $Grosse2 -fill yellow -draw "text 0,0 'Varel Dangast'" $pfad/exampleImages_null/Fotos_11.png
sleep 2 && rm $pfad/exampleImages_null/Dangast.jpg && rm $pfad/exampleImages_null/_Dangast.png && rm $pfad/exampleImages_null/Fotos_Dangast.png

# Bild Dangast import ende  
# Bild Friedrichskoog import start 
# Friedrichskoog

wget -O $pfad/exampleImages_null/Friedrichskoog.jpg $Friedrichskoog && convert $pfad/exampleImages_null/Friedrichskoog.jpg $pfad/exampleImages_null/_Friedrichskoog.png
composite -gravity Center $pfad/exampleImages_null/_Friedrichskoog.png $pfad/exampleImages_null/_Basis2.gif $pfad/exampleImages_null/Fotos_Friedrichskoog.png
#convert $pfad/exampleImages_null/Fotos_Friedrichskoog.png -gravity South -font $SCHRIFT2 -pointsize $Grosse2 -fill yellow -draw "text 0,0 'Nordseeheilbad Friedrichskoog'" $pfad/exampleImages_null/Fotos_12.png
convert $pfad/exampleImages_null/Fotos_Friedrichskoog.png -gravity South -font $SCHRIFT2 -pointsize 60 -fill yellow -draw "text 0,0 'Nordseeheilbad Friedrichskoog'" $pfad/exampleImages_null/Fotos_12.png
sleep 2 && rm $pfad/exampleImages_null/Friedrichskoog.jpg && rm $pfad/exampleImages_null/_Friedrichskoog.png && rm $pfad/exampleImages_null/Fotos_Friedrichskoog.png

# Bild Friedrichskoog import ende  
# Bild Wien import start 
# Wien

wget -O $pfad/exampleImages_null/Wien.jpg $Wien && convert $pfad/exampleImages_null/Wien.jpg $pfad/exampleImages_null/_Wien.png
composite -gravity Center $pfad/exampleImages_null/_Wien.png $pfad/exampleImages_null/_Basis2.gif $pfad/exampleImages_null/Fotos_Wien.png
convert $pfad/exampleImages_null/Fotos_Wien.png -gravity South -font $SCHRIFT2 -pointsize $Grosse2 -fill yellow -draw "text 0,0 'Wien'" $pfad/exampleImages_null/Fotos_13.png
sleep 2 && rm $pfad/exampleImages_null/Wien.jpg && rm $pfad/exampleImages_null/_Wien.png && rm $pfad/exampleImages_null/Fotos_Wien.png

# Bild Wien import ende  
# Bild Heidelberg import start 
# Heidelberg

wget -O $pfad/exampleImages_null/Heidelberg.jpg $Heidelberg && convert $pfad/exampleImages_null/Heidelberg.jpg $pfad/exampleImages_null/_Heidelberg.png
composite -gravity Center $pfad/exampleImages_null/_Heidelberg.png $pfad/exampleImages_null/_Basis2.gif $pfad/exampleImages_null/Fotos_Heidelberg.png
convert $pfad/exampleImages_null/Fotos_Heidelberg.png -gravity South -font $SCHRIFT2 -pointsize 70 -fill yellow -draw "text 0,0 'Heidelberg - Schlossberg'" $pfad/exampleImages_null/Fotos_14.png
sleep 2 && rm $pfad/exampleImages_null/Heidelberg.jpg && rm $pfad/exampleImages_null/_Heidelberg.png && rm $pfad/exampleImages_null/Fotos_Heidelberg.png

# Bild Heidelberg import ende   ***********************************************************************************************************************************************
# Das eigentliche Script:
echo "---Umwandlung-------------------------------------------------------------------------------------------------------"
zaehler=1                                 #zählt von z.B. 1
BIS=$(ls $pfad/exampleImages_null | grep -c Fotos_)  #zählt von z.B. 22
TEXT=$(cat $pfad/TEXT_des_Tages.txt)
            
while [ $zaehler -le $BIS ]  #zählt bis z.B. 22 Fotos_1 - 22
do # /usr/games/fortune $fortune 
# cowsay -f '$(ls /usr/share/cowsay/cows/ | sort -R | head -1)' '$(/usr/games/fortune $fortune | sed "$sedvar")' > $pfad/TEXT_des_Tages.txt # noch nicht ausprobiert ...
/usr/games/fortune $fortune | sed "$sedvar" > $pfad/TEXT_des_Tages.txt
TEXT=$(cat $pfad/TEXT_des_Tages.txt)
sleep 0.1
convert $pfad/exampleImages_null/Fotos_$zaehler.png -gravity North -font "$SCHRIFT" -pointsize $Grosse -fill yellow -draw "text 0,0 '$TEXT'" $pfad/exampleImages/Fotos_$zaehler.png
#echo "fortune $fortune > $pfad/TEXT_des_Tages.txt"
echo "convert "$zaehler".png"

zaehler=`expr $zaehler + 1`    # +2 wäre jeder zweiter
done
echo "---Fertig!--- offne neues Script ..."
sh erzeuge_webcam_bilder_mit_zeitstempel.sh # das script sollte unter den Minuten im cronjob bleiben! (unter 15min)
echo "---Fertig! mit GIF gespeichert unter exampleImages/Animation_1.gif ---"
exit 0
