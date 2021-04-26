# https://github.com/TuanHenry/Step-by-step-install-Hadoop-on-Ubuntu-Kali-LINUX/wiki
cd 
home_path=$(pwd)
sudo apt-get update
sudo apt install openjdk-11-jdk -y

clear
java -version

# Install the SSH if not preinstalled
sudo apt install ssh

# Removes the password from localhost
ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
chmod 0600 ~/.ssh/authorized_keys

# Downloads Hadoop
wget https://downloads.apache.org/hadoop/common/hadoop-3.3.0/hadoop-3.3.0-aarch64.tar.gz

tar xzvf hadoop-3.3.0-aarch64.tar.gz
hadoop_path=$home_path/hadoop-3.3.0

bold=$(tput bold)
normal=$(tput sgr0)


java_home_path=$(readlink -f /usr/bin/java | sed "s:bin/java::")

# Configures the .bashrc
cd
echo "# JAVA HOME PATH" >> .bashrc
echo "export JAVA_HOME=$java_home_path" >> .bashrc
echo "#Hadoop Related Options" >> .bashrc
echo "export HADOOP_HOME=$hadoop_path" >> .bashrc
echo "export HADOOP_INSTALL=$hadoop_path" >> .bashrc
echo "export HADOOP_MAPRED_HOME=$hadoop_path" >> .bashrc
echo "export HADOOP_COMMON_HOME=$hadoop_path" >> .bashrc
echo "export HADOOP_HDFS_HOME=$hadoop_path" >> .bashrc
echo "export YARN_HOME=$hadoop_path" >> .bashrc
echo "export HADOOP_COMMON_LIB_NATIVE_DIR=$hadoop_path/lib/native" >> .bashrc
echo "export PATH=$PATH:$HADOOP_HOME/sbin:$hadoop_path/bin" >> .bashrc
echo "export HADOOP_OPTS"-Djava.library.path=$hadoop_path/lib/nativ"" >> .bashrc

# Update bashrc
source ~/.bashrc
# Tutorial do Hadoop
# https://hadoop.apache.org/docs/stable/hadoop-project-dist/hadoop-common/SingleCluster.html#YARN_on_Single_Node

# Pseudo-Distributed configurations 
echo "export JAVA_HOME=$java_home_path" >>  $hadoop_path/etc/hadoop/hadoop-env.sh

# Core site
mkdir $home_path/tmpdata
clear
core_site="<configuration>
<property>
  <name>hadoop.tmp.dir</name>
  <value>/home/hadoop/tmpdata</value>
</property>
<property>
  <name>fs.default.name</name>
  <value>hdfs://127.0.0.1:9000</value>
</property>
</configuration>"
echo "${bold}Copy&paste this on the file open with Gedit${normal}"
echo $core_site
sudo gedit $hadoop_path/etc/hadoop/core-site.xml
clear
# HDFS file
hdfs_site="<configuration>
<property>
  <name>dfs.data.dir</name>
  <value>/home/hadoop/dfsdata/namenode</value>
</property>
<property>
  <name>dfs.data.dir</name>
  <value>/home/hadoop/dfsdata/datanode</value>
</property>
<property>
  <name>dfs.replication</name>
  <value>1</value>
</property>
</configuration>"
echo "${bold}Copy&paste this on the file open with Gedit${normal}"
echo $hdfs_site
sudo gedit $hadoop_path/etc/hadoop/hdfs-site.xml
clear
# MapReduce
mapred_site="<configuration> 
<property> 
  <name>mapreduce.framework.name</name> 
  <value>yarn</value> 
</property> 
</configuration>"
echo "${bold}Copy&paste this on the file open with Gedit${normal}"
echo $mapred_site
sudo gedit $hadoop_path/etc/hadoop/mapred-site.xml
clear
# YARN
yarn_site="<configuration>
<property>
  <name>yarn.nodemanager.aux-services</name>
  <value>mapreduce_shuffle</value>
</property>
<property>
  <name>yarn.nodemanager.aux-services.mapreduce.shuffle.class</name>
  <value>org.apache.hadoop.mapred.ShuffleHandler</value>
</property>
<property>
  <name>yarn.resourcemanager.hostname</name>
  <value>127.0.0.1</value>
</property>
<property>
  <name>yarn.acl.enable</name>
  <value>0</value>
</property>
<property>
  <name>yarn.nodemanager.env-whitelist</name>   
  <value>JAVA_HOME,HADOOP_COMMON_HOME,HADOOP_HDFS_HOME,HADOOP_CONF_DIR,CLASSPATH_PERPEND_DISTCACHE,HADOOP_YARN_HOME,HADOOP_MAPRED_HOME</value>
</property>
</configuration>"
echo "${bold}Copy&paste this on the file open with Gedit${normal}"
echo $yarn_site
sudo gedit $hadoop_path/etc/hadoop/yarn-site.xml

cd
rm hadoop-3.3.0-aarch64.tar.gz
clear
echo "${bold}Part 1 of 2 done!"
