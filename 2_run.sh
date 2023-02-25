#!/bin/bash

######################################################################################
#define
LOGSTASH_DIR_NAME="logstash-8.6.2"
KAFKA_DIR_NAME="kafka_2.13-3.4.0"
HADOOP_DIR_NAME="hadoop-3.3.4"

######################################################################################
# logstash

docker exec hadoop1 /bin/bash -c "/root/$LOGSTASH_DIR_NAME/bin/logstash -f /root/$LOGSTASH_DIR_NAME/config/logstash.conf -l /root/$LOGSTASH_DIR_NAME/log  >/dev/null 2>&1 &";
docker exec hadoop2 /bin/bash -c "/root/$LOGSTASH_DIR_NAME/bin/logstash -f /root/$LOGSTASH_DIR_NAME/config/logstash.conf -l /root/$LOGSTASH_DIR_NAME/log  >/dev/null 2>&1 &";
docker exec hadoop3 /bin/bash -c "/root/$LOGSTASH_DIR_NAME/bin/logstash -f /root/$LOGSTASH_DIR_NAME/config/logstash.conf -l /root/$LOGSTASH_DIR_NAME/log  >/dev/null 2>&1 &";
docker exec hadoop4 /bin/bash -c "/root/$LOGSTASH_DIR_NAME/bin/logstash -f /root/$LOGSTASH_DIR_NAME/config/logstash.conf -l /root/$LOGSTASH_DIR_NAME/log  >/dev/null 2>&1 &";
docker exec hadoop5 /bin/bash -c "/root/$LOGSTASH_DIR_NAME/bin/logstash -f /root/$LOGSTASH_DIR_NAME/config/logstash.conf -l /root/$LOGSTASH_DIR_NAME/log  >/dev/null 2>&1 &";

######################################################################################
# kafka

docker exec hadoop1 /bin/bash -c "source /root/.bashrc; /root/$KAFKA_DIR_NAME/bin/zookeeper-server-start.sh  -daemon /root/$KAFKA_DIR_NAME/config/zookeeper.properties"
docker exec hadoop2 /bin/bash -c "source /root/.bashrc; /root/$KAFKA_DIR_NAME/bin/zookeeper-server-start.sh  -daemon /root/$KAFKA_DIR_NAME/config/zookeeper.properties"
docker exec hadoop3 /bin/bash -c "source /root/.bashrc; /root/$KAFKA_DIR_NAME/bin/zookeeper-server-start.sh  -daemon /root/$KAFKA_DIR_NAME/config/zookeeper.properties"
docker exec hadoop4 /bin/bash -c "source /root/.bashrc; /root/$KAFKA_DIR_NAME/bin/zookeeper-server-start.sh  -daemon /root/$KAFKA_DIR_NAME/config/zookeeper.properties"
docker exec hadoop5 /bin/bash -c "source /root/.bashrc; /root/$KAFKA_DIR_NAME/bin/zookeeper-server-start.sh  -daemon /root/$KAFKA_DIR_NAME/config/zookeeper.properties"

docker exec hadoop1 /bin/bash -c "source /root/.bashrc; /root/$KAFKA_DIR_NAME/bin/kafka-server-start.sh -daemon /root/$KAFKA_DIR_NAME/config/server.properties"
docker exec hadoop2 /bin/bash -c "source /root/.bashrc; /root/$KAFKA_DIR_NAME/bin/kafka-server-start.sh -daemon /root/$KAFKA_DIR_NAME/config/server.properties"
docker exec hadoop3 /bin/bash -c "source /root/.bashrc; /root/$KAFKA_DIR_NAME/bin/kafka-server-start.sh -daemon /root/$KAFKA_DIR_NAME/config/server.properties"
docker exec hadoop4 /bin/bash -c "source /root/.bashrc; /root/$KAFKA_DIR_NAME/bin/kafka-server-start.sh -daemon /root/$KAFKA_DIR_NAME/config/server.properties"
docker exec hadoop5 /bin/bash -c "source /root/.bashrc; /root/$KAFKA_DIR_NAME/bin/kafka-server-start.sh -daemon /root/$KAFKA_DIR_NAME/config/server.properties"


docker exec hadoop1 /bin/bash -c "source /root/.bashrc; /root/$KAFKA_DIR_NAME/bin/kafka-topics.sh --create --bootstrap-server 192.168.101.11:9092,192.168.101.12:9092,192.168.101.13:9092,192.168.101.14:9092,192.168.101.15:9092 --replication-factor 3 --partitions 50 --topic logstash"
docker exec hadoop1 /bin/bash -c "source /root/.bashrc; /root/$KAFKA_DIR_NAME/bin/kafka-topics.sh --list --bootstrap-server 192.168.101.11:9092,192.168.101.12:9092,192.168.101.13:9092,192.168.101.14:9092,192.168.101.15:9092"

######################################################################################
# hadoop

docker exec hadoop1 /bin/bash -c "source /root/.bashrc; /root/$HADOOP_DIR_NAME/bin/hdfs namenode -format;"

docker exec hadoop1 /bin/bash -c "source /root/.bashrc; /root/$HADOOP_DIR_NAME/sbin/start-all.sh;"
docker exec hadoop2 /bin/bash -c "source /root/.bashrc; /root/$HADOOP_DIR_NAME/sbin/start-all.sh;"
docker exec hadoop3 /bin/bash -c "source /root/.bashrc; /root/$HADOOP_DIR_NAME/sbin/start-all.sh;"
docker exec hadoop4 /bin/bash -c "source /root/.bashrc; /root/$HADOOP_DIR_NAME/sbin/start-all.sh;"
docker exec hadoop5 /bin/bash -c "source /root/.bashrc; /root/$HADOOP_DIR_NAME/sbin/start-all.sh;"