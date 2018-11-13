@echo off
setlocal EnableDelayedExpansion

set _build=5
set _version=1.7.4.%_build%
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
  set symbols=NetOfficeFw.!library!.!_version!!_suffix!.symbols.nupkg

  echo NetOffice.!library!
  echo  push !file!
  REM https://www.myget.org/F/netofficefw-dev/api/v2/package
  REM https://www.myget.org/F/netoffice/api/v2/package
  REM https://api.nuget.org/v3/index.json
  nuget.exe push out\signed\!file! "!_token!" -NonInteractive -ForceEnglishOutput -Source https://www.myget.org/F/netoffice/api/v2/package
  if ERRORLEVEL 1 (
    echo Failed to push to myget.org feed.
  )

  echo  push !symbols!
  REM https://www.myget.org/F/netofficefw-dev/symbols/api/v2/package
  REM https://www.myget.org/F/netoffice/symbols/api/v2/package
  REM https://nuget.smbsrc.net/
  nuget.exe push out\signed\!symbols! "!_token!" -NonInteractive -ForceEnglishOutput -Source https://www.myget.org/F/netoffice/symbols/api/v2/package
  if ERRORLEVEL 1 (
    echo Failed to push to myget.org symbols feed.
  )

  echo.
)
