# Summary

    Jenkins server will take a mysql backup after it jenkins will upload
    with awscli to s3 service the mysql backup. To finish jenkins will 
    retrieve the mysql backup and jenkins will import again in our mysql
    container.
    
    For do it i inherit
    https://github.com/RaulAbejonDelgado/Docker/tree/master/jenkins-ubuntussh
    
    and :
    
    + added mysql container to docker compose
    
    + added in the ubuntu image the mysql ,
    with this we can connect from ubuntu container to mysql container.
    with the goal of with jenkins do a ssh connection to ubuntu container to connect with mysql container and execute script
    
    + added awscli to connect with amazon s3
    
# Ussed commands

## create mysql db
    Connect to ubuntu contianer:
    docker exec -it remote-host bash
    to connect to db_host (mysql) contaienr(For it mysql installed on ubuntu contaienr)
    mysql -u root -h db_host -p
    In mysql terminal:
    create database targetdb;
    use targetdb;
    create table info (name varchar(50), surname varchar(100), age int(3));
    insert into info values ('drohne','enhord',36);
    
## Export mysql db from ubuntu container (JENKINS WORK)
    mysqldump -u root -h db_host -p targetdb > /home/remote_user/targetdb.sql
    cd /home/remote_user/
    git add targetdb.sql
    git commit -m "Automated backup"
    git push origin master
    
## Pushing to github
    