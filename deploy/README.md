## 部署主从复制的 MySQL

### 克隆仓库

```shell
git clone https://github.com/BitTraceProject/BitTrace-Collector.git
```

### 启动容器

```shell
cd BitTrace-Collector/deploy
bash bootstrap.sh
```

### 主从复制配置（master）

```shell
mysql -u admin -H localhost -P 33061 -p
SHOW MASTER STATUS; -- 查看 MASTER_LOG_FILE 和 MASTER_LOG_POS
```

### 主从复制配置（slave）

```shell
mysql -u admin -H localhost -P 33062 -p
STOP SLAVE;
RESET SLAVE;
-- 修改 MASTER_LOG_FILE 和 MASTER_LOG_POS
CHANGE MASTER TO MASTER_HOST='collector_mysql_master',MASTER_PORT=3306,MASTER_USER='slave',MASTER_PASSWORD='admin',MASTER_LOG_FILE='binlog_bittrace.000003',MASTER_LOG_POS=157;
-- 设置只读
SET GLOBAL super_read_only=1; -- super权限的用户只读状态，1：只读，0：可写
SET GLOBAL read_only=1; -- 普通权限用户读状态，1：只读，0：可写
START SLAVE;
SHOW SLAVE STATUS;
```
