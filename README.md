# Docker Simple SSH Server

A super simple SSH Server to use with your docker data containers on the cloud. 

## How to use

### Docker cloud

Run it like this (remeber to login to your docker-cloud if you are using it)


    docker-cloud run \
        --name=backup-helper \
        -e ROOT_PASSWORD=[my-cool-root-password] \
        --volumes-from=sk-content \
        -d \
        -p 2223:22 \
        --volumes-from=[my-data-container]
        24hrservice/ssh-server

Where ```[my-cool-root-password]``` should be your root password and ```[my-data-container]``` your data container.


## TL;DR

When you deploy containers to the cloud and you use a data container as volumes, 
you cant download files form the containers as easy as when everything is running on your machine.
One way is to have a SSH server on every container, or on your data container. 
But that isn't perfect, since you need to have an SSH on a container, which really should have that service.

### The solution

Since our data container is on the cloud, and there isn't any way of copying the data to your local machine, 
we need to open up something that gives us access. 
To do this we run a container with a SSH server and mount the data container to it. 
After that we just scp whatever we need and close the SSH server afterwards.



