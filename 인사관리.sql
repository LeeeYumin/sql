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

select employee_id, last_name, department_id
from employees
where lower(last_name) = 'higgins'; --��ҹ��� �𸦶�

select last_name, substr(last_name, 2, 2)
from employees
where department_id=90; --������ġ2, ��߶���2

select last_name, substr(last_name, -3, 2) 
from employees
where department_id=90; --�ڿ�������-3, ��߶���2

select  employee_id, concat(first_name, last_name) name, 
job_id, length (last_name),
instr (last_name, 'a') "Contains 'a'?"
from employees
where substr(job_id, 4) = 'REP'; 

select ltrim ('yyedaymy', 'yea')
from dual;

select rtrim ('yyedaymy', 'yea')
from dual;

--�����Լ�
select round(345.678) as round1,
round (345.678, 0) as  round2,
round (345.678, 1) as  round3,
round (345.678, -1) as  round4
from dual; --�ø�
 
 select trunc(345.678) as trunc1,
trunc(345.678, 0) as  trunc2,
trunc(345.678, 1) as  trunc3,
trunc (345.678, -1) as  trunc4
from dual; --����

select last_name, salary,mod(salary, 5000)
from employees; 

--���� 4��
--���� ��¥�� ǥ���ϴ� ���Ǹ� �ۼ��ϰ� �� ���̺��� Date�� ����
select sysdate "Date"
from dual;

--�� ����� ���� ��� ��ȣ, �̸�, �޿� �� 15% �λ�� �޿��� "������ ǥ��"
--�λ�� �޿� ���� ���̺��� New Salary�� ����
select employee_id, last_name, salary, round(salary*1.15) "New Salary"
from employees;

--2�� ���Ǹ� �����Ͽ� �� �޿����� ���� �޿��� ���� �� ���� �߰�
--���̺��� Increase�� �����ϰ� ������ ���Ǹ� ����
SELECT employee_id, last_name, salary, 
                    ROUND(salary*1.15) "New Salary",
                    (salary*1.15)-salary "Increase"
FROM   employees;

--�̸��� J, A �Ǵ� M���� �����ϴ� ��� ����� �̸�(�빮�� ǥ��) �� �̸� ���̸� ǥ���ϴ� ���Ǹ� �ۼ�
--������ ������ ���̺��� ����
SELECT UPPER(last_name) name, 
                    LENGTH(last_name) name_length
FROM   employees
WHERE  UPPER(SUBSTR(last_name, 1, 1)) IN ('J', 'A', 'M')
ORDER BY 1;

--�ð�
select sysdate
from dual;

select last_name, (sysdate-hire_date)/7 as weeks
from employees
where department_id = 90; --�̱��� �ֱ����� �༭ 7�� ����

--��¥
select employee_id, hire_date, months_between (sysdate,  hire_date) tenure,
           add_months (hire_date, 6) review,
           next_day (hire_date, '��'),
           last_day (hire_date)
from employees; --Ȯ��

select round( sysdate, 'year'),
            round( sysdate, 'month'),
            round( sysdate, 'day'),
            round( sysdate, 'dd')
from dual; --day�� �߰��� ������. �ð��� ����.

select trunc( sysdate, 'year'),
            trunc( sysdate, 'month'),
            trunc( sysdate, 'day'),
            trunc( sysdate, 'dd')
from dual;

--��ȯ�Լ�
select *
from employees
where employee_id = '101'; --���¸� ������ �Ͻ�����ȯ��

alter session set
nls_date_language = american; --���� Ű�� ���󺹱���

select employee_id, to_char(hire_date, 'MM/YY')
from employees; --yy/mm/dd�� mm/yy��

select last_name, to_char(hire_date, 'DD Month YYYY')
from employees; --���� nls_date_language = american �س��� June ���� ��

select last_name, to_char(hire_date, 'DD month YYYY')
from employees;

select last_name, to_char(hire_date, 'DD MONTH YYYY')
from employees;

select last_name, to_char(hire_date, 'fmDD MONTH YYYY')
from employees; --fm������ ��������� 0����

select last_name, to_char(hire_date, 'fmDdspth "of" Month YYYY fmHH:MI:SS AM')
from employees; --AM��� PM�� ����

select to_char(salary, '$99,999.00') SALARY
from employees;

select to_char(salary, '$9,999.00') SALARY
from employees; --�ڸ��� �Ѿ ���� #�� ǥ���

--���ڡ����
select to_number('$3,400', '$99,999')
from dual;

--���ڡ泯¥
select to_date('2010��, 02��', 'YYYY"��", MM"��"')
from dual;

select last_name, hire_date
from employees
where hire_date > to_date('2005�� 07�� 01��', 'YYYY"��" MM"��" DD"��"'); --�ý��� ��¥ ������ �𸦶� ���� ����.

