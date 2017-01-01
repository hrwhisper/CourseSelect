Feature: 入学信息录入学生名单
  As a 管理员
  In order to 对学生信息进行管理
  I want to 学生增加将其信息录入学生名单
  
  Scenario:新生入学时将其信息录入学生名单
    Given 以管理员身份登陆
    And 处于控制页面
    When 点击add按钮
    Then 进入录入学生信息页面
    
  Scenario:学生信息展示
    Given 以管理员身份登陆
    And 处于控制页面
    When 点击show按钮
    Then 查看学生详细信息
    
    
  Scenario:学生信息修改
    Given 以管理员身份登陆
    And 处于控制页面
    When 点击edit按钮
    Then 修改学生信息

  Scenario:学生历史信息展示
    Given 以管理员身份登陆
    And 处于控制页面
    When 点击history按钮
    Then 查看学生历史修改的详细信息
    

  Scenario:删除学生
    Given 以管理员身份登陆
    And 处于控制页面
    When 点击delete按钮
    Then 显示删除成功
  