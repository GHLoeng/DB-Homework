use School
/*
students (sid, sname , email , grade)
teachers (tid, tname , email , salary )
courses (cid, cname , hour )
choices (no, sid , tid , cid , score ) 
(1)向 STUDENTS表插入编号是“800022222”且姓名是“ WangLan”的元组。

insert into STUDENTS
values ('800022222','WangLan',null,null)
(2)向 TEACHERS表插入元组(“200001000”,“LXL”,“s4zrck@pew,net”,“3024”)。

insert into TEACHERS
values('200001000','LXL','s4zrck@pew,net','3024')
(3)将 TEACHERS表中编号为“200010493”的老师工资改为4000。

update TEACHERS
set salary=4000
where tid='200010493'
(4)将 TEACHERS表中所有工资小于2500的老师工资改为2500。

update TEACHERS
set salary=2500
where salary<2500
(5)将编号为“200016731”的老师讲授的课程全部改成由姓名为“rnupx”的老师讲授。

update CHOICES
set tid = (
select tid
from TEACHERS
where tname = 'rnupx')
where tid = '200016731'
(6)更新编号“800071780”的学生年级为“2001”。

update STUDENTS
set grade='2001'
where sid = '800071780'
(7)删除没有学生选修的课程。

delete 
from COURSES
where cid not in(
select cid 
from CHOICES)
(8)删除年级高于1998的学生信息。

delete 
from CHOICES
where sid in (
select sid 
from STUDENTS
where grade>1998)

delete 
from STUDENTS
where grade>1998
(9)删除没有选修课程的学生信息。

delete 
from STUDENTS
where sid not in(
select sid
from CHOICES)
(10)删除成绩不及格的选课记录 。
*/
delete 
from CHOICES
where score<60