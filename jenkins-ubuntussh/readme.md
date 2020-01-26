# DockerFile

    This file contains the steps to make ubuntu image with ssh rdy to use
    
# docker-compose

	This file orquest the ubuntu images build and up the ubuntu container,
	and download jenkins docker image and build the container, the 2 containers
	living in the same network(net)-
	
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
	
	
	
