DESC departments;

select *
from departments; --�ּ�

select *
from employees;

select department_id, location_id
from departments;

select location_id, department_id
from departments; --select���� �� ������� ������

select department_id, department_id
from departments; --�ߺ��Ǵ��� �� �� �� ������

select last_name, hire_date, salary
from employees;

select last_name, salary, salary+300
from employees;

select last_name, salary, 12*salary+100
from employees;

select last_name, salary, 12*(salary+100)
from employees; --select�� ����� �����ִ�

select last_name, job_id, salary, commission_pct
from employees;

select last_name, 12*salary*commission_pct
from employees; --null�����

select last_name, 12*salary*nvl(commission_pct, 1)
from employees; --NVL�� �Լ���

select last_name AS name, commission_pct comm
from employees;

select last_name "name", salary*12 "Annual Salary"
from employees; --ū����ǥ ��ҹ��� �״�� ��

select last_name AS �̸�, commission_pct ���ʽ�
from employees; --�ѱ��νĵ�

select last_name || job_id AS "Employees"
from employees; --���Ῥ����

select last_name || ' is a ' || job_id
         as "Employee Details"
from employees; 

select department_id
from employees;

select distinct department_id
from employees;

select distinct department_id, job_id
from employees;

--�ǽ� 5����
DESC departments;
select *
from departments;

DESC employees;
select employee_id, last_name, job_id, hire_date AS startdate
from employees;

select distinct job_id
from employees;

select department_id "Emp #", last_name "Employee", job_id "Job", hire_date "Hire Date"
from employees;

select job_id || ' , ' || last_name "Employee and Title" --������ ���� ��ǥ �� �������� �����ϱ� ���� ' , '
from employees;


--������ ���� �� ����
select employee_id, last_name, job_id, department_id --3�� �̰ɺ��ڴٴ� ��
from employees --�ؼ����� 1�� ���̺���
where department_id = 90; --2�� ����?

select last_name, job_id, department_id
from  employees
where last_name = 'Whalen'; --�ҹ���w�� �ٲ㼭 ��ȸ�ϸ� �ȳ���. ��ҹ��� �����Ѵ�!

select last_name
from  employees
where hire_date = '05/10/10'; --��¥���ĸ����ֱ�

select last_name, salary
from  employees
where salary <=3000;

select last_name, hire_date
from  employees
where hire_date < '05/01/01'; --2005�������Ի� <= '04/12/31' �� ����

select last_name, salary
from  employees
where salary between 2500 and 3500;

select last_name, salary
from  employees
where salary between 3500 and 2500; --�����¾ȶ�

select employee_id, last_name, salary, manager_id
from  employees
where manager_id in (100, 101, 201); --( ) �ȿ� or �ΰ�...

select first_name
from  employees
where first_name like 'S%';

select last_name
from  employees
where last_name like '%s';  --�ҹ���s�� �����»��

select last_name, hire_date
from  employees
where hire_date like '05%';

select last_name
from  employees
where last_name like '_o%';

select employee_id, last_name, job_id
from  employees
where job_id like '%SA_%'; --'SA_'�� ����ִ�

select employee_id, last_name, job_id
from  employees
where job_id like '%SA3_%' escape '3'; --_(�����) �տ� �ִ� ���ڸ� �νĽ��Ѽ� ���ܽ�Ű�ڴٴ� �ǹ�. | ��� 3�̳� �ٸ� ���ڵ� �����. �� ��µ�....

select employee_id, last_name, job_id
from  employees
where job_id like '%_M%';

select employee_id, last_name, job_id
from  employees
where job_id like '%\_M%' escape '\';

select *
from employees
where commission_pct is null;

select employee_id, last_name, job_id, salary
from employees
where salary >= 10000
and job_id like '%MAN%';

select employee_id, last_name, job_id, salary
from employees
where salary >= 10000
or job_id like '%MAN%'; --and�� or���� �켱���� ����

select last_name, job_id
from employees
where job_id not in ('IT_PROG', 'ST_CLERK','SA_REP');

select last_name, job_id, salary
from employees
where job_id = 'SA_REP'
or job_id = 'AD_PRES'
and salary > 15000;

select last_name, job_id, salary
from employees
where (job_id = 'SA_REP'
or job_id = 'AD_PRES')
and salary > 15000;

--����Ǯ�� 10����
--�޿��� 12,000�� �Ѵ� ����� �̸��� �޿��� ǥ���ϴ� ���Ǹ� ����
select last_name, salary
from employees
where salary >12000;

