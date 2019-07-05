use School 
set xact_abort on
/*
1.在school数据库中建立一张新表class，包括class_id(varchar(4)), name(varchar(10)), department(varchar(20))三个列，并约束class_id为主键。
2.创建事务T3，在事务中插入一个元组（‘0001’，’01CSC’,’’CS’）,并在T3中嵌套创建事务T4，T4也插入和T3一样的元组，编写代码测试，查看结果。
3.在表class中，尝试设置name=’01CSC‘的记录的class_id 为NULL，查看结果
4.在表class中，不创建事务，插入两个元组 （‘0002’，’01CSC‘。 ’CS‘），（’0002‘，’03CSC‘，’CS‘），然后查看表中有几条记录，为什么？
5.在表class中，创建事务，并设置开启回滚，然后插入两个元组（‘0003’，’03CSC‘。 ’CS‘），（’0001‘，’03CSC‘，’CS‘），查看结果，表中有几条记录？
6.在完成上面几步的前提下，尝试设置’name‘为主键，看能否成功，并思考原因。
*/
/*
1.在school数据库中建立一张新表class，包括class_id(varchar(4)), name(varchar(10)), department(varchar(20))三个列，并约束class_id为主键。

create table class (
class_id varchar(4) not null unique,
name varchar(10),
department varchar(20)
constraint PK_id_union primary key (class_id));
2.创建事务T3，在事务中插入一个元组（‘0001’，’01CSC’,’’CS’）,并在T3中嵌套创建事务T4，T4也插入和T3一样的元组，编写代码测试，查看结果。
begin transaction t3
insert into class values ('0001','01CSC','CS');
select * from class;
begin transaction t4
insert into class values ('0001','01CSC','CS');
select * from class;
commit transaction t4
commit transaction t3
3.在表class中，尝试设置name=’01CSC‘的记录的class_id 为NULL，查看结果

begin transaction t3
insert into class values ('0001','01CSC','CS');
select * from class;
commit transaction t3
update class set class_id = NULL where name = '01CSC'
select * from class
4.在表class中，不创建事务，插入两个元组 （‘0002’，’01CSC‘。 ’CS‘），（’0002‘，’03CSC‘，’CS‘），然后查看表中有几条记录，为什么？

insert into class values ('0002','01CSC','CS');
insert into class values ('0002','03CSC','CS');
select * from class;
5.在表class中，创建事务，并设置开启回滚，然后插入两个元组（‘0003’，’03CSC‘。 ’CS‘），（’0001‘，’03CSC‘，’CS‘），查看结果，表中有几条记录？

begin transaction t5 
insert into class values ('0003','03CSC','CS');
insert into class values ('0001','03CSC','CS');
select * from class;
commit transaction t5;
select * from class;
6.在完成上面几步的前提下，尝试设置’name‘为主键，看能否成功，并思考原因。
drop table class;
create table class (
class_id varchar(4) not null unique,
name varchar(10),
department varchar(20)
constraint PK_id_union primary key (class_id));
insert into class values ('0003','03CSC','CS');
insert into class values ('0001','03CSC','CS');
select * from class;
alter table class drop constraint PK_id_union ;
alter table class alter column name varchar(10) not null ;
alter table class add constraint PK_name_union primary key (name);*/
drop table class