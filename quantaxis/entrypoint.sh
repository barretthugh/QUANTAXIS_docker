#!/bin/bash
set -e

set -i "s|localhost|$MONGODB|" /QUANTAXIS/QUANTAXIS/QAUtil/QASetting.py
exec "$@"
