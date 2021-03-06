--ESCAPE
select * from employees where job_id like '%\_A%' escape '\';
select * from employees where job_id like '%#_A%' escape '#';

--in : or 대신 사용
select * from employees where manager_id=101 or manager_id=103;
select * from employees where manager_id in (101,102,103);

--between and 대신 사용
select * from employees where manager_id BETWEEN 101 and 103;
--dml
DESC BOOK;
SELECT * FROM BOOK;
SELECT BOOKNAME,PRICE FROM BOOK;
SELECT PUBLISHER FROM BOOK;
SELECT DISTINCT PUBLISHER FROM BOOK;
SELECT * 
FROM BOOK
WHERE PRICE < 10000;

출판사별로 출판사의 평균 도서 가격보다 비싼 도서를 구하시오.
select b1.bookname,b1.publisher from book b1
where b1.price > (select avg(b2.price)
from book b2 where b2.publisher=b1.publisher);

도서를 주문하지 않은 고객의 이름을 보이시오
select name
from customer
minus select name from customer where custid in(select custid from orders);

주만이 있는 고객의 이름과 주소를 보이세요
select name, address from customer where custid in (select custid from orders);

테이블에서 고객번호가 5인 고객의 주소를 대한민국 부산
select * from customer;
update customer set address='대한민국 부산'  where custid = 5;

테이블에서 박세리 고객의 주소를 김연아 고객의 주소로 변경하시오.
UPDATE CUSTOMER
SET ADDRESS = (SELECT ADDRESS FROM CUSTOMER WHERE CUSTID ='2')
WHERE CUSTID = 5;
SELECT * FROM CUSTOMER;

delete customer where custid=5;
--단순 계산방법
select abs(-78),abs(+78) from dual;
Select round(4.875,2) from dual;
select * from orders;
고객별 평균 주문 금액을 백원 단위로 반올림한 겂을 구하시오

select custid,round(avg(saleprice),-2) from orders
group by custid;

도서 제목에 야구가 포함된 도서를 농구로 변경한후 도서 목록 가겨을 보이시오
select bookid,replace(bookname,'야구','농구') ,price from book;

굿스포츠에서 출판된 도서의 제목과 제목의 글자 수 바이트 수를 보이시오
select bookname 제목, length(bookname) 글자수, lengthb(bookname) from book
where publisher='굿스포츠';

select * from customer;
insert into customer values(6,'박세리','대한민국 대전','000-9000-0001');
insert into customer values(5,'박세리','대한민국 대전',null);

같은 성을 가진 사람이 몇명이 되는지 성별 인원수를 몇 명이나 되는지 성별 인원수를 구하시오.
select substr(name,1,1) 성,count(*) 인원수 from customer
group by substr(name,1,1);

select * from orders;

마당서점은 주문일로 부터 10일 후 매출을 확정한다. 각주문의 확정일자를 구하세요.
select orderdate 주문일자, orderdate+10 확정일자 from orders;

select sysdate from dual;
select sysdate, to_char(sysdate,'yyyy/mm/dd dy hh24:mi:ss')SYSDATE1
from dual;

2020 7월 7일에 주문받은 도서의 주문번호 주문일 고객번호 도서번호 모두 보이시오
select orderid 주문번호, to_char(orderdate,'yyyy-mm-dd day') 주문일,custid,bookid from orders where orderdate='20/07/07';

select * from customer;
고객목록에서 고객번호 이름 전화번호 앞의 두명만 보이시오
select name,phone from customer
where rownum<=2;

평균 주문금액 이하의 주문에 대해서 주문번호와 그액을 보이시오
SELECT orderid,saleprice FROM orders
WHERE saleprice <= (SELECT AVG(saleprice) FROM orders);

