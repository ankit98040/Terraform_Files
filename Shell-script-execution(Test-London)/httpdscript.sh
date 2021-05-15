#!/bin/bash

sudo yum install httpd -y 
sudo yum install php -y
sudo systemctl start httpd