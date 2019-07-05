use School
set xact_abort on
/*
create table stu_union(
sno char(5) not null unique,
sname char(8),
ssex char(1),
sage int,
sdept char(20),
constraint PK_stu_union primary key (sno));
insert into stu_union values ('10001','����','0',24,'EE');
insert into stu_union values ('95002','����','1',23,'CS');
insert into stu_union values ('95003','����','0',25,'EE');
insert into stu_union values ('95005','����','0',25,'EE');
insert into stu_union values ('95009','����','0',25,'EE');
select * from stu_union;
create table course(
cno char(4) not null unique,
cname varchar(50) not null ,
cpoints int,
constraint PK primary key(cno));
insert course values('0001','ComputerNetworks',2);
insert course values('0002','Database',3);
select * from course
create table sc(
sno char(5) references stu_union (sno) on delete cascade,
cno char(4) references course (cno) on delete cascade,
grade int,
constraint PK_SC primary key (sno,cno));
insert into sc values ('95002','0001',2);
insert into sc values ('95002','0002',2);
insert into sc values ('10001','0001',2);
insert into sc values ('10001','0002',2);
select * from sc;

delete from stu_union where sno='10001';
select * from sc;
insert into stu_union values ('10001','����','0',24,'EE');
insert into sc values ('10001','0001',2);
insert into sc values ('10001','0002',2);
��alter table��佫SC���е�on delete cascade��Ϊon delete no action,
���²���SC�����ݣ�����ʵ��һ�� ����ɾ��Stu_Union��snoΪ��10001�������ݡ�
�۲�����������ԭ��

alter table sc drop constraint FK__sc__cno__4F7CD00D;
alter table sc add constraint FK__sc__cno foreign key (cno)
references course(cno) on delete no action
alter table sc drop constraint FK__sc__sno__4E88ABD4;
alter table sc add constraint FK__sc__Sno foreign key (sno)
references stu_union(sno) on delete no action
��alter table��佫SC���е�on delete no action��Ϊon delete set NULL,
���²���SC�����ݣ�����ʵ��һ�� ����ɾ��Stu_Union��snoΪ��10001�������ݡ�
�۲�����������ԭ��

alter table sc drop constraint FK__sc__cno;
alter table sc add constraint FK__sc__cno foreign key (cno)
references course(cno) on delete set null;
alter table sc drop constraint FK__sc__sno;
alter table sc add constraint FK__sc__Sno foreign key (sno)
references stu_union(sno) on delete set null;
delete from stu_union where sno='10001';
select * from sc;
*/

/*
create table stu_card(
card_id char(14),
stu_id char(10) references students(sid) on delete cascade,
remained_money decimal(10,2),
constraint PK_stu_card primary key (card_id));
insert into stu_card values ('05212567','800001216',100.25);
insert into stu_card values ('05212222','800005753',200.50);
select * from stu_card;
create table icbc_card(
bank_id char(20),
stu_card_id char(14) references stu_card(card_id) on delete cascade,
restored_money decimal(10,2),
constraint PK_icbc_card primary key (bank_id));
insert into icbc_card values ('9558844022312','05212567',15000.1);
insert into icbc_card values ('9558844023645','05212222',50000.3);
select * from icbc_card;

alter table choices drop FK_CHOICES_STUDENTS;
alter table choices add
constraint FK_CHOICE_STUDENTS foreign key (sid)
references dbo.students (sid) on delete cascade;
��������T3���޸�ICBC_Card���������ԣ�ʹ���Ϊon delete set NULL,
����ɾ��students����һ����¼���۲�����������ԭ��

begin transaction t3 
alter table icbc_card drop FK__icbc_card__stu_c__59063A47;
alter table icbc_card add 
constraint FK_icbc_card foreign key (stu_card_id)
references stu_card(card_id) on delete set null;
delete from STUDENTS where sid = '80005753';
commit transaction t3;
select * from icbc_card;
����һ�������ѧ���������涨������ѧ����ţ�ѧ��������ѧ���İ�������
ÿ��ѧ�����ҽ���һ���������󣬰�������Ҳ�����ǰ����ѧ����������Բ������⣩

create table help(
sid char(10) primary key,
sname char(10),
helper char(10) not null);
alter table help add 
constraint FK_help foreign key(helper) 
references help(sid);
*/
ѧУѧ�����ÿ�����Ŷ���һ��������ÿ�������쵼�����Ա��
ÿ����ֻ��һ����Ա�����ⲿ����Ȩ������������������ֹ�ϵ���쵼�����⣩
�����Ż����յı�Ķ��塣������������յ����⣩

create table leader(
sid char(10),
sname char(10),
myleader char(10),
constraint PK_leader primary key (sid));
create table monitor(
sid char(10),
sname char(10),
mymonitor char(10),
constraint PK_monitor primary key (sid),
constraint PF_monitor foreign key (mymonitor) references leader(sid));
alter table leader add 
constraint FK_leader foreign key (myleader) references monitor(sid);