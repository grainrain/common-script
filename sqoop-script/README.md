# SQLSERVER->HDFS->PHOENIX

 sqoop目前暂不支持将RDBMS表直接导入phoenix表,故而编写以下脚本
 xxxx_wh_sqoop_job_create.sh创建sqoop job

## 1.xxxx_wh_sqoop_job_incremental.sh将RDBMS表的数据增量拉取到HDFS,增量数据格式采用csv存储

## 2.xxxx_wh_phoenix_bulkload.sh将csv数据从HDFS通过phoneix加载到hbase

## 3.xxxx_wh_record将每次增量产生的csv数据文件记录