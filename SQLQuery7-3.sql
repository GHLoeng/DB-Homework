use School
/*
(5)由USER1授予USER2对表 TEACHERS的查询权限和传播的此项权限的权利
(6)由USER2授予USER3对表 TEACHERS的查询权限,和传播的此项权限的权利。再由USER3授予USER2上述权限,这样的SQL语句能否成功得到执行?
(7)取消USER1对表 STUDENTS的查询权限,考虑由USER2的身份对表 STUDENTS进行查询,操作能否成功?为什么？
(8)取消USER1和USER2的关于表 COURSES的权限
*/
/*(6)由USER2授予USER3对表 TEACHERS的查询权限,和传播的此项权限的权利。再由USER3授予USER2上述权限,这样的SQL语句能否成功得到执行?*/
grant select
on v1
to user2
with grant option