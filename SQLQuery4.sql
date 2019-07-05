use School
/*
students (sid, sname , email , grade)
teachers (tid, tname , email , salary )
courses (cid, cname , hour )
choices (no, sid , tid , cid , score ) 
(1)查询选修C++课程的成绩比姓名为 ZNKOO的学生高的所有学生的编号和姓名;
select distinct STUDENTS.sid, STUDENTS.sname
from STUDENTS join CHOICES on students.sid=choices.sid join COURSES on choices.cid=COURSES.cid
where cname='C++' and  score>all 
(
select score
from STUDENTS join CHOICES on students.sid=choices.sid join COURSES on choices.cid=COURSES.cid
where sname='ZNKOO' and cname='C++'
)
(2)找出和学生883794999或学生850955252的年级一样的学生的姓名;

select distinct sname 
from students
where grade=
(
select grade
from STUDENTS
where sid = 883794999
)
union
select distinct sname 
from students
where grade=
(
select grade
from STUDENTS
where sid = 850955252
)
(3)查询没有选修Java的学生名称;

select distinct sname 
from STUDENTS join CHOICES on students.sid=choices.sid join COURSES on choices.cid=COURSES.cid
where cname not in
(
select cname
from COURSES
where cname='JAVA'
)
(4)找出课时最少的课程的详细信息;

select *
from COURSES
where hour<=all
(
select hour
from COURSES
where hour is not null
)
(5)查询工资最高的教师的编号和开设的课程号;

select distinct TEACHERS.tid,CHOICES.cid
from TEACHERS join CHOICES on TEACHERS.tid=CHOICES.tid 
where salary>=all
(
select salary
from TEACHERS
where salary is not null
)
(6)找出选修课程ERP成绩最高的学生编号; 

select distinct STUDENTS.sid
from STUDENTS join CHOICES on STUDENTS.sid=CHOICES.sid join COURSES on CHOICES.cid=COURSES.cid
where cname='ERP' and score>=all
(
select score
from STUDENTS join CHOICES on STUDENTS.sid=CHOICES.sid join COURSES on CHOICES.cid=COURSES.cid
where cname='ERP' and score is not null
)
(7)查询没有学生选修的课程名称;

select cname
from COURSES
where cid not in
(
select cid
from CHOICES
)
(8)查询讲授课程UML的教师所讲授的所有课程名称;

select distinct cname
from COURSES join CHOICES on CHOICES.cid=COURSES.cid
where CHOICES.tid=some
(
select tid
from COURSES join CHOICES on CHOICES.cid=COURSES.cid
where cname='UML'
)

(9)使用集合交运算，查询既选修了database又选修了UML课程的学生编号;

select STUDENTS.sid
from STUDENTS join CHOICES on CHOICES.sid=STUDENTS.sid join COURSES on CHOICES.cid=COURSES.cid
where cname='database'
intersect
select STUDENTS.sid
from STUDENTS join CHOICES on CHOICES.sid=STUDENTS.sid join COURSES on CHOICES.cid=COURSES.cid
where cname='UML'
(10)使用集合减运算，查询选修了database却没有选修UML课程的学生编号;
*/
select STUDENTS.sid
from STUDENTS join CHOICES on CHOICES.sid=STUDENTS.sid join COURSES on CHOICES.cid=COURSES.cid
where cname='database'
except
select STUDENTS.sid
from STUDENTS join CHOICES on CHOICES.sid=STUDENTS.sid join COURSES on CHOICES.cid=COURSES.cid
where cname='UML'



