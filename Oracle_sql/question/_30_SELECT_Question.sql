
-- 1) 3학년 학생의 학과별 평점 평균과 분산 및 편차를 검색하세요
SELECT syear, AVG(avr) "평점 평균", VARIANCE(avr) 분산, STDDEV(avr) 편차
   FROM student
   WHERE syear=3
   GROUP BY syear;



-- 2) 화학과 학년별 평균 평점을 검색하세요
SELECT major, AVG(avr)
   FROM student
   WHERE major='화학'
   GROUP BY major;


-- 3) 각 학생별 기말고사 평균을 검색하세요
SELECT sname, AVG(result)
   FROM student
   JOIN score USING(sno)
   GROUP BY sname;



-- 4) 각 학과별 학생 수를 검색하세요
SELECT DISTINCT major, COUNT(sno)
   FROM student
   GROUP BY major;

-- 5) 화학과와 생물학과 학생 4.5 환산 평점의 평균을 각각 검색하세요

SELECT major, AVG(avr*4.5/4.0)
   FROM student
   WHERE major='화학' AND major='생물'
   GROUP BY major;

-- 6) 부임일이 10년 이상 된 직급별(정교수, 조교수, 부교수) 교수의 수를 
--    검색하세요
SELECT orders, COUNT(pname)
 FROM emp
 WHERE (sysdate-hiredate) >= 10
 GROUP BY orders;



-- 7) 과목명에 화학이 포함된 과목의 학점수 총합을 검색하세요
SELECT cname, SUM(st_num)
 FROM course
 WHERE cname LIKE '%화학%'
 GROUP BY cname;

-- 8) 화학과 학생들의 기말고사 성적을 성적순으로 검색하세요
SELECT major, sname, result
 FROM student
 JOIN score USING(sno)
 WHERE major='화학'
 ORDER BY result;



-- 9) 학과별 기말고사 평균을 성적순으로 검색하세요
SELECT major, AVG(result)
 FROM student
 JOIN score USING(sno)
 GROUP BY major
 ORDER BY 2;
