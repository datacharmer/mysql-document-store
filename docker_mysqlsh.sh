docker run -d \
    -v ~/opt/linux/mysql-shell/bin/mysqlsh:/usr/bin/mysqlsh  \
    -v ~/data:/data \
    --name mybox \
    -e MYSQL_ROOT_PASSWORD=secret \
    mysql/mysql-server 

#    datacharmer/mysql-sb-full bash

