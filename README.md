# BingeBox
A carefully selected collection of useful tools to enhance your viewing experience based on Docker.

## Description
This Docker image makes use of Docker-in-Docker for improved encapsulation of the underlying images. This improves security and only exposes the absolutely essential parts of the application to the outside world. The individual HTTP services this image provides will be linked together through the use of a reverse proxy. In our case, we'll be making use of Nginx for this matter. The underlying images will be making use of their own Docker container inside the Docker-in-Docker container. This will not only provide separation but will also take care of the PID 1 zombie problem because this limits each Docker container to only contain one process.

## Applications
### Content Aggregation and Processing
- Filebot

### Content Finder
- Sonarr
- CouchPotato
- Headphones
- Flexget

### Downloaders
- Deluge
- NZBGet

### File Sharing
- Pyd.io

### File Streaming and Conversion
- Plex

### Reverse Proxy
- Nginx

### Server Management
- OpenSSH
- ProFTPd