각 고객의 평균 주문금액 보다 큰 금액의 주분번호 고객번호 금액을 보이시오
SELECT orderid 주문번호, custid 고객번호, saleprice 금액
FROM orders o1
WHERE o1.saleprice > (SELECT avg(o2.saleprice) FROM orders o2 WHERE o1.custid = o2.custid group by o2.custid);

select * from customer;
select * from orders;
대한민국에 거주하는 고객에게 판매한 도서의 총 판매액을 구하시오.
select sum(saleprice) from orders
where custid in (select custid from customer where address like '대한민국%'); 

3번 고객이 주문한 도서의 최고 금액 보다 더 비싼 도서를 구입한 주문의 주문번호와 금액을 보이시오.
select orderid, saleprice from orders 
where saleprice > (select max(saleprice) from orders where custid=3); 

--과제
exists 연산자 사용 대한민국에 거주하는 고객에게 판매한 도서의 총 판매액

마당서점의 고객별 판매액을 보이시오 이름 판매약

고객번호가 2 이하인 고객의 판매액을 보이시오
--과제
주소가 대한민국을 포함하는 고객들로 구성된 뷰를 만들고 죄회하세요
create view vw_Customer(orderid,custid,name,bookid,bookname,saleprice,orderdate)
as select o.orderid,o.custid,c.name,o.bookid,b.bookname,o.salefrom customer where address like '%대한민국%';
select * from book;
select * from orders;
select * from customer;
select name, bookname from customer,book,orders where name='김연아' and custid in
(select custid from orders)and customer.custid=orders.custid;



 SELECT	od.orderid, od.custid, cs.name,
		od.bookid, bk.bookname, od.saleprice, od.orderdate
	FROM	Orders od, Customer cs, Book bk
	WHERE	od.custid=cs.custid AND od.bookid=bk.bookid;

select * from employees;
-- commission_pct null값 체크
select count(*) from employees where commission_pct is null;

-- employee id 홀수 출력
select employee_id from employees where mod(employee_id,2)=1;

-- job id 문자 길이
select length(job_id) from employees;

-- job id 별로 연봉랍계 연봉 평균 최저 연봉 출력
select job_id,sum(salary),avg(salary),min(salary),max(salary) from employees group by job_id;
delete customer where custid=6;

--날짜 관련 함수
select sysdate from dual;

-- 근속연수 구하기
select last_name,hire_date, trunc((sysdate-hire_date)/365,0) 근속연수 from employees;

-- 특정 개월 수를 더한 날짜를 구하기
select last_name, ADD_MONTHS(hire_date,6),hire_date from employees;

--해당 날짜가 속한 월의 말일을 반환하는 함수
select last_day(sysdate) from dual;

--다음달 말일
select last_name, hire_date,last_DAY(ADD_MONTHS(hire_date,1)) "입사 다음달 말일"
from employees;
select * from employees;

--해당 날짜를 기준으로 명시된 요일에 해당하는 다음주 날짜를 반환
select hire_date, next_day(hire_date,'') from employees;
select next_day(sysdate,'월') from dual;

--month_between() 날짜와 날짜 사이의 개월 수를 구하기 
--버림
select last_name, trunc(months_between(sysdate,hire_date),0)근속월수 from employees;
--반올림
select last_name, round(months_between(sysdate,hire_date),0)근속월수 from employees;

--입사일 6개월 후 첫 번째 월요일을 직원이름별로 출력하세요
select last_name,hire_date,next_day(add_months(hire_date,6),'월')"6개월후 첫번재 월요일" from employees;
select * from employees;
select * from jobs;

-- job_id 별로 연봉합계 연봉평균 최고연봉 최저연봉 출력, 단 평균연봉이 5000 이상인 경우만 포함

select job_id, sum(salary),avg(salary)
,max(salary),min(salary) from employees group by job_id
having avg(salary) >= 5000;

