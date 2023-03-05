#!/bin/bash

cd ./docker-compose || exit
cp .env.tmpl .env
docker-compose up -d
