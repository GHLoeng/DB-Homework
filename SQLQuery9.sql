use School 
set xact_abort on
/*
1.��school���ݿ��н���һ���±�class������class_id(varchar(4)), name(varchar(10)), department(varchar(20))�����У���Լ��class_idΪ������
2.��������T3���������в���һ��Ԫ�飨��0001������01CSC��,����CS����,����T3��Ƕ�״�������T4��T4Ҳ�����T3һ����Ԫ�飬��д������ԣ��鿴�����
3.�ڱ�class�У���������name=��01CSC���ļ�¼��class_id ΪNULL���鿴���
4.�ڱ�class�У����������񣬲�������Ԫ�� ����0002������01CSC���� ��CS����������0002������03CSC������CS������Ȼ��鿴�����м�����¼��Ϊʲô��
5.�ڱ�class�У��������񣬲����ÿ����ع���Ȼ���������Ԫ�飨��0003������03CSC���� ��CS����������0001������03CSC������CS�������鿴����������м�����¼��
6.��������漸����ǰ���£��������á�name��Ϊ���������ܷ�ɹ�����˼��ԭ��
*/
/*
1.��school���ݿ��н���һ���±�class������class_id(varchar(4)), name(varchar(10)), department(varchar(20))�����У���Լ��class_idΪ������

create table class (
class_id varchar(4) not null unique,
name varchar(10),
department varchar(20)
constraint PK_id_union primary key (class_id));
2.��������T3���������в���һ��Ԫ�飨��0001������01CSC��,����CS����,����T3��Ƕ�״�������T4��T4Ҳ�����T3һ����Ԫ�飬��д������ԣ��鿴�����
begin transaction t3
insert into class values ('0001','01CSC','CS');
select * from class;
begin transaction t4
insert into class values ('0001','01CSC','CS');
select * from class;
commit transaction t4
commit transaction t3
3.�ڱ�class�У���������name=��01CSC���ļ�¼��class_id ΪNULL���鿴���

begin transaction t3
insert into class values ('0001','01CSC','CS');
select * from class;
commit transaction t3
update class set class_id = NULL where name = '01CSC'
select * from class
4.�ڱ�class�У����������񣬲�������Ԫ�� ����0002������01CSC���� ��CS����������0002������03CSC������CS������Ȼ��鿴�����м�����¼��Ϊʲô��

insert into class values ('0002','01CSC','CS');
insert into class values ('0002','03CSC','CS');
select * from class;
5.�ڱ�class�У��������񣬲����ÿ����ع���Ȼ���������Ԫ�飨��0003������03CSC���� ��CS����������0001������03CSC������CS�������鿴����������м�����¼��

begin transaction t5 
insert into class values ('0003','03CSC','CS');
insert into class values ('0001','03CSC','CS');
select * from class;
commit transaction t5;
select * from class;
6.��������漸����ǰ���£��������á�name��Ϊ���������ܷ�ɹ�����˼��ԭ��
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