DESC departments;

select *
from departments; --주석

select *
from employees;

select department_id, location_id
from departments;

select location_id, department_id
from departments; --select절에 쓴 순서대로 가져옴

select department_id, department_id
from departments; --중복되더라도 둘 다 값 가져옴

select last_name, hire_date, salary
from employees;

select last_name, salary, salary+300
from employees;

select last_name, salary, 12*salary+100
from employees;

select last_name, salary, 12*(salary+100)
from employees; --select에 산술문 쓸수있다

select last_name, job_id, salary, commission_pct
from employees;

select last_name, 12*salary*commission_pct
from employees; --null값결과

select last_name, 12*salary*nvl(commission_pct, 1)
from employees; --NVL은 함수임

select last_name AS name, commission_pct comm
from employees;

select last_name "name", salary*12 "Annual Salary"
from employees; --큰따옴표 대소문자 그대로 뜸

select last_name AS 이름, commission_pct 보너스
from employees; --한글인식됨

select last_name || job_id AS "Employees"
from employees; --연결연산자

select last_name || ' is a ' || job_id
         as "Employee Details"
from employees; 

select department_id
from employees;

select distinct department_id
from employees;

select distinct department_id, job_id
from employees;

--실습 5문제
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

select job_id || ' , ' || last_name "Employee and Title" --연결한 다음 쉼표 및 공백으로 구분하기 위해 ' , '
from employees;


--데이터 제한 및 정렬
select employee_id, last_name, job_id, department_id --3번 이걸보겠다는 말
from employees --해석순서 1번 테이블에서
where department_id = 90; --2번 조건?

select last_name, job_id, department_id
from  employees
where last_name = 'Whalen'; --소문자w로 바꿔서 조회하면 안나옴. 대소문자 구분한다!

select last_name
from  employees
where hire_date = '05/10/10'; --날짜형식맞춰주기

select last_name, salary
from  employees
where salary <=3000;

select last_name, hire_date
from  employees
where hire_date < '05/01/01'; --2005년이전입사 <= '04/12/31' 도 가능

select last_name, salary
from  employees
where salary between 2500 and 3500;

select last_name, salary
from  employees
where salary between 3500 and 2500; --오류는안뜸

select employee_id, last_name, salary, manager_id
from  employees
where manager_id in (100, 101, 201); --( ) 안에 or 인것...

select first_name
from  employees
where first_name like 'S%';

select last_name
from  employees
where last_name like '%s';  --소문자s로 끝나는사람

select last_name, hire_date
from  employees
where hire_date like '05%';

select last_name
from  employees
where last_name like '_o%';

select employee_id, last_name, job_id
from  employees
where job_id like '%SA_%'; --'SA_'가 들어있는

select employee_id, last_name, job_id
from  employees
where job_id like '%SA3_%' escape '3'; --_(언더바) 앞에 있는 문자를 인식시켜서 제외시키겠다는 의미. | 대신 3이나 다른 문자도 적용됨. 다 출력됨....

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
or job_id like '%MAN%'; --and가 or보다 우선순위 높음

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

--문제풀이 10문제
--급여가 12,000를 넘는 사원의 이름과 급여를 표시하는 질의를 실행
select last_name, salary
from employees
where salary >12000;

--사원 번호가 176인 사원의 이름과 부서 번호를 표시하는 질의를 실행
select last_name, department_id
from employees
where employee_id = 176;  --in (176) 도 가능

--급여가 5,000에서 12,000 사이에 포함되지 않는  모든 사원의 이름과 급여를 표시하도록 질의를 실행
select last_name, salary
from employees
where salary not between 5000 and 12000;

--급여가 5,000와 12,000 사이이고 부서 번호가 20 또는 50인 사원의 이름과 급여를 나열하도록 질의를 작성
--열 레이블은 Employee와 Monthly Salary로 각각 지정
select last_name "Employee", salary "Monthly Salary"
from employees
where salary between 5000 and 12000
             and department_id in (20, 50);

--2005년에 입사한 모든 사원의 이름과 입사일을 표시
select last_name, hire_date
from employees
where hire_date  like '05%'; -- hire_date between '05/01/01' and '05/12/31'; 도 가능

--관리자가 없는 모든 사원의 이름과 업무를 표시
select last_name, job_id
from employees
where manager_id is null;

--이름의 세번째 문자가 a인 모든 사원의 이름을 표시
select last_name
from employees
where last_name like '__a%';

--이름에 a와 e가 있는 모든 사원의 이름을 표시
select last_name
from employees
where last_name like '%a%'
     and last_name like '%e%';

--업무가 영업 사원(SA_REP) 또는 사무원(ST_CLERK)이면서 
--급여가 2,500, 3,500, 7,000이 아닌 모든 사원의 이름, 업무 및 급여를 표시
select last_name, job_id, salary
from employees
where job_id in  ( 'SA_REP', 'ST_CLERK')
    and salary not in(2500, 3500, 7000);

--커미션 비율(commission_pct)이 20%인 모든 사원의 이름, 급여 및 커미션을 표시하도록  명령문을 작성하여 실행
select last_name, salary, commission_pct
from employees
where commission_pct = 0.2; 

--12.08
select last_name, job_id, department_id, hire_date
from employees
order by hire_date desc; --내림차순정렬됨

select employee_id, last_name, salary*12 annsal
from employees
order by  annsal; --????오류

select last_name, job_id, department_id, hire_date
from employees
order by 3; 

select last_name, department_id, salary
from employees
order by department_id, salary DESC; --department_id는 오름차순, salary는 내림차순

select employee_id, salary
from employees
order by hire_date; 

--치환변수(중복되는 값 계속 입력 안할 수 있게)
select  employee_id, last_name,  salary, department_id
from employees
where employee_id = &employee_num; --단일&% 101입력실습

select  employee_id, last_name,  salary, department_id
from employees
where employee_id = &employee_num; --단일&% 102입력실습

select employee_id, last_name, job_id, &column_name
from employees
where &condition
order by &order_column ;

select employee_id, last_name, job_id, &&column_name
from employees
order by &column_name ; --더블&% (영구적으로 계속 사용하고자 할때 사용)

select employee_id, salary
from employees
order by &column_name ;

undefine &column_name;


--집합 연산자
select * from job_history;

select employee_id
from employees
union
select employee_id
from job_history; --107개 조회

select employee_id, job_id, department_id
from employees
union all 
select employee_id, job_id, department_id
from job_history
order by employee_id; --117개 조회

select employee_id, job_id
from employees
intersect
select employee_id, job_id
from job_history; --2개 조회

select employee_id, job_id
from  job_history
intersect
select employee_id, job_id
from employees; --2개 똑같이 조회

select employee_id, job_id
from  employees
minus
select employee_id, job_id
from job_history; --105개조회

select employee_id, job_id
from  job_history
minus
select employee_id, job_id
from employees; --8개 조회

--문자함수
desc dual;

select *
from dual;

select sysdate
from dual;

select 'The Job id for ' || UPPER(last_name) || ' is ' || lower(job_id) as "EMPLOYEE DETAILS"
from employees;
