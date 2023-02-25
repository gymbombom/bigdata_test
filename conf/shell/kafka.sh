#!/bin/bash

KAFKA_HOME=/root/kafka_2.13-3.4.0

CONNECT_STRING="hadoop1:9092,hadoop2:9092,hadoop3:9092,hadoop4:9092,hadoop5:9092"

case "$1" in
      start)
             /bin/echo "starting KAFKA"
             $KAFKA_HOME/bin/zookeeper-server-start.sh -daemon $KAFKA_HOME/config/zookeeper.properties
             sleep 10
             $KAFKA_HOME/bin/kafka-server-start.sh -daemon $KAFKA_HOME/config/server.properties
             ;;
      stop)
             /bin/echo "stopping KAFKA"
             /bin/echo ""
             $KAFKA_HOME/bin/kafka-server-stop.sh
             sleep 10
             $KAFKA_HOME/bin/zookeeper-server-stop.sh
             ;;
      list)
             /bin/echo  "kafka Topic list"
             $KAFKA_HOME/bin/kafka-topics.sh --list --bootstrap-server $CONNECT_STRING
             ;;
      consumer)
             echo -e "kafka Topic Consumer[$2]\n"
             $KAFKA_HOME/bin/kafka-console-consumer.sh --from-beginning  --bootstrap-server $CONNECT_STRING --topic $2             
             ;;             

      *)
            echo -e "Usage : kafka.sh [Option]\n"
            echo -e "Options: start | stop "
            echo -e "         list"
            echo -e "         consumer"
            exit 1
            ;;
esac
exit 0
