@if (1==1) @if(1==0) @ELSE
@echo off&SETLOCAL ENABLEEXTENSIONS

@echo off
rem =======================================
rem uac.bat
rem Created    by Haraguroicha - 2013-08-16
rem Modified   by Haraguroicha - 2016-03-30
rem =======================================

net file 1>nul 2>nul
if "%errorlevel%" == "0" (
    color 2
    title UAC Authorized
    echo UAC Authorized
) else (
    color 42
    title Need UAC Authorize
    echo Call UAC Shell
    cscript.exe /E:Jscript /nologo "%~f0" %*
    exit
)

@goto :EOF
@end @ELSE
var args = WScript.Arguments;
var shellPath = ""
var params = [];
if(args.length > 0) shellPath = args.Item(0);
if(args.length > 1) {
    for(var i = 1; i < args.length; i++) {
        params.push(args.Item(i));
    }
}
if(shellPath != "") {
    var UAC = WSH.CreateObject("Shell.Application");
    UAC.ShellExecute(shellPath, params.join(' '), "", "runas", 1);
} else {
    WScript.Echo("Error of usage.");
}
@end

