# AME QA Engineer Challenge

## Installing dependencies to run the project.

Before cloning the project, we need to ensure that some dependencies are installed on your machine.

Basically we need to install:

* Ruby
* vscode
* Appium

## Technologies
The project uses the following technologies:

* Ruby, Cucumber and Appium

### Setup folder contains the step by step to install / download the prerequisites:
Before any installation, Java 8 and Android Studio must be installed so that the environment variables can be configured.

Inside the Setup folder, there is a step-by-step guide for installing all dependencies according to Windows, MacOS and Linux platforms.

### Installing all gems from the gemfile file:

After following the instructions contained in the Setup folder, and in the project folder execute the following command:
  <b>bundle install</b>

All gems contained in the Gemfile file have been installed. <b>:)</b>

### How do I run my scenarios?
* cucumber (run all scenarios)
* cucumber <b>-t @scenario_name</b> (runs a specific scenario according to the tag.)
* Choose your device: 
  - cucumber <b>-p [android or ios]</b><br>
  Ps.: We will use a android device.

### Log folder

The log folder contains reports after executions and a bugs.txt file containing suggested bugs and possible improvements. Both files will not be in the repository in order to reduce the occupancy of the repository.
