#!/bin/bash

#确保安装inotify-tools

#备份服务器配置(备份服务器启动rsyncd)
bak_host_1='13.251.97.13'
bak_module_1='keystore-bak'
bak_user_1='root'

bak_host_2='13.250.150.89'
bak_module_2='keystore-bak'
bak_user_2='root'

#启动监听
#src='/data/main/chain/keystore'
src='/root/data/online-ethereum/keystore'
/usr/bin/inotifywait -mrq --timefmt '%Y-%m-%d %H:%M:%S' --format '[%T] file=%w%f evt=%e' \
 -e create $src |while read notifies; do 
    #执行备份
    echo "${notifies}" >> /data/var/bak/keystore_rsync.log 
    #rsync  -avz --password-file=/etc/rsyncd.pass /data/main/chain/keystore  root@13.251.97.13::keystore-bak
    rsync  -avz --password-file=/etc/rsyncd.pass $src $bak_user_1@$bak_host_1::$bak_module_1 
    rsync  -avz --password-file=/etc/rsyncd.pass $src $bak_user_2@$bak_host_2::$bak_module_2 
done
