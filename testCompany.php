<?php

require '../vendor/autoload.php';
$client = new GuzzleHttp\Client(['base_uri' => 'http://139.224.65.141:8003/']);
// $client = new GuzzleHttp\Client(['base_uri' => 'http://127.0.0.1/']); 


$response = $client->request('GET', 'companies/1',['haders'=>['Content-' => 'application/vnd.api+json']]);
// $response = $client->request('GET', 'companies/1,2',['haders'=>['Content-' => 'application/vnd.api+json']]);
// $response = $client->request('GET', 'companies?filter[name]='.urlencode('三三').'&page[number]=1&page[size]=1',['haders'=>['Content-' => 'application/vnd.api+json']]);

//添加
$data = array('data'=>array('type'=>'companies',
							'attributes'=>array('name'=>'企业名称'.rand(1,100),
												"certificate"=>"xxxxx",
												"principalRealName"=>"张三".rand(1,100),
												"principalIdentifyCardNumber"=>"610103198310301218",
												"province"=>20,
												"city"=>30,
												"region"=>40,
												"uid"=>1
												),
							)
			);
$response = $client->request('POST', 'companies',
	[
	'haders'=>['Content-' => 'application/vnd.api+json'],
	'json' => $data,
	]);
//添加

//审核
// $response = $client->request('PUT', 'companies/1/confirm',
// 	[
// 	'haders'=>['Content-' => 'application/vnd.api+json']
// 	]);
//审核

$body = $response->getBody();
echo '<pre>';
$contents = $body->getContents();
var_dump($contents);