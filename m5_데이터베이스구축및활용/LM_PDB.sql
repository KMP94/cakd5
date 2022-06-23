select 제휴사,count(경쟁사) 경쟁사방문횟수 from compet group by 제휴사;

SELECT 고객번호, 멤버십명 FROM MEMBERSHIP
WHERE 고객번호 = ANY(SELECT 고객번호 FROM MEMBERSHIP GROUP BY 고객번호 HAVING COUNT(고객번호) > 1);

SELECT COUNT(COUNT(고객번호))"멤버십 고객수" FROM MEMBERSHIP
GROUP BY 고객번호
HAVING COUNT(고객번호) =ANY(1,2,3,4);

select 제휴사,count(*) from channel group by 제휴사;

select 제휴사,count(*) 누적이용횟수 from channel group by 제휴사;

select 거주지역, 성별, 연령대, count(c.고객번호), sum(구매금액) 
from custdemo c,purprod p where c.고객번호=p.고객번호
group by 거주지역, 성별, 연령대 order by 거주지역;

CREATE TABLE 번호제휴성별연도건수매출 AS
SELECT P.고객번호, 제휴사, C.성별, YEAR, COUNT(P.고객번호) "구매건수", sum(구매금액) "매출"
FROM PURPROD P, CUSTDEMO C
WHERE P.고객번호 = C.고객번호
GROUP BY P.고객번호, 제휴사, C.성별, YEAR
ORDER BY P.고객번호, C.성별;

SELECT a.고객번호, a.제휴사, B.성별, 연령대, 거주지역, 경쟁사이용횟수AN
FROM
(SELECT 고객번호, 제휴사, COUNT(경쟁사) "경쟁사이용횟수", SUBSTR(이용년월, 0, 4) "YEAR" FROM COMPET
GROUP BY 고객번호, 제휴사, SUBSTR(이용년월, 0, 4)
ORDER BY 고객번호) a,
(SELECT * FROM 번호제휴성별연도건수매출
WHERE YEAR = 2015) b,
CUSTDEMO C
WHERE a.고객번호 = b.고객번호 AND a.제휴사 = b.제휴사 AND a.고객번호 = c.고객번호 AND B.성별 = C.성별;

