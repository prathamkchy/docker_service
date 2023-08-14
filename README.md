To make a docker image from this file run:

docker build -t my-lamp-image .


To run a docker image:

docker run -d -p 8080:80 --name my-lamp-container my-lamp-image
