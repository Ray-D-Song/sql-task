# 查询学过“张三”老师授课的同学的信息

# 嵌套子查询更容易产生性能问题, 应当显式 join
SELECT * FROM Student WHERE SId IN (
  SELECT DISTINCT SId FROM SC WHERE CId = (
    SELECT CId FROM Course WHERE TId = 
      (SELECT TId FROM Teacher WHERE Tname = '张三')
  )
);

SELECT s.* FROM
  Student as s,
  Teacher as t,
  Course as c,
  SC as sc
WHERE
  s.sid = sc.sid
  AND sc.CId = c.CId
  AND c.TId = t.Tid
  AND t.Tname = '张三';
