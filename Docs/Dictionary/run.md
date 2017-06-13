#git

###git clone "项目地址"

* git status 
* git branch dev 创建dev分支
* git checkout dev  切换dev分支

###cd 项目  启动项目

* ./smart start  
* ./smart composer 
* 添加 config.php（复制configtest.php即可）
* 修改 config.php 数据库名，去掉_text
* 添加Compile文件到 View/Smarty   mkdir Compile
* 设置权限 chmod  o+w Compile 
* 创建数据库（对照database文件）

###每次查看最新代码  启动项目  

* git pull 拉取代码到本地  
* 执行

####部署到服务器

* git checkout master
* git merge dev
* git push origin master 
* git reset --hard 版本  回滚
* git push -f 强制提交

###后端服务层

* docker-compose up -d  安装+启动
* docker-compose ps  查看编排工具容器状态
* docker exec -it [company.api.qixinyun.com-phpfpm] /bin/bash  执行
* composer install  安装composer
* phpdbg -qrr ./vendor/bin/phpunit --coverage-html ./目录  生成测试报告
* exit  退出容器
* docker-compose stop  停止
* php marmot.php autoCreate 自动创建文件
* php marmot.php cacheClear 清理缓存
* smart 检测代码
* .git/hooks/pre-commit 加钩子
* docker ps  查看服务
* vendor/bin/phpcs --report-full 错误信息报告
* phpcs忽略检测
	* // @codingStandardsIgnoreLine
	* // @codingStandardsIgnoreStart @codingStandardsIgnoreEnd
* docker logs -f company.api.qixinyun.com-nginx 查看服务器日志
* tail -f test/testpost 实时跟踪文件 
* 接收数据流 System\Classes\Request;  getRawBody()
	* file_put_contents('/var/www/html/test/testpost', $this->rawBody.PHP_EOL, FILE_APPEND);
* 媒体协议 
	* 'haders'=>['Content-Type' => 'application/vnd.api+json']
###gzip
	// $response = $client->request('GET', 'products',
	//   [
	//    'headers'        => ['Accept-Encoding' => 'gzip','Content-' => 'application/vnd.api+json'],
	//     'decode_content' => 'gzip', //正常
	//     // 'query'       => ['filter'=>['userId'=>1,'status'=>0,'name'=>'北京'],
	//     //            'page'=>['number'=>1,'size'=>1]
	//     //           ]
	//   ]
	// );

	// $response = $client->request('GET', 'products',
	//   [
	//    'headers'        => ['Accept-Encoding' => 'gzip','Content-' => 'application/vnd.api+json'],
	//     'decode_content' => false, //乱码
	//     // 'query'       => ['filter'=>['userId'=>1,'status'=>0,'name'=>'北京'],
	//     //            'page'=>['number'=>1,'size'=>1]
	//     //           ]
	//   ]
	// );

* curl -H "Accept-Encoding: gzip,deflate" -w %{size_download} 地址
	* -H 头部


###guzzle 并行、串行请求

* 并行

		$client = new GuzzleHttp\Client();
		
		$requests = function ($total) {
		    $uri = 'http://127.0.0.1:8004/';
		    for ($i = 0; $i < $total; $i++) {
		        yield new GuzzleHttp\Psr7\Request('GET', $uri);
		    }
		};
		
		$pool = new GuzzleHttp\Pool($client, $requests(5), [
		    'concurrency' => 5,
		    'fulfilled' => function ($response, $index) {
		        // this is delivered each successful response
		        // var_dump('index:'.$index);
		        // echo PHP_EOL;
		        var_dump($index);
		        echo PHP_EOL;
		    },
		    'rejected' => function ($reason, $index) {
		        // this is delivered each failed request
		    },
		]);
		
		// Initiate the transfers and create a promise
		$promise = $pool->promise();
		
		// Force the pool of requests to complete.
		$promise->wait();

