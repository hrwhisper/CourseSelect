
Feature: 选课时间限制
  As a 管理员
  In order to 对选课时间进行管理
  I want to 在不同的时间对选课操作进行控制
  
  Scenario:选课时间应该开放选课权限
    Given 到了规定的选课时间
    And 选课权限没有开放
    When 我开放选课权限
    Then 学生可以进行选课操作
  
  Scenario:选课时间终止应该关闭选课权限
    Given  选课时间终止
    And 选课权限开放着
    When  我关闭选课权限
    Then 学生不可以再进行选课操作
