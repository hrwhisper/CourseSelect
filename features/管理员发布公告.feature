
Feature: 管理员发布公告
  As a 管理员
  In order to 发布通知公告
  I want to 通知公告出现在网站主页当我发布它的时候
  
  Scenario: 新通知公告应该出现在网站主页
    Given 我要发布一条通知公告
    When 我在选课系统发布了公告
    Then 通知公告出现在公告栏上面
