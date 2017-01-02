#名称：成绩分布
#描述：作为一名教师，在成绩录入后，为了解学生成绩的分布情况，我可以获得按分数段分布的直方图，或者表格。

Feature:成绩分布
  As a teacher
  In order to 了解学生成绩的分布情况
  I want to 我可以获得按分数段分布的直方图，或者表格
  
  Scenario:显示成绩分布直方图
    Given 处于成绩管理页面
    And 选择一门课程"计算机算法"
    When 选择成绩分布
    And 以直方图的形式
    Then 显示成绩分布直方图
    

  
  Scenario:显示成绩分布表格
    Given 处于成绩管理页面
    And 选择一门课程"软件工程"
    When 选择成绩分布
    And 以表格的形式
    Then 显示成绩表格