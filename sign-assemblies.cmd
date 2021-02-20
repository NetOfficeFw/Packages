@echo off
setlocal EnableDelayedExpansion

set _certificate=goIT Solutions, s.r.o.
set _thumbprint=CA24B654C5FFAC7D97BD196269BD0E80FADF1841

set PATH=C:\Program Files (x86)\Windows Kits\10\bin\10.0.18362.0\x86;%PATH%

echo Signing NetOffice libraries
echo signtool.exe sign /v /debug /fd sha256 /td sha256 /sha1 "%_thumbprint%" /tr http://timestamp.comodoca.com/rfc3161 "libs\*.dll"
signtool.exe sign /v /fd sha256 /td sha256 /sha1 "%_thumbprint%" /tr http://timestamp.comodoca.com/rfc3161 "libs\*.dll"

if ERRORLEVEL 1 (
  echo Failed to sign assemblies.
)
