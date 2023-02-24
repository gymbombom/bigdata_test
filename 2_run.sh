
#!/bin/bash

######################################################################################
# logstash

docker exec hadoop1 /bin/bash -c "/root/logstash-8.6.0/bin/logstash -f /root/logstash-8.6.0/config/logstash.conf -l /root/logstash-8.6.0/log  >/dev/null 2>&1 &";
docker exec hadoop2 /bin/bash -c "/root/logstash-8.6.0/bin/logstash -f /root/logstash-8.6.0/config/logstash.conf -l /root/logstash-8.6.0/log  >/dev/null 2>&1 &";
docker exec hadoop3 /bin/bash -c "/root/logstash-8.6.0/bin/logstash -f /root/logstash-8.6.0/config/logstash.conf -l /root/logstash-8.6.0/log  >/dev/null 2>&1 &";
docker exec hadoop4 /bin/bash -c "/root/logstash-8.6.0/bin/logstash -f /root/logstash-8.6.0/config/logstash.conf -l /root/logstash-8.6.0/log  >/dev/null 2>&1 &";
docker exec hadoop5 /bin/bash -c "/root/logstash-8.6.0/bin/logstash -f /root/logstash-8.6.0/config/logstash.conf -l /root/logstash-8.6.0/log  >/dev/null 2>&1 &";

######################################################################################