-- job_id 별로 연봉합계 연봉평균 최고연봉 최저연봉 출력, 단 평균연봉이 5000 이상인 경우만 내림차순으로 정렬
select job_id, sum(salary)연봉합계,avg(salary)연봉평균
,max(salary)최고연봉,min(salary)최저연봉 from employees group by job_id
having avg(salary) >= 5000
ORDER BY job_id DESC;

--last_name에 l이 포함된 직원의 연봉을 구하세요.
select last_name, salary from employees where last_name like '%l%' or last_name like '%L%';

-- job_id에 PROG가 포함된 직원의 입사일을 구하세요.
select last_name,hire_date,job_id from employees where job_id like '%PROG%';

--연봉이 10000 이상인 manager_id가 100인 직원의 데이터를 출력하세요.
select * from employees where salary >= 10000 and manager_id = 100;

-- department_id가 100보다 적은 모든 직원의 연봉을 구하세요.
select last_name,salary,department_id from employees where department_id<100;

--mamager_id가 101,103인 직원의 job_id를 구하세요.
select job_id,manager_id from employees where manager_id=any(101,103);

select * from employees;
select * from departments;
--join
-- 사원번호가 110인 사원의 부서명
select department_name from employees e,departments d 
where e.department_id = d.department_id and employee_id=110;

select employee_id,department_name
from employees e
join departments d on e.department_id=d.department_id
where employee_id=110;

-- 사번이 120번인 사람의 사번, 이름 , 업무, 업무명 출력
select employee_id,last_name,e.job_id,job_title 
from employees e 
join jobs j on e.job_id=j.job_id
where employee_id=120;

select employee_id,last_name,e.job_id,job_title from employees e,jobs j 
where employee_id=120 and e.job_id=j.job_id;

select * from employees;
select * from departments;

-- 사번 이름 department_name job_title
SELECT e.employee_id, e.first_name, e.last_name, d.department_name, j.job_title
FROM employees e, departments d, jobs j
WHERE e.job_id=j.job_id AND e.department_id=d.department_id;

select employee_id,last_name, department_name, job_title
from employees e
join departments d on e.department_id=d.department_id 
join jobs j on e.job_id = j.job_id;

--self join 하나의 테이블이 두 개의 테이블인 것처럼 조인
select e.employee_id 상사번호, e.last_name 상사이름, m.last_name 직원이름, m.employee_id 직원번호
from employees e,employees m
where e.employee_id = m.manager_id
order by e.employee_id;

--outer join
select e.employee_id 사번, e.last_name 이름, m.last_name, m.employee_id
from employees e, employees m
where e.employee_id = m.manager_id(+);

-- 2005년 이후에 입사한 직원의 사번, 이름, 입사일, 부서명, 업무명 출력
select e.employee_id,e.last_name,e.hire_date,d.department_name,j.job_title
from employees e, departments d, jobs j
where e.department_id=d.department_id and e.job_id = j.job_id and e.hire_date >='05/01/01'
order by hire_date;
select * from jobs;
select * from departments;
select * from employees;
-- 잡타이틀, 부서이름별로 평균연봉을 구한 후 출력하세요
select job_title,department_name,round(avg(salary)) 
from employees e,departments d, jobs j
where e.department_id=d.department_id and e.job_id = j.job_id
group by job_title,department_name;

--평균보다 많은 급여를 받는 직원 검색 후 출력하세요.
select * from employees where salary > (select avg(salary) from employees);

--last name이 king인직원의 이름,입사일,부서아이디 출력
select last_name,hire_date,department_id from employees where lower(last_name)='king';

select employee_id,last_name,
case when salary > 20000 then '대표이사'
when salary > 15000 then '이사'
when salary > 10000 then '부장'
when salary > 5000 then '과장'
when salary > 3000 then '대리'
else '사원'
end as 직급
from employees;

--ESCAPE
SELECT * FROM employees WHERE job_id like '%\_A%' escape '\';
SELECT * FROM employees WHERE job_id like '%#_A%' escape '#';

