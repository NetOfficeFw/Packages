@echo off
setlocal EnableDelayedExpansion

set _build=1
set _version=1.7.5.%_build%
set _suffix=

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

set libs=(Core Access Excel MSFormsApi MSProject Outlook PowerPoint Publisher Visio Word)

for %%I in %libs% do (
  set library=%%I
  set file=NetOfficeFw.!library!.!_version!!_suffix!.nupkg

  echo NetOffice.!library!
  echo  push !file!
  REM https://www.myget.org/F/netofficefw-dev/api/v2/package
  REM https://www.myget.org/F/netoffice/api/v2/package
  REM https://api.nuget.org/v3/index.json
  nuget.exe push out\signed\!file! "!_token!" -NonInteractive -ForceEnglishOutput -Source https://api.nuget.org/v3/index.json
  if ERRORLEVEL 1 (
    echo Failed to push to nuget.org feed.
  )

  echo.
)
