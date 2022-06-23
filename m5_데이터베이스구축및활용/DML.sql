--ESCAPE
select * from employees where job_id like '%\_A%' escape '\';
select * from employees where job_id like '%#_A%' escape '#';

--in : or ��� ���
select * from employees where manager_id=101 or manager_id=103;
select * from employees where manager_id in (101,102,103);

--between and ��� ���
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

���ǻ纰�� ���ǻ��� ��� ���� ���ݺ��� ��� ������ ���Ͻÿ�.
select b1.bookname,b1.publisher from book b1
where b1.price > (select avg(b2.price)
from book b2 where b2.publisher=b1.publisher);

������ �ֹ����� ���� ���� �̸��� ���̽ÿ�
select name
from customer
minus select name from customer where custid in(select custid from orders);

�ָ��� �ִ� ���� �̸��� �ּҸ� ���̼���
select name, address from customer where custid in (select custid from orders);

���̺��� ����ȣ�� 5�� ���� �ּҸ� ���ѹα� �λ�
select * from customer;
update customer set address='���ѹα� �λ�'  where custid = 5;

���̺��� �ڼ��� ���� �ּҸ� �迬�� ���� �ּҷ� �����Ͻÿ�.
UPDATE CUSTOMER
SET ADDRESS = (SELECT ADDRESS FROM CUSTOMER WHERE CUSTID ='2')
WHERE CUSTID = 5;
SELECT * FROM CUSTOMER;

delete customer where custid=5;
--�ܼ� �����
select abs(-78),abs(+78) from dual;
Select round(4.875,2) from dual;
select * from orders;
���� ��� �ֹ� �ݾ��� ��� ������ �ݿø��� ���� ���Ͻÿ�

select custid,round(avg(saleprice),-2) from orders
group by custid;

���� ���� �߱��� ���Ե� ������ �󱸷� �������� ���� ��� ������ ���̽ÿ�
select bookid,replace(bookname,'�߱�','��') ,price from book;

�½��������� ���ǵ� ������ ����� ������ ���� �� ����Ʈ ���� ���̽ÿ�
select bookname ����, length(bookname) ���ڼ�, lengthb(bookname) from book
where publisher='�½�����';

select * from customer;
insert into customer values(6,'�ڼ���','���ѹα� ����','000-9000-0001');
insert into customer values(5,'�ڼ���','���ѹα� ����',null);

���� ���� ���� ����� ����� �Ǵ��� ���� �ο����� �� ���̳� �Ǵ��� ���� �ο����� ���Ͻÿ�.
select substr(name,1,1) ��,count(*) �ο��� from customer
group by substr(name,1,1);

select * from orders;

���缭���� �ֹ��Ϸ� ���� 10�� �� ������ Ȯ���Ѵ�. ���ֹ��� Ȯ�����ڸ� ���ϼ���.
select orderdate �ֹ�����, orderdate+10 Ȯ������ from orders;

select sysdate from dual;
select sysdate, to_char(sysdate,'yyyy/mm/dd dy hh24:mi:ss')SYSDATE1
from dual;

2020 7�� 7�Ͽ� �ֹ����� ������ �ֹ���ȣ �ֹ��� ����ȣ ������ȣ ��� ���̽ÿ�
select orderid �ֹ���ȣ, to_char(orderdate,'yyyy-mm-dd day') �ֹ���,custid,bookid from orders where orderdate='20/07/07';

select * from customer;
����Ͽ��� ����ȣ �̸� ��ȭ��ȣ ���� �θ� ���̽ÿ�
select name,phone from customer
where rownum<=2;

��� �ֹ��ݾ� ������ �ֹ��� ���ؼ� �ֹ���ȣ�� �׾��� ���̽ÿ�
SELECT orderid,saleprice FROM orders
WHERE saleprice <= (SELECT AVG(saleprice) FROM orders);

