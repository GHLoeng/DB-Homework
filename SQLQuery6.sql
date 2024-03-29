use School
/*
 students (sid, sname , email , grade)
 teachers (tid, tname , email , salary )
 courses (cid, cname , hour )
 choices (no, sid , tid , cid , score ) 
(1)定义选课信息和课程名称的视图 VIEWC;
(2)定义学生姓名与选课信息的视图 VIEWS;
(3)定义年级低于1998的学生的视图S1(SID, SNAME, GRADE);
(4)查询学生为“ uxjof”的学生的选课信息;
(5)查询选修课程“UML”的学生的编号和成绩;
(6)向视图S1插入记录(60000001,Lily,2001);
(7)删除原视图S1，定义包括更新和插入约束的视图S1 ，删除学号是60000001的记录，再尝试向视图插入记录(60000001,Lily,1997) ，删除所有年级为1999的学生记录，讨论更新和插入约束带来的影响。
(8)在视图 VIEWS中将姓名为“ uxjof”的学生的选课成绩都加上5分。
(9)取消以上建立的所有视图。 
(1)定义选课信息和课程名称的视图 VIEWC;

go
create view viewc
as select choices.*,courses.cname
from CHOICES,courses
where choices.cid = courses.cid
(2)定义学生姓名与选课信息的视图 VIEWS;

go
create view views
as select STUDENTS.sname,CHOICES.*
from STUDENTS,CHOICES
where STUDENTS.sid=CHOICES.sid
(3)定义年级低于1998的学生的视图S1(SID, SNAME, GRADE);

go
create view s1(sid,sname,grade)
as select sid,sname,grade
from STUDENTS
where grade>1998
(4)查询学生为“ uxjof”的学生的选课信息;

select *
from STUDENTS
where sname='uxjof'
(5)查询选修课程“UML”的学生的编号和成绩;

select sid,score
from CHOICES,COURSES
where CHOICES.cid=COURSES.cid and COURSES.cname='UML'
(6)向视图S1插入记录(60000001,Lily,2001);

insert into s1
values('60000001','Lily','2001')
(7)删除原视图S1，定义包括更新和插入约束的视图S1 ，删除学号是60000001的记录，再尝试向视图插入记录(60000001,Lily,1997) ，删除所有年级为1999的学生记录，讨论更新和插入约束带来的影响。

go
create view s1(sid,sname,grade)
as select sid,sname,grade
from STUDENTS
where grade>1998
go
drop view s1
go
create view s1(sid,sname,grade)
as select sid,sname,grade
from STUDENTS
where grade>1998
with check option
go
delete from s1
where sid='60000001'

insert into s1
values('60000001','Lily','1997')

delete from s1
where grade=1999
(8)在视图 VIEWS中将姓名为“ uxjof”的学生的选课成绩都加上5分。

update views
set score=score+5
where sname='uxjof'
(9)取消以上建立的所有视图。
*/
drop view s1
drop view viewc
drop view views