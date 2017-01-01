Feature: Homepage
As a product manager
I want our users to be greeted when they visit our site
So that they have a better experience


Scenario: User sees the login message
When I am on the homepage
Then I should see 登录

Scenario: User sees the register message
When I am on the homepage
Then I should see 注册
  
Scenario: User sees the notice message
When I am on the homepage 
Then I should see 公告
  
Scenario: User sees the courses message
When I am on the homepage 
Then I should see 开放的课程