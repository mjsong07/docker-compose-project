#!/bin/sh
cd /app
pm2 start npm --name "projectname" -- run start
pm2 logs -f projectname