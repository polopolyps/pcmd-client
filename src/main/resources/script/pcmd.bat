echo off
SETLOCAL ENABLEDELAYEDEXPANSION 

rem TODO 
rem pcmdwindow_getpearpath.bat
rem SET PCMD_PEAR_PATH=C:\projects\avid\polopoly\pear\

rem hot fix
SET PCMD_PEAR_PATH=%PEAR_PATH%

SET PCMD_OPTION=
SET PCMD_CLIENT_LIBS=

IF NOT "" == "%POLOPOLY_SERVER%" (
	SET PCMD_OPTION=%PCMD_OPTION% --server=%POLOPOLY_SERVER%
)

IF NOT "" == "%POLOPOLY_USER%" (
	SET PCMD_OPTION=%PCMD_OPTION% --user=%POLOPOLY_USER%
)

IF NOT "" == "%POLOPOLY_PASSWORD%" (
	SET PCMD_OPTION=%PCMD_OPTION% --password=%POLOPOLY_PASSWORD%
)

IF EXIST "..\custom-lib\*.jar" (
	FOR /F "tokens=*" %%G IN ('dir /b ..\custom-lib\*.jar') DO (
		SET PCMD_CLIENT_LIBS=!PCMD_CLIENT_LIBS!..\custom-lib\%%G;
	)
)

IF EXIST "..\lib\*.jar" (
	FOR /F "tokens=*" %%G IN ('dir /b ..\lib\*.jar') DO (
		SET PCMD_CLIENT_LIBS=!PCMD_CLIENT_LIBS!..\lib\%%G;
	)
)

IF EXIST "%PCMD_PEAR_PATH%..\custom\client-lib\*.jar" (
	FOR /F "tokens=*" %%G IN ('dir /b %PCMD_PEAR_PATH%..\custom\client-lib\*.jar') DO (
		SET PCMD_CLIENT_LIBS=!PCMD_CLIENT_LIBS!%PCMD_PEAR_PATH%..\custom\client-lib\%%G;
	)
)

IF EXIST "%PCMD_PEAR_PATH%..\jar-repository\policy-lib\*.jar" (
	FOR /F "tokens=*" %%G IN ('dir /b %PCMD_PEAR_PATH%..\jar-repository\policy-lib\*.jar') DO (
		SET PCMD_CLIENT_LIBS=!PCMD_CLIENT_LIBS!%PCMD_PEAR_PATH%..\jar-repository\policy-lib\%%G;
	)
)

IF "%1" == "--verbose" (
	echo "Full classpath consists of: %PCMD_CLIENT_LIBS%"
)

@echo "JAVA_OPTS=" %JAVA_OPTS% 
@echo "PCMD_CLIENT_LIBS=" %PCMD_CLIENT_LIBS% 
@echo "PCMD_OPTION=" %PCMD_OPTION% 

echo on
java %JAVA_OPTS% -cp %PCMD_CLIENT_LIBS% com.polopoly.ps.pcmd.Main%PCMD_OPTION% %*