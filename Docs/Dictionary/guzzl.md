<?php

namespace Company;



require '../vendor/autoload.php';

use GuzzleHttp;



 //$client = new GuzzleHttp\Client(['base_uri' => 'http://139.224.65.141:8003/']);

 //$client = new GuzzleHttp\Client(['base_uri' => 'http://127.0.0.1/']);



$client = new GuzzleHttp\Client();

		



		$requests = function ($total)  {



			$services = array('knowledgeProperties', 'clearInfos', 'insepections', 'equityChanges');

			foreach ($services as $kay => $value) {

				$uri = 'http://139.224.65.141:8003/'.$value;

				/*yield function() use ($client, $uri) {

                    return $client->getAsync($uri);

                };*/



			    yield new GuzzleHttp\Psr7\Request('GET', $uri);

			}

		    

		};

		

		$pool = new GuzzleHttp\Pool($client, $requests(4), [

		    'concurrency' => 4,

		    'fulfilled' => function ($response, $index) {

		        // this is delivered each successful response

		        // var_dump('index:'.$index);

		        // echo PHP_EOL;

		        //var_dump($index);

		        //echo PHP_EOL;

		        $res = $response->getBody()->getContents();

		        var_dump($res);

		        //var_dump("index".$index.':'.$res);

		    },

		    'rejected' => function ($reason, $index) {

		        // this is delivered each failed request

		        var_dump($index);

		    },

		]);

		

		// Initiate the transfers and create a promise

		$promise = $pool->promise();

		

		// Force the pool of requests to complete.

		$promise->wait();


/*$status = $response->getStatusCode();

$body = $response->getBody();

$contents = $body->getContents();

//edit -- 结束



echo "<pre>";

print_r($status);

print_r($contents);*/