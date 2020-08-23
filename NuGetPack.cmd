@echo off
setlocal EnableDelayedExpansion

set _build=
IF NOT "%APPVEYOR_BUILD_NUMBER%"=="" (
  set _build=%APPVEYOR_BUILD_NUMBER%
)
IF NOT "%1"=="" (
  set _build=%1
)

set _suffix=
set _version=1.7.8%_build%%_suffix%
set _configuration=Release
IF NOT "%CONFIGURATION%"=="" (
  set _configuration=%CONFIGURATION%
)

set _branch=releases/netoffice_v1.7.8
set _commit=39761fb6f0fb1ec6c448b20a5ba7ef301b856b65

set PATH=%~dp0.build;%PATH%

mkdir out

set libs=(Core Access Excel MSFormsApi MSProject Outlook PowerPoint Publisher Visio Word)

for %%I in %libs% do (
  set library=%%I
  set file=NetOfficeFw.!library!.nuspec
  
  echo Packing NetOffice.!library!
  nuget.exe pack src\!file! -OutputDirectory out -Version "!_version!" -Symbols -SymbolPackageFormat snupkg ^
    -Properties Configuration=!_configuration!;GitBranch="!_branch!";GitCommit=!_commit! ^
    -NonInteractive -ForceEnglishOutput
  if ERRORLEVEL 1 (
    echo Failed to create package and symbols from !file!.
  )
)
