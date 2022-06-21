# creating the table
--------------------

hive> create table if not exists taxidata(
    > vendor_id string,pickup_datetime string,dropoff_datetime string,passenger_count int,trip_distance DECIMAL(9,6),
    > pickup_longitude DECIMAL(9,6),pickup_latitude DECIMAL(9,6),rate_code int,store_and_fwd_flag string,
    > dropoff_longitude DECIMAL(9,6),dropoff_latitude DECIMAL(9,6),payment_type string,
    > fare_amount DECIMAL(9,6),extra DECIMAL(9,6),mta_tax DECIMAL(9,6),tip_amount DECIMAL(9,6),
    > tolls_amount DECIMAL(9,6),total_amount DECIMAL(9,6),trip_time_in_secs int)
    > row format delimited
    > fields terminated by ','
    > stored as textfile
    > tblproperties("skip.header..line.count"="1")
    > ;
OK
Time taken: 0.755 seconds


# describing the table
----------------------
hive> Describe extended taxidata;
OK
vendor_id           	string              	                    
pickup_datetime     	string              	                    
dropoff_datetime    	string              	                    
passenger_count     	int                 	                    
trip_distance       	decimal(9,6)        	                    
pickup_longitude    	decimal(9,6)        	                    
pickup_latitude     	decimal(9,6)        	                    
rate_code           	int                 	                    
store_and_fwd_flag  	string              	                    
dropoff_longitude   	decimal(9,6)        	                    
dropoff_latitude    	decimal(9,6)        	                    
payment_type        	string              	                    
fare_amount         	decimal(9,6)        	                    
extra               	decimal(9,6)        	                    
mta_tax             	decimal(9,6)        	                    
tip_amount          	decimal(9,6)        	                    
tolls_amount        	decimal(9,6)        	                    
total_amount        	decimal(9,6)        	                    
trip_time_in_secs   	int                 	                    
	 	 
