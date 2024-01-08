# 查询两门及其以上不及格课程的同学的学号，姓名及其平均成绩

# 查询不及格 => GROUP BY SId => SUM >= 2 => SELECT

SELECT * 
FROM Student AS s 
LEFT JOIN (
  SELECT SId, AVG(score) AS avg_score 
  FROM SC AS sc2 
  GROUP BY SId
) AS subquery ON s.SId = subquery.SId
WHERE s.SId IN (
  SELECT SId 
  FROM SC AS sc 
  GROUP BY SId 
  HAVING MAX(sc.score) < 60 AND COUNT(sc.SId) > 1
);
