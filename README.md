# SQL
____________________________________________________________________________________________________________________________________________
## SQL_DDL
### Первая часть.

**Таблица employees**
1. Создать таблицу employees
- id. serial,  primary key,
- employee_name. Varchar(50), not null
2. Наполнить таблицу employee 70 строками.

**Таблица salary**
3. Создать таблицу salary
- id. Serial  primary key,
- monthly_salary. Int, not null
4. Наполнить таблицу salary 15 строками:

**Таблица employee_salary**

5. Создать таблицу employee_salary
- id. Serial  primary key,
- employee_id. Int, not null, unique
- salary_id. Int, not null
6. Наполнить таблицу employee_salary 40 строками:
- в 10 строк из 40 вставить несуществующие employee_id

**Таблица roles**
7. Создать таблицу roles
- id. Serial  primary key,
- role_name. int, not null, unique
8. Поменять тип столба role_name с int на varchar(30)
9. Наполнить таблицу roles 20 строками:

**Таблица roles_employee**
10. Создать таблицу roles_employee
- id. Serial  primary key,
- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
- role_id. Int, not null (внешний ключ для таблицы roles, поле id)
11. Наполнить таблицу roles_employee 40 строками:

____________________________________________________________________________________________________________________________________________
 **Решение не менее 15 задач на сайте https://www.sql-ex.ru/register.php --- [Решение](https://github.com/VladimirTz/SQL/blob/main/sql-ex)**
