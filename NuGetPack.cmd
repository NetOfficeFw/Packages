@echo off
setlocal EnableDelayedExpansion

set _build=1
IF NOT "%APPVEYOR_BUILD_NUMBER%"=="" (
  set _build=%APPVEYOR_BUILD_NUMBER%
)
IF NOT "%1"=="" (
  set _build=%1
)

set _suffix=-pre1
set _version=1.7.4.%_build%%_suffix%
set _configuration=Release
IF NOT "%CONFIGURATION%"=="" (
  set _configuration=%CONFIGURATION%
)


set PATH=%~dp0.build;%PATH%

mkdir out

nuget.exe pack src\NetOffice.Core.nuspec -OutputDirectory out -Properties Configuration=%_configuration% -Version "%_version%" -NonInteractive -ForceEnglishOutput
if ERRORLEVEL 1 (
  exit /b 1
)

nuget.exe pack src\NetOffice.Access.nuspec -OutputDirectory out -Properties Configuration=%_configuration% -Version "%_version%" -NonInteractive -ForceEnglishOutput
if ERRORLEVEL 1 (
  exit /b 1
)

nuget.exe pack src\NetOffice.Excel.nuspec -OutputDirectory out -Properties Configuration=%_configuration% -Version "%_version%" -NonInteractive -ForceEnglishOutput
if ERRORLEVEL 1 (
  exit /b 1
)

nuget.exe pack src\NetOffice.MSFormsApi.nuspec -OutputDirectory out -Properties Configuration=%_configuration% -Version "%_version%" -NonInteractive -ForceEnglishOutput
if ERRORLEVEL 1 (
  exit /b 1
)

nuget.exe pack src\NetOffice.MSProject.nuspec -OutputDirectory out -Properties Configuration=%_configuration% -Version "%_version%" -NonInteractive -ForceEnglishOutput
if ERRORLEVEL 1 (
  exit /b 1
)

nuget.exe pack src\NetOffice.Outlook.nuspec -OutputDirectory out -Properties Configuration=%_configuration% -Version "%_version%" -NonInteractive -ForceEnglishOutput
if ERRORLEVEL 1 (
  exit /b 1
)

nuget.exe pack src\NetOffice.PowerPoint.nuspec -OutputDirectory out -Properties Configuration=%_configuration% -Version "%_version%" -NonInteractive -ForceEnglishOutput
if ERRORLEVEL 1 (
  exit /b 1
)

nuget.exe pack src\NetOffice.Visio.nuspec -OutputDirectory out -Properties Configuration=%_configuration% -Version "%_version%" -NonInteractive -ForceEnglishOutput
if ERRORLEVEL 1 (
  exit /b 1
)

nuget.exe pack src\NetOffice.Word.nuspec -OutputDirectory out -Properties Configuration=%_configuration% -Version "%_version%" -NonInteractive -ForceEnglishOutput
if ERRORLEVEL 1 (
  exit /b 1
)