--IN : OR 대신 사용
SELECT * FROM employees WHERE manager_id=101 or manager_id=102 or manager_id=103;
SELECT * FROM employees WHERE manager_id IN(101,102,103);

--BETWEEN AND : 포함
SELECT * FROM employees WHERE manager_id BETWEEN 101 AND 103;

--IS NULL / IS NOT NULL
SELECT * FROM employees WHERE commission_pct IS NULL;
SELECT * FROM employees WHERE commission_pct IS NOT NULL;

--[주요 함수]
--MOD
SELECT * FROM employees WHERE MOD(employee_id,2)=1;
SELECT MOD(10,3) FROM dual;

--ROUND()
SELECT ROUND(355.95555) FROM dual;
SELECT ROUND(355.95555,0) FROM dual;
SELECT ROUND(355.95555,2) FROM dual;
SELECT ROUND(355.95555,-1) FROM dual;

--TRUNC()
SELECT TRUNC(45.5555,1) FROM dual;
SELECT last_name, TRUNC(salary/12,2) FROM employees;

--날짜 관련 함수
SELECT SYSDATE FROM dual;
SELECT SYSDATE + 1 FROM dual;
SELECT last_name, TRUNC((SYSDATE - hire_date)/365)근속연수 FROM employees;
SELECT last_name, hire_date, ADD_MONTHS(hire_date, 6) FROM employees;
SELECT LAST_DAY(sysdate) - sysdate FROM dual;
SELECT hire_date, NEXT_DAY(hire_date,'월') FROM employees;
SELECT sysdate, NEXT_DAY(sysdate,'금') FROM dual;

--MONTHS_BETWEEN()
SELECT last_name, SYSDATE,hire_date, TRUNC(MONTHS_BETWEEN(sysdate, hire_date)) FROM employees;

--형변환 함수
--number character date
--to_date() 문자열을 날짜로
--to_number, to_char, to_date
SELECT last_name, months_between('2012/12/31',hire_date) FROM employees;
SELECT trunc(sysdate - to_date('2014/01/01')) FROM dual;
SELECT TRUNC(SYSDATE - TO_DATE('20140101')) FROM dual;
SELECT TRUNC(SYSDATE - TO_DATE('140101')) FROM dual;

--Q. employees 테이블에 있는 직원들(사번, 이름 기준으로)에 대하여 현재기준으로 근속연수를 구하세요.
SELECT * FROM employees;
SELECT employee_id, last_name,TRUNC(((to_date('2022/02/21') - hire_date)/365))근속연수 FROM employees;

SELECT TO_DATE('20210101'),
TO_CHAR(TO_DATE('20210101'),'MonthDD YYYY','NLS_DATE_LANGUAGE=ENGLISH') format1 FROM dual;

SELECT TO_CHAR(SYSDATE, 'YY/MM/DD HH24:MI:SS') FROM dual;
SELECT TO_CHAR(SYSDATE, 'yy/mm/dd') FROM dual;
SELECT TO_CHAR(SYSDATE, 'yyyy-MM-DD') FROM dual;
SELECT TO_CHAR(SYSDATE, 'hh24:mi:ss') FROM dual;
SELECT TO_CHAR(SYSDATE, 'day') FROM dual;

--TO_CHAR
--9 한자리의 숫자표현
--0 앞부분을 0으로 표현
--$ 달러 기호를 앞에 표현
--. 소수점을 표시
--, 특정 위치에 표시
--MI 오른쪽에 ? 기호 표시
--PR 음수값을 <>으로 표현
--EEEE 과학적 표현
--L 지역통화
SELECT salary, TO_CHAR(salary,'0999999') FROM employees;
SELECT TO_CHAR(-salary, '999999PR') FROM employees;
SELECT TO_CHAR(1111,'99.99EEEE') FROM dual;
SELECT TO_CHAR(1111,'B9999.99') FROM dual;
SELECT TO_CHAR(1111,'L99999') FROM dual;

