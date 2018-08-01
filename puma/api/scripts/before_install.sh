#!/bin/bash

APP_DIR="/var/www/api"

if [ ! -d $APP_DIR ]; then
  mkdir -p $APP_DIR
fi
