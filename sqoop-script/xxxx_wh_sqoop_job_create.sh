sqoop job  
--create INC_XXXX_JOB_A 
--import --connect 'jdbc:sqlserver://ip:port;database=WHScanning' 
--username tablename --password-file /user/admin/.PASS  
--query "SELECT  column FROM tablename WHERE 1=1 AND \$CONDITIONS"  
--incremental append --check-column tableid --last-value 1340   
--target-dir '/xxx/wh/' -m 1
