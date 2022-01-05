@ECHO off

ECHO CLONE API
git clone https://github.com/Geronimo-montes/api-biometric-recognition
CD api-biometric-recognition
ECHO INSTALL DEPENDENCIS
@REM npm install
@REM npm install --dev

CD ..
ECHO INSTALL VIRTUALENV
pip install virtualenv

ECHO CLONE PROJECT PYTHON
git clone https://github.com/Geronimo-montes/biometric_recognition
CD biometric_recognition
ECHO CREATE VIRTUAL ENV IN CURRENT DIR
python -m venv .venv
ECHO INSTALL requirements.txt
pip install -r requirements.txt

CD ..
ECHO CREATE FORDER DATA
MKDIR data
