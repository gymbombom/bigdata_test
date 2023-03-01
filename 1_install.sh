#!/bin/bash

######################################################################################
#define
JDK_DIR_NAME_11="zulu11.62.17-ca-jdk11.0.18"
LOGSTASH_DIR_NAME="logstash-8.6.2"
KAFKA_DIR_NAME="kafka_2.13-3.4.0"
HADOOP_DIR_NAME="hadoop-3.3.4"
ES_DIR_NAME="elasticsearch-8.6.2"

######################################################################################
#sshd 설정

docker exec hadoop1 sed -i  "/#Port 22/ c\Port 22" /etc/ssh/sshd_config;
docker exec hadoop2 sed -i  "/#Port 22/ c\Port 22" /etc/ssh/sshd_config;
docker exec hadoop3 sed -i  "/#Port 22/ c\Port 22" /etc/ssh/sshd_config;
docker exec hadoop4 sed -i  "/#Port 22/ c\Port 22" /etc/ssh/sshd_config;
docker exec hadoop5 sed -i  "/#Port 22/ c\Port 22" /etc/ssh/sshd_config;

docker exec hadoop1 sed -i  "/StrictHostKeyChecking/ c\StrictHostKeyChecking no" /etc/ssh/ssh_config;
docker exec hadoop2 sed -i  "/StrictHostKeyChecking/ c\StrictHostKeyChecking no" /etc/ssh/ssh_config;
docker exec hadoop3 sed -i  "/StrictHostKeyChecking/ c\StrictHostKeyChecking no" /etc/ssh/ssh_config;
docker exec hadoop4 sed -i  "/StrictHostKeyChecking/ c\StrictHostKeyChecking no" /etc/ssh/ssh_config;
docker exec hadoop5 sed -i  "/StrictHostKeyChecking/ c\StrictHostKeyChecking no" /etc/ssh/ssh_config;


docker exec hadoop1 /bin/bash -c "ssh-keygen -t rsa -P '' -f /etc/ssh/ssh_host_rsa_key; \
                               ssh-keygen -t ecdsa -P '' -f /etc/ssh/ssh_host_ecdsa_key; \
                               ssh-keygen -t ed25519 -P '' -f /etc/ssh/ssh_host_ed25519_key;"
docker exec hadoop2 /bin/bash -c "ssh-keygen -t rsa -P '' -f /etc/ssh/ssh_host_rsa_key; \
                               ssh-keygen -t ecdsa -P '' -f /etc/ssh/ssh_host_ecdsa_key; \
                               ssh-keygen -t ed25519 -P '' -f /etc/ssh/ssh_host_ed25519_key;"
docker exec hadoop3 /bin/bash -c "ssh-keygen -t rsa -P '' -f /etc/ssh/ssh_host_rsa_key; \
                               ssh-keygen -t ecdsa -P '' -f /etc/ssh/ssh_host_ecdsa_key; \
                               ssh-keygen -t ed25519 -P '' -f /etc/ssh/ssh_host_ed25519_key;"
docker exec hadoop4 /bin/bash -c "ssh-keygen -t rsa -P '' -f /etc/ssh/ssh_host_rsa_key; \
                               ssh-keygen -t ecdsa -P '' -f /etc/ssh/ssh_host_ecdsa_key; \
                               ssh-keygen -t ed25519 -P '' -f /etc/ssh/ssh_host_ed25519_key;"
docker exec hadoop5 /bin/bash -c "ssh-keygen -t rsa -P '' -f /etc/ssh/ssh_host_rsa_key; \
                               ssh-keygen -t ecdsa -P '' -f /etc/ssh/ssh_host_ecdsa_key; \
                               ssh-keygen -t ed25519 -P '' -f /etc/ssh/ssh_host_ed25519_key;"

docker exec hadoop1 /bin/bash -c "/usr/sbin/sshd"
docker exec hadoop2 /bin/bash -c "/usr/sbin/sshd"
docker exec hadoop3 /bin/bash -c "/usr/sbin/sshd"
docker exec hadoop4 /bin/bash -c "/usr/sbin/sshd"
docker exec hadoop5 /bin/bash -c "/usr/sbin/sshd"

