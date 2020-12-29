@echo off
cd server
set FLASK_APP=server.py
flask run -h 192.168.1.13
