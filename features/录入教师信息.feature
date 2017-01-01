Feature: 录入教师信息
  In order to 对教师信息进行管理
  As a 管理员
  I want to 当教师入职的时候向教师名单中添加入职教师信息
  Scenario:新教师完成入职手续后他的信息应该被添加进数据库
    Given 以管理员身份登陆
    And 处于控制页面
    When 点击add按钮
    Then 进入录入教师信息页面
    
  Scenario:教师信息展示
    Given 以管理员身份登陆
    And 处于控制页面
    When 点击show按钮
    Then 查看教师详细信息
    
    
  Scenario:教师信息修改
    Given 以管理员身份登陆
    And 处于控制页面
    When 点击edit按钮
    Then 修改教师信息

  Scenario:教师历史信息展示
    Given 以管理员身份登陆
    And 处于控制页面
    When 点击history按钮
    Then 查看教师历史修改的详细信息
    

  Scenario:删除教师
    Given 以管理员身份登陆
    And 处于控制页面
    When 点击delete按钮
    Then 显示删除成功
  
    
     

    
