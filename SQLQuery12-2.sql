/*
(4)���á�δ�ύ�������뼶��READ UNCOMMITTED������students������ʾ�����ࡱ���ݡ�
(5)���á��ύ�������뼶��(READ COMMITTED)����students������ʾ��������ࡱ���ݡ�
(6)���á����ظ��������뼶��(REPEATABLE READ)����students������ʾ��������ࡱ���ݡ������ظ����������ܱ���������
(7)���� ���ɴ��л������뼶��(SERIALIZABLE)����students������ʾ��ֹ�����û��������ύ֮ǰ�������ݡ�


set transaction isolation level read committed
select * from STUDENTS where sid = '800001216'
if @@ROWCOUNT != 0
begin
    waitfor delay '00:00:05'
    select * from STUDENTS where sid = '800001216'
end

set transaction isolation level repeatable read
delete from STUDENTS where sid='300000000'
select * from STUDENTS where sid = '300000000'
*/
set transaction isolation level serializable
delete from STUDENTS where sid='300000000'
select * from STUDENTS where sid = '300000000'