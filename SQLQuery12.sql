use School
/*
编写一个嵌套事务。外层修改students表某记录，内层在teachers表插入一条记录。
演示内层插入操作失败后，外层修改操作回滚。
800001216 	gfxrgs

select * from STUDENTS where sid = '800001216'
begin tran tran_upd_students
    update STUDENTS set grade = 1993 where sid = '800001216'
    select * from STUDENTS where sid = '800001216'
    begin tran tran_ins_teachers
        insert into TEACHERS values (null,null,null,null)
    commit tran tran_ins_teachers
rollback tran
select * from STUDENTS where sid = '800001216'
*/
/*
编写一个带有保存点的事务。更新teachers表中数据后，设置事务保存点，
然后在表courses中插入数据，如果courses插入数据失败，则回滚到事务保存点。
演示courses插入失败，但teachers表更新成功的操作。
tea:200003125 fqmmyi wcjcg@glq.net 3928
cou:10001 database 96

select * from TEACHERS where tid = '200003125'
select * from COURSES where cid = '10001'
begin tran tran_upd_tea
    update TEACHERS set salary=9999 where tid = '200003125'
    save tran upd_tea_done
    insert into COURSES values(null,null,null)
    if @@ERROR != 0 or @@ROWCOUNT > 1
    begin
        rollback tran upd_tea_done
        PRINT'插入课程表失败'
        return 
    end
commit tran tran_upd_tea
select * from TEACHERS where tid = '200003125'
select * from COURSES where cid = '10001'
*/
/*
编写一个包含事务的存储过程，用于更新courses表的课时。
如果更新记录的cid不存在，则输出“课程信息不存在”，其他错误输出“修改课时失败”，
如果执行成功，则输出“课时修改成功”。调用该存储过程，演示更新成功与更新失败的操作。

go
create procedure updatecourseinfo
    @cid_ char(10),
    @hour_ int,
    @returnStr varchar(100) out
as
begin tran
    if not exists(select cid from courses where cid=@cid_)
    begin
        select @returnStr = '课程信息不存在'
        goto onerror
    end
    update courses set hour=@hour_ where cid = @cid_
    if @@ERROR!=0
    begin
        select @returnStr = '修改课时失败'
        goto onerror
    end
    select @returnStr = '课时修改成功'
    print @returnStr
    commit tran
onerror:
    print @returnStr
    rollback tran
go

ALTER TABLE COURSES ADD CONSTRAINT Uhour CHECK (hour>0)
declare @cid_ char(10)
declare @hour_ int
declare @returnStr varchar(100)
exec updatecourseinfo '10001',0,@returnStr out
select * from COURSES 
*/
