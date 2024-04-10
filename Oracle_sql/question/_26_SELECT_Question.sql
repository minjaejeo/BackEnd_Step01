

-- <단일 행 함수를 이용하세요>

-- 1) 교수들이 부임한 달에 근무한 일수는 몇 일인지 검색하세요
-- SELECT pname, TRUNC(sysdate - hiredate)
--     FROM professor;
SELECT pno, pname, hiredate,
        LAST_DAY(TRUNC(hiredate))-TRUNC(hiredate)+1
 FROM professor;


-- 2) 교수들의 오늘까지 근무한 주가 몇 주인지 검색하세요
-- SELECT pname, TRUNC((sysdate - hiredate)/7) 
--     FROM professor;
SELECT pno, pname, TRUNC((sysdate-hiredate+1)/7)
 FROM professor;


-- 3) 1991년에서 1995년 사이에 부임한 교수를 검색하세요
-- SELECT pname, hiredate
--     FROM professor
--     WHERE hiredate BETWEEN TO_DATE('1991-01-01', 'YYYY-MM-DD') AND TO_DATE('1995-12-31', 'YYYY-MM-DD');

SELECT pno, pname, hiredate
 FROM professor
 WHERE TO_CHAR(hiredate, 'YYYY/MM/DD') BETWEEN '1991/01/01' AND '1995/12/31';



-- 4) 학생들의 4.5 환산 평점을 검색하세요(단 소수 이하 둘째자리까지)
-- SELECT sname, ROUND(avr*1.125, 2)
--     FROM student;

SELECT sno, sname ,ROUND(avr*4.5/4.0, 2)
 FROM student;

