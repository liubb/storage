每秒插入一个数值，并且自带时间戳。
----
1、创建表
create table user(id int(10) NOT NULL auto_increment,name varchar(20),userdate datetime NOT NULL DEFAULT NOW(),PRIMARY KEY  (`id`))

2、创建存储过程
CREATE PROCEDURE user()
INSERT INTO user(name) VALUES ('test');
3、创建定时器
CREATE EVENT IF NOT EXISTS eventJob
ON SCHEDULE EVERY 1 SECOND
ON COMPLETION PRESERVE
DO CALL user();
4、
开启事件test_event
alter event eventJob on completion preserve enable;
关闭事件test_event
alter event eventJob  on c
5、
SET GLOBAL event_scheduler = 1; -- 启动定时器
SET GLOBAL event_scheduler = 0; -- 停止定时器