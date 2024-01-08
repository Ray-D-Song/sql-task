# 获取平均分
# 根据学生 id 分组
# 将查询结果和学生表内联


SELECT s.SId, s.Sname, t.avg_score from Student as s
  INNER JOIN
    (SELECT SId, AVG(score) AS avg_score FROM SC GROUP BY SId HAVING avg_score >= 60) AS t
  ON s.SId = t.SId

