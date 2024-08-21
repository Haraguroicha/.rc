Set-ExecutionPolicy Bypass -Scope Process -Force

oh-my-posh init pwsh | Invoke-Expression

$env:VCPKG_ROOT = "$env:USERPROFILE\gitRepos\vcpkg"
$env:PATH = "$env:VCPKG_ROOT;$env:PATH"
$env:VCPKGRS_DYNAMIC = "1"

Set-ExecutionPolicy Default -Scope Process -Force
