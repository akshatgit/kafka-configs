#!/bin/bash

sudo useradd zk -m
sudo usermod --shell /bin/bash zk
 echo "zk:1234" | sudo chpasswd
 sudo usermod -aG sudo zk

sudo mkdir -p /data/
sudo mkfs.ext4 /dev/sdb
sudo mount /dev/sdb /data
sudo mkdir -p /data/zookeeper
sudo chown -R zk /data/zookeeper
sudo mkdir -p /data/kafka
cd /opt
sudo wget https://dlcdn.apache.org/zookeeper/zookeeper-3.8.0/apache-zookeeper-3.8.0-bin.tar.gz
sudo tar -xvf apache-zookeeper-3.8.0-bin.tar.gz
sudo chown zk -R  apache-zookeeper-3.8.0-bin.tar.gz
sudo ln -s apache-zookeeper-3.8.0-bin.tar.gz zookeeper
sudo chown -h zk zookeeper