#!/bin/sh
hdfsFileName=$(hdfs  dfs -ls   /xxxx/wh/part*  | awk '{print $8}' |  awk -F '/' '{print $4}')

loadRecodFilePath=/home/sqoop/etl/xxxx_wh_record

hdfsFilePath=/xxxx/wh/

LogDay=$(date +'%F')
LogTime=$(date +'%F %H:%M:%S')

bulkLoadLog="/home/sqoop/etl/log/xxxx_wh_phoenix_bulkload-"$LogDay".log"

#file2=$(cat $loadRecodFilePath)
Monitor()
{
    hdfsFile=$1
    echo $(date +'%F %H:%M:%S') "phonenix bulkload hdfs ["$hdfsFile"] begin-----------------"
    if [[ $hdfsFile ]];then
       echo  "[info] ["$hdfsFile"] exsit,please load data ..." 
      #su - sqoop -c "hdfs  dfs -cat $hdfsFilePath$hdfsFile"
      su - sqoop -c "phonenixCmd=$(HADOOP_CLASSPATH=/usr/hdp/current/phoenix-client/lib/hbase-protocol.jar:/usr/hdp/current/hbase-client/conf hadoop jar /usr/hdp/current/phoenix-client/phoenix-client.jar org.apache.phoenix.mapreduce.CsvBulkLoadTool -t NESTLE.WHSCANNING -i $hdfsFilePath$hdfsFile)"
      if [ $? -ne 0 ]; then
        echo "----------------->phonenixCmd cmd fail<-----------------"
      else
        echo "----------------->phonenixCmd cmd success<-----------------"
        echo $hdfsFile >> $loadRecodFilePath	
      fi
	 
    else    
       echo  " [error] ["$hdfsFile"] not exsit ,please check ..."    
    fi
    echo $(date +'%F %H:%M:%S') "phonenix bulkload hdfs ["$hdfsFile"] end-----------------"
}

MonitorMain(){
  for filename1 in $hdfsFileName
  do 
  filetemp=$(grep $filename1  $loadRecodFilePath )
    if [  -n "$filetemp" ] ;then
      echo $(date +'%F %H:%M:%S') " ["$filename1"] exist in record file ,load data yet"
    else
      echo $(date +'%F %H:%M:%S') " ["$filename1"] loading data"
      Monitor $filename1;
	  fi
  done
}

MonitorMain  2>&1 |  tee  -a $bulkLoadLog


