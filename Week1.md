# Week 1

Hadoop is basically a framework rather than a language which was mainly written in Java .

Types of data:

 	* Structured Data (RDBMS,CSV)
 	* Semi-structured (Excel)
 	* Non-structured (Images,videos and etc)


Zookeeper is used for cluster managment of data in hadoop

Hadoop has two components:

	* HDFS(Hadoop distrubuted file system)
	* Mapreduce(For distributing compution across nodes)

Replication Factor:

	* The replication factor is a property that can be set in the HDFS configuration file that will allow you to adjust the global replication factor for the entire cluster. For each block stored in HDFS, there will be n – 1 duplicated blocks distributed across the cluster. 
	* In HDFS default RF is 3


HDFS:

	* Namenode 
	
		* Master Node
		* Contains meta data
		
	* Data noode
	
		* Slave
		* Original datas

Zookeeper fives hearbeats to give information between datanodes and namenodes:

		* Name node and data node do communicate using Heartbeat. Therefore Heartbeat is the signal that is sent by the datanode to the namenode after the regular interval to time to indicate its presence, i.e. to indicate that it is alive.
		* If after a certain time of heartbeat Name Node does not receive any response from Data Node, then that particular Data Node used to be declared as dead.



A client talks with the name node to get the meta data and then talks to the respective name node				

JPS - Java Virtual Machine Process Status Tool


Hadoop server resides at port 50070

Hadoop namenode -format removes all files and caches

There is an active namenode and a standby namenode:

	* Here data will be written synchronously across active namenode and standby namenode so that on fault ,other can take over
	



