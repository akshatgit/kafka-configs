#!/bin/bash

sudo apt update
sudo apt-get install -y openjdk-11-jre
sudo apt-get install -y openjdk-11-jdk
sudo apt install -y  maven

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
sudo chown -R hsagar /data/kafka

sudo cp zookeeper/zk.service /etc/systemd/system/zk.service
sudo cp kafka/kafka.service /etc/systemd/system/kafka.service


cd /opt
sudo wget https://dlcdn.apache.org/zookeeper/zookeeper-3.8.0/apache-zookeeper-3.8.0-bin.tar.gz
sudo tar -xvf apache-zookeeper-3.8.0-bin.tar.gz
sudo chown zk -R  apache-zookeeper-3.8.0-bin
sudo ln -s apache-zookeeper-3.8.0-bin zookeeper
sudo chown -R zk apache-zookeeper-3.8.0-bin

sudo -u zk cp /users/hsagar/kafka-configs/zookeeper/zoo.cfg /opt/zookeeper/conf/
