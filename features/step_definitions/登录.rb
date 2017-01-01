When(/^I click login button$/) do
    #if(page.find("a[href='/sessions/login']"))
    #    click_on("登录")
    #end
    click_link("登录")
    # Write code here that turns the phrase above into concrete actions
end

Then(/^I will on the login page$/) do
    visit sessions_login_path
    # Write code here that turns the phrase above into concrete actions
end

Given(/^在登录界面$/) do
    visit sessions_login_path
    # Write code here that turns the phrase above into concrete actions
end

Given(/^输入姓名为"([^"]*)"$/) do |arg1|
    #fill_in "session_email" with arg1
    fill_in "session_email", :with => arg1
    # Write code here that turns the phrase above into concrete actions
end

Given(/^输入密码"([^"]*)"$/) do |arg1|
    #fill_in "session_password" with arg1
    fill_in "session_password", :with => arg1
    
    # Write code here that turns the phrase above into concrete actions
end

When(/^我单击登录按钮$/) do
    find('button').click
    # Write code here that turns the phrase above into concrete actions
end

Then(/^以学生身份返回首页$/) do
    visit root_path
    # Write code here that turns the phrase above into concrete actions
end

Then(/^以教师身份返回首页$/) do
    visit root_path
    # Write code here that turns the phrase above into concrete actions
end

Then(/^以管理员身份返回首页$/) do
    visit root_path
    # Write code here that turns the phrase above into concrete actions
end