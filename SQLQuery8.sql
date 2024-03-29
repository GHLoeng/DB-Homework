use School
/*
students (sid, sname , email , grade)
teachers (tid, tname , email , salary )
courses (cid, cname , hour )
choices (no, sid , tid , cid , score ) 
(1)通过查询选修课程C++的学生的人数，其中成绩合格的学生人数，不合格的学生人数，讨论NULL值的特殊含义。
(2)查询选修C++课程的学成的成绩小于0分的记录，并对结果使用count，查看结果的特点。
(3)查询选修课程C++的学生的编号和成绩，使用 ORDER BY按成绩进行排序时,取NULL的项是否出现在结果中？如果有，在什么位置?
(4)在上面的查询的过程中，如果加上保留字 DISTINCT会有什么效果呢?
(5)按年级对所有的学生进行分组，能得到多少个组?与现实的情况有什么不同?
(6)结合分组,使用集合函数求每个课程选修的学生的平均分,总的选课记录数,最高成绩,最低成绩,讨论考察取空值的项对集合函数的作用的影响。
(7)采用嵌套查询的方式,利用比较运算符和谓词ALL的结合来查询表 STUDENTS中最晚入学的学生年级。当存在 GRADE取空值的项时,考虑可能出现的情况,并解释。
(8)采用嵌套查询的方式,利用比较运算符和谓词ALL的结合来查询表 CHOICES中两门课都是成绩最低的学生的SID。当存在 SCORE取空值的项时,考虑可能出现的情况,并解释。

(1)通过查询选修课程C++的学生的人数，其中成绩合格的学生人数，不合格的学生人数，讨论NULL值的特殊含义。
select COUNT(*)
from CHOICES,COURSES
where CHOICES.cid=COURSES.cid and cname='C++' 
select COUNT(*)
from CHOICES,COURSES
where CHOICES.cid=COURSES.cid and cname='C++' and score>=60
select COUNT(*)
from CHOICES,COURSES
where CHOICES.cid=COURSES.cid and cname='C++' and score <60
(2)查询选修C++课程的学成的成绩小于0分的记录，并对结果使用count，查看结果的特点。

select count(*)
from CHOICES,COURSES
where CHOICES.cid=COURSES.cid and cname='C++' and score<0
(3)查询选修课程C++的学生的编号和成绩，使用 ORDER BY按成绩进行排序时,取NULL的项是否出现在结果中？如果有，在什么位置?

select CHOICES.sid,CHOICES.score
from CHOICES,COURSES
where CHOICES.cid=COURSES.cid and COURSES.cname='C++'
order by score
(4)在上面的查询的过程中，如果加上保留字 DISTINCT会有什么效果呢?

select distinct CHOICES.sid, CHOICES.score
from CHOICES,COURSES
where CHOICES.cid=COURSES.cid and COURSES.cname='C++'
order by score
(5)按年级对所有的学生进行分组，能得到多少个组?与现实的情况有什么不同?

select grade
from STUDENTS
group by grade
(6)结合分组,使用集合函数求每个课程选修的学生的平均分,总的选课记录数,最高成绩,最低成绩,讨论考察取空值的项对集合函数的作用的影响。
select cid,AVG(score),COUNT(sid),MAX(score),MIN(score)
from CHOICES
group by cid
(7)采用嵌套查询的方式,利用比较运算符和谓词ALL的结合来查询表 STUDENTS中最晚入学的学生年级。当存在 GRADE取空值的项时,考虑可能出现的情况,并解释。

select *
from STUDENTS as s1
where grade >= All(
select grade 
from STUDENTS as s2
where grade is not null 
)*/
/*(8)采用嵌套查询的方式,利用比较运算符和谓词ALL的结合来查询表 CHOICES中两门课都是成绩最低的学生的SID。当存在 SCORE取空值的项时,考虑可能出现的情况,并解释。
*/
select distinct c1.sid,c1.score,c2.score 
from CHOICES as c1,CHOICES as c2
where c1.cid != c2.cid and c1.sid = c2.sid
and c1.score <= all(
select score 
from CHOICES as c3
where score is not null and c3.cid = c1.cid)
and c2.score <= all(
select score 
from CHOICES as c4
where score is not null and c4.cid = c2.cid)


