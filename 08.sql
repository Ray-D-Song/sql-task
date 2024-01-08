# 查询至少有一门课与学号为"01"的同学所学相同的同学的信息

# 学号 01 的同学学了啥
-- SELECT CId FROM SC WHERE SId = '01';

# 除了 学号 01, 其他学了这些课的学生 SId
SELECT * FROM Student WHERE SId IN (
  SELECT DISTINCT SId FROM SC WHERE CId IN
    (SELECT CId FROM SC WHERE SId = '01')
    AND
    (SId != '01')
);