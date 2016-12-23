<?php

namespace Home\Controller;



class IndexController

{



    public function index()

    {

    	//1.



    	//1.从一个json文件获取到一个数组

		//2.获取到一个provinceList,cityList,regionList

		//3.数组转存成文件



		//1.

    	//$arr = json_decode(file_get_contents('area.json'),true);

		

		//2.

    	/*$province = [];

    	$city = [];

    	$region = [];

        $str = "";



    	foreach ($arr as $key => $value) {



    		if($value['parentId'] == 1){



    			$province[] = $value['id'];



    		}else if($value['parentId'] > 1 && $value['parentId'] < 36){



				$city[$value['id']] = $value['parentId'];



    		}else if($value['parentId'] > 35){



    			$region[$value['id']] = [$value['parentId'], $city[$value['parentId']]];

    			$str .= $value['id'] ." => [". $value['parentId'].", ".$city[$value['parentId']]."],<br>";



    		}



    	}



    	print_r($str);*/

        var_dump('Hello World');

        return true;

    }

}

