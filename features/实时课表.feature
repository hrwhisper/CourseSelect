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


#名称：课表功能
#描述：作为一个学生，当我进入选课系统在选课期间，我每选择了一门课，系统自动为我实时的产生一个课表，让我对我的上课时间有更清晰的把握。


  Scenario:课表功能
    Given 参加选课的学生student1
    When 进入课表界面
    Then 显示课表