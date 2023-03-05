GRANT ALL privileges on *.* TO 'root'@'%';
-- ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_pasword BY 'admin';

USE mysql;
-- 创建 openapi admin 账号，并分配权限
CREATE USER admin IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%';
FLUSH PRIVILEGES;
CREATE USER openapi IDENTIFIED BY 'admin';
GRANT SELECT ON *.* TO 'openapi'@'%';
FLUSH PRIVILEGES;
