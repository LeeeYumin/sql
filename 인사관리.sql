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

select employee_id, last_name, department_id
from employees
where lower(last_name) = 'higgins'; --대소문자 모를때

select last_name, substr(last_name, 2, 2)
from employees
where department_id=90; --시작위치2, 몇개잘라낼지2

select last_name, substr(last_name, -3, 2) 
from employees
where department_id=90; --뒤에서부터-3, 몇개잘라낼지2

select  employee_id, concat(first_name, last_name) name, 
job_id, length (last_name),
instr (last_name, 'a') "Contains 'a'?"
from employees
where substr(job_id, 4) = 'REP'; 

select ltrim ('yyedaymy', 'yea')
from dual;

select rtrim ('yyedaymy', 'yea')
from dual;

--숫자함수
select round(345.678) as round1,
round (345.678, 0) as  round2,
round (345.678, 1) as  round3,
round (345.678, -1) as  round4
from dual; --올림
 
 select trunc(345.678) as trunc1,
trunc(345.678, 0) as  trunc2,
trunc(345.678, 1) as  trunc3,
trunc (345.678, -1) as  trunc4
from dual; --절삭

select last_name, salary,mod(salary, 5000)
from employees; 

--문제 4개
--현재 날짜를 표시하는 질의를 작성하고 열 레이블을 Date로 지정
select sysdate "Date"
from dual;

--각 사원에 대해 사원 번호, 이름, 급여 및 15% 인상된 급여를 "정수로 표시"
--인상된 급여 열의 레이블을 New Salary로 지정
select employee_id, last_name, salary, round(salary*1.15) "New Salary"
from employees;

--2번 질의를 수정하여 새 급여에서 이전 급여를 빼는 새 열을 추가
--레이블을 Increase로 지정하고 수정한 질의를 실행
SELECT employee_id, last_name, salary, 
                    ROUND(salary*1.15) "New Salary",
                    (salary*1.15)-salary "Increase"
FROM   employees;

--이름이 J, A 또는 M으로 시작하는 모든 사원의 이름(대문자 표시) 및 이름 길이를 표시하는 질의를 작성
--각열에 적합한 레이블을 지정
SELECT UPPER(last_name) name, 
                    LENGTH(last_name) name_length
FROM   employees
WHERE  UPPER(SUBSTR(last_name, 1, 1)) IN ('J', 'A', 'M')
ORDER BY 1;

--시간
select sysdate
from dual;

select last_name, (sysdate-hire_date)/7 as weeks
from employees
where department_id = 90; --미국은 주급으로 줘서 7로 나눔

--날짜
select employee_id, hire_date, months_between (sysdate,  hire_date) tenure,
           add_months (hire_date, 6) review,
           next_day (hire_date, '금'),
           last_day (hire_date)
from employees; --확인

select round( sysdate, 'year'),
            round( sysdate, 'month'),
            round( sysdate, 'day'),
            round( sysdate, 'dd')
from dual; --day의 중간은 수요일. 시간은 정오.

select trunc( sysdate, 'year'),
            trunc( sysdate, 'month'),
            trunc( sysdate, 'day'),
            trunc( sysdate, 'dd')
from dual;

--변환함수
select *
from employees
where employee_id = '101'; --형태만 같으면 암시적변환됨

alter session set
nls_date_language = american; --껐다 키면 원상복구됨

select employee_id, to_char(hire_date, 'MM/YY')
from employees; --yy/mm/dd를 mm/yy로

select last_name, to_char(hire_date, 'DD Month YYYY')
from employees; --위에 nls_date_language = american 해놔서 June 으로 뜸

select last_name, to_char(hire_date, 'DD month YYYY')
from employees;

select last_name, to_char(hire_date, 'DD MONTH YYYY')
from employees;

select last_name, to_char(hire_date, 'fmDD MONTH YYYY')
from employees; --fm붙으면 공백지우고 0지움

select last_name, to_char(hire_date, 'fmDdspth "of" Month YYYY fmHH:MI:SS AM')
from employees; --AM대신 PM도 가능

select to_char(salary, '$99,999.00') SALARY
from employees;

select to_char(salary, '$9,999.00') SALARY
from employees; --자리수 넘어간 수는 #로 표기됨

--문자→숫자
select to_number('$3,400', '$99,999')
from dual;

--문자→날짜
select to_date('2010년, 02월', 'YYYY"년", MM"월"')
from dual;

