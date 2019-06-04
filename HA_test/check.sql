# Version: V1.0
# Author: liubinbin
# Created Time : 2019-6-4 08:21:00
# Environment: Red Hat Enterprise Linux Server release 7.5 (Maipo)
#
#
# DESC: find the hop timestampe

delimiter //
create procedure cursor_diff()
begin
    DECLARE  no_more_record INT DEFAULT 0;
    declare t1 datetime;
    declare t2 datetime;
    declare diff int;
    declare mycursor cursor for select userdate from user;
    DECLARE  CONTINUE HANDLER FOR NOT FOUND  SET  no_more_record = 1;
    open mycursor;
    WHILE no_more_record != 1 DO
         fetch  mycursor into t1;
         fetch  mycursor into t2;
         select timestampdiff(second,t1,t2) into diff;
         if diff > 2 then
           select t2;
         end if;
    END WHILE;
    close mycursor;
end;
//
delimiter ;

call cursor_diff();