Detailed Table Information	Table(tableName:taxidata, dbName:asignments, owner:cloudera, createTime:1655768436, lastAccessTime:0, retention:0, sd:StorageDescriptor(cols:[FieldSchema(name:vendor_id, type:string, comment:null), FieldSchema(name:pickup_datetime, type:string, comment:null), FieldSchema(name:dropoff_datetime, type:string, comment:null), FieldSchema(name:passenger_count, type:int, comment:null), FieldSchema(name:trip_distance, type:decimal(9,6), comment:null), FieldSchema(name:pickup_longitude, type:decimal(9,6), comment:null), FieldSchema(name:pickup_latitude, type:decimal(9,6), comment:null), FieldSchema(name:rate_code, type:int, comment:null), FieldSchema(name:store_and_fwd_flag, type:string, comment:null), FieldSchema(name:dropoff_longitude, type:decimal(9,6), comment:null), FieldSchema(name:dropoff_latitude, type:decimal(9,6), comment:null), FieldSchema(name:payment_type, type:string, comment:null), FieldSchema(name:fare_amount, type:decimal(9,6), comment:null), FieldSchema(name:extra, type:decimal(9,6), comment:null), FieldSchema(name:mta_tax, type:decimal(9,6), comment:null), FieldSchema(name:tip_amount, type:decimal(9,6), comment:null), FieldSchema(name:tolls_amount, type:decimal(9,6), comment:null), FieldSchema(name:total_amount, type:decimal(9,6), comment:null), FieldSchema(name:trip_time_in_secs, type:int, comment:null)], location:hdfs://quickstart.cloudera:8020/user/hive/warehouse/asignments.db/taxidata, inputFormat:org.apache.hadoop.mapred.TextInputFormat, outputFormat:org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat, compressed:false, numBuckets:-1, serdeInfo:SerDeInfo(name:null, serializationLib:org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe, parameters:{serialization.format=,, field.delim=,}), bucketCols:[], sortCols:[], parameters:{}, skewedInfo:SkewedInfo(skewedColNames:[], skewedColValues:[], skewedColValueLocationMaps:{}), storedAsSubDirectories:false), partitionKeys:[], parameters:{numFiles=1, transient_lastDdlTime=1655768528, COLUMN_STATS_ACCURATE=true, totalSize=1512490, skip.header..line.count=1}, viewOriginalText:null, viewExpandedText:null, tableType:MANAGED_TABLE)	
Time taken: 0.06 seconds, Fetched: 21 row(s)



# loading the dataset
--------------------
hive> load data local inpath 'yellow_taxi.csv' into table taxidata;
Loading data to table asignments.taxidata
Table asignments.taxidata stats: [numFiles=1, totalSize=1512490]
OK
Time taken: 0.423 seconds


# querying the table
---------------------
hive> select * from taxidata limit 5;
OK
VendorID	tpep_pickup_datetime	tpep_dropoff_datetime	NULL	NULL	NULL	NULL	NULL	store_and_fwd_flag	NULL	NULL	payment_typeNULL	NULL	NULL	NULL	NULL	NULL	NULL
2	2015-01-08 22:44:09	2015-01-08 22:50:56	1	1.55	-73.987686	40.724251	1	N	-73.973763	40.743378	2	7.5	0.5	0.5	0	0	8.8	5000
1	2015-01-08 22:44:09	2015-01-08 22:51:17	3	1.2	-73.99157	40.726933	1	N	-74.004105	40.721081	2	70.5	0.5	0	0	8.3	5344860
1	2015-01-08 22:44:10	2015-01-08 22:55:27	1	2.4	-73.981918	40.783443	1	N	-73.952354	40.798199	2	10.5	0.5	0.5	0	0	11.8	3345464
1	2015-01-08 22:44:10	2015-01-08 22:58:09	1	7.3	-73.973122	40.743553	1	N	-73.919571	40.832001	2	21.5	0.5	0.5	0	0	22.8	893933
Time taken: 0.253 seconds, Fetched: 5 row(s)



# Q1) What is the total number of trips ( equal to the number of rows)?
hive> Select count(*) from taxidata;
Query ID = cloudera_20220620164848_3fb4dd66-5db0-4b19-8b19-51a899a96ff5
Total jobs = 1
Launching Job 1 out of 1
Number of reduce tasks determined at compile time: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1655767983410_0001, Tracking URL = http://quickstart.cloudera:8088/proxy/application_1655767983410_0001/
Kill Command = /usr/lib/hadoop/bin/hadoop job  -kill job_1655767983410_0001
Hadoop job information for Stage-1: number of mappers: 1; number of reducers: 1
2022-06-20 16:48:20,659 Stage-1 map = 0%,  reduce = 0%
2022-06-20 16:48:26,931 Stage-1 map = 100%,  reduce = 0%, Cumulative CPU 1.51 sec
2022-06-20 16:48:32,111 Stage-1 map = 100%,  reduce = 100%, Cumulative CPU 2.43 sec
MapReduce Total cumulative CPU time: 2 seconds 430 msec
Ended Job = job_1655767983410_0001
MapReduce Jobs Launched: 
Stage-Stage-1: Map: 1  Reduce: 1   Cumulative CPU: 2.43 sec   HDFS Read: 1522910 HDFS Write: 6 SUCCESS
Total MapReduce CPU Time Spent: 2 seconds 430 msec
OK
10001
Time taken: 20.607 seconds, Fetched: 1 row(s)



# Q2) What is the total revenue generated by all the trips? The fare is stored in the column total_amount.
hive> select sum(total_amount) from taxidata;
Query ID = cloudera_20220620165656_78f83270-37e7-4dbe-ba31-d9cbfc679ba0
Total jobs = 1
Launching Job 1 out of 1
Number of reduce tasks determined at compile time: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1655767983410_0003, Tracking URL = http://quickstart.cloudera:8088/proxy/application_1655767983410_0003/
Kill Command = /usr/lib/hadoop/bin/hadoop job  -kill job_1655767983410_0003
Hadoop job information for Stage-1: number of mappers: 1; number of reducers: 1
2022-06-20 16:56:30,657 Stage-1 map = 0%,  reduce = 0%
2022-06-20 16:56:34,815 Stage-1 map = 100%,  reduce = 0%, Cumulative CPU 1.28 sec
2022-06-20 16:56:41,029 Stage-1 map = 100%,  reduce = 100%, Cumulative CPU 2.01 sec
MapReduce Total cumulative CPU time: 2 seconds 10 msec
Ended Job = job_1655767983410_0003
MapReduce Jobs Launched: 
Stage-Stage-1: Map: 1  Reduce: 1   Cumulative CPU: 2.01 sec   HDFS Read: 1523134 HDFS Write: 10 SUCCESS
Total MapReduce CPU Time Spent: 2 seconds 10 msec
OK
160546.81
Time taken: 16.843 seconds, Fetched: 1 row(s)




# Q3) What fraction of the total is paid for tolls? The toll is stored in tolls_amount.
hive> select sum(tolls_amount)/sum(total_amount) from taxidata;
Query ID = cloudera_20220620165858_791afc2a-de12-4fc8-8b1e-57e567b673f8
Total jobs = 1
Launching Job 1 out of 1
Number of reduce tasks determined at compile time: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1655767983410_0004, Tracking URL = http://quickstart.cloudera:8088/proxy/application_1655767983410_0004/
Kill Command = /usr/lib/hadoop/bin/hadoop job  -kill job_1655767983410_0004
Hadoop job information for Stage-1: number of mappers: 1; number of reducers: 1
2022-06-20 16:58:52,073 Stage-1 map = 0%,  reduce = 0%
2022-06-20 16:58:57,243 Stage-1 map = 100%,  reduce = 0%, Cumulative CPU 1.47 sec
2022-06-20 16:59:01,380 Stage-1 map = 100%,  reduce = 100%, Cumulative CPU 2.58 sec
MapReduce Total cumulative CPU time: 2 seconds 580 msec
Ended Job = job_1655767983410_0004
MapReduce Jobs Launched: 
Stage-Stage-1: Map: 1  Reduce: 1   Cumulative CPU: 2.58 sec   HDFS Read: 1524371 HDFS Write: 25 SUCCESS
Total MapReduce CPU Time Spent: 2 seconds 580 msec
OK
0.0155530340341237549348
Time taken: 15.352 seconds, Fetched: 1 row(s)



# Q4) What fraction of it is driver tips? The tip is stored in tip_amount.
hive> select sum(tip_amount)/sum(total_amount) from taxidata;
Query ID = cloudera_20220620170707_b0689dc7-915d-4b56-87ca-58790b9edb84
Total jobs = 1
Launching Job 1 out of 1
Number of reduce tasks determined at compile time: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1655767983410_0005, Tracking URL = http://quickstart.cloudera:8088/proxy/application_1655767983410_0005/
Kill Command = /usr/lib/hadoop/bin/hadoop job  -kill job_1655767983410_0005
Hadoop job information for Stage-1: number of mappers: 1; number of reducers: 1
2022-06-20 17:07:44,665 Stage-1 map = 0%,  reduce = 0%
2022-06-20 17:07:49,874 Stage-1 map = 100%,  reduce = 0%, Cumulative CPU 1.77 sec
2022-06-20 17:07:55,104 Stage-1 map = 100%,  reduce = 100%, Cumulative CPU 2.78 sec
MapReduce Total cumulative CPU time: 2 seconds 780 msec
Ended Job = job_1655767983410_0005
MapReduce Jobs Launched: 
Stage-Stage-1: Map: 1  Reduce: 1   Cumulative CPU: 2.78 sec   HDFS Read: 1524367 HDFS Write: 25 SUCCESS
Total MapReduce CPU Time Spent: 2 seconds 780 msec
OK
0.1078520339332808917225
Time taken: 16.489 seconds, Fetched: 1 row(s)



# Q5) What is the average trip amount?
hive> select avg(total_amount) from taxidata;
Query ID = cloudera_20220620170909_382c13f9-a51b-4143-bacd-34499c564f82
Total jobs = 1
Launching Job 1 out of 1
Number of reduce tasks determined at compile time: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1655767983410_0006, Tracking URL = http://quickstart.cloudera:8088/proxy/application_1655767983410_0006/
Kill Command = /usr/lib/hadoop/bin/hadoop job  -kill job_1655767983410_0006
Hadoop job information for Stage-1: number of mappers: 1; number of reducers: 1
2022-06-20 17:09:44,307 Stage-1 map = 0%,  reduce = 0%
2022-06-20 17:09:49,484 Stage-1 map = 100%,  reduce = 0%, Cumulative CPU 1.47 sec
2022-06-20 17:09:53,620 Stage-1 map = 100%,  reduce = 100%, Cumulative CPU 2.34 sec
MapReduce Total cumulative CPU time: 2 seconds 340 msec
Ended Job = job_1655767983410_0006
MapReduce Jobs Launched: 
Stage-Stage-1: Map: 1  Reduce: 1   Cumulative CPU: 2.34 sec   HDFS Read: 1523425 HDFS Write: 10 SUCCESS
Total MapReduce CPU Time Spent: 2 seconds 340 msec
OK
16.054681
Time taken: 15.774 seconds, Fetched: 1 row(s)


# Q6) What is the average distance of the trips? Distance is stored in the column trip_distance.
hive> select avg(trip_distance) from taxidata;
Query ID = cloudera_20220620171212_fe310e45-3900-44db-be26-6944ce18df0b
Total jobs = 1
Launching Job 1 out of 1
Number of reduce tasks determined at compile time: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1655767983410_0007, Tracking URL = http://quickstart.cloudera:8088/proxy/application_1655767983410_0007/
Kill Command = /usr/lib/hadoop/bin/hadoop job  -kill job_1655767983410_0007
Hadoop job information for Stage-1: number of mappers: 1; number of reducers: 1
2022-06-20 17:12:57,123 Stage-1 map = 0%,  reduce = 0%
2022-06-20 17:13:03,318 Stage-1 map = 100%,  reduce = 0%, Cumulative CPU 1.5 sec
2022-06-20 17:13:08,452 Stage-1 map = 100%,  reduce = 100%, Cumulative CPU 2.3 sec
MapReduce Total cumulative CPU time: 2 seconds 300 msec
Ended Job = job_1655767983410_0007
MapReduce Jobs Launched: 
Stage-Stage-1: Map: 1  Reduce: 1   Cumulative CPU: 2.3 sec   HDFS Read: 1523426 HDFS Write: 9 SUCCESS
Total MapReduce CPU Time Spent: 2 seconds 300 msec
OK
3.253033
Time taken: 18.244 seconds, Fetched: 1 row(s)


# Q7) How many different payment types are used?
hive> select payment_type, count(payment_type) from taxidata group by payment_type;
Query ID = cloudera_20220620172323_b3a633be-b39b-4d67-bf8e-3de34bca1fd3
Total jobs = 1
Launching Job 1 out of 1
Number of reduce tasks not specified. Estimated from input data size: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1655767983410_0009, Tracking URL = http://quickstart.cloudera:8088/proxy/application_1655767983410_0009/
Kill Command = /usr/lib/hadoop/bin/hadoop job  -kill job_1655767983410_0009
Hadoop job information for Stage-1: number of mappers: 1; number of reducers: 1
2022-06-20 17:23:10,588 Stage-1 map = 0%,  reduce = 0%
2022-06-20 17:23:15,782 Stage-1 map = 100%,  reduce = 0%, Cumulative CPU 0.97 sec
2022-06-20 17:23:19,927 Stage-1 map = 100%,  reduce = 100%, Cumulative CPU 1.8 sec
MapReduce Total cumulative CPU time: 1 seconds 800 msec
Ended Job = job_1655767983410_0009
MapReduce Jobs Launched: 
Stage-Stage-1: Map: 1  Reduce: 1   Cumulative CPU: 1.8 sec   HDFS Read: 1523425 HDFS Write: 38 SUCCESS
Total MapReduce CPU Time Spent: 1 seconds 800 msec
OK
1	6403
2	3550
3	38
4	9
payment_type	1
Time taken: 13.904 seconds, Fetched: 5 row(s)


# Q8) For each payment type, display the following details:
i) Average fare generated
--------------------------
hive> select avg(fare_amount) from taxidata;
Query ID = cloudera_20220620172525_23535def-9c1d-4b1c-9af9-4f50373e049f
Total jobs = 1
Launching Job 1 out of 1
Number of reduce tasks determined at compile time: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1655767983410_0010, Tracking URL = http://quickstart.cloudera:8088/proxy/application_1655767983410_0010/
Kill Command = /usr/lib/hadoop/bin/hadoop job  -kill job_1655767983410_0010
Hadoop job information for Stage-1: number of mappers: 1; number of reducers: 1
2022-06-20 17:25:19,880 Stage-1 map = 0%,  reduce = 0%
2022-06-20 17:25:24,019 Stage-1 map = 100%,  reduce = 0%, Cumulative CPU 1.24 sec
2022-06-20 17:25:30,203 Stage-1 map = 100%,  reduce = 100%, Cumulative CPU 2.03 sec
MapReduce Total cumulative CPU time: 2 seconds 30 msec
Ended Job = job_1655767983410_0010
MapReduce Jobs Launched: 
Stage-Stage-1: Map: 1  Reduce: 1   Cumulative CPU: 2.03 sec   HDFS Read: 1523422 HDFS Write: 10 SUCCESS
Total MapReduce CPU Time Spent: 2 seconds 30 msec
OK
12.788972
Time taken: 16.325 seconds, Fetched: 1 row(s)

ii) Average tip
----------------
hive> select avg(tip_amount) from taxidata;
Query ID = cloudera_20220620172727_9d40bc14-e313-4471-9993-df1ee33c572a
Total jobs = 1
Launching Job 1 out of 1
Number of reduce tasks determined at compile time: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1655767983410_0011, Tracking URL = http://quickstart.cloudera:8088/proxy/application_1655767983410_0011/
Kill Command = /usr/lib/hadoop/bin/hadoop job  -kill job_1655767983410_0011
Hadoop job information for Stage-1: number of mappers: 1; number of reducers: 1
2022-06-20 17:27:11,530 Stage-1 map = 0%,  reduce = 0%
2022-06-20 17:27:16,706 Stage-1 map = 100%,  reduce = 0%, Cumulative CPU 1.2 sec
2022-06-20 17:27:20,820 Stage-1 map = 100%,  reduce = 100%, Cumulative CPU 2.0 sec
MapReduce Total cumulative CPU time: 2 seconds 0 msec
Ended Job = job_1655767983410_0011
MapReduce Jobs Launched: 
Stage-Stage-1: Map: 1  Reduce: 1   Cumulative CPU: 2.0 sec   HDFS Read: 1523420 HDFS Write: 8 SUCCESS
Total MapReduce CPU Time Spent: 2 seconds 0 msec
OK
1.73153
Time taken: 14.865 seconds, Fetched: 1 row(s)


