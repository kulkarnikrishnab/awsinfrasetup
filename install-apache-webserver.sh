#!/bin/bash
sudo amazon-linux-extras install epel
sudo yum -y install httpd
sudo systemctl start httpd
sudo systemctl enable httpd
