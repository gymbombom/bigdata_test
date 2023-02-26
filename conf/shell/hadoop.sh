#!/bin/bash

HADOOP_HOME=/root/hadoop-3.3.4

case "$1" in
     start-all)
            /bin/echo "starting HADOOP"
            $HADOOP_HOME/sbin/start-all.sh
            ;;
     stop-all)
            /bin/echo "stopping HADOOP"
            $HADOOP_HOME/sbin/stop-all.sh
            ;;            
      *)
            echo -e "Usage : hadoop.sh [Option]\n"
            echo -e "Options: start-all | stop-all"
            exit 1
            ;;
esac
exit 0           