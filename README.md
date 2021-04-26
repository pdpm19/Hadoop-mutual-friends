# Hadoop Mutual Friends
The main focus of this project is to develop a MapReduce job for Hadoop. With that, we can find mutual friends between 2 persons (IDs) or scale it to find mutual friends for n persons.

## Requirements
- Linux distro;
- SSH (to run Hadoop HDFS);
- Python v3.xx.
- Access to dataset located on Google Drive https://drive.google.com/drive/folders/1_qdEwXajfnyaQEvSmveazfwLbuAW14_Z?usp=sharing
- Dataset original link https://snap.stanford.edu/data/ego-Gplus.html

## Struture
The folder **Python Standalone** contains Python scripts to run a standard implementation to find mutual friends from n IDs.

The folder **Python MapReduce** contains Python scripts to run a MapReduce job, fitted for ´cmd´ run and Hadoop.

The folder **Hadoop Scripts** contains scripts to do the Setting Up Hadoop.

## Setting Up Hadoop
1. Open and run `hadoop_configuration.sh` to download and configure Hadoop;
2. Open and run `start_hdfs.sh` to start-up the HDFS.  


## To Do
- [x] Standard implementation in Python;
- [x] MapReduce in Python, but running in `cmd`;
- [ ] MapReduce in Python, but running with Hadoop.
