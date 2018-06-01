#!/bin/bash

forever start /QUANTAXIS/QUANTAXIS_Webkit/backend/bin/www
cd /QUANTAXIS/QUANTAXIS_Webkit/web/
npm run dev