�� ���� ��� �ֹ��ݾ� ���� ū �ݾ��� �ֺй�ȣ ����ȣ �ݾ��� ���̽ÿ�
SELECT orderid �ֹ���ȣ, custid ����ȣ, saleprice �ݾ�
FROM orders o1
WHERE o1.saleprice > (SELECT avg(o2.saleprice) FROM orders o2 WHERE o1.custid = o2.custid group by o2.custid);

select * from customer;
select * from orders;
���ѹα��� �����ϴ� ������ �Ǹ��� ������ �� �Ǹž��� ���Ͻÿ�.
select sum(saleprice) from orders
where custid in (select custid from customer where address like '���ѹα�%'); 

3�� ���� �ֹ��� ������ �ְ� �ݾ� ���� �� ��� ������ ������ �ֹ��� �ֹ���ȣ�� �ݾ��� ���̽ÿ�.
select orderid, saleprice from orders 
where saleprice > (select max(saleprice) from orders where custid=3); 

--����
exists ������ ��� ���ѹα��� �����ϴ� ������ �Ǹ��� ������ �� �Ǹž�

���缭���� ���� �Ǹž��� ���̽ÿ� �̸� �Ǹž�

����ȣ�� 2 ������ ���� �Ǹž��� ���̽ÿ�
--����
�ּҰ� ���ѹα��� �����ϴ� ����� ������ �並 ����� ��ȸ�ϼ���
create view vw_Customer(orderid,custid,name,bookid,bookname,saleprice,orderdate)
as select o.orderid,o.custid,c.name,o.bookid,b.bookname,o.salefrom customer where address like '%���ѹα�%';
select * from book;
select * from orders;
select * from customer;
select name, bookname from customer,book,orders where name='�迬��' and custid in
(select custid from orders)and customer.custid=orders.custid;



 SELECT	od.orderid, od.custid, cs.name,
		od.bookid, bk.bookname, od.saleprice, od.orderdate
	FROM	Orders od, Customer cs, Book bk
	WHERE	od.custid=cs.custid AND od.bookid=bk.bookid;

select * from employees;
-- commission_pct null�� üũ
select count(*) from employees where commission_pct is null;

-- employee id Ȧ�� ���
select employee_id from employees where mod(employee_id,2)=1;

-- job id ���� ����
select length(job_id) from employees;

-- job id ���� �������� ���� ��� ���� ���� ���
select job_id,sum(salary),avg(salary),min(salary),max(salary) from employees group by job_id;
delete customer where custid=6;

--��¥ ���� �Լ�
select sysdate from dual;

-- �ټӿ��� ���ϱ�
select last_name,hire_date, trunc((sysdate-hire_date)/365,0) �ټӿ��� from employees;

-- Ư�� ���� ���� ���� ��¥�� ���ϱ�
select last_name, ADD_MONTHS(hire_date,6),hire_date from employees;

--�ش� ��¥�� ���� ���� ������ ��ȯ�ϴ� �Լ�
select last_day(sysdate) from dual;

--������ ����
select last_name, hire_date,last_DAY(ADD_MONTHS(hire_date,1)) "�Ի� ������ ����"
from employees;
select * from employees;

--�ش� ��¥�� �������� ��õ� ���Ͽ� �ش��ϴ� ������ ��¥�� ��ȯ
select hire_date, next_day(hire_date,'') from employees;
select next_day(sysdate,'��') from dual;

--month_between() ��¥�� ��¥ ������ ���� ���� ���ϱ� 
--����
select last_name, trunc(months_between(sysdate,hire_date),0)�ټӿ��� from employees;
--�ݿø�
select last_name, round(months_between(sysdate,hire_date),0)�ټӿ��� from employees;

--�Ի��� 6���� �� ù ��° �������� �����̸����� ����ϼ���
select last_name,hire_date,next_day(add_months(hire_date,6),'��')"6������ ù���� ������" from employees;
select * from employees;
select * from jobs;

-- job_id ���� �����հ� ������� �ְ��� �������� ���, �� ��տ����� 5000 �̻��� ��츸 ����

