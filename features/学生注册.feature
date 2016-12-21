Feature: 学生注册
  Scenario: 学生注册失败
    Given 在注册界面
    And 注册姓名为"student1"
    And 用户名为空
    When 我单击注册按钮
    Then 返回注册失败信息有误
