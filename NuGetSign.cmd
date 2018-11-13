@echo off
setlocal EnableDelayedExpansion

set _certificate=Open Source Developer, Jozef Izso
set _thumbprint=533B9839AEBA395DDFB303888629C88BFF512983

set PATH=%~dp0.build;%PATH%

mkdir out
mkdir out\signed

set libs=(Core Access Excel MSFormsApi MSProject Outlook PowerPoint Publisher Visio Word)

echo Signing NetOffice packages
nuget.exe sign "out\*.nupkg" -CertificateFingerprint "%_thumbprint%" -HashAlgorithm SHA256 -Timestamper http://timestamp.comodoca.com -TimestampHashAlgorithm SHA256 -Overwrite -OutputDirectory out\signed -NonInteractive -ForceEnglishOutput
if ERRORLEVEL 1 (
  echo Failed to sign packages.
)