select job_id, sum(salary),avg(salary)
,max(salary),min(salary) from employees group by job_id
having avg(salary) >= 5000;

-- job_id ���� �����հ� ������� �ְ��� �������� ���, �� ��տ����� 5000 �̻��� ��츸 ������������ ����
select job_id, sum(salary)�����հ�,avg(salary)�������
,max(salary)�ְ���,min(salary)�������� from employees group by job_id
having avg(salary) >= 5000
ORDER BY job_id DESC;

--last_name�� l�� ���Ե� ������ ������ ���ϼ���.
select last_name, salary from employees where last_name like '%l%' or last_name like '%L%';

-- job_id�� PROG�� ���Ե� ������ �Ի����� ���ϼ���.
select last_name,hire_date,job_id from employees where job_id like '%PROG%';

--������ 10000 �̻��� manager_id�� 100�� ������ �����͸� ����ϼ���.
select * from employees where salary >= 10000 and manager_id = 100;

-- department_id�� 100���� ���� ��� ������ ������ ���ϼ���.
select last_name,salary,department_id from employees where department_id<100;

--mamager_id�� 101,103�� ������ job_id�� ���ϼ���.
select job_id,manager_id from employees where manager_id=any(101,103);

select * from employees;
select * from departments;
--join
-- �����ȣ�� 110�� ����� �μ���
select department_name from employees e,departments d 
where e.department_id = d.department_id and employee_id=110;

select employee_id,department_name
from employees e
join departments d on e.department_id=d.department_id
where employee_id=110;

-- ����� 120���� ����� ���, �̸� , ����, ������ ���
select employee_id,last_name,e.job_id,job_title 
from employees e 
join jobs j on e.job_id=j.job_id
where employee_id=120;

select employee_id,last_name,e.job_id,job_title from employees e,jobs j 
where employee_id=120 and e.job_id=j.job_id;

select * from employees;
select * from departments;

-- ��� �̸� department_name job_title
SELECT e.employee_id, e.first_name, e.last_name, d.department_name, j.job_title
FROM employees e, departments d, jobs j
WHERE e.job_id=j.job_id AND e.department_id=d.department_id;

select employee_id,last_name, department_name, job_title
from employees e
join departments d on e.department_id=d.department_id 
join jobs j on e.job_id = j.job_id;

--self join �ϳ��� ���̺��� �� ���� ���̺��� ��ó�� ����
select e.employee_id ����ȣ, e.last_name ����̸�, m.last_name �����̸�, m.employee_id ������ȣ
from employees e,employees m
where e.employee_id = m.manager_id
order by e.employee_id;

--outer join
select e.employee_id ���, e.last_name �̸�, m.last_name, m.employee_id
from employees e, employees m
where e.employee_id = m.manager_id(+);

-- 2005�� ���Ŀ� �Ի��� ������ ���, �̸�, �Ի���, �μ���, ������ ���
select e.employee_id,e.last_name,e.hire_date,d.department_name,j.job_title
from employees e, departments d, jobs j
where e.department_id=d.department_id and e.job_id = j.job_id and e.hire_date >='05/01/01'
order by hire_date;
select * from jobs;
select * from departments;
select * from employees;
-- ��Ÿ��Ʋ, �μ��̸����� ��տ����� ���� �� ����ϼ���
select job_title,department_name,round(avg(salary)) 
from employees e,departments d, jobs j
where e.department_id=d.department_id and e.job_id = j.job_id
group by job_title,department_name;

--��պ��� ���� �޿��� �޴� ���� �˻� �� ����ϼ���.
select * from employees where salary > (select avg(salary) from employees);

--last name�� king�������� �̸�,�Ի���,�μ����̵� ���
select last_name,hire_date,department_id from employees where lower(last_name)='king';

select employee_id,last_name,
case when salary > 20000 then '��ǥ�̻�'
when salary > 15000 then '�̻�'
when salary > 10000 then '����'
when salary > 5000 then '����'
when salary > 3000 then '�븮'
else '���'
end as ����
from employees;

