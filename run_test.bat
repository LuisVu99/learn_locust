@echo off
REM Script to run Locust load tests locally on Windows

echo.
echo ^(^) Locust Load Testing Script
echo ==============================
echo.

REM Check if locust is installed
where locust >nul 2>nul
if %errorlevel% neq 0 (
    echo. Installing dependencies...
    pip install -r requirements.txt
)

REM Get parameters or use defaults
setlocal enabledelayedexpansion
set HOST=%1
if "!HOST!"=="" set HOST=http://localhost:8000

set USERS=%2
if "!USERS!"=="" set USERS=10

set SPAWN_RATE=%3
if "!SPAWN_RATE!"=="" set SPAWN_RATE=2

set RUN_TIME=%4
if "!RUN_TIME!"=="" set RUN_TIME=1m

echo. Configuration:
echo.   Host: !HOST!
echo.   Users: !USERS!
echo.   Spawn Rate: !SPAWN_RATE!
echo.   Run Time: !RUN_TIME!
echo.

echo. Starting load test...
locust -f locustfile.py ^
  --host=!HOST! ^
  --users=!USERS! ^
  --spawn-rate=!SPAWN_RATE! ^
  --run-time=!RUN_TIME! ^
  --headless ^
  --csv=results ^
  --csv-prefix=""

echo.
echo. Test completed!
echo. Results saved to results_*.csv
echo.

endlocal
