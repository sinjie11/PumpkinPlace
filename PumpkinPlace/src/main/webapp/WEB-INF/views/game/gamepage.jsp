<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<META http-equiv="Expires" content="-1">
<META http-equiv="Pragma" content="no-cache">
<META http-equiv="Cache-Control" content="No-Cache">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=0, user-scalable=no, target-densitydpi=medium-dpi" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" /> -->
<title>Insert title here</title>

</head>
<body>
	<canvas id="canvas" width="1440" height="2960"></canvas>
	<script>
	var user_id = '${loginId}';
	if(user_id != null)
		user_id;
	else
		user_id = 'guest';
		/* Init */ //asd
		var user_Id = "";
		var result_Score = 0;
	
		var run = "main";
		var resources = "${pageContext.request.contextPath}/resources/images/";
		var image_Detail = "detail/";
		var image_Item = "item/";
		var image_Ui = "ui/";
		var image_Heart = "heart/";
		var png = ".png";
		var cvs = document.getElementById('canvas');
		var ctx = cvs.getContext('2d');
	
		var friend_list = new Array();
		var sot_list = new Array();
		var sot_select_fornt = "pot_fornt";
		var sot_select_back = "pot_back";
		
		var tube_heart = new Image();
		var peulodo_heart = new Image();
		var jeiji_heart = new Image();
		var eopichi_heart = new Image();
		var mujicon_heart = new Image();
		
		var tube_alive = true;
		var peulodo_alive = false;
		var jeiji_alive = false;
		var eopichi_alive = false;
		var mujicon_alive = false;
		
		var tube_break = true;
		var peulodo_break = true;
		var jeiji_break = true;
		var eopichi_break = true;
		var mujicon_break = true; 
		
		tube_heart.src =    resources + image_Heart + "heart0" + png;  
		peulodo_heart.src = resources + image_Heart + "heart0" + png;
		jeiji_heart.src =   resources + image_Heart + "heart0" + png;
		eopichi_heart.src = resources + image_Heart + "heart0" + png;
		mujicon_heart.src = resources + image_Heart + "heart0" + png;
		
		var upgrade_cnt = 0;
		var shopRun = false;
		var coinText = 0;
		var scoreText = 0;
		var result_Score = 0;
		var clickX = 0;
		var clickY = 0;
		var dir = -1;
		var speed = 1;
		var pickY = 1900;
		var fanX = 410;
		var thermometerY = 650;
		var thermometerSize = -90; //MAX = 400;
		var thermometerSpeed = 0.001;
		var isPressed = false;
		var buy_State = false;
		var need_coin = 0;
		var buff_Cnt = 0;
		var buff_time = false;
		var player_costume = 0;
		var player_fan_item = 0;
		var sot_change = "";
	
		var start_bg = new Image();
		var bg = new Image();
		var title = new Image();
		var player = new Image();
		var fire = new Image();
		var firewood = new Image();
		var tent = new Image();
		var shop = new Image();
		var shopmenu = new Image();
		var upgrade = new Image();
		var btn_buff = new Image();
		var gauge = new Image();
		var sot_fornt = new Image();
		var sot_back = new Image();
		var thermometer1 = new Image();
		var thermometer2 = new Image();
		var thermometer3 = new Image();
		var thermometercheck = new Image();
		var frame = new Image();
		var coin = new Image();
		var start = new Image();
		var pick = new Image();
		var fan = new Image();
		var end = new Image();
		var btn_Buy = new Image();
		var btn_character = new Image();
		var show_item = new Image();
		var select_item = "init_item";
		var select_view = "init_item";
		var canvs_width = 0;
		var canvs_height = 0;
		var fan_anim = false;
		var chaein_fornt = new Image();
		var chaein_back = new Image();
		var frient_tube = new Image();
		var frient_eopichi = new Image();
		var frient_peulodo = new Image();
		var frient_jeiji = new Image();
		var frient_mujicon = new Image();
		var end_bg = new Image();
		var sold_image = new Image();
		var retry_image = new Image();
		
		/* Images Setting */
		//UI Images
		start_bg.src = resources + image_Ui + "start_bg" + png;
		start.src = resources + image_Ui + "start" + png;
		bg.src = resources + image_Ui + "bg" + png; // BackGround Image
		title.src = resources + image_Ui + "title" + png;
		fire.src = resources + image_Ui + "fire1" + png; // Fire Image
		firewood.src = resources + image_Ui + "firewood" + png;
		tent.src = resources + image_Ui + "tent" + png; // Tent Image
		gauge.src = resources + image_Ui + "gauge" + png; // Gauge Image
		sot_fornt.src = resources + image_Item + sot_select_fornt + png; // sot_fornt Image
		sot_back.src = resources + image_Item + sot_select_back + png; // sot_fornt Image
		thermometer1.src = resources + image_Ui + "thermometer1" + png;
		thermometer2.src = resources + image_Ui + "thermometer2" + png;
		thermometer3.src = resources + image_Ui + "thermometer3" + png;
		thermometercheck.src = resources + image_Ui + "thermometercheck" + png;
		frame.src = resources + image_Ui + "frame" + png;
		coin.src = resources + image_Ui + "coin" + png;
		pick.src = resources + image_Ui + "pick" + png;
		end.src = resources + image_Ui + "end" + png;
		shop.src = resources + image_Ui + "shop" + png;
		shopmenu.src = resources + image_Ui + "shopmenu" + png;
		btn_Buy.src = resources + image_Ui + "btn_BuyUp" + png;
		btn_buff.src = resources + image_Ui + "buff_Disabled" + png; // buff Image
		chaein_fornt.src = resources + image_Ui + "chaein_fornt" + png;
		chaein_back.src = resources + image_Ui + "chaein_back" + png;
		end_bg.src = resources + image_Ui + "end_bg" + png;
		sold_image.src = resources + image_Ui + "sold_image" + png;
		retry_image.src = resources + image_Ui + "retry_image" + png
		//Item Images
		player.src = resources + image_Item + "player1" + png; // Player Image
		fan.src = resources + image_Item + "fan1" + png;
		frient_eopichi.src = resources + image_Item + "eopichi_happy" + png;
		frient_peulodo.src = resources + image_Item + "peulodo_happy" + png;
		frient_jeiji.src = resources + image_Item + "jeiji_happy" + png;
		frient_mujicon.src = resources + image_Item + "mujicon_happy" + png;
		frient_tube.src = resources + image_Item + "tube_happy" + png;
		//Detail Iagmes
		show_item.src = resources + image_Detail + select_view + png;
		btn_character.src = resources + image_Detail + image_Detail + png;
		//ETC
		upgrade.src = resources + "upgrade1" + png; // updgrade Image
	
	
		/* cvs.addEventListener('click', clickController);
		cvs.addEventListener('onmouseup', upController);
		cvs.addEventListener('onmousedown', downController);
		cvs.addEventListener('onmouseout', mouseOutController); */
	
		cvs.onmousedown = function(event) {
			//isPressed = true;
			//doInterval('1', event);
			downController(event);
		};
		/* 		cvs.onmouseup = function(event) {
					//isPressed = false;
					//doInterval('-1', event);
					upController(event);
				} */
		cvs.onmouseout = function(event) {
			mouseOutController(event);
		}
		cvs.onclick = function(event) {
			clickController(event);
		}
		function resize() {
			var ratio = canvas.width / canvas.height;
			if (window.innerHeight / window.innerWidth <= 2.05) {
				var height = window.innerHeight;
				var width = height * ratio;
				cvs.style.width = width + 'px';
				cvs.style.height = height - 30 + 'px';
			} else {
				var width = window.innerWidth;
				var height = width / ratio;
				cvs.style.width = width + 'px';
				cvs.style.height = height - 30 + 'px';
			}
			canvs_width = parseFloat(parseInt(cvs.style.width) / parseInt(cvs.width)).toFixed(2);
			canvs_height = parseFloat(parseInt(cvs.style.height) / parseInt(cvs.height)).toFixed(2);
	
		}
		window.addEventListener('load', resize, false);
		window.addEventListener('resize', resize, false);
	
		function init() {
			for (var i = 0; i < 4; i++) {
				friend_list[i] = false;
				console.log("friend_list[" + i + "] : " + friend_list[i]);
			}
			for (var i = 0; i < 2; i++) {
				sot_list[i] = false;
				console.log("sot_list[" + i + "] : " + sot_list[i]);
			}
			sot_select_fornt = "pot_fornt";
			sot_select_back = "pot_back";
			sot_change = 0;
			thermometerSpeed = 0.001;
			shopRun = false;
			coinText = 0;
			scoreText = 0;
			clickX = 0;
			clickY = 0;
			dir = -1;
			speed = 1;
			pickY = 1900;
			fanX = 410;
			thermometerY = 650;
			thermometerSize = -90; //MAX = 400;
			isPressed = false;
			buy_State = false;
			need_coin = 0;
			buff_Cnt = 0;
			//ctx.clearRect(0, 0, 1440, 2960);
			//UI
			bg.src = resources + image_Ui + "bg" + png; // BackGround Image
			title.src = resources + image_Ui + "title" + png;
			fire.src = resources + image_Ui + "fire1" + png; // Fire Image
			firewood.src = resources + image_Ui + "firewood" + png;
			tent.src = resources + image_Ui + "tent" + png; // Tent Image
			player.src = resources + image_Item + "player1" + png; // Player Image
			upgrade.src = resources + "upgrade1" + png; // updgrade Image
			btn_buff.src = resources + image_Ui + "buff_Disabled" + png; // buff Image
			gauge.src = resources + image_Ui + "gauge" + png; // Gauge Image
			thermometer1.src = resources + image_Ui + "thermometer1" + png;
			thermometer2.src = resources + image_Ui + "thermometer2" + png;
			thermometer3.src = resources + image_Ui + "thermometer3" + png;
			thermometercheck.src = resources + image_Ui + "thermometercheck" + png;
			frame.src = resources + image_Ui + "frame" + png;
			coin.src = resources + image_Ui + "coin" + png;
			start.src = resources + image_Ui + "start" + png;
			pick.src = resources + image_Ui + "pick" + png;
			fan.src = resources + image_Item + "fan1" + png;
			end.src = resources + image_Ui + "end" + png;
			shop.src = resources + image_Ui + "shop" + png;
			shopmenu.src = resources + image_Ui + "shopmenu" + png;
			btn_Buy.src = resources + image_Ui + "btn_BuyUp" + png;
	
			//Item
			btn_character.src = resources + image_Detail + select_item + png;
			show_item.src = resources + image_Detail + select_view + png;
			//ETC
			sot_fornt.src = resources + image_Ui + sot_select_fornt + png; // sot_fornt Image
			sot_back.src = resources + image_Ui + sot_select_back + png
			player_fan_item = 0;
			player_costume = 0;
			
			tube_heart.src =    resources + image_Heart + "heart0" + png;  
			peulodo_heart.src = resources + image_Heart + "heart0" + png;
			jeiji_heart.src =   resources + image_Heart + "heart0" + png;
			eopichi_heart.src = resources + image_Heart + "heart0" + png;
			mujicon_heart.src = resources + image_Heart + "heart0" + png;
			
			tube_break = true;
			peulodo_break = true;
			jeiji_break = true;
			eopichi_break = true;
			mujicon_break = true; 
		}
	
		/* 		function doInterval(action, event) {
					if (isPressed) {
						downController(event);
						setTimeout(function() {
							doInterval(action, event);
						}, 200);
					}
				} */
	
		function mouseOutController(event) { //캔버스 밖으로 나갈때만 적용??? 왜지???
			console.log("mouseOutController");
			if ((event.offsetX <= 50 * canvs_width && event.offsetX >= 330 * canvs_width) && (event.offsetY <= 2620 * canvs_height && event.offsetY >= 2900 * canvs_height)) {
				upgrade.src = resources + "upgrade1" + png;
			}
			if (event.offsetX <= 330 * canvs_width && event.offsetX >= 630 * canvs_width && event.offsetY <= 2620 * canvs_height && event.offsetY >= 2900 * canvs_height) {
				if (buff_Cnt >= 1) {
					btn_buff.src = resources + image_Ui + "buff_Up" + png;
				} else {
					btn_buff.src = resources + image_Ui + "buff_Disabled" + png;
				}
			}
		}
	
		//function clickController(event) {
		function upController(event) {
			//console.log("clickController");
			if (run == "run" && !shopRun) {
				console.log("mouse up");
				if (event.offsetX <= 330 * canvs_width && event.offsetX >= 630 * canvs_width && event.offsetY <= 2620 * canvs_height && event.offsetY >= 2900 * canvs_height) {
					if (buff_Cnt > 0) {
						btn_buff.src = resources + image_Ui + "buff_Up" + png;
						buff_time = true;
						buff_Cnt--;
						console.log("buff_cnt -- : ", buff_Cnt);
					} else {
						btn_buff.src = resources + image_Ui + "buff_Disabled" + png;
					}
				}
			}
		}
	
		//function upController(event) {
		function clickController(event) {
			//console.log("mouse up");
			console.log("clickController");
			if (run == "main") {
				init();
				run = "run";
			}
			if (run == "result") {//357, 2560
				if (event.offsetX >= 357 * canvs_width && event.offsetX <= 1083 * canvs_width && event.offsetY >= 2560 * canvs_height && event.offsetY <= 2832 * canvs_height) {
					run = "main";
				}
			}
				
			if (run == "run" && !shopRun) {
				upgrade.src = resources + "upgrade1" + png;
				btn_Buy.src = resources + image_Ui + "btn_BuyUp" + png;
				if (run == "run" && !shopRun) {
					if (event.offsetX >= 135 * canvs_width && event.offsetX <= 535 * canvs_width && event.offsetY >= 2280 * canvs_height && event.offsetY <= 2480 * canvs_height) {
						console.log("shop open");
						shopRun = true;
						need_coin = 0;
					}
				}
				if (event.offsetX >= 520  * canvs_width && event.offsetX <= 840 * canvs_width && event.offsetY >= 790 * canvs_height && event.offsetY <= 1130 * canvs_height) {
					
					/* if(tube_alive && !tube_break){
						var i = 1;
						if(i < 6){
							setInterval(function() {	
								if(i < 6){ 
							
								tube_heart.src = resources + image_Heart + "heart" + i + png;
								console.log("tube_heart.src : " + tube_heart.src);
								i++;
								}
								else {
									if(tube_hear.src == (resources + image_Heart + "heart1" + png)){
										tube_heart.src = resources + image_Heart + "heart1" + png;
										tube_break = true;
										console.log("tube_break!! : " + tube_break);
									}
									else{
										tube_heart.src = resources + image_Heart + "heart0" + png;
									}
								}
							}, 200);
						}
					} */
					if(tube_alive){
						setTimeout(function() {
							for(var i = 1; i<6; i++){
								tube_heart.src = resources + image_Heart + "heart" + i + png;
							}
						}, 500);
					}
					//tube_heart.src = resources + image_Heart + "heart0" + png;
				}
				if (event.offsetX >= 225  * canvs_width && event.offsetX <= 555 * canvs_width && event.offsetY >= 800 * canvs_height && event.offsetY <= 1140 * canvs_height) {
					if(peulodo_alive){
						setTimeout(function() {
							for(var i = 1; i<6; i++){
								peulodo_heart.src = resources + image_Heart + "heart" + i + png;
							}
						}, 500);
					}
					//peulodo_heart.src = resources + image_Heart + "heart0" + png;
				}
				if (event.offsetX >= 420  * canvs_width && event.offsetX <= 740 * canvs_width && event.offsetY >= 800 * canvs_height && event.offsetY <= 1140 * canvs_height) {
					if(jeiji_alive){
						setTimeout(function() {
							for(var i = 1; i<6; i++){
								jeiji_heart.src = resources + image_Heart + "heart" + i + png;
							}
						}, 500);	
					}
					//jeiji_heart.src = resources + image_Heart + "heart0" + png;
				}
				if (event.offsetX >= 700  * canvs_width && event.offsetX <= 1020 * canvs_width && event.offsetY >= 800 * canvs_height && event.offsetY <= 1140 * canvs_height) {
					if(eopichi_alive){
						setTimeout(function() {
							for(var i = 1; i<6; i++){
								eopichi_heart.src = resources + image_Heart + "heart" + i + png;
							}
						}, 500);
					}
					//eopichi_heart.src = resources + image_Heart + "heart0" + png;
				}
				if (event.offsetX >= 830  * canvs_width && event.offsetX <= 1150 * canvs_width && event.offsetY >= 800 * canvs_height && event.offsetY <= 1140 * canvs_height) {
					if(mujicon_alive){
						setTimeout(function() {
							for(var i = 1; i<6; i++){
								mujicon_heart.src = resources + image_Heart + "heart" + i + png;
							}
						}, 500);
					}
					//mujicon_heart.src = resources + image_Heart + "heart0" + png;
				}
			}
			// Item Shop Select Button
			if (shopRun) {
				if (event.offsetX >= 544 * canvs_width && event.offsetX <= 894 * canvs_width && event.offsetY >= 1032 * canvs_height && event.offsetY <= 1132 * canvs_height) {
					console.log(buy_State);
					if (need_coin == 0) {
						alert("선택 바람");
					} else if (coinText.valueOf() >= need_coin) {
						coinText -= need_coin;
						console.log("select_item : " + select_item);
						switch (select_item) {
						case "detail_item_hood":
							player_costume = 1;
							break;
						case "detail_item_santa":
							player_costume = 2;
							break;
						//Item 부채
						case "detail_item_gita":
							player_fan_item = 1;
							break;
						case "detail_item_fish":
							player_fan_item = 2;
							break;
						case "detail_item_sheep_pot":
							sot_list[0] = true;
							sot_change = "Sheep_pot_";
							sot_select_fornt = "Sheep_pot_fornt";
							sot_select_back = "Sheep_pot_back";
							break;
						case "detail_item_cauldron":
							sot_list[1] = true;
							sot_change = "cauldron_";
							sot_select_fornt = "cauldron_fornt";
							sot_select_back = "cauldron_back";
							break;
						case "detail_character_peulodo":
							peulodo_alive = true;
							friend_list[0] = true;
							break;
						case "detail_character_jeiji":
							jeiji_alive = true;
							friend_list[1] = true;
							break;
						case "detail_character_eopichi":
							eopichi_alive = true;
							friend_list[2] = true;
							break;
						case "detail_character_mujicon":
							mujicon_alive = true;
							friend_list[3] = true;
							break;
						case "detail_buff":
							buff_Cnt++;
							console.log("buff_Cnt : " + buff_Cnt);
							break;
						}
						requestAnimationFrame(draw);
						select_item = "init_item";
						select_view = "init_item";
						need_coin = 0;
						alert("아이템 구입 성공" + coinText);
	
					} else {
						alert("코인 부족");
					}
					requestAnimationFrame(draw);
				}
				// Shop Close
				if ((event.offsetX >= 1100 * canvs_width && event.offsetX <= 1200 * canvs_width && event.offsetY >= 550 * canvs_height && event.offsetY <= 650 * canvs_height) ||
					(event.offsetX <= 245 * canvs_width && event.offsetX >= 1195 * canvs_width && event.offsetY <= 530 * canvs_height && event.offsetY >= 2430 * canvs_height)) {
					console.log("shopRun false");
					shopRun = false;
					select_item = "init_item";
					select_view = "init_item";
					sot_change = 0;
					chk_costume();
					chk_Fan();
				}
				// Item Select
				//Character Select Start
				if ((event.offsetX >= 284 * canvs_width && event.offsetX <= 484 * canvs_width && event.offsetY >= 1268 * canvs_height && event.offsetY <= 1464 * canvs_height) && !friend_list[0]) {
					select_item = "detail_character_peulodo";
					select_view = "character_peulodo";
					need_coin = 150;
					console.log("detail_character_peulodo");
					console.log(btn_character.src);
				}
				if ((event.offsetX >= 508 * canvs_width && event.offsetX <= 708 * canvs_width && event.offsetY >= 1268 * canvs_height && event.offsetY <= 1464 * canvs_height) && !friend_list[1]) {
					select_item = "detail_character_jeiji";
					select_view = "character_jeiji";
					need_coin = 500;
					console.log("detail_character_jeiji");
					console.log(btn_character.src);
				}
				if ((event.offsetX >= 730 * canvs_width && event.offsetX <= 932 * canvs_width && event.offsetY >= 1268 * canvs_height && event.offsetY <= 1464 * canvs_height) && !friend_list[2]) {
					select_item = "detail_character_eopichi";
					select_view = "character_eopichi";
					need_coin = 1200;
					console.log("detail_character_eopichi");
					console.log(btn_character.src);
				}
				if ((event.offsetX >= 950 * canvs_width && event.offsetX <= 1154 * canvs_width && event.offsetY >= 1268 * canvs_height && event.offsetY <= 1464 * canvs_height) && !friend_list[3]) {
					select_item = "detail_character_mujicon";
					select_view = "character_mujicon";
					need_coin = 2000;
					console.log("detail_character_mujicon");
					console.log(btn_character.src);
				}
				//Character Select End
				//Sot Select Start
				if ((event.offsetX >= 284 * canvs_width && event.offsetX <= 488 * canvs_width && event.offsetY >= 1610 * canvs_height && event.offsetY <= 1812 * canvs_height) && !sot_list[1]) {
					select_item = "detail_item_sheep_pot";
					select_view = "view_sheep_pot";
					need_coin = 500;
					console.log("detail_item_sheep_pot");
					console.log(btn_character.src);
				}
				if ((event.offsetX >= 284 * canvs_width && event.offsetX <= 488 * canvs_width && event.offsetY >= 1832 * canvs_height && event.offsetY <= 2034 * canvs_height) && !sot_list[2]) {
					select_item = "detail_item_cauldron";
					select_view = "view_cauldron";
					need_coin = 1000;
					console.log("detail_item_cauldron");
					console.log(btn_character.src);
				}
				//Sot Select End
				if( (event.offsetX >= 618 * canvs_width && event.offsetX <= 820 * canvs_width && event.offsetY >= 1610 * canvs_height && event.offsetY <= 1812 * canvs_height) ) {
					select_item = "detail_item_gita";
					select_view = "view_gita";
					need_coin = 200;
					console.log("detail_item_gita");
					console.log(btn_character.src);
				}
				if( (event.offsetX >= 618 * canvs_width && event.offsetX <= 820 * canvs_width && event.offsetY >= 1832 * canvs_height && event.offsetY <= 2034 * canvs_height) ) {
					select_item = "detail_item_fish";
					select_view = "view_fish";
					need_coin = 200;
					console.log("detail_item_fish");
					console.log(btn_character.src);
				}
				if( (event.offsetX >= 952 * canvs_width && event.offsetX <= 1156 * canvs_width && event.offsetY >= 1610 * canvs_height && event.offsetY <= 1812 * canvs_height) ) {
					select_item = "detail_item_hood";
					select_view = "view_hood";
					need_coin = 300;
					console.log("detail_item_hood");
					console.log(btn_character.src);
				}
				if( (event.offsetX >= 952 * canvs_width && event.offsetX <= 1156 * canvs_width && event.offsetY >= 1832 * canvs_height && event.offsetY <= 2034 * canvs_height) ) {
					select_item = "detail_item_santa";
					select_view = "view_santa";
					need_coin = 300;
					console.log("detail_item_santa");
					console.log(btn_character.src);
				}
				if( (event.offsetX >= 284 * canvs_width && event.offsetX <= 488 * canvs_width && event.offsetY >= 2182 * canvs_height && event.offsetY <= 2382 * canvs_height) ) {
					select_item = "detail_buff";
					select_view = "view_buff";
					need_coin = 300;
					console.log("detail_buff");
					console.log(btn_character.src);
				}
				btn_character.src = resources + image_Detail + select_item + png;
				show_item.src = resources + image_Detail + select_view + png;
				sot_back.src = resources + image_Ui + sot_select_back + png;
				sot_fornt.src = resources + image_Ui + sot_select_fornt + png;
			}
		}
	
		function downController(event) {
			console.log("downController");
			if (run == "run" && !shopRun) {
				if ((event.offsetX >= 50 * canvs_width && event.offsetX <= 330 * canvs_width) && (event.offsetY >= 2620 * canvs_height && event.offsetY <= 2900 * canvs_height)) {
					/* console.log("run upgrade down"); */
					upgrade.src = resources + "upgrade2" + png;
				}
				if ((event.offsetX >= 330 * canvs_width && event.offsetX <= 630 * canvs_width && event.offsetY >= 2620 * canvs_height && event.offsetY <= 2900 * canvs_height) && (buff_Cnt > 0)) {
					console.log("buff_down cnt? : " + buff_Cnt);
					btn_buff.src = resources + image_Ui + "buff_Down" + png;
				}
				if (event.offsetX >= 840 * canvs_width && event.offsetX <= 1640 * canvs_width && event.offsetY >= 1900 * canvs_height && event.offsetY <= 2680 * canvs_height) {
					console.log("player click & player_costume : " + player_costume);
					fan_anim = true;
					chk_costume();
					chk_Fan();
					fire.src = resources + image_Ui + "fire2" + png;
					fanX = 1000; //pickY = 1900;
	
					scoreText += 100;
					//TODO 코인 태스트
					coinText += 1000;
					thermometerY -= 10;
					thermometerSize -= 10;
	
					setTimeout(function() {
						fire.src = resources + image_Ui + "fire3" + png;
					}, 50);
	
					setTimeout(function() {
						fan_anim = false;
						chk_costume();
						chk_Fan();
						fire.src = resources + image_Ui + "fire1" + png;
						fanX = 410;
					}, 100);
					if (thermometerY <= 360) {
						run = "result";
					}
				//thermometerSpeed += 0.00001;
				}
				if (!shopRun) {
					if( (event.offsetX >= 544 * canvs_width && event.offsetX <= 894 * canvs_width && event.offsetY >= 1032 * canvs_height && event.offsetY <= 1132 * canvs_height) ) {
						btn_Buy.src = resources + image_Ui + "btn_BuyDown" + png;
					}
				}
			}
		}
	
		function chk_costume() {
			console.log("chk_costume : " + player_costume);
			if (fan_anim) {
				switch (player_costume) {
				case 0:
					player.src = resources + image_Item + "player2" + png; // Player Image
					break;
				case 1:
					player.src = resources + image_Item + "player_hood2" + png; // Player Image
					break;
				case 2:
					player.src = resources + image_Item + "player_santa2" + png; // Player Image
					break;
				}
			} else {
				switch (player_costume) {
				case 0:
					player.src = resources + image_Item + "player1" + png; // Player Image
					break;
				case 1:
					player.src = resources + image_Item + "player_hood1" + png; // Player Image
					break;
				case 2:
					player.src = resources + image_Item + "player_santa1" + png; // Player Image
					break;
				}
			}
		}
	
		function chk_Fan() {
			console.log("chk_Fan : " + player_fan_item);
			if (fan_anim) {
				switch (player_fan_item) {
				case 0:
					fan.src = resources + image_Item + "fan2" + png; // Player Image
					break;
				case 1:
					fan.src = resources + image_Item + "gita2" + png; // Player Image
					break;
				case 2:
					fan.src = resources + image_Item + "fish2" + png; // Player Image
					break;
				}
			} else {
				switch (player_fan_item) {
				case 0:
					fan.src = resources + image_Item + "fan1" + png; // Player Image  asdasd
					break;
				case 1:
					fan.src = resources + image_Item + "gita1" + png; // Player Image
					break;
				case 2:
					fan.src = resources + image_Item + "fish1" + png; // Player Image
					break;
				}
			}
		}
	
		// 좌표 찍기
		function action_coords(event) {
			var x1 = event.clientX;
			var y1 = event.clientY;
			var x2 = event.offsetX;
			var y2 = event.offsetY;
			var x3 = event.screenX;
			var y3 = event.screenY;
			var coords = "clientX: " + x1 + ", clientY: " + y1 + "<br/>";
			coords += "offsetX: " + x2 + ", offsetY: " + y2 + "<br/>";
			coords += "screenX: " + x3 + ", screenY: " + y3;
			console.log(coords);
		}
	
		/*
			타이머
		*/
		// 자동 코인 증가 합수
		setInterval(function() {
			if (run == "run" && !shopRun) {
				/* console.log("BaseCoin Up"); */
				if (buff_time) {
					coinText += 2000;
				/* console.log("Buff On"); */
				} else {
					coinText += 1000;
				/* console.log("Buff Off"); */
				}
			}
		}, 1000);
		// 속도 증가
		setInterval(function() {
			console.log("speedUp : " + thermometerSpeed);
			if (run == "run" && !shopRun) {
				thermometerSpeed += 0.000000001;
			}
		}, 1000);
	
		/*
			Init
		*/
		window.onload = init();
		setInterval(function(){
			//if(tube_alive)
/* 				if(tube_break && tube_alive){
					tube_heart.src = resources + image_Heart + "heart1" + png;
					tube_break = false;
					console.log("tube_alive?? : " + tube_break);
				} */
			if(tube_alive)
				tube_heart.src = resources + image_Heart + "heart1" + png;
		}, 3000);
		setInterval(function(){
			if(peulodo_alive)
			peulodo_heart.src = resources + image_Heart + "heart1" + png;	
		}, 2000);
		
		setInterval(function(){
			if(jeiji_alive)
			jeiji_heart.src	= resources + image_Heart + "heart1" + png;
		}, 3000);
		
		setInterval(function(){
			if(eopichi_alive)
			eopichi_heart.src = resources + image_Heart + "heart1" + png;
		}, 4000);
		setInterval(function(){
			if(mujicon_alive)
			mujicon_heart.src = resources + image_Heart + "heart1" + png;
		}, 5000);
		
		/*
			Draw
		*/
		function draw() {
			/* console.log("run : " + run); */
			if (run == "main") {
				ctx.clearRect(0, 0, 1440, 2960);
				ctx.drawImage(start_bg, 0, 0); // BackGround
				ctx.drawImage(start, 290, 1780);
			}
			if (run == "run" && !shopRun) {
				if (!shopRun) {
					ctx.clearRect(0, 0, 1440, 2960);
					thermometerY += thermometerSpeed;
					thermometerSize += thermometerSpeed;
					ctx.drawImage(bg, 0, 0); // Draw BackGroundasdasdasd
					ctx.drawImage(frame, -230, -350);
					ctx.drawImage(chaein_back, 120, 160);
					ctx.drawImage(sot_back, 120, 160);
					
					ctx.drawImage(thermometercheck, 672.5, 520);
					ctx.drawImage(thermometer3, 705, 790, 29, thermometerSize);
					ctx.drawImage(thermometer2, 705, thermometerY);
					ctx.drawImage(thermometer1, 632, 320);
					
					//Friend
					ctx.drawImage(frient_tube, 570, 1080);
					ctx.drawImage(tube_heart, 510, 790);

					for (var i = 0; i < 4; i++) {
						if (friend_list[0]) {
							ctx.drawImage(frient_peulodo, 265, 1090);
							ctx.drawImage(peulodo_heart, 215, 800);	
						}
						if (friend_list[1]) {
							ctx.drawImage(frient_jeiji, 410, 1090);
							ctx.drawImage(jeiji_heart, 410, 800);
						}
						if (friend_list[2]) {
							ctx.drawImage(frient_eopichi, 740, 1100);
							ctx.drawImage(eopichi_heart, 700, 810);
						}
						if (friend_list[3]) {
							ctx.drawImage(frient_mujicon, 890, 1090);
							ctx.drawImage(mujicon_heart, 830, 800);	
						}
					}
					
					ctx.drawImage(chaein_fornt, 120, 160);
					ctx.drawImage(sot_fornt, 120, 160);
					//ctx.drawImage(sot_fornt, 120, 150); // Draw Sot
	
					ctx.drawImage(title, 0, 0);
					ctx.drawImage(coin, 50, 250);
					ctx.drawImage(firewood, 465, 1860);
					ctx.drawImage(fire, 610, 1640); // Draw Fire
					ctx.drawImage(tent, -200, 1900, 900, 600); // Draw Tent
					ctx.drawImage(shop, 120, 2200);
	
					ctx.drawImage(upgrade, 20, 2610); // Draw updgrade
					if (buff_Cnt >= 1) {
						btn_buff.src = resources + image_Ui + "buff_Up" + png;
					} else {
						btn_buff.src = resources + image_Ui + "buff_Disabled" + png;
					}
					ctx.drawImage(btn_buff, 330, 2610); // Draw Btn2
					ctx.drawImage(gauge, -60, 820); // Draw Gauge
					ctx.drawImage(pick, 100, pickY);
	

					ctx.drawImage(fan, fanX, 1950);
					ctx.drawImage(player, 640, 1900); // Draw Player
				
				
				if (thermometerY >= 770) {
					run = "result";
				}
				if (thermometerY <= 595 && thermometerY >= 515) {
					pickY--;
					console.log("check");
				}
				if (pickY <= 785) {
					console.log("pickY : " + pickY);
					coinText += 10000;
					pickY = 1900;
				}
				ctx.font = "160px a전자시계 보통";
				ctx.fillText(coinText, 320, 450);
				ctx.font = "160px a로케트 보통";
				ctx.fillText(scoreText, 860, 2800);
				ctx.font = "160px a로케트 보통";
				ctx.fillText(buff_Cnt, 660, 2800);
				}
			}
			if (shopRun) {
				ctx.drawImage(shopmenu, 245, 530);
				ctx.drawImage(btn_Buy, 544, 1032);
				if (select_item != "init_item") {
					ctx.drawImage(btn_character, 801, 651);
					ctx.drawImage(show_item, 289, 652);
				}
				if (sot_list[0]) {
					ctx.drawImage(sold_image, 284, 1610);
				}
				if (sot_list[1]) {
					ctx.drawImage(sold_image, 284, 1830);
				}
				if (friend_list[0]) {
					ctx.drawImage(sold_image, 284, 1268);
				}
				if (friend_list[1]) {
					ctx.drawImage(sold_image, 508, 1268);
				}
				if (friend_list[2]) {
					ctx.drawImage(sold_image, 730, 1268);
				}
				if (friend_list[3]) {
					ctx.drawImage(sold_image, 950, 1268);
				}
	
			} else {
				select_item = "init_item";
				select_view = "init_item";
			}
			if (run == "result") {
				ctx.clearRect(0, 0, 1440, 2960);
				ctx.drawImage(retry_image, 357, 2440);
				ctx.font = "160px a로케트 보통";
				ctx.fillText(scoreText, 926, 1732);
				ctx.drawImage(end_bg, 0, 0);
			}
			if (run == "end") {
				if(${checkResult == 'success'})
					point = point + 500;
				$.ajax({
					type : 'post',
					url : '/pumpkinplace/game/gameupdate/',
					data : ({
						'mem_id' : "${loginId}", 
						'mem_account' : coinText,
						'mem_gamescore' :  scoreText
					}), 
					success : function(result) {
						location = '/pumpkinplace/game/gamepage/';
					} 
				});
			}
			requestAnimationFrame(draw);
		}
		draw();
	</script>

</body>
</html>