--WIDTH_BUCKET() 지정값, 최소값, 최대값, BUCKET 개수
SELECT WIDTH_BUCKET(95,0,100,10) FROM dual;
SELECT department_id, last_name, salary, WIDTH_BUCKET(salary,0,20000,5) FROM employees WHERE department_id=50;

--[과제] employees 테이블에서 employee_id, last_name, salary, hire_date 및 입사일 기준으로 근속년수를 계산해서 아래사항을
--추가한 후 출력하세요. 2001년 1월 1일 창업하여 현재(2020년 12월 31일) 까지 20년간 운영되어온 회사라는 직원의 근속연수에 따라
--30등급으로 나누어 등급에 따라 1000원의 bonus를 지급(bonus 기준 내림차순 정렬)
SELECT employee_id, last_name, salary, hire_date,
TRUNC(((to_date('20201231') - hire_date)/365))근속연수,
(WIDTH_BUCKET(TRUNC(((to_date('20.12.31') - hire_date)/365)),0,20,30)-1)*1000 bonus
FROM employees
ORDER BY bonus DESC;

--문자함수
SELECT UPPER('HELLO WORLD') FROM DUAL;
SELECT LOWER('HELLO WORLD') FROM DUAL;
SELECT LAST_NAME,SALARY FROM EMPLOYEES WHERE LOWER(LAST_NAME)='seo';
select initcap(job_id) from employees; -- 첫 문자만 대문자로 처리
select length(last_name) from employees;
select instr('hello world','o',1,2) from dual; -- o사이의 길이 1-찾기를 시작할 위치 2-몇번째 문자
select substr('hello world',3,3) from dual;
select substr('hello world',-3,3) from dual;
select lpad('hello world',20,'#') from dual;
select rpad('hello world',20,'#') from dual;
select ltrim('aaahello worldaaa','a') from dual;
select rtrim('aaahello worldaaa','a') from dual;
select ltrim('   hello world   ') from dual;
select rtrim('   hello world   ') from dual;
SELECT TRIM(BOTH 'a' FROM 'aaaHello Worldaaa') FROM DUAL;

-- 기타 함수
select salary, salary*12*NVL(commission_pct,0) from employees; -- nvl(replace)

select last_name, department_id,
case when department_id=90 then '경원지원실'
when department_id=60 then '프로그래머'
when department_id = 100 then '인사부'
end as 소속
from employees;

-- 분석 함수 : 여러가지 기준을 적용해 여러 결과를 return 할 수 있으며 처리 대상이 되는 행의 집단을 window라고 지칭
--first_value() over() 그룹의 첫번째 값을 구한다.
select first_name, salary,
first_value(salary) over(order by salary desc) from employees;
--3줄 위의 값까지 중 첫번쨰 값
select first_name, salary,
first_value(salary) over(order by salary desc rows 3 preceding) from employees;
--연봉 +2000까지중 첫번쨰 값
select first_name, salary,
first_value(salary) over(order by salary desc range 2000 preceding) from employees;

--Q 3줄 위의 값까지중 최저연봉
select first_name, salary,
first_value(salary) over(order by salary rows 3 preceding) from employees;

select first_name, salary,
last_value(salary) over(order by salary desc rows 3 preceding) from employees;

--Q 위아래 각각 2줄까지중 마지막 값
select first_name, salary,
last_value(salary) over(order by salary desc rows between 2 preceding and 2 following) from employees;


[과제]employees 테이블에서 department_id=50인 직원의 연봉을 내림차순의로 정렬하여 누적 카운트를 출력하세요
select salary, COUNT(*) over(order by salary) from employees where department_id=50;

