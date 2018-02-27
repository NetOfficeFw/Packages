@echo off
setlocal EnableDelayedExpansion

set _build=1
set _version=1.7.4.%_build%
set _suffix=-pre1

set _token=
IF NOT "%1"=="" (
  set _token=%1
)

IF "%_token%"=="" (
  echo No API key token was provided on command line.
  echo Usage: NuGetPush.cmd token
  exit /b 2
)

set PATH=%~dp0.build;%PATH%

nuget.exe push out\NetOfficeFw.Core.%_version%%_suffix%.nupkg "%_token%" -NonInteractive -ForceEnglishOutput -Source https://www.myget.org/F/netoffice/api/v2/package
if ERRORLEVEL 1 (
  exit /b 1
)

nuget.exe push out\NetOfficeFw.Access.%_version%%_suffix%.nupkg "%_token%" -NonInteractive -ForceEnglishOutput -Source https://www.myget.org/F/netoffice/api/v2/package
if ERRORLEVEL 1 (
  exit /b 1
)

nuget.exe push out\NetOfficeFw.Excel.%_version%%_suffix%.nupkg "%_token%" -NonInteractive -ForceEnglishOutput -Source https://www.myget.org/F/netoffice/api/v2/package
if ERRORLEVEL 1 (
  exit /b 1
)

nuget.exe push out\NetOfficeFw.MSForms.%_version%%_suffix%.nupkg "%_token%" -NonInteractive -ForceEnglishOutput -Source https://www.myget.org/F/netoffice/api/v2/package
if ERRORLEVEL 1 (
  exit /b 1
)

nuget.exe push out\NetOfficeFw.MSProject.%_version%%_suffix%.nupkg "%_token%" -NonInteractive -ForceEnglishOutput -Source https://www.myget.org/F/netoffice/api/v2/package
if ERRORLEVEL 1 (
  exit /b 1
)

nuget.exe push out\NetOfficeFw.Outlook.%_version%%_suffix%.nupkg "%_token%" -NonInteractive -ForceEnglishOutput -Source https://www.myget.org/F/netoffice/api/v2/package
if ERRORLEVEL 1 (
  exit /b 1
)

nuget.exe push out\NetOfficeFw.PowerPoint.%_version%%_suffix%.nupkg "%_token%" -NonInteractive -ForceEnglishOutput -Source https://www.myget.org/F/netoffice/api/v2/package
if ERRORLEVEL 1 (
  exit /b 1
)

nuget.exe push out\NetOfficeFw.Visio.%_version%%_suffix%.nupkg "%_token%" -NonInteractive -ForceEnglishOutput -Source https://www.myget.org/F/netoffice/api/v2/package
if ERRORLEVEL 1 (
  exit /b 1
)

nuget.exe push out\NetOfficeFw.Word.%_version%%_suffix%.nupkg "%_token%" -NonInteractive -ForceEnglishOutput -Source https://www.myget.org/F/netoffice/api/v2/package
if ERRORLEVEL 1 (
  exit /b 1
)

