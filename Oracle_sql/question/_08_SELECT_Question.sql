
-- 1) 성적순으로 학생의 이름을 검색하라
-- SELECT sname, avr
--     FROM student
--     ORDER BY avr DESC;

SELECT avr, sno, sname
 FROM student
 ORDER BY avr;


-- 2) 학과별 성적순으로 학생의 정보를 검색하라
-- SELECT major, sname, avr
--     FROM student
--     ORDER BY major, avr DESC;

SELECT major, sno, sname, avr
 FROM student
 ORDER BY major, avr DESC;

-- 3) 학년별 성적순으로 학생의 정보를 검색하라
-- SELECT syear, sname, avr
--     FROM student
--     ORDER BY syear, avr DESC;
SELECT syear, sno, sname, avr
 FROM student
 ORDER BY syear, avr DESC;

-- 4) 학과별 학년별로 학생의 정보를 성적순으로 검색하라
-- SELECT major, syear, sname, avr
--     FROM student
--     ORDER BY major, syear, avr DESC;
SELECT major, syear, sno, sname, avr
 FROM student
 ORDER BY major, syear, avr DESC;

-- 5) 학점순으로 과목 이름을 검색하라
-- SELECT st_num, cname
--     FROM course
--     ORDER BY st_num DESC;
SELECT cname, st_num
 FROM course
 ORDER BY st_num;


-- 6) 각 학과별로 교수의 정보를 검색하라
-- SELECT section, pname
--     FROM professor
--     ORDER BY section;
SELECT section, pno, pname, hiredate, orders
 FROM professor
 ORDER BY section;


-- 7) 지위별로 교수의 정보를 검색하라
-- SELECT orders, pname
--     FROM professor
--     ORDER BY orders;
SELECT orders, pno, pname, hiredate, section
 FROM professor
 ORDEr BY orders;


-- 8) 각 학과별로 교수의 정보를 부임일자 순으로 검색하라
-- SELECT section, pname, hiredate
--     FROM professor
--     ORDER BY section, hiredate DESC;

SELECT section, orders, hiredate, pno, pname
 FROM professor
 ORDER BY section, hiredate;