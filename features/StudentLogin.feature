Feature: 学生登录
  Scenario: 学生1登陆
    Given 在登录界面
    And  输入用户名为'student1@test.com'
    And 输入密码为'password'
    When 我单击登录按钮
    Then 我会成功登陆进入我的主页