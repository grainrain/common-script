# vps script


## 1.hava a vps

## 2.ssh login vps

## 3.exec  shadowsocks-all.sh

> chmod +x shadowsocks-all.sh

>./shadowsocks-all.sh 2>&1 | tee shadowsocks-all.log

## 4.exec  bbr.sh  to speed up network
>chmod +x bbr.sh

>./bbr.sh

## 5.reboot  vps ,check bbr 
>lsmod | grep bbr

## 6.find a iphone/android client to connect

