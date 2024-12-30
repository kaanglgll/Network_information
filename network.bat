@echo off
mode con: cols=90 lines=250
echo Loading network information...
:loop
for /f "tokens=2 delims=:" %%a in ('netsh wlan show interface ^| find "SSID" ^| findstr /v "BSSID"') do set ssid= %%a
for /f "tokens=2 delims=:" %%a in ('netsh wlan show interface ^| find "Description"') do set adapter= %%a
for /f "tokens=2 delims=:" %%a in ('netsh wlan show interface ^| find "State"') do set state= %%a
for /f "tokens=2 delims=:" %%a in ('netsh wlan show interface ^| find "Signal"') do set signal= %%a
for /f "tokens=4 delims==" %%a in ('ping -n 2 8.8.8.8 ^| find "Average"') do set ping= %%a
for /f "tokens=2 delims "  %%a in ('netstat -e ^| find "Bytes"') do set rbytes=%%a 
for /f "tokens=2 delims "  %%a in ('netstat -e ^| find "Bytes"') do set sbytes=%%a
cls
echo.
echo  Network:
echo  ----------- 
echo  SSID:%ssid%
echo  NIC:%adapter%
echo  State:%state%
echo  Signal:%signal%
echo.
echo  Ping:
echo  ----------- 
echo  %ping%
echo received: %rbytes%
echo received: %sbytes% 
goto  loop
