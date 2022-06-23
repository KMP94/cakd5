--[���̺� ���� ��Ģ]

--���̺���� ��ü�� �ǹ��� �� �ִ� ������ �̸��� ����Ѵ�. ������ �ܼ����� �ǰ��Ѵ�.--
--���̺���� �ٸ� ���̺��� �̸��� �ߺ����� �ʾƾ� �Ѵ�.--
--�� ���̺� �������� Į������ �ߺ��ǰ� ������ �� ����. --
--���̺� �̸��� �����ϰ� �� Į������ ��ȣ "( )" �� ���� �����Ѵ�.--
--�� Į������ �޸�" ", �� ���еǰ�, �׻� ���� �����ݷ� ";"���� ������.--
--Į���� ���ؼ��� �ٸ� ���̺���� ����Ͽ� �����ͺ��̽� �������� �ϰ��� �ְ� ����ϴ� ���� ����. (������ ǥ��ȭ ����)--
--Į�� �ڿ� ������ ������ �� �����Ǿ�� �Ѵ�.--
--���̺��� Į������ �ݵ�� ���ڷ� �����ؾ� �ϰ�, �������� ���̿� ���� �Ѱ谡 �ִ�.--
--�������� ������ ������ �����(Reserved word)�� �� �� ����.--
--A-Z, a-z, 0-9, _, $, # ���ڸ� ���ȴ�.
select * from tabs;
CREATE TABLE MEMBER
(
ID VARCHAR2(50),
PWD VARCHAR2(50),
NAME VARCHAR2(50),
GENDER NCHAR(2),
AGE NUMBER(3),
BIRTHDAT VARCHAR2(50),
PHONE VARCHAR2(13),
REGDATE DATE
);
INSERT INTO MEMBER(ID,PWD,NAME)VALUES('200901','111','JAMES');

DROP TABLE MEMBER;

INSERT INTO MEMBER VALUES('200902','111','JAMES','M',29,'01-JAN-99','010-1234-2345','1994/05/02');

ALTER TABLE MEMBER ADD TEXT NCLOB;

INSERT INTO MEMBER(ID,PWD,TEXT)VALUES('200903','112','��ġ�� ������ ���� �����Ѵ�');

--���� ���̺��� �̿��Ͽ� ���ο� ���̺��� ����
CREATE TABLE MEMBER1 AS SELECT * FROM MEMBER;
SELECT * FROM MEMBER;

-- DESCRIBE ���̺� �Ӽ� ��ȸ
DESC MEMBER; 
--���� �����ϴ� ���̺��� ���
SELECT * FROM TABS; 

--ALTER
DESC MEMBER1;
--����
ALTER TABLE MEMBER1 MODIFY(ID VARCHAR2(50), NAME NVARCHAR2(50));
--����
ALTER TABLE MEMBER1 RENAME COLUMN BIRTHDAT TO BD;
--����
ALTER TABLE MEMBER1 DROP COLUMN AGE;
--�߰�
ALTER TABLE MEMBER1 ADD AGE NUMBER;

--�⺻Ű ����
ALTER TABLE MEMBER1 ADD CONSTRAINT MEMBER1_PK PRIMARY KEY(ID);

--[����] MEMBER2 ���̺� ������ �� ����, ����, ����(��¼Ұ���)
CREATE TABLE MEMBER2
(
COMPANY VARCHAR2(50),
INYEAR DATE,
OUTYEAR DATE,
TEL NUMBER(11),
LOCATION NCLOB
);
INSERT INTO MEMBER2 VALUES('CAKD5','2021/12/28','2022/6/8','01086036002','����ø�����');
SELECT * FROM MEMBER2;
ALTER TABLE MEMBER2 RENAME COLUMN INDATE TO �Ի���;
ALTER TABLE MEMBER2 RENAME COLUMN OUTDATE TO �����;
ALTER TABLE MEMBER2 ADD NAME VARCHAR2(20);
ALTER TABLE MEMBER2 ADD ���� VARCHAR2(20);
UPDATE MEMBER2 SET COMPANY='�����' WHERE COMPANY='CAKD5';
UPDATE MEMBER2 SET NAME='�ڱ���' WHERE COMPANY ='�����';

--���̺�� : PLAYER
--���̺� ���� : K-���� �������� ������ ������ �ִ� ���̺�
--Į���� : PLAYER_ID (����ID) ���� ���� �ڸ��� 7�ڸ�,
--PLAYER_NAME (������) ���� ���� �ڸ��� 20�ڸ�,
--TEAM_ID (��ID) ���� ���� �ڸ��� 3�ڸ�,
--JOIN_YYYY (�Դܳ⵵) ���� ���� �ڸ��� 4�ڸ�,
--POSITION (������) ���� ���� �ڸ��� 10�ڸ�,
--BACK_NO (���ȣ) ���� 2�ڸ�,
--NATION (����) ���� ���� �ڸ��� 20�ڸ�,
--BIRTH_DATE (�������) ��¥,
--�������� : �⺻Ű(PRIMARY KEY) :  PLAYER_ID
--(�������Ǹ��� PLAYER_PK)
--���� �ݵ�� ���� (NOT NULL) : PLAYER_NAME, TEAM_ID
CREATE TABLE PLAYER(
PLAYER_ID NCHAR(7),
PLAYER_NAME VARCHAR(20) NOT NULL,
TEAM_ID NCHAR(3) NOT NULL,
JOIN_YYYY NCHAR(4),
POSITION VARCHAR(10),
BACK_NO NUMBER(2),
NATION VARCHAR(20),
BIRTH_DATE DATE
CONSTRAINT PLAYER_PK PRIMARY KEY(PLAYER_ID);
);
DROP TABLE PLAYER;
DESC PLAYER;