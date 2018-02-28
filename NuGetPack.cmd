@echo off
setlocal EnableDelayedExpansion

set _build=3
IF NOT "%APPVEYOR_BUILD_NUMBER%"=="" (
  set _build=%APPVEYOR_BUILD_NUMBER%
)
IF NOT "%1"=="" (
  set _build=%1
)

set _suffix=
set _version=1.7.4.%_build%%_suffix%
set _configuration=Release
IF NOT "%CONFIGURATION%"=="" (
  set _configuration=%CONFIGURATION%
)


set PATH=%~dp0.build;%PATH%

mkdir out

nuget.exe pack src\NetOfficeFw.Core.nuspec -OutputDirectory out -Properties Configuration=%_configuration% -Version "%_version%" -NonInteractive -ForceEnglishOutput
if ERRORLEVEL 1 (
  exit /b 1
)

nuget.exe pack src\NetOfficeFw.Access.nuspec -OutputDirectory out -Properties Configuration=%_configuration% -Version "%_version%" -NonInteractive -ForceEnglishOutput
if ERRORLEVEL 1 (
  exit /b 1
)

nuget.exe pack src\NetOfficeFw.Excel.nuspec -OutputDirectory out -Properties Configuration=%_configuration% -Version "%_version%" -NonInteractive -ForceEnglishOutput
if ERRORLEVEL 1 (
  exit /b 1
)

nuget.exe pack src\NetOfficeFw.MSFormsApi.nuspec -OutputDirectory out -Properties Configuration=%_configuration% -Version "%_version%" -NonInteractive -ForceEnglishOutput
if ERRORLEVEL 1 (
  exit /b 1
)

nuget.exe pack src\NetOfficeFw.MSProject.nuspec -OutputDirectory out -Properties Configuration=%_configuration% -Version "%_version%" -NonInteractive -ForceEnglishOutput
if ERRORLEVEL 1 (
  exit /b 1
)

nuget.exe pack src\NetOfficeFw.Outlook.nuspec -OutputDirectory out -Properties Configuration=%_configuration% -Version "%_version%" -NonInteractive -ForceEnglishOutput
if ERRORLEVEL 1 (
  exit /b 1
)

nuget.exe pack src\NetOfficeFw.PowerPoint.nuspec -OutputDirectory out -Properties Configuration=%_configuration% -Version "%_version%" -NonInteractive -ForceEnglishOutput
if ERRORLEVEL 1 (
  exit /b 1
)

nuget.exe pack src\NetOfficeFw.Visio.nuspec -OutputDirectory out -Properties Configuration=%_configuration% -Version "%_version%" -NonInteractive -ForceEnglishOutput
if ERRORLEVEL 1 (
  exit /b 1
)

nuget.exe pack src\NetOfficeFw.Word.nuspec -OutputDirectory out -Properties Configuration=%_configuration% -Version "%_version%" -NonInteractive -ForceEnglishOutput
if ERRORLEVEL 1 (
  exit /b 1
)

