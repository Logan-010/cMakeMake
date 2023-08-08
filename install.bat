@echo off

set "source_folder=cmakemake"
set "destination_folder=C:\cmakemake"

rem Copy the folder
xcopy "%source_folder%" "%destination_folder%" /E /I

echo "cmakemake installed, read WARNING.txt to add to path"
echo "use via cmakemake"

pause
