#!/bin/bash

######################################################################################
#define
LOGSTASH_DIR_NAME="logstash-8.6.0"

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
######################################################################################
# host파일 설정

docker exec hadoop1 /bin/bash -c "echo '' >> /etc/hosts; \
			       echo '192.168.101.11  hes1' >> /etc/hosts; \
			       echo '192.168.101.12  hes2' >> /etc/hosts; \
			       echo '192.168.101.13  hes3' >> /etc/hosts; \
			       echo '192.168.101.14  hes4' >> /etc/hosts; \
			       echo '192.168.101.15  hes5' >> /etc/hosts;" 
docker exec hadoop2 /bin/bash -c "echo '' >> /etc/hosts; \
                               echo '192.168.101.11  hes1' >> /etc/hosts; \
                               echo '192.168.101.12  hes2' >> /etc/hosts; \
                               echo '192.168.101.13  hes3' >> /etc/hosts; \
                               echo '192.168.101.14  hes4' >> /etc/hosts; \
                               echo '192.168.101.15  hes5' >> /etc/hosts;"
docker exec hadoop3 /bin/bash -c "echo '' >> /etc/hosts; \
                               echo '192.168.101.11  hes1' >> /etc/hosts; \
                               echo '192.168.101.12  hes2' >> /etc/hosts; \
                               echo '192.168.101.13  hes3' >> /etc/hosts; \
                               echo '192.168.101.14  hes4' >> /etc/hosts; \
                               echo '192.168.101.15  hes5' >> /etc/hosts;"
docker exec hadoop4 /bin/bash -c "echo '' >> /etc/hosts; \
                               echo '192.168.101.11  hes1' >> /etc/hosts; \
                               echo '192.168.101.12  hes2' >> /etc/hosts; \
                               echo '192.168.101.13  hes3' >> /etc/hosts; \
                               echo '192.168.101.14  hes4' >> /etc/hosts; \
                               echo '192.168.101.15  hes5' >> /etc/hosts;"
docker exec hadoop5 /bin/bash -c "echo '' >> /etc/hosts; \
                               echo '192.168.101.11  hes1' >> /etc/hosts; \
                               echo '192.168.101.12  hes2' >> /etc/hosts; \
                               echo '192.168.101.13  hes3' >> /etc/hosts; \
                               echo '192.168.101.14  hes4' >> /etc/hosts; \
                               echo '192.168.101.15  hes5' >> /etc/hosts;"

######################################################################################                               
# logstash 설정
docker cp  ./conf/logstash/logstash.conf hadoop1:/root/logstash-8.6.0/config

# archive and scp
docker exec hadoop1 /bin/bash -c "tar -cvf $LOGSTASH_DIR_NAME.tar $LOGSTASH_DIR_NAME ; \
                                  scp $LOGSTASH_DIR_NAME.tar hadoop2:/root; \
                                  scp $LOGSTASH_DIR_NAME.tar hadoop3:/root; \
                                  scp $LOGSTASH_DIR_NAME.tar hadoop4:/root; \
                                  scp $LOGSTASH_DIR_NAME.tar hadoop5:/root; "


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