iii) Average tax – tax is stored in column mta_tax
---------------------------------------------------
hive> select avg(mta_tax) from taxidata;
Query ID = cloudera_20220620172828_38054f7d-8eab-4108-8224-c6ba6f32e672
Total jobs = 1
Launching Job 1 out of 1
Number of reduce tasks determined at compile time: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1655767983410_0012, Tracking URL = http://quickstart.cloudera:8088/proxy/application_1655767983410_0012/
Kill Command = /usr/lib/hadoop/bin/hadoop job  -kill job_1655767983410_0012
Hadoop job information for Stage-1: number of mappers: 1; number of reducers: 1
2022-06-20 17:28:24,925 Stage-1 map = 0%,  reduce = 0%
2022-06-20 17:28:30,098 Stage-1 map = 100%,  reduce = 0%, Cumulative CPU 1.27 sec
2022-06-20 17:28:35,262 Stage-1 map = 100%,  reduce = 100%, Cumulative CPU 2.05 sec
MapReduce Total cumulative CPU time: 2 seconds 50 msec
Ended Job = job_1655767983410_0012
MapReduce Jobs Launched: 
Stage-Stage-1: Map: 1  Reduce: 1   Cumulative CPU: 2.05 sec   HDFS Read: 1523408 HDFS Write: 8 SUCCESS
Total MapReduce CPU Time Spent: 2 seconds 50 msec
OK
0.49745
Time taken: 15.321 seconds, Fetched: 1 row(s)



# Q9) On average which hour of the day generates the highest revenue?
