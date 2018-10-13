@echo off
setlocal EnableDelayedExpansion

set _build=
set _version=1.7.3%_build%
set _suffix=-preview1
set _certificate=Open Source Developer, Jozef Izso

set PATH=%~dp0.build;%PATH%

mkdir out
mkdir out\signed

set libs=(Core Access Excel MSFormsApi MSProject Outlook PowerPoint Visio Word)

for %%I in %libs% do (
  set library=%%I
  set file=NetOfficeFw.!library!.!_version!!_suffix!.nupkg
  set symbols=NetOfficeFw.!library!.!_version!!_suffix!.symbols.nupkg
  
  echo Signing NetOffice.!library!
  nuget.exe sign out\!file! -CertificateSubjectName "%_certificate%" -HashAlgorithm SHA256 -Timestamper http://timestamp.comodoca.com -TimestampHashAlgorithm SHA256 -Overwrite -OutputDirectory out\signed -NonInteractive -ForceEnglishOutput
  if ERRORLEVEL 1 (
    echo Failed to sign package !file!.
  )

  nuget.exe sign out\!symbols! -CertificateSubjectName "%_certificate%" -HashAlgorithm SHA256 -Timestamper http://timestamp.comodoca.com -TimestampHashAlgorithm SHA256 -Overwrite -OutputDirectory out\signed -NonInteractive -ForceEnglishOutput
  if ERRORLEVEL 1 (
    echo Failed to sign package !symbols!.
  )

)
