Feature: 实时课表
  As a student
  In order to 选课的时候不希望提交的时候才说课程冲突
  I want to 能在勾选课程的时候，显示当前的实时课表，以提高选课时的体验和效率
  
  Scenario:选课时同步更新
    Given 尚未选课
    And 学生身份
    And 处于选课界面
    When 我添加一门课程"计算机体系结构"
    Then 实时课表显示这门课"计算机体系结构"
