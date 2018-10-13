@echo off
setlocal EnableDelayedExpansion

set _build=3
IF NOT "%APPVEYOR_BUILD_NUMBER%"=="" (
  set _build=%APPVEYOR_BUILD_NUMBER%
)
IF NOT "%1"=="" (
  set _build=%1
)

set _suffix=-hotfix
set _version=1.7.4.%_build%%_suffix%
set _configuration=Release
IF NOT "%CONFIGURATION%"=="" (
  set _configuration=%CONFIGURATION%
)


set PATH=%~dp0.build;%PATH%

mkdir out

::set libs=(Core Access Excel MSFormsApi MSProject Outlook PowerPoint Publisher Visio Word)
set libs=(Publisher)

for %%I in %libs% do (
  set library=%%I
  set file=NetOfficeFw.!library!.nuspec
  
  echo Packing NetOffice.!library!
  nuget.exe pack src\!file! -OutputDirectory out -Properties Configuration=!_configuration! -Version "!_version!" -Symbols -NonInteractive -ForceEnglishOutput
  if ERRORLEVEL 1 (
    echo Failed to create package from !file!.
  )
)
