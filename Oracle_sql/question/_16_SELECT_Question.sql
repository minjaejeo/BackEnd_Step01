
-- 1) 송강 교수가 강의하는 과목을 검색한다
-- SELECT cname, pname
--     FROM professor, course
--     WHERE professor.pno=course.pno
--         AND pname='송강';

SELECT p.pno, pname, cno, cname
 FROM professor p, course c
 WHERE p.pno=c.pno
  AND pname='송강';

-- 2) 화학 관련 과목을 강의하는 교수의 명단을 검색한다
-- SELECT cname, pname
--     FROM course, professor
--     WHERE course.pno=professor.pno
--         AND cname LIKE '%화학%';

SELECT pname, cname
 FROM professor p , course c
 WHERE p.pno=c.pno
  AND cname LIKE '%화학%';


-- 3) 학점이 2학점인 과목과 이를 강의하는 교수를 검색한다
-- SELECT cname, st_num, pname
--     FROM course, professor
--     WHERE course.pno=professor.pno
--         AND st_num='2';

SELECT pname
 FROM professor p, course c
 WHERE p.pno=c.pno
 AND st_num=2;

-- 4) 화학과 교수가 강의하는 과목을 검색한다
-- SELECT pname, section, cname
--     FROM professor, course
--     WHERE professor.pno=course.pno
--         AND section='화학';

SELECT cname
 FROM professor p, course c
 WHERE p.pno=c.pno
 AND section='화학';


-- 5) 화학과 1학년 학생의 기말고사 성적을 검색한다
SELECT major, syear, result
    FROM student, score
    WHERE student.sno=score.sno
        AND major='화학' AND syear='1'
    ORDER BY 3 DESC;

-- 6) 일반화학 과목의 기말고사 점수를 검색한다
-- SELECT cname, result
--     FROM course, score
--     WHERE course.cno=score.cno
--         AND cname='일반화학'
--     ORDER BY 2 DESC;

SELECT sno,result
 FROM course c, score r
 WHERE c.cno=r.cno
 AND cname='일반화학';


-- 7) 화학과 1학년 학생의 일반화학 기말고사 점수를 검색한다
-- SELECT major, syear, cname, result
--     FROM student, course, score
--     WHERE student.sno=score.sno
--         AND major='화학' AND syear='1' AND cname LIKE '일반화학'
--     ORDER BY 4 DESC;

SELECT major, syear, result
 FROM student s, course c, score r
 WHERE s.sno=r.sno AND c.cno=r.cno
 AND major='화학' AND syear=1 AND cname='일반화학';

-- 8) 화학과 1학년 학생이 수강하는 과목을 검색한다
-- SELECT major, syear, cname
--     FROM student, course, score
--     WHERE student.sno=score.sno
--         AND major='화학' AND syear='1';

SELECT DISTINCT cname
 FROM student s, course c, score r
 WHERE s.sno=r.sno AND c.cno=r.cno
 AND major='화학' AND syear=1;


-- 9) 유기화학 과목의 평가점수가 F인 학생의 명단을 검색한다
-- SELECT cname, grade, result, sname
--     FROM student, course, score, scgrade
--     WHERE student.sno=score.sno AND result BETWEEN loscore AND hiscore
--         AND cname='유기화학' AND grade='F';

SELECT cname, sname, result, grade
 FROM student s, course c, score r, scgrade g
 WHERE s.sno=r.sno AND c.cno=r.cno
 AND result BETWEEN loscore AND hiscore
 AND cname='유기화학' AND grade='F';

