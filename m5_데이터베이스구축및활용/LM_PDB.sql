select ���޻�,count(�����) �����湮Ƚ�� from compet group by ���޻�;

SELECT ����ȣ, ����ʸ� FROM MEMBERSHIP
WHERE ����ȣ = ANY(SELECT ����ȣ FROM MEMBERSHIP GROUP BY ����ȣ HAVING COUNT(����ȣ) > 1);

SELECT COUNT(COUNT(����ȣ))"����� ����" FROM MEMBERSHIP
GROUP BY ����ȣ
HAVING COUNT(����ȣ) =ANY(1,2,3,4);

select ���޻�,count(*) from channel group by ���޻�;

select ���޻�,count(*) �����̿�Ƚ�� from channel group by ���޻�;

select ��������, ����, ���ɴ�, count(c.����ȣ), sum(���űݾ�) 
from custdemo c,purprod p where c.����ȣ=p.����ȣ
group by ��������, ����, ���ɴ� order by ��������;

CREATE TABLE ��ȣ���޼��������Ǽ����� AS
SELECT P.����ȣ, ���޻�, C.����, YEAR, COUNT(P.����ȣ) "���ŰǼ�", sum(���űݾ�) "����"
FROM PURPROD P, CUSTDEMO C
WHERE P.����ȣ = C.����ȣ
GROUP BY P.����ȣ, ���޻�, C.����, YEAR
ORDER BY P.����ȣ, C.����;

SELECT a.����ȣ, a.���޻�, B.����, ���ɴ�, ��������, ������̿�Ƚ��AN
FROM
(SELECT ����ȣ, ���޻�, COUNT(�����) "������̿�Ƚ��", SUBSTR(�̿���, 0, 4) "YEAR" FROM COMPET
GROUP BY ����ȣ, ���޻�, SUBSTR(�̿���, 0, 4)
ORDER BY ����ȣ) a,
(SELECT * FROM ��ȣ���޼��������Ǽ�����
WHERE YEAR = 2015) b,
CUSTDEMO C
WHERE a.����ȣ = b.����ȣ AND a.���޻� = b.���޻� AND a.����ȣ = c.����ȣ AND B.���� = C.����;

