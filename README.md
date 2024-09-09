# Robot Framework Mobile Automation with Appium

This repository contains a Robot Framework test automation setup for testing Android applications using the Appium library.

## Table of Contents
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Setting up the Android App](#setting-up-the-android-app)
- [Updating the ANDROID_APP Variable](#updating-the-android_app-variable)
- [Running the Tests](#running-the-tests)
## Prerequisites

Before running the tests, make sure you have the following installed:

1. **Node.js** and **npm**
2. **Appium**
   - Install Appium via npm:

     ```bash
     npm install -g appium
     ```

3. **Android SDK** (for Android device emulation)
4. **Java JDK**
## Installation
1. Clone this repository:
    ```bash 
    git clone https://github.com/adityadimasptra/lion-parcel-assignment-4.git
    ```
2. Navigate to the project directory:
    ```bash
    cd lion-parcel-assignment-4
    ```
3. Install the required Python depedencies:
    ```bash
    pip install -r requirements.txt
    ```
## Setting up the Android App
1. Download the Android app Lion Parcel from the following link: [Lion Parcel APK](https://drive.google.com/file/d/1oOYseSmvf3MpYhS5vv3DOJsP2QxDMtVu/view?usp=sharing), and the place it to directory: `/app/android/
## Running the Tests
Once everything is set up, you can run the tests using the following command:
```bash
robot tests/CheckRate.robot
```