select last_name, hire_date
from employees
where hire_date > to_date('2005년 07월 01일', 'YYYY"년" MM"월" DD"일"'); --시스템 날짜 형식을 모를때 형식 지정.

select last_name, hire_date
from employees
where hire_date > to_date('05/07/01', 'YY-MM-DD'); --위랑 같은 결과.

select last_name, hire_date
from employees
where hire_date > to_date('05/07/01', 'fxYY-MM-DD'); --실행안됨.

select last_name, hire_date
from employees
where hire_date > to_date('05/07/01', 'fxYY/MM/DD'); --실행됨.

--일반함수
select last_name, salary, NVL(commission_pct, 0), (salary*12) + (salary*12*NVL (commission_pct,0)) AN_SAL
from employees;

select last_name, salary, NVL(commission_pct, '보너스 없음')
from employees; --문자 타입 통일 안시켜서 오류뜸

select last_name, salary, NVL(to_char(commission_pct), '보너스 없음')
from employees; --타입 통일 시켜줘서 값 뜸

select last_name, salary, commission_pct, NVL2(commission_pct, 'SAL+COMM', 'SAL') income
from employees; --'SAL+COMM', 'SAL' 2개 위치의 값은 타입 같아야 됨

select first_name, length(first_name) "expr1", last_name, length(last_name) "expr2",
          nullif (length(first_name), length(last_name)) result
from employees;

--조건처리
select last_name, job_id, salary,
          CASE job_id WHEN 'IT_PROG'    THEN 1.10*salary
                                WHEN 'ST_CLERK' THEN 1.15*salary
                                WHEN 'SA_REP'      THEN 1.20*salary
                                ELSE salary
           END "REVISE_SALARY"
from employees; --들여쓰기잘해주기

select last_name, salary,
          CASE WHEN salary<5000 THEN 'Low'
                     WHEN salary<10000 THEN 'Medium'
                     WHEN salary<20000 THEN 'Good'
                                                       ELSE  'Excellent'
           END qualified_salary
from employees; --작은값부터 구할때는 작은값부터 적어주기  

select last_name, job_id, salary,
          DECODE(job_id,  'IT_PROG',    1.10*salary,
                                       'ST_CLERK', 1.15*salary,
                                       'SA_REP',      1.20*salary,
                                                              salary)
        REVISED_SALARY
from employees;   

--문제풀이 03,04
--각 사원의 이름을 표시하고 근무 달 수(입사일로부터 현재까지의 달 수)를 계산하여
--열 레이블을 MONTHS_WORKED로 지정. 결과는 정수로 반올림하여 표시. (날짜함수사용)
select last_name, round(months_between (sysdate,  hire_date) tenure)/12, "MONTHS_WORKED",
from employees;


--모든 사원의 성 및 급여를 표시하기 위한 query를 작성.
--급여가 15자 길이로 표시되고 왼쪽에 # 기호가 채워지도록 형식을 지정.
--열 레이블을 SALARY 로 지정. (문자함수사용)
select last_name, salary "SALARY",
from employees




--부서 90의 모든 사원에 대해 성(last_name) 및 재직 기간(주 단위)을 표시하도록 query 를 작성.
--주를 나타내는 숫자 열의 레이블로 TENURE를 지정하고 주를 나타내는 숫자 값을 정수로 나타내기. (날짜연산)




--각 사원에 대해 다음 항목을 생성하는 질의를 작성하고 열 레이블을 Dream Salaries로 지정하시오.
--<employee last_name> earns <salary> monthly but wants <salary의 3배>. 
--<예시> Matos earns $2,600.00 monthly but wants $7,800.00. (변환함수, 연결연산자)



--사원의 이름, 입사일 및 급여 검토일을 표시. 급여 검토일은 여섯 달이 경과한 후 첫번째 월요일.
--열 레이블을 REVIEW로 지정하고 날짜는 "2010.03.31 월요일"과 같은 형식으로 표시되도록 지정하시오. (날짜함수)


--이름, 입사일 및 업무 시작 요일을 표시하고 열 레이블을 DAY로 지정. 월요일을 시작으로 해서 요일을 기준으로 결과를 정렬.(산수)


--사원의 이름과 커미션을 표시하는 질의를 작성. 커미션을 받지 않는 사원일 경우 “No Commission”을 표시.  (NVL함수)
--열 레이블은 COMM으로 지정.


--DECODE 함수와 CASE 구문을 사용하여 다음 데이터에 따라 JOB_ID 열의 값을 기준으로 모든 사원의 등급을 표시하는 질의를 작성.
--
