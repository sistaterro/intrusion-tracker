@echo off
cd /d "%~dp0"
start "" http://localhost:8080/intrusion_tracker.html
python -m http.server 8080
