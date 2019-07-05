use School
/*
set transaction isolation level repeatable read
set lock_timeout 2000
begin tran 
select * from STUDENTS where sid = '800001216'
commit tran
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
