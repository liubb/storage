ÿ�����һ����ֵ�������Դ�ʱ�����
----
1��������
create table user(id int(10) NOT NULL auto_increment,name varchar(20),userdate datetime NOT NULL DEFAULT NOW(),PRIMARY KEY  (`id`))

2�������洢����
CREATE PROCEDURE user()
INSERT INTO user(name) VALUES ('test');
3��������ʱ��
CREATE EVENT IF NOT EXISTS eventJob
ON SCHEDULE EVERY 1 SECOND
ON COMPLETION PRESERVE
DO CALL user();
4��
�����¼�test_event
alter event eventJob on completion preserve enable;
�ر��¼�test_event
alter event eventJob  on c
5��
SET GLOBAL event_scheduler = 1; -- ������ʱ��
SET GLOBAL event_scheduler = 0; -- ֹͣ��ʱ��