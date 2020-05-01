# AME QA Engineer Challenge

## Installing dependencies to run the project.

Before cloning the project, we need to ensure that some dependencies are installed on your machine.

Basically we need to install:

* Ruby
* vscode

## Technologies
The project uses the following technologies:

* Ruby and Rspec

### Setup folder contains the step by step to install / download the prerequisites:

Inside the Setup folder, there is a step-by-step guide for installing all dependencies according to Windows, MacOS and Linux platforms.

### Installing all gems from the gemfile file:

After following the instructions contained in the Setup folder, and in the project folder execute the following command:
  <b>bundle install</b>

All gems contained in the Gemfile file have been installed. <b>:)</b>

### How do I run my scenarios?
* rspec /file.rb

### Log folder

The log folder contains reports after executions and a bugs.txt file containing suggested bugs and possible improvements. Both files will not be in the repository in order to reduce the occupancy of the repository. <br>

I confess that API testing is not my specialty, but I tried hard to deliver a mvp and realized that the API has a possible problem. The posts made by HTTParty were made however when consulting it in Postman or via browser, the record was not loaded returning the message: <b>"status": "failed", "data": "Record does not found."</b>
