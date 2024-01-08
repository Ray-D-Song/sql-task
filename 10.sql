# 查询没学过张三老师课的学生信息
# 查询上过的
SELECT s.* FROM Student AS s WHERE s.SId NOT IN (
  SELECT DISTINCT sc.SId FROM SC AS sc, Course AS c, Teacher AS t WHERE
    sc.CId = c.CId
    AND c.TId = t.TId
    AND t.Tname = '张三'
)