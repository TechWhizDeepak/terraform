#!/bin/bash
sudo yum update -y
sudo amazon-linux-extras install nginx1 -y 
sudo systemctl enable nginx
sudo systemctl start nginx
echo "Hi Deepak, How are you" > /usr/share/nginx/html/index.html