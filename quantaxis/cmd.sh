#!/bin/bash

forever start /QUANTAXIS/QUANTAXIS_Webkit/backend/bin/www
forever start /QUANTAXIS/QUANTAXIS_Webkit/web/build/dev-server.js
