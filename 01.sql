# 查询"01"课程比"02"课程成绩高的学生的信息及课程分数
SELECT * FROM 
  (SELECT SId, score FROM SC WHERE CId='01') AS t1, 
  (SELECT SId, score FROM SC WHERE CId='02') AS t2
WHERE t1.SId=t2.SId
AND t1.score>t2.score;

# 查询同时存在"01"课程和"02"课程的情况
SELECT s.SId, s.Sname, s.Sage, s.Ssex FROM Student AS s
  JOIN (SELECT SId, score FROM SC AS t1 WHERE CId='01') AS t1 ON s.SId = t1.SId
  JOIN (SELECT SId, score FROM SC AS t2 WHERE CId='02') AS t2 ON s.SId = t2.SId;

# 查询存在" 01 "课程但可能不存在" 02 "课程的情况(不存在时显示为 null)
SELECT s.SId, s.Sname, s.Sage, s.Ssex, t1.score, IFNULL(t2.score, 'null') FROM Student AS s
  JOIN (SELECT SId, score FROM SC AS t1 WHERE CId='01') AS t1 ON s.SId = t1.SId
  LEFT JOIN (SELECT SId, score FROM SC AS t2 WHERE CId='02') AS t2 ON s.SId = t2.SId;

# 查询不存在"01"课程但存在"02"课程的情况
SELECT * FROM Student AS s WHERE 
  s.SId IN(
    SELECT DISTINCT SId FROM SC WHERE CId = '02'
  ) 
  AND
  s.SId NOT IN(
    SELECT DISTINCT SId FROM SC WHERE CId = '01'
  )