@echo off
setlocal EnableDelayedExpansion

set _certificate=goIT Solutions, s.r.o.
set _thumbprint=CA24B654C5FFAC7D97BD196269BD0E80FADF1841

set PATH=%~dp0.build;%PATH%

mkdir out
mkdir out\signed

set libs=(Core Access Excel MSFormsApi MSProject Outlook PowerPoint Publisher Visio Word)

echo Signing NetOffice packages
nuget.exe sign "out\*.nupkg" -CertificateFingerprint "%_thumbprint%" -HashAlgorithm SHA256 -Timestamper http://timestamp.comodoca.com -TimestampHashAlgorithm SHA256 -Overwrite -OutputDirectory out\signed -NonInteractive -ForceEnglishOutput
if ERRORLEVEL 1 (
  echo Failed to sign packages.
)

nuget.exe sign "out\*.snupkg" -CertificateFingerprint "%_thumbprint%" -HashAlgorithm SHA256 -Timestamper http://timestamp.comodoca.com -TimestampHashAlgorithm SHA256 -Overwrite -OutputDirectory out\signed -NonInteractive -ForceEnglishOutput
if ERRORLEVEL 1 (
  echo Failed to sign symbols packages.
)
