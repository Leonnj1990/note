# 使用Travis进行持续集成

---

### 持续集成

Continuous Integration，简称CI，意思是，在一个项目中，任何人对代码库的任何改动，都会触发CI服务器自动对项目进行构建，自动运行测试，甚至自动部署到测试环境。这样做的好处就是，随时发现问题，随时修复。因为修复问题的成本随着时间的推移而增长，越早发现，修复成本越低。

## 如何为GitHub上的开源项目用Travis CI进行持续集成

### Travis CI是什么?

Travis CI是在线托管的CI服务，使用yaml格式配置用于持续集成完成自动化测试部署的开源项目。

> 我用了GitHub，也有开源项目，现在怎么搞CI？

首先, 直接用你的**Github账号**登录Travis CI的网站: [https://travis-ci.org/](https://travis-ci.org/)

第一次登录时，授权给Travis访问你的GitHub代码库，然后，把需要CI的代码库选上：

