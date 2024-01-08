# 查询和"01"号的同学学习的课程完全相同的其他同学的信息
select a.* from student a where a.SId in
  (
    select distinct SId from sc where SId!='01' and CId in
      (select CId from sc where SId='01')
    group by SId having count(1) = (select count(1) from sc where SId='01')
  )

