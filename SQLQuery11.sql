use School
/*
create table worker(
number char(5),
name char(8) constraint U1 unique,
sex char(1),
sage int constraint U2 check(sage <= 28),
department char(20),
constraint PK_worker primary key(number) )
insert into worker values('00001','����','M',14,'�Ƽ���')
select * from worker
����Լ��U3����sageֵ���ڵ���0��

alter table worker drop U2;
alter table worker add constraint U3 check(sage >= 0)
�������R2��ȷ������ļ�¼��sageֵ��1��100֮�䣬���󶨵�sage���ԡ�

go 
create rule R2 as @value between 1 and 100
go
exec sp_bindrule R2,'worker.[sage]';

�������R2�İ󶨣����ظ�(6)�Ĳ�����

exec sp_unbindrule 'worker.[sage]';
insert into worker values('00002','½��','M',104,'�Ƽ���');
select * from worker;

update worker 
set name = '����',sage = 38
where number = '00002'
��֪ʾ�������Ѳ���sageΪ38�ļ�¼����ô�������R3����sage����50��
�۲�������R3�Ĳ����Ƿ��ܳɹ���

go 
CREATE RULE R3 AS @Sage>50
go
exec sp_bindrule R2,'worker.[sage]';

select * from worker;
����һ����worker���ϵĴ�����T4��Ҫ������¼��sageֵ����ȱ����Ѽ�¼�����sageֵ��
go 
create trigger T4 on worker
for insert
as if (select sage from inserted) < (select max(sage) from worker)
begin 
rollback transaction
end
insert into worker values('00003','½��','M',10,'�Ƽ���');
(10)��ʾΥ��������T4�Ĳ�����������һ���ȱ����Ѽ�¼�����sageֵС�ļ�¼
delete worker where number='00003';
insert into worker values('00003','½��','M',10,'�Ƽ���');
select * from worker;
����һ����worker���ϵĴ�����T5��Ҫ�󵱸���һ����¼��ʱ�򣬱��м�¼��sageֵҪ���ϼ�¼��sageֵ����Ϊһ�㹤�ʼ���ֻ�������ܽ���

go 
create trigger T5 on worker
for update
as if (select sage from inserted) <= (select sage from deleted)
begin 
rollback transaction
end
 
(13)Ϊworker����������T6����ֹ�޸ı��Ϊ00001�ļ�¼��
 
go 
create trigger T6  on worker
for update 
as if (select number from deleted) = '00001'
begin 
rollback transaction
end

update worker 
set sage = 51
where number = '00001'
��������students��stu_card���������ͼ������INSTEADOF������ʹ����ͼ֧�ָ��²���
������ʾ���²�����
go
create view studentcard as 
select STUDENTS.sid,STUDENTS.sname,stu_card.card_id
from STUDENTS,stu_card
where STUDENTS.sid = stu_card.stu_id

go
create trigger tri_ins_sc on studentcard
instead of update
as 
begin
    set nocount on
    if (exists
        (select students.sid from students,inserted,stu_card
         where students.sid = inserted.sid and stu_card.stu_id = STUDENTS.sid))
    begin
        update STUDENTS set sid = inserted.sid from inserted
        update stu_card set stu_id = inserted.sid from inserted
    end
    else print'�����Ѵ���'
end*/
update studentcard set sid = '05212567' where sid = '05212567'