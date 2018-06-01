#!/bin/bash

forever start /quantaxis/QUANTAXIS_Webkit/backend/bin/www
forever start /quantaxis/QUANTAXIS_Webkit/web/build/dev-server.js
