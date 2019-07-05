/*
(4)设置“未提交读”隔离级别（READ UNCOMMITTED），在students表上演示读“脏”数据。
(5)设置“提交读”隔离级别(READ COMMITTED)，在students表上演示避免读“脏”数据。
(6)设置“可重复读”隔离级别(REPEATABLE READ)，在students表上演示避免读“脏”数据、不可重复读，但不能避免幻象读。
(7)设置 “可串行化”隔离级别(SERIALIZABLE)，在students表上演示防止其他用户在事务提交之前更新数据。


set transaction isolation level read committed
select * from STUDENTS where sid = '800001216'
if @@ROWCOUNT != 0
begin
    waitfor delay '00:00:05'
    select * from STUDENTS where sid = '800001216'
end

set transaction isolation level repeatable read
delete from STUDENTS where sid='300000000'
select * from STUDENTS where sid = '300000000'
*/
set transaction isolation level serializable
delete from STUDENTS where sid='300000000'
select * from STUDENTS where sid = '300000000'