# 1st start the localhost
echo "1st start the localhost"
echo "ssh localhost"

# ssh localhost

hadoop_path="hadoop-3.3.0/"

cd $hadoop_path
# Formats the HDFS
bin/hdfs namenode -format

# Start all features from Hadoop
sbin/start-all.sh

echo "If everything worked, you can check your Hadoop HDFS on this page http://localhost:9870/"


# Creating the directories to run MapReduce job
bin/hdfs dfs -mkdir /user

# Not mandatory, but I created an user with name hadoop
username="hadoop"
bin/hdfs dfs -mkdir /user/$username

echo "Checking all jobs from Hadoop"
jps

echo "To stop the all jobs from Hadoop, just run sbin/stop-dfs.sh"

# Makes the input and output directories
bin/hdfs dfs -mkdir /user/$username/input /user/$username/output

# Copies our dataset to Hadoop
# bin/hdfs dfs -copyFromLocal <dataset origin path> <dataset destiny path> 
bin/hdfs dfs -copyFromLocal /home/hadoop/gplus_combined.csv /user/hadoop/input

echo "Now runs the MapReducer job"

# Standard command:
# <hadoop> jar <diretoria do hadoop-streaming> \
# -input <path_input> \
# -output <path_output> \
# -mapper <path_mapper> \
# -reducer <path_reducer>

bin/hadoop jar /home/hadoop/hadoop-3.3.0/share/hadoop/tools/lib/hadoop-streaming-3.3.0.jar \
-input /user/hadoop/input/gplus_combined.csv \
-output /user/hadoop/output/out \
-mapper /home/hadoop/mapper.py \
-reducer /home/hadoop/reducer.py
