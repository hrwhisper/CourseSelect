Feature: 登录
  Scenario: 进入登录页面
    Given I am on the homepage
    When I click login button
    Then I will on the login page
    
  Scenario: 学生登录
    Given 在登录界面
    And 输入姓名为"student1@test.com"
    And 输入密码"password"
    When 我单击登录按钮
    Then 以学生身份返回首页

  Scenario: 教师登录
    Given 在登录界面
    And 输入姓名为"teacher1@test.com"
    And 输入密码"password"
    When 我单击登录按钮
    Then 以教师身份返回首页
    
  Scenario: 管理员登录
    Given 在登录界面
    And 输入姓名为"admin@test.com"
    And 输入密码"password"
    When 我单击登录按钮
    Then 以管理员身份返回首页