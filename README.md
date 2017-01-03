# CourseSelect

这个系统是基于https://github.com/PENGZhaoqing/CourseSelect 的继续开发

本项目已部署在heroku平台上[演示Demo戳这里](https://hrcourseselect.herokuapp.com)

### 截图

<img src="/lib/screenshot01.png" width="700">  



<img src="/lib/screenshot02.png" width="700">



<img src="/lib/screenshot03.png" width="700">   



## 说明

目前使用的库和数据库：

* 使用[Bootstrap](http://getbootstrap.com/)作为前端库
* 使用[Rails_admin Gem](https://github.com/sferik/rails_admin)作为后台管理
* 使用[Postgresql](http://postgresapp.com/)作为数据库

使用前需要安装Bundler，Gem，Ruby，Rails等依赖环境。

请根据本地系统下载安装[postgresql](https://devcenter.heroku.com/articles/heroku-postgresql#local-setup)数据库，并运行`psql -h localhost`检查安装情况。


## 安装

在终端（MacOS或Linux）中执行以下代码

```
$ git clone https://github.com/PENGZhaoqing/CourseSelect
$ cd CourseSelect
$ bundle install
$ rake db:migrate
$ rake db:seed
$ rails s 
```

在浏览器中输入`localhost:3000`访问主页



## 多人开发协作

fork后，同步我的代码：

添加源

```
git remote add upstream https://github.com/hrwhisper/CourseSelect
git remote -v
```

git remote -v 后，应该出现我的地址。

然后

```
git fetch upstream
git merge upstream/master
```

每次同步代码后，可以执行如下重新构建一下数据库（若rake db:migrate 不行的话，那就加上reset）

```
rake db:migrate:reset
rake db:seed
```

由于可能加了新的包，所以最好还要
```
bundle install
```

更新自己的github仓库（git push)

最后通过pull request即可。





##使用

1.学生登陆：

账号：`student1@test.com`

密码：`password`

2.老师登陆：

账号：`teacher1@test.com`

密码：`password`


3.管理员登陆：

账号：`admin@test.com`

密码：`password`

账号中数字都可以替换成2,3...等等


## Heroku云部署

项目可直接在Heroku上免费部署

1.fork此项目到自己Github账号下

2.创建Heroku账号以及Heroku app

3.将Heroku app与自己Github下的fork的项目进行连接

4.下载配置[Heroku CLI](https://devcenter.heroku.com/articles/heroku-command-line)命令行工具

5.运行`heroku login`在终端登陆，检查与heroku app的远程连接情况`git config --list | grep heroku`，若未检查到相应的app，请看[这里](http://stackoverflow.com/questions/5129598/how-to-link-a-folder-with-an-existing-heroku-app)

6.运行部署，详情[请戳这里](https://devcenter.heroku.com/articles/getting-started-with-rails4#rails-asset-pipeline)

我的部署实例：

```
heroku create hrcourseselect
git push heroku master
heroku run rake db:migrate
heroku run rake db:seed
```








## 测试

本项目包含了部分的测试（integration/fixture/model test），测试文件位于/test目录下。运行测试：

```
PENG-MacBook-Pro:IMS_sample PENG-mac$ rake test
Run options: --seed 15794

# Running:
.........

Finished in 1.202169s, 7.4865 runs/s, 16.6366 assertions/s.

9 runs, 20 assertions, 0 failures, 0 errors, 0 skips
```

###cucumber
```
运行准备：
rails generate cucumber:install capybara
rails generate cucumber_rails_training_wheels:install
rails generate rspec:install
rake db:test:prepare
运行：
cucumber (全部执行)
cucumber features/XX.feature (执行XX测试，.feature文件在features文件夹下)
```

## 添加的功能

1. ~~课表实时显示~~
2. ~~课表功能~~
3. ~~首页查看开放的课程（不需登录）~~
4. ~~查看选自己课的学生学生信息~~
5. ~~学生信息统计可视化~~
6. ~~管理员在首页发公告~~
7. ~~通过学期、时间等筛选课程~~
8. ~~查看以往学期所授课程~~
9. ~~编辑、查看课程大纲~~
10. ~~选课时间限制~~
11. ~~选课人数限制-~~
12. ~~获取课程名单EXCEL表格~~
13. ~~Excel成绩导入~~
14. ~~课程评价~~
15. ~~课程成绩分布可视化~~
16. ~~每学期成绩分数统计~~
17. ~~总分数统计~~
18. ~~查询评估结果~~
19. ~~通知详情页~~
20. ~~Discuss功能~~
21. 评估结果可视化
22. GPA目标计算
23. 选课方式修改
24. 选课结果邮件通知




## 更新日志 ##
- 2016.12.29
  - excel 导出
  - bug修复
- 2016.12.28
  - 选课时间限制
  - 服务器后台验证选课时间限制
  - 服务器后台验证课程冲突
  - 修复提交空id导致的错误
  - 更新readme
  - 选课人数
- 2016.12.25
  - excel
  - 可以通过学期筛选课程
- 2016.12.21
  - 管理员首页可以发公告
- 2016.12.20
  - 删除student_num字段
  - 修复课程已选人数不对的bug
  - 教师页面看已经选的人数
  - 教师可以查看选课的学生名单
  - 研究所信息统计可视化
- 2016.12.19
  - 选课批量提交
  - 实时课表
- 2016.12.18
  - 课表功能
