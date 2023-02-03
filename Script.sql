/*1. Создать таблицу employees
- id. serial,  primary key,
- employee_name. Varchar(50), not null
*/

create table employees(
	id serial  primary key,
	employee_name Varchar(50) not null
);

/*2. Наполнить таблицу employee 70 строками.*/

insert into employees (employee_name)
values  ('Vladimir'),
		('Clara Poore'), 
		('Tammy Galindo'), 
		('Rickey Jones'), 
		('Jill Anspach'), 
		('Lacy Racicot'), 
		('David Macias'), 
		('Jessica Manns'), 
		('Amber Holcomb'), 
		('Betty Wells'), 
		('Miguel Fletcher'), 
		('Joseph Hodges'), 
		('Ida Bohannon'), 
		('Cindy Merrifield'), 
		('Mary Dowell'), 
		('Marie Thomas'), 
		('Donald Fierro'), 
		('Anna Wick'), 
		('Robert Harian'), 
		('Michael Mark'), 
		('Lucius Patterson'), 
		('Lorna Rose'), 
		('Karen Santiago'), 
		('Peggy Beachler'), 
		('Chester Baird'), 
		('Ronda Colley'), 
		('Robert Chapman'), 
		('Sandra Hibbard'), 
		('Steven Pagano'), 
		('Ramona Russell'), 
		('Ryan Morgan'), 
		('Shannon Daugherty'), 
		('Charlene Little'), 
		('Steve Lewandowski'), 
		('Donnie Shoemaker'), 
		('Veronica Treto'), 
		('Jonathon Belanger'), 
		('William Hughes'), 
		('Courtney Alston'), 
		('Isaac Walters'), 
		('Leon Ashcraft'), 
		('Daniel Patterson'), 
		('Randall Phillips'), 
		('James Williams'), 
		('Nancy Searles'), 
		('Edward Hilliard'), 
		('Joel Vandevelde'), 
		('Nancy Bravo'), 
		('Jesse Clark'), 
		('Gregory Magelssen'), 
		('Ella Cortez'), 
		('Michael Diaz'), 
		('Robert Walsh'), 
		('Valorie Seibert'), 
		('Yoshiko Miller'), 
		('Timothy Johnson'), 
		('Lita Webb'), 
		('Lindsay Barrera'), 
		('Jacqulyn Matthews'), 
		('Lee Rehart'), 
		('Fred Spencer'), 
		('Melinda Webster'), 
		('Shawn Pretti'), 
		('Betty Schaefer'), 
		('Barbara Teets'), 
		('Patricia Tomas'), 
		('Mattie Kelley'), 
		('Mary Yates'), 
		('Andrea Croes'), 
		('Amanda Riley');

/*3. Создать таблицу salary
- id. Serial  primary key,
- monthly_salary. Int, not null*/	

create table salary(
	id serial primary key,
	monthly_salary int not null
);

/*4. Наполнить таблицу salary 15 строками:
- 1000
- 1100
- 1200
- 1300
- 1400
- 1500
- 1600
- 1700
- 1800
- 1900
- 2000
- 2100
- 2200
- 2300
- 2400
- 2500
*/

insert into salary (monthly_salary)
values  (1000),
		(1100),
		(1200),
		(1300),
		(1400),
		(1500),
		(1600),
		(1700),
		(1800),
		(1900),
		(2000),
		(2100),
		(2200),
		(2300),
		(2400),
		(2500);
	
/*5. Создать таблицу employee_salary
- id. Serial  primary key,
- employee_id. Int, not null, unique
- salary_id. Int, not null
*/	
	
create table employee_salary(
	id serial  primary key,
	employee_id int not null unique,
	salary_id int not null
);	

/*6. Наполнить таблицу employee_salary 40 строками:
- в 10 строк из 40 вставить несуществующие employee_id
*/	

insert into employee_salary (employee_id, salary_id)
values (70, 16),
   	   (60, 14),
       (50, 12),
       (40, 10),
       (30, 8),
       (20, 6),
       (10, 4),
       (1, 2),
       (71, 1),
       (69, 3),
       (59, 5),
       (49, 7),
       (72, 9),
       (39, 11),
       (29, 13),
       (73, 15),
       (19, 16),
       (9, 1),
       (74, 2),
       (67, 3),
       (57, 4),
       (75, 5),
       (47, 6),
       (37, 7),
       (76, 8),
       (27, 9),
       (77, 10),
       (17, 11),
       (7, 12),
       (78, 13),
       (15, 14),
       (25, 15),
       (35, 16),
       (45, 10),
       (55, 5),
       (79, 15),
       (65, 1),
       (3, 11),
       (80, 12),
       (33, 16);

/*7. Создать таблицу roles
- id. Serial  primary key,
- role_name. int, not null, unique
*/	
create table roles(
	id serial primary key,
	role_name int not null unique
	);

/*8. Поменять тип столба role_name с int на varchar(30)*/	

alter table roles alter column role_name type varchar(30);

/*9. Наполнить таблицу roles 20 строками*/

insert into roles (role_name)
values ('Junior Python developer'),
		('Middle Python developer'),
		('Senior Python developer'),
		('Junior Java developer'),
		('Middle Java developer'),
		('Senior Java developer'),
		('Junior JavaScript developer'),
		('Middle JavaScript developer'),
		('Senior JavaScript developer'),
		('Junior Manual QA engineer'),
		('Middle Manual QA engineer'),
		('Senior Manual QA engineer'),
		('Project Manager'),
		('Designer'),
		('HR'),
		('CEO'),
		('Sales manager'),
		('Junior Automation QA engineer'),
		('Middle Automation QA engineer'),
		('Senior Automation QA engineer');

/*10. Создать таблицу roles_employee
- id. Serial  primary key,
- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
- role_id. Int, not null (внешний ключ для таблицы roles, поле id)
*/	
	
create table roles_employee(
	id serial primary key,
	employee_id Int not null unique,
	role_id Int not null,
		foreign key (employee_id)
			references employees(id),
		foreign key (role_id)
			references roles(id)
); 

/*11. Наполнить таблицу roles_employee 40 строками*/

insert into roles_employee(employee_id, role_id)
values (40, 1),
   	   (38, 3),
       (36, 5),
       (34, 7),
       (32, 9),
       (30, 11),
       (28, 13),
       (26, 15),
       (24, 17),
       (22, 19),
       (20, 20),
       (1, 18),
       (3, 16),
       (5, 14),
       (7, 12),
       (9, 10),
       (11, 8),
       (13, 6),
       (15, 4),
       (17, 2),
       (19, 1),
       (21, 2),
       (23, 3),
       (25, 4),
       (27, 5),
       (29, 6),
       (31, 7),
       (33, 8),
       (35, 9),
       (37, 10),
       (39, 11),
       (18, 12),
       (16, 13),
       (14, 14),
       (12, 15),
       (10, 16),
       (8, 17),
       (6, 18),
       (4, 19),
       (2, 20);