--ESCAPE
SELECT * FROM employees WHERE job_id like '%\_A%' escape '\';
SELECT * FROM employees WHERE job_id like '%#_A%' escape '#';

--IN : OR ��� ���
SELECT * FROM employees WHERE manager_id=101 or manager_id=102 or manager_id=103;
SELECT * FROM employees WHERE manager_id IN(101,102,103);

--BETWEEN AND : ����
SELECT * FROM employees WHERE manager_id BETWEEN 101 AND 103;

--IS NULL / IS NOT NULL
SELECT * FROM employees WHERE commission_pct IS NULL;
SELECT * FROM employees WHERE commission_pct IS NOT NULL;

--[�ֿ� �Լ�]
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

--��¥ ���� �Լ�
SELECT SYSDATE FROM dual;
SELECT SYSDATE + 1 FROM dual;
SELECT last_name, TRUNC((SYSDATE - hire_date)/365)�ټӿ��� FROM employees;
SELECT last_name, hire_date, ADD_MONTHS(hire_date, 6) FROM employees;
SELECT LAST_DAY(sysdate) - sysdate FROM dual;
SELECT hire_date, NEXT_DAY(hire_date,'��') FROM employees;
SELECT sysdate, NEXT_DAY(sysdate,'��') FROM dual;

--MONTHS_BETWEEN()
SELECT last_name, SYSDATE,hire_date, TRUNC(MONTHS_BETWEEN(sysdate, hire_date)) FROM employees;

--����ȯ �Լ�
--number character date
--to_date() ���ڿ��� ��¥��
--to_number, to_char, to_date
SELECT last_name, months_between('2012/12/31',hire_date) FROM employees;
SELECT trunc(sysdate - to_date('2014/01/01')) FROM dual;
SELECT TRUNC(SYSDATE - TO_DATE('20140101')) FROM dual;
SELECT TRUNC(SYSDATE - TO_DATE('140101')) FROM dual;

--Q. employees ���̺� �ִ� ������(���, �̸� ��������)�� ���Ͽ� ����������� �ټӿ����� ���ϼ���.
SELECT * FROM employees;
SELECT employee_id, last_name,TRUNC(((to_date('2022/02/21') - hire_date)/365))�ټӿ��� FROM employees;

SELECT TO_DATE('20210101'),
TO_CHAR(TO_DATE('20210101'),'MonthDD YYYY','NLS_DATE_LANGUAGE=ENGLISH') format1 FROM dual;

SELECT TO_CHAR(SYSDATE, 'YY/MM/DD HH24:MI:SS') FROM dual;
SELECT TO_CHAR(SYSDATE, 'yy/mm/dd') FROM dual;
SELECT TO_CHAR(SYSDATE, 'yyyy-MM-DD') FROM dual;
SELECT TO_CHAR(SYSDATE, 'hh24:mi:ss') FROM dual;
SELECT TO_CHAR(SYSDATE, 'day') FROM dual;

--TO_CHAR
--9 ���ڸ��� ����ǥ��
--0 �պκ��� 0���� ǥ��
--$ �޷� ��ȣ�� �տ� ǥ��
--. �Ҽ����� ǥ��
--, Ư�� ��ġ�� ǥ��
--MI �����ʿ� ? ��ȣ ǥ��
--PR �������� <>���� ǥ��
--EEEE ������ ǥ��
--L ������ȭ
SELECT salary, TO_CHAR(salary,'0999999') FROM employees;
SELECT TO_CHAR(-salary, '999999PR') FROM employees;
SELECT TO_CHAR(1111,'99.99EEEE') FROM dual;
SELECT TO_CHAR(1111,'B9999.99') FROM dual;
SELECT TO_CHAR(1111,'L99999') FROM dual;

--WIDTH_BUCKET() ������, �ּҰ�, �ִ밪, BUCKET ����
SELECT WIDTH_BUCKET(95,0,100,10) FROM dual;
SELECT department_id, last_name, salary, WIDTH_BUCKET(salary,0,20000,5) FROM employees WHERE department_id=50;

