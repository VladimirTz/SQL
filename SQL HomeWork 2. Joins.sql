/*Подключится к 
Host: 159.69.151.133
Port: 5056
DB: подключение к той таблице где делали DDL операции
User: подключение к тем пользователем каким делали DDL операции
Pass: 123*/


 /*1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.*/

select employee_name, monthly_salary
	from ((employee_salary as e_s inner join employees as e
	on e_s.employee_id = e.id) inner join salary as s
	on e_s.salary_id = s.id)
	order by monthly_salary;

 /*2. Вывести всех работников у которых ЗП меньше 2000.*/

select employee_name, monthly_salary
	from employees inner join salary
	on employees.id = salary.id
	where monthly_salary < 2000;

 /*3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)*/

select monthly_salary, employee_name
	from ((employee_salary as e_s left join employees as e
	on e_s.employee_id = e.id) left join salary as s 
	on e_s.salary_id = s.id) 
	where employee_name is null
	order by monthly_salary;

 /*4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)*/

select monthly_salary, employee_name
	from ((employee_salary as e_s left join employees as e
	on e_s.employee_id = e.id) left join salary as s 
	on e_s.salary_id = s.id) 
	where employee_name is null and monthly_salary < 2000;

 /*5. Найти всех работников кому не начислена ЗП.*/

select employee_name, monthly_salary
	from employees as e left join salary as s
	on e.id = s.id
	where monthly_salary is null;

 /*6. Вывести всех работников с названиями их должности.*/

select employee_name, role_name
	from ((roles_employee as r_e inner join roles as r
	on r_e.role_id =r.id) inner join employees as e
	on r_e.employee_id = e.id);

 /*7. Вывести имена и должность только Java разработчиков.*/

select employee_name, role_name
	from ((roles_employee as r_e inner join roles as r
	on r_e.role_id =r.id) inner join employees as e
	on r_e.employee_id = e.id)
	where role_name like '% Java developer'; /* or (where role_name like '%Java%'); */

 /*8. Вывести имена и должность только Python разработчиков.*/

select employee_name, role_name
	from ((roles_employee as r_e inner join roles as r
	on r_e.role_id =r.id) inner join employees as e
	on r_e.employee_id = e.id)
	where role_name like '%Python%';

 /*9. Вывести имена и должность всех QA инженеров.*/

select employee_name, role_name
	from ((roles_employee as r_e inner join roles as r
	on r_e.role_id =r.id) inner join employees as e
	on r_e.employee_id = e.id)
	where role_name like '%QA%';

 /*10. Вывести имена и должность ручных QA инженеров.*/

select employee_name, role_name
	from ((roles_employee as r_e inner join roles as r
	on r_e.role_id =r.id) inner join employees as e
	on r_e.employee_id = e.id)
	where role_name like '%Manual QA%';

 /*11. Вывести имена и должность автоматизаторов QA*/

select employee_name, role_name
	from ((roles_employee as r_e inner join roles as r
	on r_e.role_id =r.id) inner join employees as e
	on r_e.employee_id = e.id)
	where role_name like '%Automation QA%';

 /*12. Вывести имена и зарплаты Junior специалистов*/

select employee_name,  monthly_salary
	from ((((roles_employee as r_e left join roles as r
	on r_e.role_id =r.id) left join employees as e
	on r_e.employee_id = e.id) left join employee_salary as e_s /* or: full join employee_salary as e_s */
	on e_s.employee_id = e.id) left join salary as s            /* or: full join salary as s */
	on e_s.salary_id = s.id)
	where role_name like 'Junior %'
	order by monthly_salary;

 /*13. Вывести имена и зарплаты Middle специалистов*/

select employee_name,  monthly_salary
	from ((((roles_employee as r_e left join roles as r
	on r_e.role_id =r.id) left join employees as e
	on r_e.employee_id = e.id) left join employee_salary as e_s /* or: full join employee_salary as e_s */   
	on e_s.employee_id = e.id) left join salary as s            /* or: full join salary as s */
	on e_s.salary_id = s.id)
	where role_name like 'Middle %'
	order by monthly_salary;

 /*14. Вывести имена и зарплаты Senior специалистов*/