--[과제] employees 테이블에서 department_id=50인 직원의 연봉을 내림차순 정렬하여 누적 카운트를 출력하세요.
SELECT DEPARTMENT_ID, LAST_NAME, SALARY,SUM(SALARY) OVER(PARTITION BY DEPARTMENT_ID ORDER BY DEPARTMENT_ID ASC) FROM EMPLOYEES;
--[과제] employees 테이블에서 department_id를 기준으로 오름차순 정렬하고 직원의 연봉 누적 합계를 출력하세요.
SELECT FIRST_NAME, DEPARTMENT_ID, SALARY, RANK() OVER(PARTITION BY DEPARTMENT_ID ORDER BY SALARY DESC)
FROM EMPLOYEES;
--[과제] employees 테이블에서 department_id(부서)별 직원 연봉순위를 출력하세요.

-- 100번 부서의 구성원 모두의 급여보다 더 많은 급여를 받는 사원을 출력
select employee_id,last_name,salary from employees 
where salary >all(select salary from employees where department_id=100); 

--Q. 가격이 10000원 이상 20000원 이하인 도서를 검색하세요.
SELECT * FROM BOOK WHERE 10000 <= PRICE AND PRICE <= 20000;
--Q. 출판사가 굿스포츠, 혹은 대한미디어인 도서를 검색하세요.
SELECT * FROM BOOK WHERE PUBLISHER = '굿스포츠' OR PUBLISHER = '대한미디어';
SELECT * FROM BOOK WHERE PUBLISHER IN ('굿스포츠','대한미디어');
--Q. 출판사가 굿스포츠, 혹은 대한미디어가 아닌 도서를 검색하세요.
SELECT * FROM BOOK WHERE PUBLISHER NOT IN ('굿스포츠','대한미디어');
--Q. 도서이름에 축구가 포함된 출판사를 검색하세요.
select PUBLISHER from BOOK where BOOKNAME like '%축구%';
select * from BOOK where BOOKNAME like '%축구%';
--[과제] 도서이름의 왼쪽 두 번째 위치에 구라는 문자열을 갖는 도서를 검색하세요.
-- _은 특정 위치의 한개의 문자와 일치
-- %은 0개 이상의 문자와 일치
SELECT BOOKNAME,PUBLISHER
FROM BOOK
WHERE BOOKNAME LIKE'_구%';
--[과제] 축구에 관한 도서 중 가격이 20,000원 이상인 도서를 검색하세요.
SELECT * 
FROM BOOK
WHERE BOOKNAME LIKE '%축구%' AND PRICE >= 20000;

SELECT * 
FROM BOOK
ORDER BY BOOKNAME;

SELECT * 
FROM BOOK
ORDER BY BOOKNAME DESC;

--Q. 도서를 가격순으로 검색하고 가격이 같으면 이름순으로 검색하세요.
SELECT * FROM BOOK ORDER BY PRICE,BOOKNAME;
--Q. 도서를 가격의 내림차순으로 검색하고 만약 가격이 같다면 출판사의 오름차순으로 출력하세요.
select * from book
order by price Desc,publisher;

SELECT * FROM ORDERS;
SELECT SUM(SALEPRICE)
FROM ORDERS;

SELECT SUM(SALEPRICE) AS "총매출"
FROM ORDERS;

--Q.CUSTID 가 2번인 고객이 주문한 도서의 총판매액을 구하세요.
select sum(SALEPRICE) AS "총 판매액" from ORDERS where CUSTID=2;
SELECT SUM(SALEPRICE) AS TOTAL,
AVG(SALEPRICE) AS AVERAGE,
MIN(SALEPRICE) AS MINIMUM,
MAX(SALEPRICE) AS MAXIMUM
FROM ORDERS;

SELECT COUNT(*) FROM ORDERS;

--Q. CUSTID별 도서수량과 총판매액을 출력하세요.
SELECT CUSTID, COUNT(*) AS 도서수량, SUM(SALEPRICE) AS "총 판매액"
FROM ORDERS
GROUP BY CUSTID;