docker exec hadoop1 /bin/bash -c "ssh-keygen -t rsa -P '' -f /root/.ssh/id_rsa;"
docker exec hadoop2 /bin/bash -c "ssh-keygen -t rsa -P '' -f /root/.ssh/id_rsa;"
docker exec hadoop3 /bin/bash -c "ssh-keygen -t rsa -P '' -f /root/.ssh/id_rsa;"
docker exec hadoop4 /bin/bash -c "ssh-keygen -t rsa -P '' -f /root/.ssh/id_rsa;"
docker exec hadoop5 /bin/bash -c "ssh-keygen -t rsa -P '' -f /root/.ssh/id_rsa;"

docker exec hadoop1 /bin/bash -c "sshpass -p root ssh-copy-id -i ~/.ssh/id_rsa.pub root@192.168.101.11;  \
                               sshpass -p root ssh-copy-id -i ~/.ssh/id_rsa.pub root@192.168.101.12; \
                               sshpass -p root ssh-copy-id -i ~/.ssh/id_rsa.pub root@192.168.101.13; \
                               sshpass -p root ssh-copy-id -i ~/.ssh/id_rsa.pub root@192.168.101.14; \
                               sshpass -p root ssh-copy-id -i ~/.ssh/id_rsa.pub root@192.168.101.15;
                              "
docker exec hadoop2 /bin/bash -c "sshpass -p root ssh-copy-id -i ~/.ssh/id_rsa.pub root@192.168.101.11;  \
                               sshpass -p root ssh-copy-id -i ~/.ssh/id_rsa.pub root@192.168.101.12; \
                               sshpass -p root ssh-copy-id -i ~/.ssh/id_rsa.pub root@192.168.101.13; \
                               sshpass -p root ssh-copy-id -i ~/.ssh/id_rsa.pub root@192.168.101.14; \
                               sshpass -p root ssh-copy-id -i ~/.ssh/id_rsa.pub root@192.168.101.15;
                              "
docker exec hadoop3 /bin/bash -c "sshpass -p root ssh-copy-id -i ~/.ssh/id_rsa.pub root@192.168.101.11;  \
                               sshpass -p root ssh-copy-id -i ~/.ssh/id_rsa.pub root@192.168.101.12; \
                               sshpass -p root ssh-copy-id -i ~/.ssh/id_rsa.pub root@192.168.101.13; \
                               sshpass -p root ssh-copy-id -i ~/.ssh/id_rsa.pub root@192.168.101.14; \
                               sshpass -p root ssh-copy-id -i ~/.ssh/id_rsa.pub root@192.168.101.15;
                              "
docker exec hadoop4 /bin/bash -c "sshpass -p root ssh-copy-id -i ~/.ssh/id_rsa.pub root@192.168.101.11;  \
                               sshpass -p root ssh-copy-id -i ~/.ssh/id_rsa.pub root@192.168.101.12; \
                               sshpass -p root ssh-copy-id -i ~/.ssh/id_rsa.pub root@192.168.101.13; \
                               sshpass -p root ssh-copy-id -i ~/.ssh/id_rsa.pub root@192.168.101.14; \
                               sshpass -p root ssh-copy-id -i ~/.ssh/id_rsa.pub root@192.168.101.15;
                              "
docker exec hadoop5 /bin/bash -c "sshpass -p root ssh-copy-id -i ~/.ssh/id_rsa.pub root@192.168.101.11;  \
                               sshpass -p root ssh-copy-id -i ~/.ssh/id_rsa.pub root@192.168.101.12; \
                               sshpass -p root ssh-copy-id -i ~/.ssh/id_rsa.pub root@192.168.101.13; \
                               sshpass -p root ssh-copy-id -i ~/.ssh/id_rsa.pub root@192.168.101.14; \
                               sshpass -p root ssh-copy-id -i ~/.ssh/id_rsa.pub root@192.168.101.15;
                              "                                                            

