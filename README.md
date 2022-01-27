# Module: Image Slideshow
The `MMM-ImageSlideshow` module is designed to display images, one at a time on a fixed interval, from one or many directories. These images can be shown in order or at random, one directory at a time or all at time. The image heights and widths can be fixed, and the images can be made to be shown in grayscale.

## Dependencies / Requirements

This module requires no special dependencies. The only requirement is that the image directories you path to are fixed paths accessible to the Magic Mirror instance.

## Operation

This module will take in a list of directory paths, one or more, containing image files. The module will display those images in either alphabetical or random order, across either each path one at time or across all the paths at once. Once all the images have been shown, it will loop back and start again.

Extra configurations include setting the amount of time an image is shown for, rendering the images in grayscale, selecting which file extensions are valid, and using a fixed image height and/or width.


## Using the module

To use this module, add it to the modules array in the `config/config.js` file:
````javascript
modules: [
	{
		module: 'MMM-ImageSlideshow',
		position: 'bottom_left',
		config: {
			imagePaths: ['modules/MMM-ImageSlideshow/example1']
		}
	}	
]
````

## Configuration options

The following properties can be configured:

<table width="100%">
	<!-- why, markdown... -->
	<thead>
		<tr>
			<th>Option</th>
			<th width="100%">Description</th>
		</tr>
	<thead>
	<tbody>	
		<tr>
			<td><code>imagePaths</code></td>
			<td>Array value containing strings. Each string should be a path to a directory where image files can be found.<br>
				<br><b>Example:</b> <code>['modules/MMM-ImageSlideshow/example1']</code>
				<br>This value is <b>REQUIRED</b>
			</td>
		</tr>		
		<tr>
			<td><code>slideshowSpeed</code></td>
			<td>Integer value, the length of time to show one image before switching to the next, in milliseconds.<br>
				<br><b>Example:</b> <code>6000</code>
				<br><b>Default value:</b> <code>10000</code>
				<br>This value is <b>OPTIONAL</b>
			</td>
		</tr>
		<tr>
			<td><code>delayUntilRestart</code></td>
			<td>Integer value, the length of time to restart the slideshow after the last image has been shown, in milliseconds. The module will go blank will waits to restart. This value defaults to zero, meaning no delay until restarting.<br>
				<br><b>Example:</b> <code>6000</code>
				<br><b>Default value:</b> <code>0</code>
				<br>This value is <b>OPTIONAL</b>
			</td>
		</tr>		
		<tr>
			<td><code>fixedImageWidth</code></td>
			<td>Integer value, sets a fixed pixel width for all the images to be shown. If set to 0, the image's actual width is used.<br>
				<br><b>Example:</b> <code>250</code>
				<br><b>Default value:</b> <code>0</code>
				<br>This value is <b>OPTIONAL</b>
			</td>
		</tr>
		<tr>
			<td><code>fixedImageHeight</code></td>
			<td>Integer value, sets a fixed pixel height for all the images to be shown. If set to 0, the image's actual height is used.<br>
				<br><b>Example:</b> <code>300</code>
				<br><b>Default value:</b> <code>0</code>
				<br>This value is <b>OPTIONAL</b>
			</td>
		</tr>        
		<tr>
			<td><code>randomizeImageOrder</code></td>
			<td>Boolean value, if true will randomize the order of the images, if false will use an alphabetical sorting by filename.<br>
				<br><b>Example:</b> <code>true</code>
				<br><b>Default value:</b> <code>false</code>
				<br>This value is <b>OPTIONAL</b>
			</td>
		</tr>   
        <tr>
			<td><code>treatAllPathsAsOne</code></td>
			<td>Boolean value, if true will treat all the paths specified in <code>imagePaths</code> as one path. Otherwise, if false, images will only be shown from one path at a time in the order of <code>imagePaths</code>, until all the images in that path are exhausted, before continuing to the next path.<br>
				<br><b>Example:</b> <code>true</code>
				<br><b>Default value:</b> <code>false</code>
				<br>This value is <b>OPTIONAL</b>
			</td>
		</tr>
        <tr>
			<td><code>makeImagesGrayscale</code></td>
			<td>Boolean value, if true images will be rendered in grayscale (i.e black and white) instead of color. If false they will be rendered as just they are without change.<br>
				<br><b>Example:</b> <code>true</code>
				<br><b>Default value:</b> <code>false</code>
				<br>This value is <b>OPTIONAL</b>
			</td>
		</tr> 
        <tr>
			<td><code>validImageFileExtensions</code></td>
			<td>String value, a list of image file extensions, seperated by commas, that should be included. Files found without one of the extensions will be ignored.<br>
				<br><b>Example:</b> <code>'png,jpg'</code>
				<br><b>Default value:</b> <code>'bmp,jpg,gif,png'</code>
				<br>This value is <b>OPTIONAL</b>
			</td>
		</tr>         
    </tbody>
