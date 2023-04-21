create database STUDENT_MANAGER;
use STUDENT_MANAGER;

create table Student(
studentId int primary key auto_increment,
studentName varchar(255),
age int,
email varchar(255) unique
);

create table Subject(
subjectId int primary key auto_increment,
subjectName varchar(255)
);

create table Class(
classId int primary key auto_increment,
className varchar(255)
);

create table Mark(
mark int,
subjectId int,
studentId int,
foreign key (subjectId) references Subject (subjectId),
foreign key (studentId) references student (studentId)
);

create table ClassStudent(
studentId int,
classId int,
foreign key (classId) references class(classId)
);

insert into student(studentName,age,email)values
("Ba Lam",20,"lam@gmail.com"),
("Ba Khoa",22,"khoa@gmail.com"),
("Ba Tuan",19,"tuan@gmail.com"),
("Ba Hung",02,"hung@gmail.com"),
("Ba khiet",03,"khiet@gmail.com");

insert into class(className)values
("java08"),
("java09"),
("java10"),
("java11"),
("java03");

insert into classstudent(studentId,classId)values
(1,2),
(3,1),
(4,2),
(5,3),
(2,5),
(2,3);

insert into `subject`(subjectName)values
("Toan"),
("Van"),
("Anh"),
("Li"),
("Hoa"),
("Dia"),
("Su");

insert into mark(mark,subjectId,studentId)values
(8,1,1),
(2,2,6),
(5,3,3),
(7,4,2),
(9,3,4),
(10,2,5),
(4,3,3),
(1,4,5);
-- 1.	Hien thi danh sach tat ca cac hoc vien 
select * from student;
-- 2.	Hien thi danh sach tat ca cac mon hoc
select * from `subject`;
-- 3.	Tinh diem trung binh 
select round(avg(mark.mark)) as "DiemTB" from mark;
-- 4.	Hien thi mon hoc nao co hoc sinh thi duoc diem cao nhat
select subject.subjectName from `subject` join mark on subject.subjectId=mark.subjectId where mark=(select max(mark) from Mark);
-- 5.	Danh so thu tu cua diem theo chieu giam
select mark.mark from mark order by mark desc;
-- 7.	Cap nhat them dong chu « Day la mon hoc «  vao truoc cac 
--      ban ghi tren cot SubjectName trong bang Subjects
select  concat(subjectName, " ", " day la mon hoc") as "Monhoc" from subject;
-- 8.	Viet Check Constraint de kiem tra do tuoi nhap vao trong 
--      bang Student yeu cau Age >15 va Age < 50
delete from student where age <15;
alter table student add constraint Chk_Age check (age between 15 and 50);
select * from student;
-- 9.	Loai bo tat ca quan he giua cac bang
-- Alter table[Tên Bảng] drop constraint[Tên ràng buộc]
alter table mark drop constraint mark_ibfk_1;
alter table mark drop constraint mark_ibfk_2;
alter table classstudent drop constraint classstudent_ibfk_1;
-- 10.	Xoa hoc vien co StudentID la 1
delete from student where studentId=1;
-- 11.	Trong bang Student them mot column Status co kieu du lieu la Bit va co gia tri Default la 1
alter table student add column status bit default 1;
-- 12.	Cap nhap gia tri Status trong bang Student thanh 0
update student set status = 0;
select * from student;