--[����] employees ���̺��� employee_id, last_name, salary, hire_date �� �Ի��� �������� �ټӳ���� ����ؼ� �Ʒ�������
--�߰��� �� ����ϼ���. 2001�� 1�� 1�� â���Ͽ� ����(2020�� 12�� 31��) ���� 20�Ⱓ ��Ǿ�� ȸ���� ������ �ټӿ����� ����
--30������� ������ ��޿� ���� 1000���� bonus�� ����(bonus ���� �������� ����)
SELECT employee_id, last_name, salary, hire_date,
TRUNC(((to_date('20201231') - hire_date)/365))�ټӿ���,
(WIDTH_BUCKET(TRUNC(((to_date('20.12.31') - hire_date)/365)),0,20,30)-1)*1000 bonus
FROM employees
ORDER BY bonus DESC;

--�����Լ�
SELECT UPPER('HELLO WORLD') FROM DUAL;
SELECT LOWER('HELLO WORLD') FROM DUAL;
SELECT LAST_NAME,SALARY FROM EMPLOYEES WHERE LOWER(LAST_NAME)='seo';
select initcap(job_id) from employees; -- ù ���ڸ� �빮�ڷ� ó��
select length(last_name) from employees;
select instr('hello world','o',1,2) from dual; -- o������ ���� 1-ã�⸦ ������ ��ġ 2-���° ����
select substr('hello world',3,3) from dual;
select substr('hello world',-3,3) from dual;
select lpad('hello world',20,'#') from dual;
select rpad('hello world',20,'#') from dual;
select ltrim('aaahello worldaaa','a') from dual;
select rtrim('aaahello worldaaa','a') from dual;
select ltrim('   hello world   ') from dual;
select rtrim('   hello world   ') from dual;
SELECT TRIM(BOTH 'a' FROM 'aaaHello Worldaaa') FROM DUAL;

-- ��Ÿ �Լ�
select salary, salary*12*NVL(commission_pct,0) from employees; -- nvl(replace)

select last_name, department_id,
case when department_id=90 then '���������'
when department_id=60 then '���α׷���'
when department_id = 100 then '�λ��'
end as �Ҽ�
from employees;

-- �м� �Լ� : �������� ������ ������ ���� ����� return �� �� ������ ó�� ����� �Ǵ� ���� ������ window��� ��Ī
--first_value() over() �׷��� ù��° ���� ���Ѵ�.
select first_name, salary,
first_value(salary) over(order by salary desc) from employees;
--3�� ���� ������ �� ù���� ��
select first_name, salary,
first_value(salary) over(order by salary desc rows 3 preceding) from employees;
--���� +2000������ ù���� ��
select first_name, salary,
first_value(salary) over(order by salary desc range 2000 preceding) from employees;

--Q 3�� ���� �������� ��������
select first_name, salary,
first_value(salary) over(order by salary rows 3 preceding) from employees;

select first_name, salary,
last_value(salary) over(order by salary desc rows 3 preceding) from employees;

--Q ���Ʒ� ���� 2�ٱ����� ������ ��
select first_name, salary,
last_value(salary) over(order by salary desc rows between 2 preceding and 2 following) from employees;


[����]employees ���̺��� department_id=50�� ������ ������ ���������Ƿ� �����Ͽ� ���� ī��Ʈ�� ����ϼ���
select salary, COUNT(*) over(order by salary) from employees where department_id=50;