select last_name, hire_date
from employees
where hire_date > to_date('05/07/01', 'YY-MM-DD'); --���� ���� ���.

select last_name, hire_date
from employees
where hire_date > to_date('05/07/01', 'fxYY-MM-DD'); --����ȵ�.

select last_name, hire_date
from employees
where hire_date > to_date('05/07/01', 'fxYY/MM/DD'); --�����.

--�Ϲ��Լ�
select last_name, salary, NVL(commission_pct, 0), (salary*12) + (salary*12*NVL (commission_pct,0)) AN_SAL
from employees;

select last_name, salary, NVL(commission_pct, '���ʽ� ����')
from employees; --���� Ÿ�� ���� �Ƚ��Ѽ� ������

select last_name, salary, NVL(to_char(commission_pct), '���ʽ� ����')
from employees; --Ÿ�� ���� �����༭ �� ��

select last_name, salary, commission_pct, NVL2(commission_pct, 'SAL+COMM', 'SAL') income
from employees; --'SAL+COMM', 'SAL' 2�� ��ġ�� ���� Ÿ�� ���ƾ� ��

select first_name, length(first_name) "expr1", last_name, length(last_name) "expr2",
          nullif (length(first_name), length(last_name)) result
from employees;

--����ó��
select last_name, job_id, salary,
          CASE job_id WHEN 'IT_PROG'    THEN 1.10*salary
                                WHEN 'ST_CLERK' THEN 1.15*salary
                                WHEN 'SA_REP'      THEN 1.20*salary
                                ELSE salary
           END "REVISE_SALARY"
from employees; --�鿩���������ֱ�

select last_name, salary,
          CASE WHEN salary<5000 THEN 'Low'
                     WHEN salary<10000 THEN 'Medium'
                     WHEN salary<20000 THEN 'Good'
                                                       ELSE  'Excellent'
           END qualified_salary
from employees; --���������� ���Ҷ��� ���������� �����ֱ�  

select last_name, job_id, salary,
          DECODE(job_id,  'IT_PROG',    1.10*salary,
                                       'ST_CLERK', 1.15*salary,
                                       'SA_REP',      1.20*salary,
                                                              salary)
        REVISED_SALARY
from employees;   

--����Ǯ�� 03,04
--�� ����� �̸��� ǥ���ϰ� �ٹ� �� ��(�Ի��Ϸκ��� ��������� �� ��)�� ����Ͽ�
--�� ���̺��� MONTHS_WORKED�� ����. ����� ������ �ݿø��Ͽ� ǥ��. (��¥�Լ����)
select last_name, round(months_between (sysdate,  hire_date) tenure)/12, "MONTHS_WORKED",
from employees;


--��� ����� �� �� �޿��� ǥ���ϱ� ���� query�� �ۼ�.
--�޿��� 15�� ���̷� ǥ�õǰ� ���ʿ� # ��ȣ�� ä�������� ������ ����.
--�� ���̺��� SALARY �� ����. (�����Լ����)
select last_name, salary "SALARY",
from employees




--�μ� 90�� ��� ����� ���� ��(last_name) �� ���� �Ⱓ(�� ����)�� ǥ���ϵ��� query �� �ۼ�.
--�ָ� ��Ÿ���� ���� ���� ���̺�� TENURE�� �����ϰ� �ָ� ��Ÿ���� ���� ���� ������ ��Ÿ����. (��¥����)




--�� ����� ���� ���� �׸��� �����ϴ� ���Ǹ� �ۼ��ϰ� �� ���̺��� Dream Salaries�� �����Ͻÿ�.
--<employee last_name> earns <salary> monthly but wants <salary�� 3��>. 
--<����> Matos earns $2,600.00 monthly but wants $7,800.00. (��ȯ�Լ�, ���Ῥ����)



--����� �̸�, �Ի��� �� �޿� �������� ǥ��. �޿� �������� ���� ���� ����� �� ù��° ������.
--�� ���̺��� REVIEW�� �����ϰ� ��¥�� "2010.03.31 ������"�� ���� �������� ǥ�õǵ��� �����Ͻÿ�. (��¥�Լ�)


--�̸�, �Ի��� �� ���� ���� ������ ǥ���ϰ� �� ���̺��� DAY�� ����. �������� �������� �ؼ� ������ �������� ����� ����.(���)


--����� �̸��� Ŀ�̼��� ǥ���ϴ� ���Ǹ� �ۼ�. Ŀ�̼��� ���� �ʴ� ����� ��� ��No Commission���� ǥ��.  (NVL�Լ�)
--�� ���̺��� COMM���� ����.


--DECODE �Լ��� CASE ������ ����Ͽ� ���� �����Ϳ� ���� JOB_ID ���� ���� �������� ��� ����� ����� ǥ���ϴ� ���Ǹ� �ۼ�.
--
