@ECHO off
SET current_dir=%~dp0

IF not exist "%current_dir%\data" MKDIR data
IF not exist "%current_dir%\model" MKDIR model
IF not exist "%current_dir%\model\database" MKDIR model\database

ECHO Instalando 'virtualenv'
pip install virtualenv

IF not exist "%current_dir%\biometric_recognition" git clone https://github.com/Geronimo-montes/biometric_recognition
CD biometric_recognition
IF not exist "%current_dir%\biometric_recognition\.venv" CALL python -m venv .venv
CALL "%current_dir%\biometric_recognition\.venv\Scripts\pip.exe" install -r requirements.txt
CD "%current_dir%"

IF not exist "%current_dir%\api-biometric-recognition" git clone https://github.com/Geronimo-montes/api-biometric-recognition
CD api-biometric-recognition
CALL npm install
CD "%current_dir%"

IF not exist "%current_dir%\app-user-authentication" git clone https://github.com/Geronimo-montes/app-user-authentication
CD app-user-authentication
CALL npm install
CD "%current_dir%"

ECHO Run Project...
CD "%current_dir%\api-biometric-recognition"
START "RUN api-biometric-recognition Project" CALL npm start

CD "%current_dir%\app-user-authentication"
START "RUN app-user-authentication Project" CALL npm start
EXIT