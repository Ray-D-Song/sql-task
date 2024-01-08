# 查询所有同学的学生编号、学生姓名、选课总数、所有课程的总成绩(没成绩的显示为 null )
SELECT s.SId, s.Sname, IFNULL(sc.count, 0), IFNULL(sc.sum, 0) FROM 
  Student AS s
    LEFT JOIN
  (SELECT SId, COUNT(SId) AS count, SUM(score) AS sum FROM SC GROUP BY SId) AS sc
    ON s.SId = sc.SId;

# 带有成绩的学生信息
SELECT *
FROM STUDENT AS s
WHERE SId IN
  (SELECT SId FROM SC);