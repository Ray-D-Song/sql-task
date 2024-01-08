# 查询没有学全所有课程的同学的信息

# SUM
SELECT * FROM Student AS s WHERE s.SId NOT IN (
  SELECT sc.SId FROM SC AS sc
    GROUP BY sc.SId
    HAVING COUNT(sc.CId) = (SELECT count(CId) from Course)
);