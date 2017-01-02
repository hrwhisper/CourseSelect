Feature:查询目标分数
    As a student
    In order to 以便于我对自己的gpa进行规划，及对学习目标进行设定
    I want to在输入我想要达到的gpa和剩余学分的情况下，知道我之后的每门课需平均达到多少分，才能达到预期分数
    
    Scenario:查询目标分数
      Given 学生student1登录在成绩统计界面
      And 输入目标分数90
      And 输入总学分30
      When 我点击计算按钮
      Then 显示目前学分15
      And 显示目前平均分89
      And 显示剩下学分目标分数91
      

    Scenario:查询目标分数
      Given 学生student2登录在成绩统计界面
      And 输入目标分数85
      And 输入总学分30
      When 我点击计算按钮
      Then 显示目前学分10
      And 显示目前平均分70
      And 显示剩下学分目标分数90
      
    Scenario:查询目标分数
      Given 学生student3登录在成绩统计界面
      And 输入目标分数85
      And 输入总学分30
      When 我点击计算按钮
      Then 显示目前学分20
      And 显示目前平均分60
      And 显示无法满足目标