######################################################################################
# host파일 설정

docker exec hadoop1 /bin/bash -c "echo '' >> /etc/hosts; \
			       echo '192.168.101.11  hadoop1' >> /etc/hosts; \
			       echo '192.168.101.12  hadoop2' >> /etc/hosts; \
			       echo '192.168.101.13  hadoop3' >> /etc/hosts; \
			       echo '192.168.101.14  hadoop4' >> /etc/hosts; \
			       echo '192.168.101.15  hadoop5' >> /etc/hosts;" 
docker exec hadoop2 /bin/bash -c "echo '' >> /etc/hosts; \
                               echo '192.168.101.11  hadoop1' >> /etc/hosts; \
                               echo '192.168.101.12  hadoop2' >> /etc/hosts; \
                               echo '192.168.101.13  hadoop3' >> /etc/hosts; \
                               echo '192.168.101.14  hadoop4' >> /etc/hosts; \
                               echo '192.168.101.15  hadoop5' >> /etc/hosts;"
docker exec hadoop3 /bin/bash -c "echo '' >> /etc/hosts; \
                               echo '192.168.101.11  hadoop1' >> /etc/hosts; \
                               echo '192.168.101.12  hadoop2' >> /etc/hosts; \
                               echo '192.168.101.13  hadoop3' >> /etc/hosts; \
                               echo '192.168.101.14  hadoop4' >> /etc/hosts; \
                               echo '192.168.101.15  hadoop5' >> /etc/hosts;"
docker exec hadoop4 /bin/bash -c "echo '' >> /etc/hosts; \
                               echo '192.168.101.11  hadoop1' >> /etc/hosts; \
                               echo '192.168.101.12  hadoop2' >> /etc/hosts; \
                               echo '192.168.101.13  hadoop3' >> /etc/hosts; \
                               echo '192.168.101.14  hadoop4' >> /etc/hosts; \
                               echo '192.168.101.15  hadoop5' >> /etc/hosts;"
docker exec hadoop5 /bin/bash -c "echo '' >> /etc/hosts; \
                               echo '192.168.101.11  hadoop1' >> /etc/hosts; \
                               echo '192.168.101.12  hadoop2' >> /etc/hosts; \
                               echo '192.168.101.13  hadoop3' >> /etc/hosts; \
                               echo '192.168.101.14  hadoop4' >> /etc/hosts; \
                               echo '192.168.101.15  hadoop5' >> /etc/hosts;"
######################################################################################
# shell 파일 복사
docker cp  ./conf/shell hadoop1:/root/

docker exec hadoop1 /bin/bash -c "chmod 755 -R /root/shell"

docker exec hadoop1 /bin/bash -c "tar -cvf shell.tar shell ; \
                                  scp shell.tar hadoop2:/root; \
                                  scp shell.tar hadoop3:/root; \
                                  scp shell.tar hadoop4:/root; \
                                  scp shell.tar hadoop5:/root; "

docker exec hadoop1 /bin/bash -c "tar -xvf shell.tar; \
                                  rm -rf shell.tar; "
docker exec hadoop2 /bin/bash -c "tar -xvf shell.tar; \
                                  rm -rf shell.tar; "
docker exec hadoop3 /bin/bash -c "tar -xvf shell.tar; \
                                  rm -rf shell.tar; "
docker exec hadoop4 /bin/bash -c "tar -xvf shell.tar; \
                                  rm -rf shell.tar; "
docker exec hadoop5 /bin/bash -c "tar -xvf shell.tar; \
                                  rm -rf shell.tar; "                                                                                                      

######################################################################################                               
# logstash 설정
docker cp  ./conf/logstash/logstash.conf hadoop1:/root/$LOGSTASH_DIR_NAME/config

