@echo off

set "source_folder=cmakemake"
set "destination_folder=C:\cmakemake"

rem Copy the folder
xcopy "%source_folder%" "%destination_folder%" /E /I

rem Add the destination folder to the PATH
powershell -Command "$existingPath = [Environment]::GetEnvironmentVariable('PATH', [EnvironmentVariableTarget]::Machine); $newPath = $existingPath + ';C:\cmakemake'; [Environment]::SetEnvironmentVariable('PATH', $newPath, [EnvironmentVariableTarget]::Machine);"

echo "cmakemake installed and added to PATH."
echo "use via cmakemake"
