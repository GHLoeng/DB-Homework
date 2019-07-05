use School
/*
create table worker(
number char(5),
name char(8) constraint U1 unique,
sex char(1),
sage int constraint U2 check(sage <= 28),
department char(20),
constraint PK_worker primary key(number) )
insert into worker values('00001','李勇','M',14,'科技部')
select * from worker
加入约束U3，令sage值大于等于0。

alter table worker drop U2;
alter table worker add constraint U3 check(sage >= 0)
加入规则R2，确保插入的记录的sage值在1到100之间，并绑定到sage属性。

go 
create rule R2 as @value between 1 and 100
go
exec sp_bindrule R2,'worker.[sage]';

解除规则R2的绑定，并重复(6)的操作。

exec sp_unbindrule 'worker.[sage]';
insert into worker values('00002','陆勇','M',104,'科技部');
select * from worker;

update worker 
set name = '王勇',sage = 38
where number = '00002'
已知示例三中已插入sage为38的记录，那么加入规则R3，令sage大于50。
观察加入规则R3的操作是否能成功。

go 
CREATE RULE R3 AS @Sage>50
go
exec sp_bindrule R2,'worker.[sage]';

select * from worker;
建立一个在worker表上的触发器T4，要求插入记录的sage值必须比表中已记录的最大sage值大。
go 
create trigger T4 on worker
for insert
as if (select sage from inserted) < (select max(sage) from worker)
begin 
rollback transaction
end
insert into worker values('00003','陆勇','M',10,'科技部');
(10)演示违反触发器T4的操作，即插入一条比表中已记录的最大sage值小的记录
delete worker where number='00003';
insert into worker values('00003','陆勇','M',10,'科技部');
select * from worker;
建立一个在worker表上的触发器T5，要求当更新一个记录的时候，表中记录的sage值要比老记录的sage值大，因为一般工资级别只能升不能降。

go 
create trigger T5 on worker
for update
as if (select sage from inserted) <= (select sage from deleted)
begin 
rollback transaction
end
 
(13)为worker表建立触发器T6，禁止修改编号为00001的记录。
 
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
建立基于students和stu_card两个表的视图，创建INSTEADOF触发器使该视图支持更新操作
，并演示更新操作。
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
    else print'数据已存在'
end*/
update studentcard set sid = '05212567' where sid = '05212567'