# archive and scp
docker exec hadoop1 /bin/bash -c "tar -cvf $LOGSTASH_DIR_NAME.tar $LOGSTASH_DIR_NAME ; \
                                  scp $LOGSTASH_DIR_NAME.tar hadoop2:/root; \
                                  scp $LOGSTASH_DIR_NAME.tar hadoop3:/root; \
                                  scp $LOGSTASH_DIR_NAME.tar hadoop4:/root; \
                                  scp $LOGSTASH_DIR_NAME.tar hadoop5:/root; "

# 압축해제 및 tar 파일 삭제
docker exec hadoop1 /bin/bash -c "tar -xvf $LOGSTASH_DIR_NAME.tar; \
                                  rm -rf $LOGSTASH_DIR_NAME.tar; "
docker exec hadoop2 /bin/bash -c "tar -xvf $LOGSTASH_DIR_NAME.tar; \
                                  rm -rf $LOGSTASH_DIR_NAME.tar; "
docker exec hadoop3 /bin/bash -c "tar -xvf $LOGSTASH_DIR_NAME.tar; \
                                  rm -rf $LOGSTASH_DIR_NAME.tar;"
docker exec hadoop4 /bin/bash -c "tar -xvf $LOGSTASH_DIR_NAME.tar; \
                                  rm -rf $LOGSTASH_DIR_NAME.tar;"
docker exec hadoop5 /bin/bash -c "tar -xvf $LOGSTASH_DIR_NAME.tar; \
                                  rm -rf $LOGSTASH_DIR_NAME.tar;"

######################################################################################
#kafka 설정

#kafka data directory create
docker exec hadoop1  mkdir -p /root/$KAFKA_DIR_NAME/data/zookeeper

# 원본설정파일 복사
docker exec hadoop1 /bin/bash -c "cp /root/$KAFKA_DIR_NAME/config/zookeeper.properties /root/$KAFKA_DIR_NAME/config/zookeeper.properties_ori"
docker exec hadoop1 /bin/bash -c "cp /root/$KAFKA_DIR_NAME/config/server.properties /root/$KAFKA_DIR_NAME/config/server.properties_ori"

# zookeeper.properties 파일 설정
docker exec hadoop1 sed -i "/dataDir=/ c\dataDir=/root/$KAFKA_DIR_NAME/data/zookeeper" /root/$KAFKA_DIR_NAME/config/zookeeper.properties

docker exec hadoop1 /bin/bash -c "echo '' >> /root/$KAFKA_DIR_NAME/config/zookeeper.properties; \
                               echo 'tickTime=2000' >> /root/$KAFKA_DIR_NAME/config/zookeeper.properties; \
                               echo 'initLimit=10' >> /root/$KAFKA_DIR_NAME/config/zookeeper.properties; \
                               echo 'syncLimit=5'  >> /root/$KAFKA_DIR_NAME/config/zookeeper.properties;"

docker exec hadoop1 /bin/bash -c "echo '' >> /root/$KAFKA_DIR_NAME/config/zookeeper.properties; \
                               echo 'server.1=192.168.101.11:2888:3888' >> /root/$KAFKA_DIR_NAME/config/zookeeper.properties; \
                               echo 'server.2=192.168.101.12:2888:3888' >> /root/$KAFKA_DIR_NAME/config/zookeeper.properties; \
                               echo 'server.3=192.168.101.13:2888:3888' >> /root/$KAFKA_DIR_NAME/config/zookeeper.properties; \
                               echo 'server.4=192.168.101.14:2888:3888' >> /root/$KAFKA_DIR_NAME/config/zookeeper.properties; \                                                             
                               echo 'server.5=192.168.101.15:2888:3888' >> /root/$KAFKA_DIR_NAME/config/zookeeper.properties;"

# server.properties 파일 설정
docker exec hadoop1 /bin/bash -c "sed -i '/log.dirs=/ c\log.dirs=/root/$KAFKA_DIR_NAME/data/kafka/kafka-logs' /root/$KAFKA_DIR_NAME/config/server.properties; \
                               sed -i '/zookeeper.connect=/ c\zookeeper.connect=192.168.101.11:2181,192.168.101.12:2181,192.168.101.13:2181,192.168.101.14:2181,192.168.101.15:2181' /root/$KAFKA_DIR_NAME/config/server.properties; "

