#!/bin/sh

#Sqoop job name
SqoopJobID=INC_XXXX_JOB_A
SqoopJobList=$(su - sqoop -c "sqoop job --list |  grep -w '$SqoopJobID'")
LogDay=$(date +'%F')
LogTime=$(date +'%F %H:%M:%S')
#日志输出
SqoopLog="/home/sqoop/etl/log/nestle_wh_sqoop_job_increamental-"$LogDay".log"
Monitor()
{
    echo $(date +'%F %H:%M:%S')" [info]begin to Exec Sqoop job pull sqlserver data to hdfs(csv) ..."
    if [[ $SqoopJobList ]];then #这里判断执行的sqoop job是否存在
       # 检测是否启动成功(成功的话页面会返回状态"200")     
       echo  $(date +'%F %H:%M:%S') "[info]  exec sqoop job["$SqoopJobID"] begin-----------------" 
	   su - sqoop -c "sqoop job  -exec "$SqoopJobID
    else    
       echo  " [error] sqoop job["$SqoopJobID"] not exsit,please create ..."    
    fi
    echo $(date +'%F %H:%M:%S') " "$SqoopJobID" end-----------------"
}
#Monitor >>$SqoopLog 2>&1 &
Monitor  2>&1 |  tee -a $SqoopLog