--[����] employees ���̺��� department_id=50�� ������ ������ �������� �����Ͽ� ���� ī��Ʈ�� ����ϼ���.
SELECT DEPARTMENT_ID, LAST_NAME, SALARY,SUM(SALARY) OVER(PARTITION BY DEPARTMENT_ID ORDER BY DEPARTMENT_ID ASC) FROM EMPLOYEES;
--[����] employees ���̺��� department_id�� �������� �������� �����ϰ� ������ ���� ���� �հ踦 ����ϼ���.
SELECT FIRST_NAME, DEPARTMENT_ID, SALARY, RANK() OVER(PARTITION BY DEPARTMENT_ID ORDER BY SALARY DESC)
FROM EMPLOYEES;
--[����] employees ���̺��� department_id(�μ�)�� ���� ���������� ����ϼ���.

-- 100�� �μ��� ������ ����� �޿����� �� ���� �޿��� �޴� ����� ���
select employee_id,last_name,salary from employees 
where salary >all(select salary from employees where department_id=100); 

--Q. ������ 10000�� �̻� 20000�� ������ ������ �˻��ϼ���.
SELECT * FROM BOOK WHERE 10000 <= PRICE AND PRICE <= 20000;
--Q. ���ǻ簡 �½�����, Ȥ�� ���ѹ̵���� ������ �˻��ϼ���.
SELECT * FROM BOOK WHERE PUBLISHER = '�½�����' OR PUBLISHER = '���ѹ̵��';
SELECT * FROM BOOK WHERE PUBLISHER IN ('�½�����','���ѹ̵��');
--Q. ���ǻ簡 �½�����, Ȥ�� ���ѹ̵� �ƴ� ������ �˻��ϼ���.
SELECT * FROM BOOK WHERE PUBLISHER NOT IN ('�½�����','���ѹ̵��');
--Q. �����̸��� �౸�� ���Ե� ���ǻ縦 �˻��ϼ���.
select PUBLISHER from BOOK where BOOKNAME like '%�౸%';
select * from BOOK where BOOKNAME like '%�౸%';
--[����] �����̸��� ���� �� ��° ��ġ�� ����� ���ڿ��� ���� ������ �˻��ϼ���.
-- _�� Ư�� ��ġ�� �Ѱ��� ���ڿ� ��ġ
-- %�� 0�� �̻��� ���ڿ� ��ġ
SELECT BOOKNAME,PUBLISHER
FROM BOOK
WHERE BOOKNAME LIKE'_��%';
--[����] �౸�� ���� ���� �� ������ 20,000�� �̻��� ������ �˻��ϼ���.
SELECT * 
FROM BOOK
WHERE BOOKNAME LIKE '%�౸%' AND PRICE >= 20000;

SELECT * 
FROM BOOK
ORDER BY BOOKNAME;

SELECT * 
FROM BOOK
ORDER BY BOOKNAME DESC;

--Q. ������ ���ݼ����� �˻��ϰ� ������ ������ �̸������� �˻��ϼ���.
SELECT * FROM BOOK ORDER BY PRICE,BOOKNAME;
--Q. ������ ������ ������������ �˻��ϰ� ���� ������ ���ٸ� ���ǻ��� ������������ ����ϼ���.
select * from book
order by price Desc,publisher;

SELECT * FROM ORDERS;
SELECT SUM(SALEPRICE)
FROM ORDERS;

SELECT SUM(SALEPRICE) AS "�Ѹ���"
FROM ORDERS;

--Q.CUSTID �� 2���� ���� �ֹ��� ������ ���Ǹž��� ���ϼ���.
select sum(SALEPRICE) AS "�� �Ǹž�" from ORDERS where CUSTID=2;
SELECT SUM(SALEPRICE) AS TOTAL,
AVG(SALEPRICE) AS AVERAGE,
MIN(SALEPRICE) AS MINIMUM,
MAX(SALEPRICE) AS MAXIMUM
FROM ORDERS;

SELECT COUNT(*) FROM ORDERS;

--Q. CUSTID�� ���������� ���Ǹž��� ����ϼ���.
SELECT CUSTID, COUNT(*) AS ��������, SUM(SALEPRICE) AS "�� �Ǹž�"
FROM ORDERS
GROUP BY CUSTID;

