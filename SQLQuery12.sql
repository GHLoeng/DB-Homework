use School
/*
��дһ��Ƕ����������޸�students��ĳ��¼���ڲ���teachers�����һ����¼��
��ʾ�ڲ�������ʧ�ܺ�����޸Ĳ����ع���
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
��дһ�����б��������񡣸���teachers�������ݺ��������񱣴�㣬
Ȼ���ڱ�courses�в������ݣ����courses��������ʧ�ܣ���ع������񱣴�㡣
��ʾcourses����ʧ�ܣ���teachers����³ɹ��Ĳ�����
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
        PRINT'����γ̱�ʧ��'
        return 
    end
commit tran tran_upd_tea
select * from TEACHERS where tid = '200003125'
select * from COURSES where cid = '10001'
*/
/*
��дһ����������Ĵ洢���̣����ڸ���courses��Ŀ�ʱ��
������¼�¼��cid�����ڣ���������γ���Ϣ�����ڡ�����������������޸Ŀ�ʱʧ�ܡ���
���ִ�гɹ������������ʱ�޸ĳɹ��������øô洢���̣���ʾ���³ɹ������ʧ�ܵĲ�����

go
create procedure updatecourseinfo
    @cid_ char(10),
    @hour_ int,
    @returnStr varchar(100) out
as
begin tran
    if not exists(select cid from courses where cid=@cid_)
    begin
        select @returnStr = '�γ���Ϣ������'
        goto onerror
    end
    update courses set hour=@hour_ where cid = @cid_
    if @@ERROR!=0
    begin
        select @returnStr = '�޸Ŀ�ʱʧ��'
        goto onerror
    end
    select @returnStr = '��ʱ�޸ĳɹ�'
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
