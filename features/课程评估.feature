Feature:评价课程
  As a student
  In order to 以便于教务处、老师对这门课的授课情况有一个基础了解。
  I want to 可以在课程过半之后，能够对课程进行评价，
  
  
  Scenario:进入评估课程页面
    Given 学生在我的课程界面
    When 我点击评估课程
    Then 显示课程评估界面
    

  Scenario:评估课程
    Given 学生student1登陆
    When 处于课程评估界面
    Then 显示已选课程的列表
    
  Scenario:计算机体系结构评估
    Given 学生student1登陆
    And 处于课程评估界面
    And 显示已选课程的列表
    When 点击计算机体系结构课程后的评估
    Then 显示 评估课程: 计算机体系结构
    
  Scenario:提交评估结果失败
    Given 在评估课程: 计算机体系结构界面
    And 不填写任何内容
    When 我点击提交按钮
    Then 显示不能为空提示框
    

  Scenario:提交评估结果成功
    Given 在评估课程: 计算机体系结构界面
    And 填写所有内容
    When 我点击提交按钮
    Then 显示提交成功
    
    
 Scenario:取消评估
    Given 在评估课程: 计算机体系结构界面
    When 我点击取消按钮
    Then 返回课程评估界面
    
    
    
 #还需要修改   