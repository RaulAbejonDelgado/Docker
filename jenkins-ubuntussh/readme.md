#Summary

    This is a jenkins and docker practise, where docker will up the jenkins
    container and ubuntu with ssh container.
    After that you can configure the jenkins downloading ssh_client plugin
    to configure a job that it can connect by ssh to ubuntu container and
    execute a simple script.

# DockerFile

    This file contains the steps to make ubuntu image with ssh rdy to use
    
# docker-compose

	Ubuntu so and jenkins have the persist volumens  data 
	
	In the ubuntu folder must contain the ssh remote-key files to up ubuntu container successfully
	
	Steps:
	
	1- docker-compose build
	2- docker-compose up
	
	
	To stop all containers:
	
	docker-compose down
	
	To destroy all containers:
	
	docker-compose down
	
# Generate ssh-key

	ssh-heygen -f name-file-keygen, this command will generate 2 files.
	
	
	
