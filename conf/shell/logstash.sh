#!/bin/bash

LOGSTASH_HOME=/root/logstash-8.6.2


case "$1" in
      start)
             /bin/echo "starting logstash"
             /bin/echo ""
             $LOGSTASH_HOME/bin/logstash -f $LOGSTASH_HOME/config/logstash.conf -l $LOGSTASH_HOME/log  >/dev/null 2>&1 &
             ;;
      stop)
             /bin/echo "stopping logstash"
             /bin/echo ""
	         ps -ef | grep -i 'logstash-8.6.2/config/logstash.conf' | grep -v grep | awk '{print $2}' | xargs kill -9
             ;;
      *)
            echo -e "Usage : logstash.sh [Option]\n"
            echo -e "Options: start | stop "            
            exit 1
            ;;
esac
exit 0