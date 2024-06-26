

-- 1) 학생중에 동명이인을 검색한다
-- SELECT DISTINCT s.sno, s.sname
--     FROM student s, student n
--     WHERE s.sname=n.sname AND s.sno!=n.sno
--     ORDER BY s.sname;


SELECT DISTINCT s2.sno, s2.sname
 FROM student s1, student s2
 WHERE s1.sno!=s2.sno
  AND s1.sname=s2.sname;


-- 2) 전체 교수 명단과 교수가 담당하는 과목의 이름을 학과 순으로 검색한다
-- SELECT p.section, p.pno, p.pname, c.pno, c.cname
--     FROM professor p, course c
--     WHERE p.pno=c.pno
--     ORDER BY p.section;

SELECT section, pname, cname
 FROM professor p, course c
 WHERE p.pno=c.pno(+)
 ORDER BY section;

-- 3) 이번 학기 등록된 모드 과목과 담당 교수의 학점 순으로 검색한다
-- SELECT c.st_num, c.cname, p.pname
--     FROM course c, professor p
--     WHERE c.pno=p.pno(+)
--     ORDER BY c.st_num;

SELECT c.cno, cname, st_num, pname
 FROM professor p, course c
 WHERE p.pno(+)=c.pno
 ORDER BY st_num;

