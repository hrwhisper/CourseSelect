Then(/^I should see 登录$/) do
    expect(page).to have_content("登录")
    # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see 注册$/) do
    expect(page).to have_content("注册")
    # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see 公告$/) do
    expect(page).to have_content("公告")
    # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see 开放的课程$/) do
    expect(page).to have_content("开放的课程")
    # Write code here that turns the phrase above into concrete actions
end
