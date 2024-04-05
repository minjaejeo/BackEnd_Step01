--NATURAL JOIN / USING 절로 해결

-- 1) 송강 교수가 강의하는 과목을 검색한다
SELECT pname, cname
    FROM professor
    NATURAL JOIN course
    WHERE pname='송강'; 

SELECT pname, cname
    FROM professor
    JOIN course USING(pno)
    WHERE pname='송강';

-- 2) 화학 관련 과목을 강의하는 교수의 명단을 검색한다
SELECT cname, pname
    FROM professor
    NATURAL JOIN course
    WHERE cname LIKE '%화학%';

SELECT cname, pname
    FROM professor
    JOIN course USING(pno)
    WHERE cname LIKE '%화학%';

-- 3) 학점이 2학점인 과목과 이를 강의하는 교수를 검색한다
SELECT cname, st_num, pname
    FROM professor
    NATURAL JOIN course
    WHERE st_num=2;

SELECT cname, st_num, pname
    FROM professor
    JOIN course USING(pno)
    WHERE st_num=2;

-- 4) 화학과 교수가 강의하는 과목을 검색한다
SELECT section, pname, cname
    FROM professor
    NATURAL JOIN course
    WHERE section='화학';

SELECT section, pname, cname
    FROM professor
    JOIN course USING(pno)
    WHERE section='화학';

-- 5) 화학과 1학년 학생의 기말고사 성적을 검색한다
SELECT major, syear, sname, result
    FROM student
    NATURAL JOIN score
    WHERE major='화학' 
        AND syear=1
    ORDER BY result;

SELECT major, syear, sname, result
    FROM student
    JOIN score USING(sno)
    WHERE major='화학'
        AND syear='1'
    ORDER BY result;

-- 6) 일반화학 과목의 기말고사 점수를 검색한다
SELECT cname, result
    FROM course
    NATURAL JOIN score
    WHERE cname='일반화학'
    ORDER BY result;

SELECT cname, result
    FROM course
    JOIN score USING(cno)
    WHERE cname='일반화학'
    ORDER By result;

-- 7) 화학과 1학년 학생의 일반화학 기말고사 점수를 검색한다
SELECT major, syear, sname, cname, result
    FROM student
    NATURAL JOIN score
    NATURAL JOIN course
    WHERE major='화학' 
        AND syear=1
        AND cname='일반화학'
    ORDER BY result;

SELECT major, syear, sname, cname, result
    FROM student
    JOIN score USING(sno)
    JOIN course USING(cno)
    WHERE major='화학'
        AND syear=1
        AND cname='일반화학'
    ORDER BY result;

-- 8) 화학과 1학년 학생이 수강하는 과목을 검색한다
SELECT major, syear, sname, cname
    FROM student
    NATURAL JOIN score
    NATURAL JOIN course
    WHERE major='화학'
        AND syear=1
    ORDER BY sname;

SELECT major, syear, sname, cname
    FROM student
    JOIN score USING(sno)
    JOIN course USING(cno)
    WHERE major='화학'
     AND syear=1
    ORDER BY sname; 