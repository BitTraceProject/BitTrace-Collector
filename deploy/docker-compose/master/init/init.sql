GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';
-- ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_pasword BY 'admin';

USE mysql;
-- 创建 admin 账号，并分配权限
CREATE USER admin IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%';
FLUSH PRIVILEGES;
-- 创建主从复制专用账号，并给 slave 分配权限
CREATE USER slave IDENTIFIED BY 'admin';
GRANT SELECT, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'slave'@'%';
FLUSH PRIVILEGES;

-- 创建 openapi admin 账号，并分配写入权限
CREATE USER openapi IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON *.* TO 'openapi'@'%';
-- ALTER USER 'openapi'@'%' IDENTIFIED WITH mysql_native_pasword BY 'admin';
FLUSH PRIVILEGES;
