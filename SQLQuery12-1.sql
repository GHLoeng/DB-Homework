/*
(4)���á�δ�ύ�������뼶��READ UNCOMMITTED������students������ʾ�����ࡱ���ݡ�
(5)���á��ύ�������뼶��(READ COMMITTED)����students������ʾ��������ࡱ���ݡ�
(6)���á����ظ��������뼶��(REPEATABLE READ)����students������ʾ��������ࡱ���ݡ������ظ����������ܱ���������
(7)���� ���ɴ��л������뼶��(SERIALIZABLE)����students������ʾ��ֹ�����û��������ύ֮ǰ�������ݡ�


begin tran
update STUDENTS set grade=2017 where sid = '800001216'
waitfor delay '00:00:05'
select * from STUDENTS where sid = '800001216'
commit tran
select * from STUDENTS where sid = '800001216'


INSERT INTO STUDENTS
VALUES ('300000000','test','test@gmail.com',2017)
set transaction isolation level repeatable read
begin tran
    select * from STUDENTS where sid = '300000000'
    if @@ROWCOUNT != 0
    begin
        waitfor delay '00:00:10'
        select * from STUDENTS where sid = '300000000'
    end
rollback tran
*/
INSERT INTO STUDENTS
VALUES ('300000000','test','test@gmail.com',2017)
set transaction isolation level serializable
begin tran
    select * from STUDENTS where sid = '300000000'
    
        waitfor delay '00:00:10'
        select * from STUDENTS where sid = '300000000'
    
rollback tran