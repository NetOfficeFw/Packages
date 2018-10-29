@echo off
setlocal EnableDelayedExpansion

set _build=.1
set _version=1.7.3%_build%
set _suffix=
set _certificate=Open Source Developer, Jozef Izso
set _fingerprint=533b9839aeba395ddfb303888629c88bff512983

set PATH=%~dp0.build;%PATH%

mkdir out
mkdir out\signed

set libs=(Core Access Excel MSFormsApi MSProject Outlook PowerPoint Visio Word)

for %%I in %libs% do (
  set library=%%I
  set file=NetOfficeFw.!library!.!_version!!_suffix!.nupkg
  set symbols=NetOfficeFw.!library!.!_version!!_suffix!.symbols.nupkg
  
  echo Signing NetOffice.!library!
  nuget.exe sign out\!file! -CertificateFingerprint "%_fingerprint%" -HashAlgorithm SHA256 -Timestamper http://timestamp.comodoca.com -TimestampHashAlgorithm SHA256 -Overwrite -OutputDirectory out\signed -NonInteractive -ForceEnglishOutput
  if ERRORLEVEL 1 (
    echo Failed to sign package !file!.
  )

  nuget.exe sign out\!symbols! -CertificateFingerprint "%_fingerprint%" -HashAlgorithm SHA256 -Timestamper http://timestamp.comodoca.com -TimestampHashAlgorithm SHA256 -Overwrite -OutputDirectory out\signed -NonInteractive -ForceEnglishOutput
  if ERRORLEVEL 1 (
    echo Failed to sign package !symbols!.
  )

)
