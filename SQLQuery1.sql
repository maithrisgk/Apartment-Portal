create table aptno(aptno varchar(10) NOT NULL PRIMARY KEY,
type varchar(10), 
status varchar(20));

insert into aptno values ('A1', '2BHK' , 'Rented');

insert into aptno values ('B1', '3BHK', 'Vacant');


select * from aptno;

--alter table aptno 
--add constraint pk_aptno
--primary key (aptno);

--drop table aptno;

create table staff(
name char(60) not null,
designation varchar(30),
phonenumber bigint
);

insert into staff values(
'Heidi Mcray', 'Property Manager', 3423567989
);

insert into staff values(
'James Fallon', 'Maintenance Technician', 5536682234
);

insert into staff values (
'Jimmy Kimmell','Maintenance Technician', 3425670987);

insert into staff values (
'Victoria Davis','Maintenance Technician', 5514428976
);

insert into staff values (
'Joseph Fernandes','Maintenance Technician', 4129876542
);



select * from staff;

create table maintenance(
fname varchar(50),
lname varchar(50),
aptno varchar(10) foreign key references aptno (aptno),
priority_rbtn varchar(10),
descr varchar(200),
technician varchar(200),
permit varchar(10)
);

insert into maintenance values(
'Jacob',
'Schneider',
'A1',
'Medium',
'Broken kitchen tap',
'James Fallon',
'Yes'
);

select * from maintenance;
