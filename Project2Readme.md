#Wavefield Simulation

<!---**Inhaltsangabe dieser README Datei:**
1. Projektbeschreibung
2. Was liegt wo?
3. Benutzungsbeispiele
4. Dependencies
5. Installationshinweise
6. Autoren
7. Lizenzhinweise
--->
** Table of contents **
1. Describtion of the project
2. Directories ???
3. Examples and software handling
4. Dependencies
5. Installation instructions
6. Authors
7. License agreement

##1. Describtion of the project

This program simulates a wave field using MathWorks Matlab. The user can place up to three sources in the field. The sources can emit sine- or cosinewaves. Properties like the amplitude, the frequency, the phase and the amount of damping can be adjusted. While the simulation is running the User is able to stop, continue or cancel the simulation.

When the Program is executed first a window for the quality setting and some basic program presets opens. Due to the problem that not every computer has the resources to run this simulation properly the user is able to set the quality to "low" or "high". The setting influences the refresh time of the simulation.


<!---Dieses Programm verwaltet die gegebene MIT/TIMIT-Datenbank. Die MIT/TIMIT-Datenbank besteht aus englischsprachigen Sätzen. Sie werden von 16 verschiedenen Sprechern unterschiedlichen Geschlechts dargeboten. Zu jedem Sprecher liegen 10 verschiedene Sätze vor. Einige Sätze kommen mehrfach vor. Zur weiteren Unterscheidung der Sätze sind Kriterien wie das Satzkürzel (SentenceID), das Kürzel des Sprechers (Name), sein Geschlecht (Gender),
die verwendeten Wörter (Words) und die vorkommenden Phoneme (Phonems) gegeben.

Dieses Programm bietet eine Suchfunktion. Der Nutzer kann nach einzelnen Kriterien, oder einer Kombination mehrerer Kriterien suchen. Ausgegebene Suchergebnisse können direkt wiedergegeben werden. Die Darstellung erfolgt in einem Graphical User Interface (GUI).

Zur grafischen Auswertung der Files verfügt dieses Programm über eine STFT (Short Time Fourier Transform) Funktion.
--->

##2. Directories

The Simulation consitst of two m.files.
**SourceOfSound.m** features the functions that describe the Sound Sources wich were placed in the field.
**WaveGUI.m** builds the graphical user interface.


<!--
Im Ordner *MFiles_TIMIT_MIT* liegen die Programmdateien und alle verwendeten Matlab Funktionen und Klassen.

Im Ordner *TIMIT MIT* ist die Datenbank hinterlegt.
-->

##3. Examples and software handling

###Software handling

After executing the WaveGUI.m a first dialog windows opens. In this window the user has to choose primarily the quality settings for the simulation. Older mobile devices (>3-4 Years) especially those with dedicated graphic solutions should choose the lower quality settings. Modern devices and most stationary computers can handle the higher quality setting.  
Additional to this the dialog window allows to make other minor setting which can also be changed later in der main window.
Now the main window can be started by clicking on the **Sart GUI** button. 


<!--
Die Datenbank bietet folgende Suchparameter:
* Kürzel des Sprechers
* Geschlecht des Sprechers
* Satz ID
* Verwendete Wörter
* Verwendete Phoneme

Im **Eingabefeld** kann der Nutzer den Pfad zur MIT/TMIT Datenbank angeben. Wenn dieser nicht angegeben wird, verwendet das Programm eine DefaultDirectory (../TIMIT MIT/). Der Pfad sollte bei der im Kapitel 5 beschriebenen Installation bereits korrekt gesetzt sein. Das korrekte Laden  der Datenbank wird über die Ausgabe **"Database successfully loaded"** bestätigt. Sollte ein Fehler vorliegen erscheint die Statusmeldung **"Files not found"**.

