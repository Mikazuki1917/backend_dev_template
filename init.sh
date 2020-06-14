#!/bin/bash

gitkeeps=`find . -name \.gitkeep -type f`

for gitkeep in $gitkeeps;do
  rm $gitkeep
done

docker-compose up -d --build
docker-compose exec php-api composer create-project --prefer-dist slim/slim-skeleton:dev-master .
