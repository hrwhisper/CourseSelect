Feature: 注册
  Scenario: 学生注册因为信息不全注册失败
    Given 在注册界面
    And 注册姓名为"student1"
    And 用户名为空
    When 我单击注册按钮
    Then 返回注册失败信息有误


  Scenario: 学生注册因为密码不同失败
    Given 在注册界面
    And 注册姓名为"venny"
    And 用户名为"venny@test.com"
    And 密码为"password"
    And 确定密码为"password222"
    When 我单击注册按钮
    Then 返回注册失败信息有误

  Scenario: 学生注册成功
    Given 在注册界面
    And 注册姓名为"venny"
    And 用户名为"venny@test.com"
    And 密码为"password"
    And 确定密码为"password"
    When 我单击注册按钮
    Then 返回注册成功