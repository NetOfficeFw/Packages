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
set _version=1.7.6%_build%%_suffix%
set _configuration=Release
IF NOT "%CONFIGURATION%"=="" (
  set _configuration=%CONFIGURATION%
)

set _branch=releases/netoffice_v1.7.6
set _commit=62107e02c5ba94d75d2f36b76ac5cd24fe2e898f

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