# archive and scp
docker exec hadoop1 /bin/bash -c "tar -cvf $KAFKA_DIR_NAME.tar $KAFKA_DIR_NAME ; \
                                  scp $KAFKA_DIR_NAME.tar hadoop2:/root; \
                                  scp $KAFKA_DIR_NAME.tar hadoop3:/root; \
                                  scp $KAFKA_DIR_NAME.tar hadoop4:/root; \
                                  scp $KAFKA_DIR_NAME.tar hadoop5:/root; "

# 압축해제 및 tar 파일 삭제
docker exec hadoop1 /bin/bash -c "tar -xvf $KAFKA_DIR_NAME.tar; \
                                  rm -rf $KAFKA_DIR_NAME.tar; "
docker exec hadoop2 /bin/bash -c "tar -xvf $KAFKA_DIR_NAME.tar; \
                                  rm -rf $KAFKA_DIR_NAME.tar; "
docker exec hadoop3 /bin/bash -c "tar -xvf $KAFKA_DIR_NAME.tar; \
                                  rm -rf $KAFKA_DIR_NAME.tar; "
docker exec hadoop4 /bin/bash -c "tar -xvf $KAFKA_DIR_NAME.tar; \
                                  rm -rf $KAFKA_DIR_NAME.tar; "
docker exec hadoop5 /bin/bash -c "tar -xvf $KAFKA_DIR_NAME.tar; \
                                  rm -rf $KAFKA_DIR_NAME.tar; "

# 개별설정
docker exec hadoop1 sed -i "/broker.id=/ c\broker.id=1" /root/$KAFKA_DIR_NAME/config/server.properties
docker exec hadoop2 sed -i "/broker.id=/ c\broker.id=2" /root/$KAFKA_DIR_NAME/config/server.properties
docker exec hadoop3 sed -i "/broker.id=/ c\broker.id=3" /root/$KAFKA_DIR_NAME/config/server.properties
docker exec hadoop4 sed -i "/broker.id=/ c\broker.id=4" /root/$KAFKA_DIR_NAME/config/server.properties
docker exec hadoop5 sed -i "/broker.id=/ c\broker.id=5" /root/$KAFKA_DIR_NAME/config/server.properties

docker exec hadoop1 /bin/bash -c "echo 1 > /root/$KAFKA_DIR_NAME/data/zookeeper/myid;"
docker exec hadoop2 /bin/bash -c "echo 2 > /root/$KAFKA_DIR_NAME/data/zookeeper/myid;"
docker exec hadoop3 /bin/bash -c "echo 3 > /root/$KAFKA_DIR_NAME/data/zookeeper/myid;"
docker exec hadoop4 /bin/bash -c "echo 4 > /root/$KAFKA_DIR_NAME/data/zookeeper/myid;"
docker exec hadoop5 /bin/bash -c "echo 5 > /root/$KAFKA_DIR_NAME/data/zookeeper/myid;"

######################################################################################
#hadoop 설정

# 원본설정파일 복사
docker exec hadoop1 /bin/bash -c "cp /root/$HADOOP_DIR_NAME/etc/hadoop/core-site.xml /root/$HADOOP_DIR_NAME/etc/hadoop/core-site.xml_ori"
docker exec hadoop1 /bin/bash -c "cp /root/$HADOOP_DIR_NAME/etc/hadoop/hdfs-site.xml /root/$HADOOP_DIR_NAME/etc/hadoop/hdfs-site.xml_ori"
docker exec hadoop1 /bin/bash -c "cp /root/$HADOOP_DIR_NAME/etc/hadoop/mapred-site.xml /root/$HADOOP_DIR_NAME/etc/hadoop/mapred-site.xml_ori"
docker exec hadoop1 /bin/bash -c "cp /root/$HADOOP_DIR_NAME/etc/hadoop/yarn-site.xml /root/$HADOOP_DIR_NAME/etc/hadoop/yarn-site.xml_ori"
docker exec hadoop1 /bin/bash -c "cp /root/$HADOOP_DIR_NAME/etc/hadoop/hadoop-env.sh /root/$HADOOP_DIR_NAME/etc/hadoop/hadoop-env.sh_ori"


