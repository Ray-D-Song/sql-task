# 查询 SC 表存在成绩的学生信息
# 对 SId 字段进行去重

SELECT * FROM Student AS s
  WHERE s.SId IN
    (SELECT DISTINCT SId FROM SC);

SELECT DISTINCT s.*
from Student s, SC sc
WHERE s.SId = sc.SId;