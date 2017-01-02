
# 还没实现，猜测，，

Feature:评价授课教师
  
  As a student
  In order to教务处对这门课的授课教师有一个基础了解，及老师能够及时得到来自学生的反馈。
  I want to 可以在课程过半之后，能够对授课教师进行评价
  
  Scenario:进入评价教师界面
    Given 以学生身份登陆
    When 进入教师评估页面
    Then 显示已选课程的教师的评估列表
    

  Scenario:评价教师teacher1
    Given 以学生身份登陆
    And 进入教师评估页面
    When 点击teacher1教师后面的评估
    Then 进入教师评估页面

  Scenario:提交评估结果失败
    Given 在teacher1教师评估页面
    And 不填写教师评估的任何内容
    When 当点击提交按钮
    Then 显示评估不能为空提示框
    

  Scenario:提交评估结果成功
    Given 在teacher1教师评估页面
    And 填写教师评估所有内容
    When 当点击提交按钮
    Then 显示评估提交成功
    
    
 Scenario:取消评估
    Given 在teacher1教师评估页面
    When 当点击取消按钮
    Then 返回教师评估界面
    
  