@ECHO OFF

REM
:: A batch script to display specific processes for routine monitoring.
:: This file must be saved in ASCII format to be executable.
::

REM lets set some variable
SET _user = "my/username"
SET _address = "xxx.xxx.xxx.xxx"

REM ask for password
SET /P _pass= Password: 

REM stop is password is empty
IF "%_pass%"=="" GOTO :end

REM provide feedback that something is happening
ECHO.
ECHO.
ECHO ...working...
ECHO.
ECHO.

REM display any process where memory usage is greater that 1 gig
tasklist /S %_address% /U %_user% /v /FI "MEMUSAGE gt 1000000" /P %_pass%

ECHO.
ECHO.

REM display any process that begins with the letters 'fm'
tasklist /S %_address% /U %_user% /v /FI "IMAGENAME eq fm*" /P %_pass%

ECHO.
ECHO.

REM display any process that begins with the letters 'java'
tasklist /S %_address% /U %_user% /v /FI "IMAGENAME eq java*" /P %_pass%

ECHO.
ECHO.

REM wait for user to press space bar or cancel program
PAUSE

:end