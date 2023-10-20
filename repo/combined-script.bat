@echo off
setlocal enabledelayedexpansion

:: Define the list of commands to run
set commands[0]=python -u train.py ETTh1 forecast_univar --loader forecast_csv_univar --repr-dims 320 --max-threads 8 --seed 42 --gpu None --eval
set commands[1]=python -u train.py ETTh2 forecast_univar --loader forecast_csv_univar --repr-dims 320 --max-threads 8 --seed 42 --gpu None --eval
set commands[2]=python -u train.py ETTm1 forecast_univar --loader forecast_csv_univar --repr-dims 320 --max-threads 8 --seed 42 --gpu None --eval
set commands[3]=python -u train.py ETTh1 forecast_multivar --loader forecast_csv --repr-dims 320 --max-threads 8 --seed 42 --gpu None --eval
set commands[4]=python -u train.py ETTh2 forecast_multivar --loader forecast_csv --repr-dims 320 --max-threads 8 --seed 42 --gpu None --eval
set commands[5]=python -u train.py ETTm1 forecast_multivar --loader forecast_csv --repr-dims 320 --max-threads 8 --seed 42 --gpu None --eval
set commands[6]=python -u train.py electricity forecast_univar --loader forecast_csv_univar --repr-dims 320 --max-threads 8 --seed 42 --gpu None --eval
set commands[7]=python -u train.py electricity forecast_multivar --loader forecast_csv --repr-dims 320 --max-threads 8 --seed 42 --gpu None --eval

:: Specify the output file
set output_file=command_output.txt

:: Clear the output file (if it already exists)
del %output_file%

:: Loop through the commands and execute them
for %%i in (0 1 2 3 4 5 6 7) do (
    echo Running command: !commands[%%i]! >> %output_file%
    echo ===================================== >> %output_file%
    !commands[%%i]! >> %output_file%
    echo. >> %output_file%
)

echo All commands have been executed, and the output is saved in %output_file%.