# 설정파일 복사
docker cp  ./conf/hadoop/core-site.xml hadoop1:/root/$HADOOP_DIR_NAME/etc/hadoop
docker cp  ./conf/hadoop/hdfs-site.xml hadoop1:/root/$HADOOP_DIR_NAME/etc/hadoop
docker cp  ./conf/hadoop/mapred-site.xml hadoop1:/root/$HADOOP_DIR_NAME/etc/hadoop
docker cp  ./conf/hadoop/yarn-site.xml hadoop1:/root/$HADOOP_DIR_NAME/etc/hadoop
docker cp  ./conf/hadoop/masters hadoop1:/root/$HADOOP_DIR_NAME/etc/hadoop/masters
docker cp  ./conf/hadoop/slaves hadoop1:/root/$HADOOP_DIR_NAME/etc/hadoop/slaves

# user 정보 추가
docker exec hadoop1 /bin/bash -c "echo '' >> /root/$HADOOP_DIR_NAME/etc/hadoop/hadoop-env.sh; \
                               echo 'export JAVA_HOME=/root/$JDK_DIR_NAME_11' >> /root/$HADOOP_DIR_NAME/etc/hadoop/hadoop-env.sh; \
                               echo 'export HDFS_NAMENODE_USER=root' >> /root/$HADOOP_DIR_NAME/etc/hadoop/hadoop-env.sh; \
                               echo 'export HDFS_DATANODE_USER=root' >> /root/$HADOOP_DIR_NAME/etc/hadoop/hadoop-env.sh; \
                               echo 'export HDFS_SECONDARYNAMENODE_USER=root' >> /root/$HADOOP_DIR_NAME/etc/hadoop/hadoop-env.sh; \
                               echo 'export YARN_RESOURCEMANAGER_USER=root' >> /root/$HADOOP_DIR_NAME/etc/hadoop/hadoop-env.sh; \
                               echo 'export YARN_NODEMANAGER_USER=root' >> /root/$HADOOP_DIR_NAME/etc/hadoop/hadoop-env.sh;
                              "

# namenode 디렉토리 생성
docker exec hes1 /bin/bash -c "mkdir -p /root/$HADOOP_DIR_NAME/data/hdfs/namenode"

# archive and scp
docker exec hadoop1 /bin/bash -c "tar -cvf $HADOOP_DIR_NAME.tar $HADOOP_DIR_NAME ; \
                                  scp $HADOOP_DIR_NAME.tar hadoop2:/root; \
                                  scp $HADOOP_DIR_NAME.tar hadoop3:/root; \
                                  scp $HADOOP_DIR_NAME.tar hadoop4:/root; \
                                  scp $HADOOP_DIR_NAME.tar hadoop5:/root; "

# 압축해제 및 tar 파일 삭제
docker exec hadoop1 /bin/bash -c "tar -xvf $HADOOP_DIR_NAME.tar; \
                                  rm -rf $HADOOP_DIR_NAME.tar; "
docker exec hadoop2 /bin/bash -c "tar -xvf $HADOOP_DIR_NAME.tar; \
                                  rm -rf $HADOOP_DIR_NAME.tar; "
docker exec hadoop3 /bin/bash -c "tar -xvf $HADOOP_DIR_NAME.tar; \
                                  rm -rf $HADOOP_DIR_NAME.tar; "
docker exec hadoop4 /bin/bash -c "tar -xvf $HADOOP_DIR_NAME.tar; \
                                  rm -rf $HADOOP_DIR_NAME.tar; "
