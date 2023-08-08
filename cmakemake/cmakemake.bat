@echo off

if "%~3"=="" (
    echo Usage: %0 ^<project name^> ^<c or cpp^> ^<h or hpp^>
    echo Creates basic cmake project based on cli config
    exit /b 1
)

set "new_project_name=%~1"
set "currentDir=%CD%"

:: Check if the directory already exists
if exist "%new_project_name%\" (
    echo ERR! Directory already exists!: %new_project_name%
    exit /b 1
) else (
    mkdir "%new_project_name%"
    echo Directory created: %new_project_name%
)

set "project_zip_cpp-h=cmake_default_cpp-h.tar.gz"
set "project_zip_cpp-hpp=cmake_default_cpp-hpp.tar.gz"
set "project_zip_c-h=cmake_default_c-h.tar.gz"
set "project_zip_c-hpp=cmake_default_c-hpp.tar.gz"
if "%~2"=="cpp" (
    if "%~3"=="h" (
        tar -xzf "C:\cmakemake\%project_zip_cpp-h%" -C "%currentDir%\%new_project_name%"
    )
    if "%~3"=="hpp" (
        tar -xzf "C:\cmakemake\%project_zip_cpp-hpp%" -C "%currentDir%\%new_project_name%"
    )
)

if "%~2"=="c" (
    if "%~3"=="h" (
        tar -xzf "C:\cmakemake\%project_zip_c-h%" -C "%currentDir%\%new_project_name%"
    )
    if "%~3"=="hpp" (
        tar -xzf "C:\cmakemake\%project_zip_c-hpp%" -C "%currentDir%\%new_project_name%"
    )
)
echo Copied default files into %new_project_name%
cd "%new_project_name%"

set "cmake_file=CMakeLists.txt"

if not exist "%cmake_file%" (
    echo Error: CMakeLists.txt not found in the current directory.
    exit /b 1
)

:: Replace instances of "projectName" with the new project name in CMakeLists.txt
powershell -Command "(Get-Content -Path '%cmake_file%') -replace 'projectName', '%new_project_name%' | Set-Content -Path '%cmake_file%'"

:: Check if the second argument is "c" and replace .cpp with .c in CMakeLists.txt
if "%~2"=="c" (
    powershell -Command "(Get-Content -Path '%cmake_file%') -replace '\.cpp', '.c' | Set-Content -Path '%cmake_file%'"
)

if "%~3"=="hpp" (
    powershell -Command "(Get-Content -Path '%cmake_file%') -replace '\.h', '.hpp' | Set-Content -Path '%cmake_file%'"
)

if "%~2"=="c" (
    echo c project selected!
)

if "%~2"=="cpp" (
    echo cpp project selected!
)

if "%~3"=="h" (
    echo header files selected
)

if "%~3"=="hpp" (
    echo header++ files selected!
)

echo project created!

echo Done!

cd ..
