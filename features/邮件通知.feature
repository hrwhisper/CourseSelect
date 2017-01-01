Feature: 邮件通知
  As a student
  In order to 方便确定选课
  I want to 在选课结束后能及时的被告知的结果（如通过邮件的方式)
  
  Scenario:选课结束收到邮件通知
    Given 学生"student1"参加选课
    When 选课时间结束，1月5号下午5点
    Then 发送邮件给选课学生"student1"
    