select employee_name,  monthly_salary
	from ((((roles_employee as r_e left join roles as r
	on r_e.role_id =r.id) left join employees as e
	on r_e.employee_id = e.id) left join employee_salary as e_s /* or: full join employee_salary as e_s */
	on e_s.employee_id = e.id) left join salary as s            /* or: full join salary as s */
	on e_s.salary_id = s.id)
	where role_name like 'Senior %'
	order by monthly_salary;

 /*15. Вывести зарплаты Java разработчиков*/

select monthly_salary, role_name
	from (((roles_employee as r_e left join roles as r
	on r_e.role_id =r.id) left join employee_salary as e_s      /* or: full join employee_salary as e_s */
	on r_e.employee_id = e_s.employee_id) left join salary as s /* or: full join salary as s */
	on e_s.salary_id = s.id)
	where role_name like '% Java developer'
	order by monthly_salary;

 /*16. Вывести зарплаты Python разработчиков*/

select monthly_salary, role_name
	from (((roles_employee as r_e left join roles as r
	on r_e.role_id =r.id) left join employee_salary as e_s      /* or: full join employee_salary as e_s */
	on r_e.employee_id = e_s.employee_id) left join salary as s /* or: full join salary as s */
	on e_s.salary_id = s.id)
	where role_name like '% Python developer'
	order by monthly_salary;

 /*17. Вывести имена и зарплаты Junior Python разработчиков*/

select employee_name, monthly_salary, role_name
	from ((((roles_employee as r_e full join roles as r         /* or: inner/left join roles as r */
	on r_e.role_id =r.id) full join employees as e              /* or: inner/left join employees as e */
	on r_e.employee_id = e.id) full join employee_salary as e_s /* or: inner/left join employee_salary as e_s */
	on e_s.employee_id = e.id) full join salary as s            /* or: inner/left join salary as s */
	on e_s.salary_id = s.id)
	where role_name like 'Junior Python developer'
	order by monthly_salary;

 /*18. Вывести имена и зарплаты Middle JS разработчиков*/

select employee_name, monthly_salary, role_name
	from ((((roles_employee as r_e full join roles as r         /* or: inner/left join roles as r */
	on r_e.role_id =r.id) full join employees as e              /* or: inner/left join employees as e */
	on r_e.employee_id = e.id) full join employee_salary as e_s /* or: inner/left join employee_salary as e_s */
	on e_s.employee_id = e.id) full join salary as s            /* or: inner/left join salary as s */
	on e_s.salary_id = s.id)
	where role_name like 'Middle JavaScript developer'
	order by monthly_salary;

 /*19. Вывести имена и зарплаты Senior Java разработчиков*/

select employee_name, monthly_salary, role_name
	from ((((roles_employee as r_e full join roles as r         /* or: inner/left join roles as r */
	on r_e.role_id =r.id) full join employees as e              /* or: inner/left join employees as e */
	on r_e.employee_id = e.id) full join employee_salary as e_s /* or: inner/left join employee_salary as e_s */
	on e_s.employee_id = e.id) full join salary as s            /* or: inner/left join salary as s */
	on e_s.salary_id = s.id)
	where role_name like 'Senior Java developer'
	order by monthly_salary;

 /*20. Вывести зарплаты Junior QA инженеров*/

select monthly_salary, role_name
	from (((roles_employee as r_e left join roles as r
	on r_e.role_id =r.id) left join employee_salary as e_s      /* or: full join employee_salary as e_s */
	on r_e.employee_id = e_s.employee_id) left join salary as s /* or: full join salary as s */
	on e_s.salary_id = s.id)
	where role_name like 'Junior % QA engineer'
	order by monthly_salary;

 /*21. Вывести среднюю зарплату всех Junior специалистов*/

select avg(monthly_salary) as avg_monthly_salary_junior
	from (((roles_employee as r_e left join roles as r
	on r_e.role_id =r.id) left join employee_salary as e_s      /* or: full join employee_salary as e_s */
	on r_e.employee_id = e_s.employee_id) left join salary as s /* or: full join salary as s */
	on e_s.salary_id = s.id)
	where role_name like 'Junior%';

 /*22. Вывести сумму зарплат JS разработчиков*/