docker exec hadoop5 /bin/bash -c "tar -xvf $HADOOP_DIR_NAME.tar; \
                                  rm -rf $HADOOP_DIR_NAME.tar; "    

######################################################################################
# elasticsearch

#원본파일복사
docker exec hadoop1 /bin/bash -c "cp /root/$ES_DIR_NAME/config/elasticsearch.yml /root/$ES_DIR_NAME/config/elasticsearch.yml_ori"
docker exec hadoop1 /bin/bash -c "cp /root/$ES_DIR_NAME/config/jvm.options /root/$ES_DIR_NAME/config/jvm.options_ori"

# 설정파일 복사
docker cp  ./conf/elasticsearch/elasticsearch.yml hadoop1:/root/$ES_DIR_NAME/config
docker cp  ./conf/elasticsearch/jvm.options hadoop1:/root/$ES_DIR_NAME/config

# archive and scp
docker exec hadoop1 /bin/bash -c "tar -cvf $ES_DIR_NAME.tar $ES_DIR_NAME ; \
                                  scp $ES_DIR_NAME.tar hadoop2:/root; \
                                  scp $ES_DIR_NAME.tar hadoop3:/root; \
                                  scp $ES_DIR_NAME.tar hadoop4:/root; \
                                  scp $ES_DIR_NAME.tar hadoop5:/root; "


#user add 및 파일 move 압축해제 , tar 파일삭제 , owner 및 권한변경
docker exec hadoop1 /bin/bash -c "useradd es; \
                                  echo es:es | chpasswd; \
                                  mv /root/$ES_DIR_NAME.tar /home/es; \
                                  cd /home/es; tar -xvf $ES_DIR_NAME.tar; \
                                  rm -rf /home/es/$ES_DIR_NAME.tar; \
                                  chown -R es:es /home/es/$ES_DIR_NAME; \
                                  chmod -R 775 /home/es/$ES_DIR_NAME;
                                  "
docker exec hadoop2 /bin/bash -c "useradd es; \
                                  echo es:es | chpasswd; \
                                  mv /root/$ES_DIR_NAME.tar /home/es; \
                                  cd /home/es; tar -xvf $ES_DIR_NAME.tar; \
                                  rm -rf /home/es/$ES_DIR_NAME.tar; \
                                  chown -R es:es /home/es/$ES_DIR_NAME; \
                                  chmod -R 775 /home/es/$ES_DIR_NAME;
                                  "
docker exec hadoop3 /bin/bash -c "useradd es; \
                                  echo es:es | chpasswd; \
                                  mv /root/$ES_DIR_NAME.tar /home/es; \
                                  cd /home/es; tar -xvf $ES_DIR_NAME.tar; \
                                  rm -rf /home/es/$ES_DIR_NAME.tar; \
                                  chown -R es:es /home/es/$ES_DIR_NAME; \
                                  chmod -R 775 /home/es/$ES_DIR_NAME;
                                  "
docker exec hadoop4 /bin/bash -c "useradd es; \
                                  echo es:es | chpasswd; \
                                  mv /root/$ES_DIR_NAME.tar /home/es; \
                                  cd /home/es; tar -xvf $ES_DIR_NAME.tar; \
                                  rm -rf /home/es/$ES_DIR_NAME.tar; \
                                  chown -R es:es /home/es/$ES_DIR_NAME; \
                                  chmod -R 775 /home/es/$ES_DIR_NAME;
                                  "
docker exec hadoop5 /bin/bash -c "useradd es; \
                                  echo es:es | chpasswd; \
                                  mv /root/$ES_DIR_NAME.tar /home/es; \
                                  cd /home/es; tar -xvf $ES_DIR_NAME.tar; \
                                  rm -rf /home/es/$ES_DIR_NAME.tar; \
                                  chown -R es:es /home/es/$ES_DIR_NAME; \
                                  chmod -R 775 /home/es/$ES_DIR_NAME;
                                  "                                                                                                                                                                                                                                          


######################################################################################