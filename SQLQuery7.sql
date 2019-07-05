use School
/*
(1)授予所有用户对表 STUDENTS的查询权限
(2)授予所有用户对表 COURSES的查询和更新权限
(3)授予USER1对表 TEACHERS的查询,更新工资的权限,且允许 USERI1可以传播这些权限
(4)授予USER2对表 CHOICES的查询,更新成绩的权限
(5)由USER1授予USER2对表 TEACHERS的查询权限和传播的此项权限的权利
(6)由USER2授予USER3对表 TEACHERS的查询权限,和传播的此项权限的权利。再由USER3授予USER2上述权限,这样的SQL语句能否成功得到执行?
(7)取消USER1对表 STUDENTS的查询权限,考虑由USER2的身份对表 STUDENTS进行查询,操作能否成功?为什么？
(8)取消USER1和USER2的关于表 COURSES的权限
*/
/*(1)授予所有用户对表 STUDENTS的查询权限*/
grant select 
on students
to public
/*(2)授予所有用户对表 COURSES的查询和更新权限*/
grant select,update 
on courses
to public

revoke select
on students
from public
revoke select,update
on courses
from public
/*(3)授予USER1对表 TEACHERS的查询,更新工资的权限,且允许 USERI1可以传播这些权限
go
create view v1
as select salary
from TEACHERS
go*/
grant select,update
on v1 
to user1
with grant option
/*(4)授予USER2对表 CHOICES的查询,更新成绩的权限
go 
create view v2 
as select score
from CHOICES
go*/
grant select,update
on v2 
to user2
/*(7)取消USER1对表 STUDENTS的查询权限,
考虑由USER2的身份对表 STUDENTS进行查询,操作能否成功?为什么？*/
revoke select 
on students
from user1
/*(8)取消USER1和USER2的关于表 COURSES的权限*/

