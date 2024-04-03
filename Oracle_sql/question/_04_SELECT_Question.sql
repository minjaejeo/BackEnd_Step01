
--1) 각 학생의 평점을 검색하라(별명을 사용)
SELECT sname 학생, avr 평점
	FROM student;

--2) 각 과목의 학점수를 검색하라(별명을 사용)
SELECT cname 과목, st_num 학점수
	FROM course;

--3) 각 교수의 지위를 검색하라(별명을 사용)
SELECT pname 교수, orders 지위
	FROM professor;

--4) 급여를 10%인상했을 때 연간 지급되는 급여를 검색하라(별명을 사용)
SELECT ename 이름, sal*1.1 "10%인상 급여"
	FROM emp;

--5) 현재 학생의 평균 평점은 4.0만점이다. 이를 4.5만점으로 환산해서 검색하라(별명을 사용)
SELECT sname 학생, ROUND(avr*1.125,2) "4.5만점 환산평점"
	FROM student;