--Q. 가격이 8000원 이상인 도서를 구매한 고객에 대하여 고객별 주문 도서의 총 수량을 구하세요. 단 두권 이상 구매한 고객에 한정함
SELECT CUSTID, COUNT(*) AS 도서수량
FROM ORDERS
WHERE SALEPRICE >= 8000
GROUP BY CUSTID
HAVING COUNT(*) >= 2;

SELECT * FROM CUSTOMER;

SELECT * 
FROM CUSTOMER, ORDERS
WHERE CUSTOMER.CUSTID = ORDERS.CUSTID
ORDER BY CUSTOMER.CUSTID;

--Q. 고객별로 주문한 모든 도서의 총 판매액을 구하고 고객이름별로 정렬하세요.
SELECT NAME, SUM(SALEPRICE)
FROM CUSTOMER,ORDERS
WHERE CUSTOMER.CUSTID = ORDERS.CUSTID
GROUP BY CUSTOMER.NAME
ORDER BY CUSTOMER.NAME;

--Q. 고객의 이름과 고객이 주문한 도서의 이름을 구하세요.
SELECT CUSTOMER.NAME, BOOK.BOOKNAME
FROM CUSTOMER,ORDERS,BOOK
WHERE CUSTOMER.CUSTID = ORDERS.CUSTID AND ORDERS.BOOKID= BOOK.BOOKID;

SELECT C.NAME, B.BOOKNAME
FROM CUSTOMER C,ORDERS O,BOOK B
WHERE C.CUSTID = O.CUSTID AND O.BOOKID= B.BOOKID;

--[과제] 가격이 20,000인 도서를 주문한 고객의 이름과 도서의 이름을 구하세요.
SELECT C.NAME, B.BOOKNAME, O.SALEPRICE
FROM BOOK B, CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID AND O.BOOKID=B.BOOKID AND B.PRICE=20000;

--[과제] 도서를 구매하지 않은 고객을 포함하여 고객의 이름과 고객이 주문한 도서의 판매가격을 구하세요.
--outer join 조인조건을 만족하지 못하더라도 해당 행을 나타냄

--union
select first_name 이름, salary 금여 from employees
where salary<5000
union
select first_name 이름, salary 금여 from employees
where hire_date < '99/01/01';

-- union all(중복제거)
select first_name 이름, salary 금여 from employees
where salary<5000
union all
select first_name 이름, salary 금여 from employees
where hire_date < '99/01/01';
--intersect
select first_name 이름, salary 금여 from employees
where salary<5000
intersect
select first_name 이름, salary 금여 from employees
where hire_date < '07/01/01';
--minus(차집합)
select first_name 이름, salary 금여 from employees
where salary<5000
minus
select first_name 이름, salary 금여 from employees
where hire_date < '07/01/01';



SELECT C.NAME, O.SALEPRICE
FROM CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID(+);
--[과제] 가장 비싼 도서의 이름을 출력하세요.
SELECT BOOKNAME
FROM BOOK
WHERE PRICE=(SELECT MAX(PRICE) FROM BOOK);
SELECT * FROM BOOK;

--[과제] 도서를 구매한 적이 있는 고객의 이름을 검색하세요.
SELECT NAME
FROM CUSTOMER
WHERE CUSTID IN (SELECT CUSTID FROM ORDERS);
--[과제] 대한미디어에서 출판한 도서를 구매한 고객의 이름을 출력하세요.
SELECT NAME
FROM CUSTOMER
WHERE CUSTID IN (SELECT CUSTID FROM ORDERS
WHERE BOOKID IN (SELECT BOOKID FROM BOOK
WHERE PUBLISHER = '대한미디어'));

SELECT employee_id, last_name, salary, hire_date,
TRUNC(((to_date('20201231') - hire_date)/365))근속연수,
(WIDTH_BUCKET(TRUNC(((to_date('20.12.31') - hire_date)/365)),0,20,30)-1)*1000 bonus
FROM employees
ORDER BY bonus DESC;

--문자함수
SL