--Q. ������ 8000�� �̻��� ������ ������ ���� ���Ͽ� ���� �ֹ� ������ �� ������ ���ϼ���. �� �α� �̻� ������ ���� ������
SELECT CUSTID, COUNT(*) AS ��������
FROM ORDERS
WHERE SALEPRICE >= 8000
GROUP BY CUSTID
HAVING COUNT(*) >= 2;

SELECT * FROM CUSTOMER;

SELECT * 
FROM CUSTOMER, ORDERS
WHERE CUSTOMER.CUSTID = ORDERS.CUSTID
ORDER BY CUSTOMER.CUSTID;

--Q. ������ �ֹ��� ��� ������ �� �Ǹž��� ���ϰ� ���̸����� �����ϼ���.
SELECT NAME, SUM(SALEPRICE)
FROM CUSTOMER,ORDERS
WHERE CUSTOMER.CUSTID = ORDERS.CUSTID
GROUP BY CUSTOMER.NAME
ORDER BY CUSTOMER.NAME;

--Q. ���� �̸��� ���� �ֹ��� ������ �̸��� ���ϼ���.
SELECT CUSTOMER.NAME, BOOK.BOOKNAME
FROM CUSTOMER,ORDERS,BOOK
WHERE CUSTOMER.CUSTID = ORDERS.CUSTID AND ORDERS.BOOKID= BOOK.BOOKID;

SELECT C.NAME, B.BOOKNAME
FROM CUSTOMER C,ORDERS O,BOOK B
WHERE C.CUSTID = O.CUSTID AND O.BOOKID= B.BOOKID;

--[����] ������ 20,000�� ������ �ֹ��� ���� �̸��� ������ �̸��� ���ϼ���.
SELECT C.NAME, B.BOOKNAME, O.SALEPRICE
FROM BOOK B, CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID AND O.BOOKID=B.BOOKID AND B.PRICE=20000;

--[����] ������ �������� ���� ���� �����Ͽ� ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� ���ϼ���.
--outer join ���������� �������� ���ϴ��� �ش� ���� ��Ÿ��

--union
select first_name �̸�, salary �ݿ� from employees
where salary<5000
union
select first_name �̸�, salary �ݿ� from employees
where hire_date < '99/01/01';

-- union all(�ߺ�����)
select first_name �̸�, salary �ݿ� from employees
where salary<5000
union all
select first_name �̸�, salary �ݿ� from employees
where hire_date < '99/01/01';
--intersect
select first_name �̸�, salary �ݿ� from employees
where salary<5000
intersect
select first_name �̸�, salary �ݿ� from employees
where hire_date < '07/01/01';
--minus(������)
select first_name �̸�, salary �ݿ� from employees
where salary<5000
minus
select first_name �̸�, salary �ݿ� from employees
where hire_date < '07/01/01';



SELECT C.NAME, O.SALEPRICE
FROM CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID(+);
--[����] ���� ��� ������ �̸��� ����ϼ���.
SELECT BOOKNAME
FROM BOOK
WHERE PRICE=(SELECT MAX(PRICE) FROM BOOK);
SELECT * FROM BOOK;

--[����] ������ ������ ���� �ִ� ���� �̸��� �˻��ϼ���.
SELECT NAME
FROM CUSTOMER
WHERE CUSTID IN (SELECT CUSTID FROM ORDERS);
--[����] ���ѹ̵��� ������ ������ ������ ���� �̸��� ����ϼ���.
SELECT NAME
FROM CUSTOMER
WHERE CUSTID IN (SELECT CUSTID FROM ORDERS
WHERE BOOKID IN (SELECT BOOKID FROM BOOK
WHERE PUBLISHER = '���ѹ̵��'));

SELECT employee_id, last_name, salary, hire_date,
TRUNC(((to_date('20201231') - hire_date)/365))�ټӿ���,
(WIDTH_BUCKET(TRUNC(((to_date('20.12.31') - hire_date)/365)),0,20,30)-1)*1000 bonus
FROM employees
ORDER BY bonus DESC;

--�����Լ�
SL