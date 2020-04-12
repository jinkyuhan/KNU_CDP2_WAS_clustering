# CDP2_WAS_clustering


## Dependency

## Usage



# Project description

### Step 1. Build 2 images and Setup 3 containers with Docker-Compose

1. apache-server

&nbsp;&nbsp;&nbsp;&nbsp;Static web server to distribute requests to other Web Application Servers(tomcat)


2. tomcat-server1, tomcat-server2

&nbsp;&nbsp;&nbsp;&nbsp;Web Application Server(WAS) supporting each other. It provides Failover and Load  Balancing


