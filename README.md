# CourseSelect

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
$ git clone https://github.com/hrwhisper/CourseSelect
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



## 原系统功能

这个系统是基于https://github.com/PENGZhaoqing/CourseSelect 的继续开发

- 多角色登陆（学生，老师，管理员）
- 学生选课（不能批量），退课
- 老师动态增加，删除课程
- 老师对课程下的学生添加、修改成绩（不能导入、只能一个个改）
- 权限控制：老师和学生只能看到自己相关课程信息





## 本系统添加的功能

1. 课程开放、关闭
2. 批量选课
3. 课表实时显示
4. 课表功能
5. 首页查看开放的课程（不需登录）
6. 查看选自己课的学生学生信息
7. 学生信息统计可视化
8. 管理员在首页发公告
9. 通过学期、时间等筛选课程
10. 查看以往学期所授课程
11. 编辑、查看课程大纲
12. 选课时间限制
13. 选课人数限制
14. 获取课程名单EXCEL表格
15. Excel成绩导入
16. 课程评价
17. 课程成绩分布可视化
18. 每学期成绩分数统计
19. 总分数统计
20. 查询评估结果
21. 通知详情页
22. 课程悄悄话功能
23. 评估结果可视化





## Future work

1. 富文本编辑器
2. GPA目标计算
3. 选课方式修改 -积分选课
4. 选课结果邮件通知
