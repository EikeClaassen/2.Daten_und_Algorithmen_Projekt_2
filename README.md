#Wavefield Simulation

** Table of contents **
1. Description of the project
2. Directories
3. User guide and examples
4. Dependencies
5. Installation instructions
6. Authors
7. License agreement

##1. Description of the project

This program simulates a wave field using MathWorks Matlab. The user can place sound sources in the field. The sources emit sine-waves. Properties like the amplitude, the frequency, the phase and the amount of damping can be adjusted. While the simulation is running the User is able to start, continue or cancel the simulation. It is possible to receive a lineplot at every point of the wavefield. Also the quality settings can be adjusted. Due to the problem that not every computer has the resources to run this simulation properly the user is able to set the quality to "low" or "high". The setting influences the refresh time and the resolution of the simulation.



##2. Directories

The Simulation consists of two m.files.
**SourceOfSound.m** features the functions that describe the Sound Sources which were placed in the field.
**WaveGUI.m** builds the graphical user interface.


##3. User guide and examples

###Software handling

After executing the WaveGUI.m the graphical user interface opens. First the user should check the settings for the quality settings. Users with older mobile devices (>3-4 Years) especially those with dedicated graphic solutions should choose the lower quality settings. Modern devices and most stationary computers can handle the higher quality setting. The quality setting has influence on the refresh time and the resulution of the animation. With the low quality settings it works at 10Hz and the high setting works with 16.6Hz. The quality settings can be adjusted on-the-fly while the program is running.

The settings for "Frequency", "Amplitude", "Phase" and "Damping" are realized using slider. With the sliders the boundaries for the parameters can be predefined in a way that the illustration stays always reasonable and clear. The slider for the phase features values from 0 to 2 Pi.

To start the simulation sound sources have to be added using the **"Add"** button. It's possible to place as many sources as the user needs or the hardware is able to compute. It's recommended to work with a reasonable amount of sources (up to 6-8) because the impact on performance is relatively high. An warning dialog informs the user if he places five or more sources.
With the button "Start" the simulation can be started. The button "Freeze" pauses the simulation.

 With the function "Select a Point" the user can select a random point in the wavefield. The program returns a line plot of the specific area.


##4. Dependencies
This program was developed and tested using MathWorks Matlab in the versions:
* Matlab 2014b
* Matlab 2015a

The program consists of the following essential files:
* SourceOfSound.m (Class)
* WaveGUI (Class)
* wir.jpg (Picture)


##5. Installation instructions

This program requires the installation of MathWorks Matlab **2014b** or **2015a**.

Installation procedure

1. Installing Matlab
2. All necessary Matlab datas (see chapter 4) should be located in one folder.
3. Set the path of the folder in Matlab
4. Execute the File **WaveGUI.m**

Informations for the software handling are covered in the chapter **3. ##3. User guide and examples**
<!--


Informationen zum Umgang mit dem Programm finden sich im Kapitel **3. Benutzungsbeispiele**

Jede Klasse verfügt über einen Hilfe-Text. Handles im GUI besitzen Tool-Tipp Fenster.
-->

##6. Authors

This  program was developed by:

    Sascha Bilert         6009917
    Eike Claaßen          6010410
    Jan-Michel Grüttgen   6010074



##7. Licence agreement

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
