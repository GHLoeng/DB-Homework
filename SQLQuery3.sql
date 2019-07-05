use School
/*
 students (sid, sname , email , grade)
 teachers (tid, tname , email , salary )
 courses (cid, cname , hour )
 choices (no, sid , tid , cid , score ) 
(1)查询全部课程的详细记录;
(2)查询所有有选修课的学生的编号;
(3)查询课时<88(小时)的课程的编号;
(4)请找出总分超过400分的学生;
(5)查询课程的总数;
(6)查询所有课程和选修该课程的学生总数;
(7)查询选修成绩超过60的课程超过两门的学生编号;
(8)统计各个学生的选修课程数目和平均成绩;
(9)查询选修Java的所有学生的编号及姓名;
(10)查询姓名为ssht的学生所选的课程的编号和成绩;
(11)查询其他课时比课程C++多的课程的名称;

*/
/*
select *
from COURSES

select distinct sid 
from CHOICES

select cid
from COURSES
where hour<88

select sid,sname,email,grade
from STUDENTS
where grade>400

select COUNT(*)
from COURSES

select cid,COUNT(sid)
from CHOICES
group by cid

--查询选修成绩超过60的课程超过两门的学生编号;
select distinct sid
from CHOICES
where score > 60
group by sid
having COUNT(sid)>2

--统计各个学生的选修课程数目和平均成绩;
select distinct sid,COUNT(sid),AVG(score)
from CHOICES
group by sid

--查询选修Java的所有学生的编号及姓名
select distinct students.sid,sname
from STUDENTS join CHOICES on STUDENTS.sid = CHOICES.sid join COURSES on CHOICES.cid = COURSES.cid
where cname = 'JAVA'

--查询姓名为ssht的学生所选的课程的编号和成绩
select cid,score
from STUDENTS join CHOICES on STUDENTS.sid = CHOICES.sid
where sname = 'ssht'
*/
--查询其他课时比课程C++多的课程的名称;
with cpp(hour) as (select hour from COURSES where cname = 'C++')
select cname 
from COURSES,cpp
where COURSES.hour > cpp.hour