select sum(monthly_salary) as sum_monthly_salary_JavaScript_developer
	from (((roles_employee as r_e left join roles as r
	on r_e.role_id =r.id) left join employee_salary as e_s      /* or: full join employee_salary as e_s */
	on r_e.employee_id = e_s.employee_id) left join salary as s /* or: full join salary as s */
	on e_s.salary_id = s.id)
	where role_name like '%JavaScript developer';

 /*23. Вывести минимальную ЗП QA инженеров*/

select min(monthly_salary)
	from (((roles_employee as r_e left join roles as r
	on r_e.role_id =r.id) left join employee_salary as e_s      /* or: full join employee_salary as e_s */
	on r_e.employee_id = e_s.employee_id) left join salary as s /* or: full join salary as s */
	on e_s.salary_id = s.id)
	where role_name like '%QA engineer';

 /*24. Вывести максимальную ЗП QA инженеров*/

select max(monthly_salary)
	from (((roles_employee as r_e left join roles as r
	on r_e.role_id =r.id) left join employee_salary as e_s      /* or: full join employee_salary as e_s */
	on r_e.employee_id = e_s.employee_id) left join salary as s /* or: full join salary as s */
	on e_s.salary_id = s.id)
	where role_name like '%QA engineer';

 /*25. Вывести количество QA инженеров*/

select count(role_name) as quantity_QA_engineer
	from roles_employee as r_e left join roles as r
	on r_e.role_id =r.id
	where role_name like '%QA engineer';

 /*26. Вывести количество Middle специалистов.*/

select count(role_name) as quantity_Middle
	from roles_employee as r_e left join roles as r
	on r_e.role_id =r.id
	where role_name like 'Middle%';

 /*27. Вывести количество разработчиков*/

select count(role_name) as quantity_developer
	from roles_employee as r_e left join roles as r
	on r_e.role_id =r.id
	where role_name like '%developer';

 /*28. Вывести фонд (сумму) зарплаты разработчиков.*/

select sum(monthly_salary) as sum_developer
	from (((roles_employee as r_e left join roles as r
	on r_e.role_id =r.id) left join employee_salary as e_s      
	on r_e.employee_id = e_s.employee_id) left join salary as s 
	on e_s.salary_id = s.id)
	where role_name like '%developer';

 /*29. Вывести имена, должности и ЗП всех специалистов по возрастанию*/

select employee_name, monthly_salary, role_name
	from ((((roles_employee as r_e left join roles as r         
	on r_e.role_id =r.id) right join employees as e              
	on r_e.employee_id = e.id) left join employee_salary as e_s 
	on e_s.employee_id = e.id) left join salary as s            
	on e_s.salary_id = s.id)
	order by monthly_salary;

 /*30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300*/

select employee_name, monthly_salary, role_name
	from ((((roles_employee as r_e left join roles as r         
	on r_e.role_id =r.id) right join employees as e              
	on r_e.employee_id = e.id) left join employee_salary as e_s 
	on e_s.employee_id = e.id) left join salary as s            
	on e_s.salary_id = s.id)
	where monthly_salary BETWEEN 1700 AND 2300
	order by monthly_salary;


 /*31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300*/

select employee_name, monthly_salary, role_name
	from ((((roles_employee as r_e left join roles as r         
	on r_e.role_id =r.id) right join employees as e              
	on r_e.employee_id = e.id) left join employee_salary as e_s 
	on e_s.employee_id = e.id) left join salary as s            
	on e_s.salary_id = s.id)
	where monthly_salary < 2300
	order by monthly_salary;

 /*32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000*/ 

select employee_name, monthly_salary, role_name
	from ((((roles_employee as r_e left join roles as r         
	on r_e.role_id =r.id) right join employees as e              
	on r_e.employee_id = e.id) left join employee_salary as e_s 
	on e_s.employee_id = e.id) left join salary as s            
	on e_s.salary_id = s.id)
	where monthly_salary in (1100, 1500, 2000)
	order by monthly_salary;