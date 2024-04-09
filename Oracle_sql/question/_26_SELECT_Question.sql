

-- <단일 행 함수를 이용하세요>

-- 1) 교수들이 부임한 달에 근무한 일수는 몇 일인지 검색하세요
SELECT pname, TRUNC(sysdate - hiredate)
    FROM professor;

-- 2) 교수들의 오늘까지 근무한 주가 몇 주인지 검색하세요
SELECT pname, TRUNC((sysdate - hiredate)/7) 
    FROM professor;

-- 3) 1991년에서 1995년 사이에 부임한 교수를 검색하세요
SELECT pname, hiredate
    FROM professor
    WHERE hiredate BETWEEN TO_DATE('1991-01-01', 'YYYY-MM-DD') AND TO_DATE('1995-12-31', 'YYYY-MM-DD');

-- 4) 학생들의 4.5 환산 평점을 검색하세요(단 소수 이하 둘째자리까지)
SELECT sname, ROUND(avr*1.125, 2)
    FROM student;

