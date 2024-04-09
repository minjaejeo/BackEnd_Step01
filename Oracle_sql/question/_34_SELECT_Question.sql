
-- <서브 쿼리를 사용하세요>


-- 1) 관우보다 평점이 우수한 학생의 학번과 이름을 검색하세요

SELECT AVG(avr)
 FROM student
 WHERE sname='관우';

SELECT sno, sname, AVG(avr)
 FROM student
 GROUP BY sno, sname
 HAVING AVG(avr) > (SELECT AVG(avr)
                     FROM student
                     WHERE sname='관우');

-- 2) 관우와 동일한 학년 학생 중에 평점이 사마감과 동일한 학생을 검색하세요
SELECT syear
 FROM student
 WHERE sname='관우';

SELECT AVG(avr)
 FROM student
 WHERE sname='사마감';

SELECT syear, sname, AVG(avr)
 FROM student
 WHERE syear=(SELECT syear
                FROM student
                WHERE sname='관우')
 GROUP BY syear, sname
 HAVING AVG(avr)=(SELECT AVG(avr)
                    FROM student
                    WHERE sname='사마감');


-- 3) 관우보다 일반 화학과목의 학점이 더 낮은 학생의 명단을 학점과 검색하세요

SELECT result
 FROM student
 JOIN score USING(sno)
 JOIN course USING(cno)
 WHERE sname='관우';

SELECT cname
 FROM course
 WHERE cname='일반화학';

SELECT sno, sname, result
 FROM student
 WHERE result < (SELECT result
                    FROM student
                    JOIN score USING(sno)
                    WHERE sname='관우')
        AND cname=(SELECT cname
                    FROM course
                    WHERE cname='일반화학')
 GROUP BY sno, sname;

-- 4) 인원수가 가장 많은 학과를 검색하세요

SELECT major, COUNT(*)
 FROM student
 GROUP BY major;

SELECT major
 FROM student
 GROUP BY major
 HAVING COUNT(*)=(SELECT MAX(COUNT(*))
                    FROM student
                    GROUP BY major);

-- 5) 학생 중 기말고사 성적이 가장 낮은 학생의 정보를 검색하세요
SELECT result
 FROM student
 JOIN score USING(sno);


SELECT sno, result
 FROM student
 JOIN score USING(sno)
 GROUP BY sno
 HAVING result=(SELECT MIN(result)
                FROM student
                JOIN score USING(sno)
                GROUP BY sno);