Der Nutzer kann nach einzelnen Parametern suchen, oder um die Suche zu spezifizieren Kombinationen mehrerer Parameter verwenden. Die Auswahl von **"Person"** und **"Gender"** sind mittels eines Dropdown Feldes möglich. Bei den Suchparametern **"Words"** und **"Phonems"** ist eine Mehrfachnennung möglich. Die Suchbegriffe müssen hier durch ein Komma getrennt werden. Eine Suche nach Wortfragmenten ist nicht möglich. Die Suche wird über den Button **"Search"** durchgeführt.

Die Suchergebnisse werden im ListBox-Fenster des GUI dargestellt. Der Nutzer kann hier einzelne Sätze auswählen und sie mittels des Buttons **"Play/Pause/Resume"** wiedergeben bzw. pausieren. Mit dem Button **"Stop"** kann die Wiedergabe abgebrochen werden.

Mit dem Button **"STFT"** wird eine Short Time Fourier Transform durchgeführt und grafisch in einem separaten Fenster dargestellt. In ihr kann man die Sätze auf fehlerhafte Bereiche überprüfen. Das Rauschen wird hier in der Regel als Balken mit einer hohen gleichmäßig Leistungsdichte über den gesammten Frequenzbereich dargestellt.

Mittels des **"CWresults"** Buttons kann der Anwender die gefundenen Ergebnisse im Base-Workspace in das Cell Array *"results"* speichern. Die Ergebnisse werden außerdem über die Konsole ausgegeben.


###Beispiel
1. **Beispiel für SentenceID**: `sa2`

2. **Beispiele für die Mehfachnennung**:
`she,wash,suit`; `she , wash , suit`;`she, wash, suit`;

3. **Beispiel Words**:
Bei der Suche nach dem Wort "I" werden nur Ergebnisse angezeigt, die das Wort "I" enthalten. Wörter die unter anderem ein "i" beinhalten werden nicht angezeigt.

-->

##4. Dependencies
This program was developed and tested using MathWorks Matlab in the versions:
* Matlab 2014b
* Matlab 2015a

The program consists of the following essential files:
* SourceOfSound.m (Class)
* WaveGUI (Script)

<!--
Dieses Programm wurde erstellt und getest mit MathWorks Matlab in den Versionen:
* Matlab 2014b
* Matlab 2015a

Das Programm umfasst folgende notwendige Files:
* AudioPlayer.m (Class)
* AudioPlayerTest.m (Script)
* DatabaseGUI.m (Class)
* STFT.m (Function)
* Windowing.m (Function)
* TMIT_MIT_Database.m (Class)
* TMIT_MIT_DatabaseTest.m (Script)
-->

##5. Installation instructions

This programm requires the installation of MathWorks Matlab **2014b** or **2015a**.

Installation procedure

1. Installing Matlab
2. All necessary Matlab datas (see chapter 4) should be located in one folder.
3. Set the path of the folder in Matlab
4. Execute the File **WaveGUI.m**



<!--
Dieses Programm setzt die Installation von MathWorks Matlab **2014b** oder **2015a** voraus.

Installationsreihenfolge

1.  Matlab installieren
2.  Alle notwendigen Matlab Dateien (siehe Punkt 4) sollten sich gemeinsam mit den TIMIT MIT Ordner in einem Verzeichnis befinden
3.  Via Matlab das erstellte Verzeichnis öffnen
4.  In den Ordner MFILES_TIMIT_MIT navigieren
5.  In der Konsole den Befehl `TIMIT_MIT_Database();` eingeben um das GUI zu starten

Informationen zum Umgang mit dem Programm finden sich im Kapitel **3. Benutzungsbeispiele**

Jede Klasse verfügt über einen Hilfe-Text. Handles im GUI besitzen Tool-Tipp Fenster.
-->

##6. Authors

This  programm was developt by:

    Sascha Bilert         6009917
    Eike Claaßen          6010410
    Jan-Michel Grüttgen   6010074



##7. Lizenzhinweise

Copyright (c) 2015 Sascha Bilert, Eike Claaßen, Jan-Michel Grüttgen

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
