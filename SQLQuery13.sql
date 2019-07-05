use school
/*
以下练习均在school数据库中students表上进行。
1.在students表上演示锁争夺，通过sp_who查看阻塞的进程。
通过设置lock_timeout解除锁争夺。
2.在students表上演示死锁。
3.讨论如何避免死锁以及死锁的处理方法。
4.在school数据库上创建用户“王二”，在students表上创建视图grade2000，
将年级为2000的学生元组放入视图。
5.授予用户王二在视图grade2000的select权限。
6.授予用户王二在视图grade2000的修改sname列的权限。
7.查看SQL Server错误日志。
*/
/*
set transaction isolation level repeatable read
begin tran 
update STUDENTS set grade = 2017 where sid = '800001216'
*/
/*
set transaction isolation level repeatable read
begin tran 
    select * from STUDENTS where sid = '800001216'
    waitfor delay '00:00:10'
    update STUDENTS set grade = 2017 where sid = '800001216'
commit tran
select * from STUDENTS where sid = '800001216'
*/
/*
死锁的避免

尽量使查询对资源的使用顺序保持一致，避免出现循环访问。

尽量减少事务执行的时间。

保持事务简短并在一个批处理中。

避免事务中的用户交互，即锁的竞争。

减少资源的占用时间从而减少锁的竞争。

在合理的范围内降低隔离级别，减少锁的持有时间。

同一个对象尽量采用select 在update 前来使用。

对于实时性要求不高的可以使用with(nolock)来实现对表的查询，但是可能会差生脏读。

​
死锁的处理

可以使用然后用kill spid处理掉处于导致死锁的事务
使用SET LOCK_TIMEOUT 设定锁请求超时

SQL Server内部有一个锁监视器线程执行死锁检查，锁监视器对特定线程启动死锁搜索时，会标识线程正在等待的资源；然后查找特定资源的所有者，并递归地继续执行对那些线程的死锁搜索，直到找到一个构成死锁条件的循环。检测到死锁后，数据库引擎 选择运行回滚开销最小的事务的会话作为死锁牺牲品，返回1205 错误，回滚死锁牺牲品的事务并释放该事务持有的所有锁，使其他线程的事务可以请求资源并继续运行。

修改产生锁死的语句

*/
/*
4.在school数据库上创建用户“王二”，在students表上创建视图grade2000，
将年级为2000的学生元组放入视图。
5.授予用户王二在视图grade2000的select权限。
6.授予用户王二在视图grade2000的修改sname列的权限。
7.查看SQL Server错误日志。

exec sp_addlogin '王二','123456','school','English'
go 
use School
go 
exec sp_grantdbaccess '王二'
*/
/*
go 
create view grade2000 as
    select * from STUDENTS where grade = 2000
go
select * from grade2000

go
grant select on grade2000 to 王二
go
grant update on dbo.[grade2000]([sname]) to 王二
*/
dbcc log(school,4)
