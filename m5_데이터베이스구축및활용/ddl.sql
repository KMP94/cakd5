--[테이블 생성 규칙]

--테이블명은 객체를 의미할 수 있는 적절한 이름을 사용한다. 가능한 단수형을 권고한다.--
--테이블명은 다른 테이블의 이름과 중복되지 않아야 한다.--
--한 테이블 내에서는 칼럼명이 중복되게 지정될 수 없다. --
--테이블 이름을 지정하고 각 칼럼들은 괄호 "( )" 로 묶어 지정한다.--
--각 칼럼들은 콤마" ", 로 구분되고, 항상 끝은 세미콜론 ";"으로 끝난다.--
--칼럼에 대해서는 다른 테이블까지 고려하여 데이터베이스 내에서는 일관성 있게 사용하는 것이 좋다. (데이터 표준화 관점)--
--칼럼 뒤에 데이터 유형은 꼭 지정되어야 한다.--
--테이블명과 칼럼명은 반드시 문자로 시작해야 하고, 벤더별로 길이에 대한 한계가 있다.--
--벤더에서 사전에 정의한 예약어(Reserved word)는 쓸 수 없다.--
--A-Z, a-z, 0-9, _, $, # 문자만 허용된다.
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

INSERT INTO MEMBER(ID,PWD,TEXT)VALUES('200903','112','정치는 국민을 위해 존재한다');

--가존 테이블을 이용하여 새로운 테이블을 생성
CREATE TABLE MEMBER1 AS SELECT * FROM MEMBER;
SELECT * FROM MEMBER;

-- DESCRIBE 테이블 속성 조회
DESC MEMBER; 
--현재 존재하는 테이블의 목록
SELECT * FROM TABS; 

--ALTER
DESC MEMBER1;
--수정
ALTER TABLE MEMBER1 MODIFY(ID VARCHAR2(50), NAME NVARCHAR2(50));
--변경
ALTER TABLE MEMBER1 RENAME COLUMN BIRTHDAT TO BD;
--삭제
ALTER TABLE MEMBER1 DROP COLUMN AGE;
--추가
ALTER TABLE MEMBER1 ADD AGE NUMBER;

--기본키 설정
ALTER TABLE MEMBER1 ADD CONSTRAINT MEMBER1_PK PRIMARY KEY(ID);

--[과제] MEMBER2 테이블 생성한 후 수정, 변경, 삭제(경력소개서)
CREATE TABLE MEMBER2
(
COMPANY VARCHAR2(50),
INYEAR DATE,
OUTYEAR DATE,
TEL NUMBER(11),
LOCATION NCLOB
);
INSERT INTO MEMBER2 VALUES('CAKD5','2021/12/28','2022/6/8','01086036002','서울시마포구');
SELECT * FROM MEMBER2;
ALTER TABLE MEMBER2 RENAME COLUMN INDATE TO 입사일;
ALTER TABLE MEMBER2 RENAME COLUMN OUTDATE TO 퇴사일;
ALTER TABLE MEMBER2 ADD NAME VARCHAR2(20);
ALTER TABLE MEMBER2 ADD 전공 VARCHAR2(20);
UPDATE MEMBER2 SET COMPANY='블랙기업' WHERE COMPANY='CAKD5';
UPDATE MEMBER2 SET NAME='박광민' WHERE COMPANY ='블랙기업';

--테이블명 : PLAYER
--테이블 설명 : K-리그 선수들의 정보를 가지고 있는 테이블
--칼럼명 : PLAYER_ID (선수ID) 문자 고정 자릿수 7자리,
--PLAYER_NAME (선수명) 문자 가변 자릿수 20자리,
--TEAM_ID (팀ID) 문자 고정 자릿수 3자리,
--JOIN_YYYY (입단년도) 문자 고정 자릿수 4자리,
--POSITION (포지션) 문자 가변 자릿수 10자리,
--BACK_NO (등번호) 숫자 2자리,
--NATION (국적) 문자 가변 자릿수 20자리,
--BIRTH_DATE (생년월일) 날짜,
--제약조건 : 기본키(PRIMARY KEY) :  PLAYER_ID
--(제약조건명은 PLAYER_PK)
--값이 반드시 존재 (NOT NULL) : PLAYER_NAME, TEAM_ID
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