</table>

# MMM-ImageSlideshow-addon

Fortune-Sprüche auf eigene oder auf aktuelle Webcam Bildern gelegt mit Ramen für den Maggic-Mirror.

fortune-de:

https://de.wikipedia.org/wiki/Fortune_(Computerprogramm)

z.B. für die Modulanwendung MMM-ImageSlideshow
Das script fortune_Image.sh,

den Ordner exampleImages_null (alle zukünftigen Bilder müssen chronologisch Foto_15.png bis z.B Foto_888.png)

# Beispiel:

<img src="https://github.com/eyedat/MMM-ImageSlideshow-addon/blob/main/Fortune-script_eye.gif?raw=true" alt="">


/home/pi/MagicMirror/modules/MMM-ImageSlideshow/fotune.sh
/home/pi/MagicMirror/modules/MMM-ImageSlideshow/font
/home/pi/MagicMirror/modules/MMM-ImageSlideshow/exampleImages_null

Die ersten 14 Bilder können von eigenen Webcams oder z.B. aus dem Internet geladen werden.
Die im script geschriebene Links sind nur beispiele und sollten nicht verwendet werden.
Bild1: Eine Aldi Webcam das Modell Maginon IPC-100AC.
* news="xxx" # Bild 2
* paris="xxx" # Bild 3 ... z.B: paris="https://cs3.wettercomassets.com/thumbnails/variants/58b6c68dcebfc036028b457d/700_394.jpg?_=1642941280"
* Ahlbeck="xxx" # Bild 4
* Hamburg="xxx" # Bild 5
* Bremen="xxx" # Bild 6
* Kiel="xxx" # Bild 7
* Mallorca="xxx" # Bild 8
* Berlin="xxx" # Bild 9
* Oldenburg="xxx" # Bild 10
* Dangast="xxx" # Bild 11
* Friedrichskoog="xxx" # Bild 12
* Wien="xxx" # Bild 13
* Heidelberg="xxx" # Bild 14

Im original Ordner "exampleImages" können alle Bilder gelöscht werden.
Das script erstellt eigene Bilder aus den Original vorlagen des Ordners: exampleImages_null

Beispiel: /home/pi/MagicMirror/modules/MMM-ImageSlideshow/exampleImages/Fotos_$zaehler.png
#         Installation:

* -1.-

        sudo apt-get update
        sudo apt install imagemagick fortunes-de
        
* -2.-

Bei bedarf die Schriften... (aus lizensgründen ist der Ordner: font nicht gefüllt)
Hier könnte man den Inhalt des Orners füllen: 
                                                       https://www.1001freefonts.com/ 
                                                       
                                                   
                                                       
        sudo cp -r $pfad/font/* /usr/share/fonts/truetype/

* -3.-

Um alle 15 Minuten neue Texte unter Fortune zu generieren
und diese in die Bilder zu schreiben,
diesen cronjob einrichten.

        sudo crontab -e

" mit nano in die letzte Zeile einfügen" 

        */15 * * * * sudo --user=pi sh $pfad/fortune_Image.sh
         
"speichern str x"
Und zuletzt den Cronjob neustarten

        sudo crontab -l
        sudo service cron reload
