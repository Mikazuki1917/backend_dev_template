#!/bin/bash

inputArg () {
  read -p 'what is the db_name? ' db_name
  read -sp 'what is the db_root_password? ' db_root_password

  read -p 'Do you want to create user?[y/n] ' is_create_user

  if [ $is_create_user = 'n' ];then
      return
  fi

  read -p 'what is the db_user? ' db_user
  read -sp 'what is the db_user_password? ' db_user_password
}

setEnviromentVariable () {
  export DB_NAME=$db_name
  export DB_ROOT_PASSWORD=$db_root_password
  export DB_USER=$db_user
  export DB_USER_PASSWORD=$db_user_password
}

main () {
  inputArg
  setEnviromentVariable

  gitkeeps=`find . -name \.gitkeep -type f`

  for gitkeep in $gitkeeps;do
    rm $gitkeep
  done

  docker-compose up -d --build
  docker-compose exec php-api composer create-project --prefer-dist slim/slim-skeleton:dev-master .
}

main