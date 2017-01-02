
#-----------------------------实时课表----------------------------#

Given(/^尚未选课$/) do
    # Write code here that turns the phrase above into concrete actions
end

Given(/^学生身份$/) do
    # Write code here that turns the phrase above into concrete actions
end

Given(/^处于选课界面$/) do
    # Write code here that turns the phrase above into concrete actions
end

When(/^我添加一门课程"([^"]*)"$/) do |arg1|
    # Write code here that turns the phrase above into concrete actions
end

Then(/^实时课表显示这门课"([^"]*)"$/) do |arg1|
    # Write code here that turns the phrase above into concrete actions
end


Given(/^参加选课的学生student(\d+)$/) do |arg1|
#  pending # Write code here that turns the phrase above into concrete actions
end

When(/^进入课表界面$/) do
#  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^显示课表$/) do
#  pending # Write code here that turns the phrase above into concrete actions
end


#-----------------------------邮件通知----------------------------#

Given(/^学生"([^"]*)"参加选课$/) do |arg1|
    # Write code here that turns the phrase above into concrete actions
end

When(/^选课时间结束，(\d+)月(\d+)号下午(\d+)点$/) do |arg1, arg2, arg3|
    # Write code here that turns the phrase above into concrete actions
end

Then(/^发送邮件给选课学生"([^"]*)"$/) do |arg1|
    # Write code here that turns the phrase above into concrete actions
end

#-----------------------------成绩页面----------------------------#


Given(/^在我的课程界面$/) do
    # Write code here that turns the phrase above into concrete actions
end

When(/^我点击所有成绩页面$/) do
    # Write code here that turns the phrase above into concrete actions
end

Then(/^显示成绩页面$/) do
    # Write code here that turns the phrase above into concrete actions
end

#-----------------------------成绩统计----------------------------#


When(/^我点击所有成绩统计$/) do
    # Write code here that turns the phrase above into concrete actions
end

Then(/^显示成绩分布图$/) do
    # Write code here that turns the phrase above into concrete actions
end

#---------------------------查询目标分数--------------------------#

Given(/^学生student(\d+)登录在成绩统计界面$/) do |arg1|
#  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^输入目标分数(\d+)$/) do |arg1|
#  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^输入总学分(\d+)$/) do |arg1|
#  pending # Write code here that turns the phrase above into concrete actions
end

When(/^我点击计算按钮$/) do
#  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^显示目前学分(\d+)$/) do |arg1|
#  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^显示目前平均分(\d+)$/) do |arg1|
#  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^显示剩下学分目标分数(\d+)$/) do |arg1|
#  pending # Write code here that turns the phrase above into concrete actions
end


Then(/^显示无法满足目标$/) do
#  pending # Write code here that turns the phrase above into concrete actions
end


#-----------------------------课程评估----------------------------#



Given(/^学生在我的课程界面$/) do
#  pending # Write code here that turns the phrase above into concrete actions
end

When(/^我点击评估课程$/) do
#  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^显示课程评估界面$/) do
#  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^学生student(\d+)登陆$/) do |arg1|
#  pending # Write code here that turns the phrase above into concrete actions
end

When(/^处于课程评估界面$/) do
#  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^显示已选课程的列表$/) do
#  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^处于课程评估界面$/) do
#  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^显示已选课程的列表$/) do
#  pending # Write code here that turns the phrase above into concrete actions
end

When(/^点击计算机体系结构课程后的评估$/) do
#  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^显示 评估课程: 计算机体系结构$/) do
#  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^在评估课程: 计算机体系结构界面$/) do
#  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^不填写任何内容$/) do
#  pending # Write code here that turns the phrase above into concrete actions
end

When(/^我点击提交按钮$/) do
#  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^显示不能为空提示框$/) do
#  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^填写所有内容$/) do
#  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^显示提交成功$/) do
#  pending # Write code here that turns the phrase above into concrete actions
end

When(/^我点击取消按钮$/) do
#  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^返回课程评估界面$/) do
#  pending # Write code here that turns the phrase above into concrete actions
end



#-----------------------------教师评估----------------------------#



Given(/^以学生身份登陆$/) do
#  pending # Write code here that turns the phrase above into concrete actions
end

When(/^进入教师评估页面$/) do
#  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^显示已选课程的教师的评估列表$/) do
#  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^进入教师评估页面$/) do
#  pending # Write code here that turns the phrase above into concrete actions
end

When(/^点击teacher(\d+)教师后面的评估$/) do |arg1|
#  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^进入教师评估页面$/) do
#  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^在teacher(\d+)教师评估页面$/) do |arg1|
#  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^不填写教师评估的任何内容$/) do
#  pending # Write code here that turns the phrase above into concrete actions
end

When(/^当点击提交按钮$/) do
#  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^显示评估不能为空提示框$/) do
#  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^填写教师评估所有内容$/) do
#  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^显示评估提交成功$/) do
#  pending # Write code here that turns the phrase above into concrete actions
end

When(/^当点击取消按钮$/) do
#  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^返回教师评估界面$/) do
#  pending # Write code here that turns the phrase above into concrete actions
end


#------------------------所有课程不登录可显示-----------------------#


When(/^在首页$/) do
#  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^查看所有的课程列表$/) do
#  pending # Write code here that turns the phrase above into concrete actions
end


#----------------------------课程分类显示---------------------------#


Given(/^课程查询页面$/) do
    # Write code here that turns the phrase above into concrete actions
end

When(/^选择以学期分类$/) do
    # Write code here that turns the phrase above into concrete actions
end

When(/^选择(\d+)冬季学期$/) do |arg1|
    # Write code here that turns the phrase above into concrete actions
end

Then(/^显示满足(\d+)冬季学期条件的所有课程$/) do |arg1|
    # Write code here that turns the phrase above into concrete actions
end

When(/^选择以学生分类$/) do
    # Write code here that turns the phrase above into concrete actions
end

When(/^选择研究生$/) do
    # Write code here that turns the phrase above into concrete actions
end

Then(/^显示满足研究生条件的所有课程$/) do
    # Write code here that turns the phrase above into concrete actions
end

When(/^选择以时间分类$/) do
    # Write code here that turns the phrase above into concrete actions
end

When(/^选择星期一的课程$/) do
    # Write code here that turns the phrase above into concrete actions
end

Then(/^显示满足星期一条件的所有课程$/) do
    # Write code here that turns the phrase above into concrete actions
end

When(/^选择(\d+)\-(\d+)节的课程$/) do |arg1, arg2|
    # Write code here that turns the phrase above into concrete actions
end

Then(/^显示满足(\d+)\-(\d+)节条件的所有课程$/) do |arg1, arg2|
    # Write code here that turns the phrase above into concrete actions
end



When(/^点击计算机体系结构后面课程大纲按钮$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^进入计算机体系结构课程大纲页面$/) do
  pending # Write code here that turns the phrase above into concrete actions
end


#-----------------------------课程讨论----------------------------#


Given(/^在课程页面$/) do
#  pending # Write code here that turns the phrase above into concrete actions
end

When(/^点击某一课程后，进入课程详情页面$/) do
#  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^显示discuss$/) do
#  pending # Write code here that turns the phrase above into concrete actions
end