--��� ��ȣ�� 176�� ����� �̸��� �μ� ��ȣ�� ǥ���ϴ� ���Ǹ� ����
select last_name, department_id
from employees
where employee_id = 176;  --in (176) �� ����

--�޿��� 5,000���� 12,000 ���̿� ���Ե��� �ʴ�  ��� ����� �̸��� �޿��� ǥ���ϵ��� ���Ǹ� ����
select last_name, salary
from employees
where salary not between 5000 and 12000;

--�޿��� 5,000�� 12,000 �����̰� �μ� ��ȣ�� 20 �Ǵ� 50�� ����� �̸��� �޿��� �����ϵ��� ���Ǹ� �ۼ�
--�� ���̺��� Employee�� Monthly Salary�� ���� ����
select last_name "Employee", salary "Monthly Salary"
from employees
where salary between 5000 and 12000
             and department_id in (20, 50);

--2005�⿡ �Ի��� ��� ����� �̸��� �Ի����� ǥ��
select last_name, hire_date
from employees
where hire_date  like '05%'; -- hire_date between '05/01/01' and '05/12/31'; �� ����

--�����ڰ� ���� ��� ����� �̸��� ������ ǥ��
select last_name, job_id
from employees
where manager_id is null;

--�̸��� ����° ���ڰ� a�� ��� ����� �̸��� ǥ��
select last_name
from employees
where last_name like '__a%';

--�̸��� a�� e�� �ִ� ��� ����� �̸��� ǥ��
select last_name
from employees
where last_name like '%a%'
     and last_name like '%e%';

--������ ���� ���(SA_REP) �Ǵ� �繫��(ST_CLERK)�̸鼭 
--�޿��� 2,500, 3,500, 7,000�� �ƴ� ��� ����� �̸�, ���� �� �޿��� ǥ��
select last_name, job_id, salary
from employees
where job_id in  ( 'SA_REP', 'ST_CLERK')
    and salary not in(2500, 3500, 7000);

--Ŀ�̼� ����(commission_pct)�� 20%�� ��� ����� �̸�, �޿� �� Ŀ�̼��� ǥ���ϵ���  ��ɹ��� �ۼ��Ͽ� ����
select last_name, salary, commission_pct
from employees
where commission_pct = 0.2; 

--12.08
select last_name, job_id, department_id, hire_date
from employees
order by hire_date desc; --�����������ĵ�

select employee_id, last_name, salary*12 annsal
from employees
order by  annsal; --????����

select last_name, job_id, department_id, hire_date
from employees
order by 3; 

select last_name, department_id, salary
from employees
order by department_id, salary DESC; --department_id�� ��������, salary�� ��������

select employee_id, salary
from employees
order by hire_date; 

--ġȯ����(�ߺ��Ǵ� �� ��� �Է� ���� �� �ְ�)
select  employee_id, last_name,  salary, department_id
from employees
where employee_id = &employee_num; --����&% 101�Է½ǽ�

select  employee_id, last_name,  salary, department_id
from employees
where employee_id = &employee_num; --����&% 102�Է½ǽ�

select employee_id, last_name, job_id, &column_name
from employees
where &condition
order by &order_column ;

select employee_id, last_name, job_id, &&column_name
from employees
order by &column_name ; --����&% (���������� ��� ����ϰ��� �Ҷ� ���)

select employee_id, salary
from employees
order by &column_name ;

undefine &column_name;


--���� ������
select * from job_history;

select employee_id
from employees
union
select employee_id
from job_history; --107�� ��ȸ

select employee_id, job_id, department_id
from employees
union all 
select employee_id, job_id, department_id
from job_history
order by employee_id; --117�� ��ȸ

select employee_id, job_id
from employees
intersect
select employee_id, job_id
from job_history; --2�� ��ȸ

select employee_id, job_id
from  job_history
intersect
select employee_id, job_id
from employees; --2�� �Ȱ��� ��ȸ

select employee_id, job_id
from  employees
minus
select employee_id, job_id
from job_history; --105����ȸ

select employee_id, job_id
from  job_history
minus
select employee_id, job_id
from employees; --8�� ��ȸ

--�����Լ�
desc dual;

select *
from dual;

select sysdate
from dual;

select 'The Job id for ' || UPPER(last_name) || ' is ' || lower(job_id) as "EMPLOYEE DETAILS"
from employees;
