#!/bin/bash

#Parameters that it will configured from jenkins
DB_HOST=$1
DB_PASSWORD=$2
DB_NAME=$3
DATE=$(date +_%H-%M-%S)
GIT_USER=$4
GIT_PASS=$5
DIR="/home/remote_user/automated_exports"

#changing to root user

#sudo su

#export db
mysqldump -u root -h $DB_HOST -p$DB_PASSWORD $DB_NAME > /home/remote_user/targetdb$DATE.sql

if [ -d "$DIR" ]; then
  ### Take action if $DIR exists ###
  echo "Installing config files in ${DIR}..."
  
else
  ###  Control will jump here if $DIR does NOT exists ###
  mkdir automated_exports
  cd /home/remote_user/automated_exports
  git init
  git config --global user.name "RaulAbejonDelgado"
  git config --global user.email "raul.abejon.delgado@gmail.com"
  git remote add origin https://github.com/RaulAbejonDelgado/automated_exports.git
  
  
fi

#git remote set-url origin https://$GIT_USER:$GIT_PASS@github.com/$GIT_USER/automated_exports.git
#git pull
#cp /home/remote_user/targetdb$DATE.sql > home/remote_user/automated_exports
#git add .
#git commit -m 'Automated push by jenkins'
#git push origin master

#upload to some plataflorm in this case github
cp /home/remote_user/targetdb$DATE.sql /home/remote_user/automated_exports/targetdb$DATE.sql
git remote set-url origin https://$GIT_USER:$GIT_PASS@github.com/$GIT_USER/automated_exports.git
git pull origin master
git add .
git commit -m 'Automated push by jenkins'
git push origin master

#cd ..
#rm -r /home/remote_user/automated_exports *

#aws command
#export AWS_ACCESS_KEY_ID=
#export AWS_SECRET_ACCESS_KEY=
#aws s3 cp /home/remote_user/targetdb_$DATE.sql://BUCKETNAME
