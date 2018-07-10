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
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<title>Insert title here</title>

</head>
<body>
	<canvas id="canvas" width="1440" height="2960"></canvas>
	<script type="text/javascript">

</script>

	<script>
		var user_id = "";
		var result_score= 0;
	
		/* Init */ //asd
		var run = "main";
		var resources = "${pageContext.request.contextPath}/resources/images/";
		var png = ".png";
		var cvs = document.getElementById('canvas');
		var ctx = cvs.getContext('2d');
		var shopRun = false;
		var coinText = 0;
		var scoreText = 0;
		var clickX = 0;
		var clickY = 0;
		var dir = -1;
		var speed = 1;
		var pickY = 1900;
		var fanX = 460;
		var thermometerY = 650;
		var thermometerSize = -90; //MAX = 400;
		var thermometerSpeed = 0.25;
		var isPressed = false;
		var buy_State = false;
		var use_coin = 0;
		var buff_Cnt = 0;
		var buff_time = false;
		var player_costume = 0;
	
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
		var sot = new Image();
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
		/*
		Setting Images
		*/
		/* cvs.clientWidth = window.innerWidth;
		cvs.clientHeight = window.innerHeight; */
	
		bg.src = resources + "bg" + png; // BackGround Image
		title.src = resources + "title" + png;
		fire.src = resources + "fire1" + png; // Fire Image
		firewood.src = resources + "firewood" + png;
		tent.src = resources + "tent" + png; // Tent Image
		player.src = resources + "player1" + png; // Player Image
		upgrade.src = resources + "upgrade1" + png; // updgrade Image
		btn_buff.src = resources + "buff_Disabled" + png; // buff Image
		gauge.src = resources + "gauge" + png; // Gauge Image
		sot.src = resources + "sot" + png; // Sot Image
		thermometer1.src = resources + "thermometer1" + png;
		thermometer2.src = resources + "thermometer2" + png;
		thermometer3.src = resources + "thermometer3" + png;
		thermometercheck.src = resources + "thermometercheck" + png;
		frame.src = resources + "frame" + png;
		coin.src = resources + "coin" + png;
		start.src = resources + "start" + png;
		pick.src = resources + "pick" + png;
		fan.src = resources + "fan1" + png;
		end.src = resources + "end" + png;
		shop.id = "shopid";
		shop.src = resources + "shop" + png;
		shopmenu.src = resources + "shopmenu" + png;
		btn_Buy.src = resources + "btn_BuyUp" + png;
		btn_character.src = resources + select_item + png;
		show_item.src = resources + select_view + png;
		shop.height = 400;
	
		shop.addEventListener('click', function(event) {
			console.log("asdasdasdasdasd");
		});
	
		/*
		FrameWork
		*/
		cvs.addEventListener('click', clickController);
		cvs.addEventListener('onmouseup', upController);
		cvs.addEventListener('onmousedown', downController);
		cvs.addEventListener('onmouseout', mouseOutController);
	
		cvs.onmousedown = function(event) {
			isPressed = true;
			doInterval('1', event);
			downController(event);
		};
		cvs.onmouseup = function(event) {
			isPressed = false;
			doInterval('-1', event);
			upController(event);
		}
		cvs.onmouseout = function(event) {
			mouseOutController(event);
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
		/* 			console.log("cvs.style.width : " + cvs.style.width);
					console.log("cvs.width : " + cvs.width);
					console.log("cvs.style.height : " + cvs.style.height);
					console.log("cvs.height : " + cvs.height);
					console.log("canvs_width : " + canvs_width);
					console.log("canvs_height : " + canvs_height); */
		}
		window.addEventListener('load', resize, false);
		window.addEventListener('resize', resize, false);
		function init() {
			/* cvs.clientWidth = window.innerWidth;
			cvs.clientHeight = window.innerHeight; */
			/* console.log("Game_Init()"); */
			/* console.log("window.innerWidth2 : " + window.innerWidth);
			console.log("window.innerHeight2 : " + window.innerHeight); */
			shopRun = false;
			coinText = 0;
			scoreText = 0;
			clickX = 0;
			clickY = 0;
			dir = -1;
			speed = 1;
			pickY = 1900;
			fanX = 460;
			thermometerY = 650;
			thermometerSize = -90; //MAX = 400;
			thermometerSpeed = 0.25;
			isPressed = false;
			buy_State = false;
			use_coin = 0;
			buff_Cnt = 0;
			ctx.clearRect(0, 0, 1440, 2960);
			bg.src = resources + "bg" + png; // BackGround Image
			title.src = resources + "title" + png;
			fire.src = resources + "fire1" + png; // Fire Image
			firewood.src = resources + "firewood" + png;
			tent.src = resources + "tent" + png; // Tent Image
			player.src = resources + "player1" + png; // Player Image
			upgrade.src = resources + "upgrade1" + png; // updgrade Image
			btn_buff.src = resources + "buff_Disabled" + png; // buff Image
			gauge.src = resources + "gauge" + png; // Gauge Image
			sot.src = resources + "sot" + png; // Sot Image
			thermometer1.src = resources + "thermometer1" + png;
			thermometer2.src = resources + "thermometer2" + png;
			thermometer3.src = resources + "thermometer3" + png;
			thermometercheck.src = resources + "thermometercheck" + png;
			frame.src = resources + "frame" + png;
			coin.src = resources + "coin" + png;
			start.src = resources + "start" + png;
			pick.src = resources + "pick" + png;
			fan.src = resources + "fan1" + png;
			end.src = resources + "end" + png;
			shop.src = resources + "shop" + png;
	
			shopmenu.src = resources + "shopmenu" + png;
			btn_Buy.src = resources + "btn_BuyUp" + png;
			btn_character.src = resources + select_item + png;
			show_item.src = resources + select_view + png;
		}
	
		function doInterval(action, event) {
			if (isPressed) {
				downController(event);
				setTimeout(function() {
					doInterval(action, event);
				}, 200);
			}
		}
	
		function mouseOutController(event) {
			/* console.log("mouseOut"); */ // * canvs_height 
			if ((event.offsetX <= 50 * canvs_width && event.offsetX >= 330 * canvs_width) && (event.offsetY <= 2620 * canvs_height && event.offsetY >= 2900 * canvs_height)) {
				upgrade.src = resources + "upgrade1" + png;
			/* console.log("upgrade out"); */
			}
			if (event.offsetX <= 330 * canvs_width && event.offsetX >= 630 * canvs_width && event.offsetY <= 2620 * canvs_height && event.offsetY >= 2900 * canvs_height) {
				if (buff_Cnt >= 1) {
					btn_buff.src = resources + "buff_Up" + png;
	
				} else {
					btn_buff.src = resources + "buff_Disabled" + png;
				}
			/* console.log("buff out"); */
			}
		}
	
		function upController(event) {
			if (run == "run") {
				/* console.log("mouse up"); */
				upgrade.src = resources + "upgrade1" + png;
				btn_Buy.src = resources + "btn_BuyUp" + png;
				if (event.offsetX <= 330 * canvs_width && event.offsetX >= 630 * canvs_width && event.offsetY <= 2620 * canvs_height && event.offsetY >= 2900 * canvs_height) {
					if (buff_Cnt >= 1) {
						btn_buff.src = resources + "buff_Up" + png;
						buff_time = true;
						buff_Cnt--;
						console.log("buff_cnt -- : ", buff_Cnt);
					} else {
						btn_buff.src = resources + "buff_Disabled" + png;
					}
				}
	
			}
			// Item Shop Select Button
			if (shopRun) {
				if (event.offsetX >= 544 * canvs_width && event.offsetX <= 894 * canvs_width && event.offsetY >= 1032 * canvs_height && event.offsetY <= 1132 * canvs_height) {
					console.log(buy_State);
					if (use_coin == 0) {
						alert("선택 바람");
					} else if (coinText.valueOf() >= use_coin) {
						coinText -= use_coin;
						console.log("select_item : " + select_item);
						switch (select_item) {
						case "detail_item_hood":
							player_costume = 1;
							break;
						case "detail_item_santa":
							player_costume = 2;
							break;
						case "detail_buff":
							buff_Cnt++;
							console.log("buff_Cnt : " + buff_Cnt);
							break;
						}
						requestAnimationFrame(draw);
						alert("아이템 구입 성공" + coinText);
	
					} else {
						alert("코인 부족");
					}
				//requestAnimationFrame(draw);
				}
				// Shop Close
				if ((event.offsetX >= 1100 * canvs_width && event.offsetX <= 1200 * canvs_width && event.offsetY >= 550 * canvs_height && event.offsetY <= 650 * canvs_height) ||
					(event.offsetX <= 245 * canvs_width && event.offsetX >= 1195 * canvs_width && event.offsetY <= 530 * canvs_height && event.offsetY >= 2430 * canvs_height)) {
					console.log("shopRun false");
					shopRun = false;
					select_item = "init_item";
					select_view = "init_item";
				}
				// Item Select
				if( (event.offsetX >= 284 * canvs_width && event.offsetX <= 484 * canvs_width && event.offsetY >= 1264 * canvs_height && event.offsetY <= 1464 * canvs_height) ) {
					select_item = "detail_character_peulodo";
					select_view = "character_peulodo";
					use_coin = 150;
					console.log("detail_character_peulodo");
					console.log(btn_character.src);
				}
				if( (event.offsetX >= 508 * canvs_width && event.offsetX <= 708 * canvs_width && event.offsetY >= 1268 * canvs_height && event.offsetY <= 1464 * canvs_height) ) {
					select_item = "detail_character_jeiji";
					select_view = "character_jeiji";
					use_coin = 500;
					console.log("detail_character_jeiji");
					console.log(btn_character.src);
				}
				if( (event.offsetX >= 730 * canvs_width && event.offsetX <= 932 * canvs_width && event.offsetY >= 1268 * canvs_height && event.offsetY <= 1464 * canvs_height) ) {
					select_item = "detail_character_eopichi";
					select_view = "character_eopichi";
					use_coin = 1200;
					console.log("detail_character_eopichi");
					console.log(btn_character.src);
				}
				if( (event.offsetX >= 950 * canvs_width && event.offsetX <= 1154 * canvs_width && event.offsetY >= 1268 * canvs_height && event.offsetY <= 1464 * canvs_height) ) {
					select_item = "detail_character_mujicon";
					select_view = "character_mujicon";
					use_coin = 2000;
					console.log("detail_character_mujicon");
					console.log(btn_character.src);
				}
				if( (event.offsetX >= 284 * canvs_width && event.offsetX <= 488 * canvs_width && event.offsetY >= 2182 * canvs_height && event.offsetY <= 2382 * canvs_height) ) {
					select_item = "detail_buff";
					select_view = "view_buff";
					use_coin = 300;
					console.log("detail_buff");
					console.log(btn_character.src);
				}
				if( (event.offsetX >= 284 * canvs_width && event.offsetX <= 488 * canvs_width && event.offsetY >= 1610 * canvs_height && event.offsetY <= 1812 * canvs_height) ) {
					select_item = "detail_item_sheep_pot";
					select_view = "view_sheep_pot";
					use_coin = 500;
					console.log("detail_item_sheep_pot");
					console.log(btn_character.src);
				}
				if( (event.offsetX >= 618 * canvs_width && event.offsetX <= 820 * canvs_width && event.offsetY >= 1610 * canvs_height && event.offsetY <= 1812 * canvs_height) ) {
					select_item = "detail_item_gita";
					select_view = "view_gita";
					use_coin = 200;
					console.log("detail_item_gita");
					console.log(btn_character.src);
				}
				if( (event.offsetX >= 618 * canvs_width && event.offsetX <= 820 * canvs_width && event.offsetY >= 1832 * canvs_height && event.offsetY <= 2034 * canvs_height) ) {
					select_item = "detail_tiem_fish";
					select_view = "view_fish";
					use_coin = 200;
					console.log("detail_tiem_fish");
					console.log(btn_character.src);
				}
				if( (event.offsetX >= 952 * canvs_width && event.offsetX <= 1156 * canvs_width && event.offsetY >= 1610 * canvs_height && event.offsetY <= 1812 * canvs_height) ) {
					select_item = "detail_item_hood";
					select_view = "view_hood";
					use_coin = 300;
					console.log("detail_item_hood");
					console.log(btn_character.src);
				}
				if( (event.offsetX >= 952 * canvs_width && event.offsetX <= 1156 * canvs_width && event.offsetY >= 1832 * canvs_height && event.offsetY <= 2034 * canvs_height) ) {
					select_item = "detail_item_santa";
					select_view = "view_santa";
					use_coin = 300;
					console.log("detail_item_santa");
					console.log(btn_character.src);
				}
				btn_character.src = resources + select_item + png;
				show_item.src = resources + select_view + png;
	
			}
			if ((event.offsetX >= 135 * canvs_width && event.offsetX <= 535 * canvs_width) &&
				(event.offsetY >= 2280 * canvs_height) && event.offsetY <= 2480 * canvs_height) {
				console.log("shop click 1");
			}
		/* 
					console.log("event.offsetX : " + event.offsetX);
					console.log("tq1 : " + tq1);
					console.log("tq2 : " + tq2);
					console.log("tq3 : " + tq1 / tq2);
		 */ /* console.log("event.pageX : " + event.pageX); */
		//		console.log("event.offsetY : " + event.offsetY);
		/* console.log("event.pageY : " + event.pageY); */
		//asdasdasdasdasㅁㄴㅇㅁㄴㅇ
		//document.addEventListener("click", action_coords(event));
		//console.log("click thermometerSpeed : " + thermometerSpeed);
		//console.log("thermometerY : " + thermometerY);
		}
	
		function downController(event) {
			if (run == "run") {
				if ((event.offsetX >= 50 * canvs_width && event.offsetX <= 330 * canvs_width) && (event.offsetY >= 2620 * canvs_height && event.offsetY <= 2900 * canvs_height)) {
					/* console.log("run upgrade down"); */
					upgrade.src = resources + "upgrade2" + png;
				}
				if (event.offsetX >= 330 * canvs_width && event.offsetX <= 630 * canvs_width && event.offsetY >= 2620 * canvs_height && event.offsetY <= 2900 * canvs_height) {
					/* console.log("run buff down"); */
					if (buff_Cnt >= 1) {
						btn_buff.src = resources + "buff_Down" + png;
					} else {
						btn_buff.src = resources + "buff_Disabled" + png;
					}
				}
				if (!shopRun) {
					if (event.offsetX >= 840 * canvs_width && event.offsetX <= 1640 * canvs_width && event.offsetY >= 1900 * canvs_height && event.offsetY <= 2680 * canvs_height) {
						console.log("player click & player_costume : " + player_costume);
						switch (player_costume) {
						case 0:
							console.log("player_costume : " + player_costume);
							player.src = resources + "player2" + png; // Player Image
							break;
						case 1:
							console.log("player_costume : " + player_costume);
							player.src = resources + "player_hood2" + png; // Player Image
							break;
						case 2:
							console.log("player_costume : " + player_costume);
							player.src = resources + "player_santa2" + png; // Player Image
							break;
						}
						//player.src = resources + "player2" + png; // Player Image
						fan.src = resources + "fan2" + png;
						fire.src = resources + "fire2" + png;
						fanX = 1000; //pickY = 1900;
	
						scoreText += 100;
						//TODO 코인 태스트
						coinText += 1000;
						thermometerY -= 10;
						thermometerSize -= 10;
	
						setTimeout(function() {
							fire.src = resources + "fire3" + png;
						}, 50);
						setTimeout(function() {
							fan.src = resources + "fan1" + png;
							switch (player_costume) {
							case 0:
								player.src = resources + "player1" + png; // Player Image
								break;
							case 1:
								player.src = resources + "player_hood1" + png; // Player Image
								break;
							case 2:
								player.src = resources + "player_santa1" + png; // Player Image
								break;
							}
							//player.src = resources + "player1" + png; // Player Image
							fire.src = resources + "fire1" + png;
							fanX = 460;
						}, 100);
						if (thermometerY <= 360) {
							run = "end";
						}
						thermometerSpeed += 0.00025;
					}
				} else {
					if( (event.offsetX >= 544 * canvs_width && event.offsetX <= 894 * canvs_width && event.offsetY >= 1032 * canvs_height && event.offsetY <= 1132 * canvs_height) ) {
						btn_Buy.src = resources + "btn_BuyDown" + png;
					}
				}
			}
		}
	
		function clickController(event) {
			/* 			console.log("event.target.offsetHeight : " + event.target.offsetHeight);
						console.log("event.target.offsetLeft : " + event.target.offsetWidth); */
	
			//ctx.getImageData(sx, sy, sw, sh)
			if (run == "main") {
				run = "run";
			/* console.log("run start1? : " + run); */
			}
			if (run == "end") {
				run = "main";
			}
			if (run == "run" && !shopRun) {
				if (event.offsetX >= 135 * canvs_width && event.offsetX <= 535 * canvs_width &&
					event.offsetY >= 2280 * canvs_height && event.offsetY <= 2480 * canvs_height) {
					console.log("shop click 1");
				/* 					console.log("shop.clientTop : " + shop.clientTop);
									console.log("shop.clientHeight : " + shop.clientHeight);
									console.log("shop.offsetHeight : " + shop.offsetHeight);
									console.log("shop.height : " + shop.height);
									console.log("event.target.offsetLeft : " + event.target.offsetLeft); */
				}
				if (event.offsetX >= 135 * canvs_width && event.offsetX <= 535 * canvs_width && event.offsetY >= 2280 * canvs_height && event.offsetY <= 2480 * canvs_height) {
					console.log("shop click 2");
					shopRun = true;
					use_coin = 0;
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
			if (run == "run" && !shopRun) {
				//console.log("speedUp : " + thermometerSpeed);
				thermometerSpeed += 0.00001;
			}
		}, 1000);
		/*
			Init
		*/
		/* window.onload(function (){
			init();
		}); */
		window.onload = init();
		/*
			Draw
		*/
		function draw() {
			/* console.log("run : " + run); */
			if (run == "main") {
				ctx.clearRect(0, 0, 1440, 2960);
				ctx.drawImage(bg, 0, 0); // BackGround
				ctx.drawImage(start, 520, 1780);
			}
			if (run == "run") {
				//coin Text
	
				if (!shopRun) {
					/* 	speed += dir;
						pickY += dir; */
	
					ctx.clearRect(0, 0, 1440, 2960);
					thermometerY += thermometerSpeed;
					thermometerSize += thermometerSpeed;
					ctx.drawImage(bg, 0, 0); // Draw BackGround
					ctx.drawImage(frame, -230, -350);
					ctx.drawImage(sot, 120, 150); // Draw Sot
					ctx.drawImage(title, 0, 0);
					ctx.drawImage(coin, 50, 250);
					ctx.drawImage(firewood, 465, 1860);
					ctx.drawImage(fire, 610, 1640); // Draw Fire
					ctx.drawImage(tent, -200, 1900, 900, 600); // Draw Tent
					ctx.drawImage(shop, 120, 2200);
					shop.addEventListener("onclick", function(e) {
						console.log("asdasd");
					}, false)
					ctx.drawImage(upgrade, 20, 2610); // Draw updgrade
					ctx.drawImage(btn_buff, 330, 2610); // Draw Btn2
					ctx.drawImage(gauge, -60, 820); // Draw Gauge
					ctx.drawImage(pick, 100, pickY);
	
					ctx.drawImage(thermometercheck, 672.5, 520);
					ctx.drawImage(thermometer3, 705, 790, 29, thermometerSize);
					ctx.drawImage(thermometer2, 705, thermometerY);
					ctx.drawImage(thermometer1, 632, 320);
					ctx.drawImage(fan, fanX, 1890);
					switch (player_costume) {
					case 0:
						player.src = resources + "player1" + png; // Player Image
						break;
					case 1:
						player.src = resources + "player_hood1" + png; // Player Image
						break;
					case 2:
						player.src = resources + "player_santa1" + png; // Player Image
						break;
					}
					ctx.drawImage(player, 640, 1900); // Draw Player
				//if (pickY >= 1900) {
				//	console.log("pickY Low = " + pickY);
				//	dir = -1;
				//}
				//if (pickY <= 785) {
				//	console.log("pickY Hight = " + pickY);
				//	dir = 1;
				//}
				}
				if (thermometerY >= 770) {
					run = "end";
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
				if (shopRun) {
					ctx.drawImage(shopmenu, 245, 530);
					ctx.drawImage(btn_Buy, 544, 1032);
					if (select_item != "init_item") {
						/* 						switch (select_item) {
												case "detail_character_peulodo":
													ctx.drawImage(btn_character, 801, 651);
													break;
												case "detail_character_jeiji":
													ctx.drawImage(btn_character, 801, 651);
													break;
												case "detail_character_eopichi":
													ctx.drawImage(btn_character, 801, 651);
													break;
												case "detail_character_mujicon":
													ctx.drawImage(btn_character, 801, 651);
													break;
												default:
													select_item = "init_item";
													ctx.drawImage(btn_character, 801, 651);
													break;
												} */
						ctx.drawImage(btn_character, 801, 651);
						ctx.drawImage(show_item, 289, 652);
	
					/* 						if (!buy_State) {
												alert("아이템 구임?");
											} */
					}
				} else {
					select_item = "init_item";
					select_view = "init_item";
				}
	
			}
			if (run == "end") {
				ctx.clearRect(0, 0, 1440, 2960);
				init();
			/* asdasd
							ctx.drawImage(bg, 0, 0); // Draw BackGround
							ctx.drawImage(end, 520, 1780);
							shopRun = false;
							coinText = 0;
							scoreText = 0;
							clickX = 0;
							clickY = 0;
							dir = -1;
							speed = 1;
							pickY = 1900;
							fanX = 460;
							thermometerY = 650;
							thermometerSize = -90; //MAX = 400;
							thermometerSpeed = 0.25;
							console.log("end");
			 */
			}
			/* 			$("document").on("vclick", "#shopid", function(){
							alert("asdasdasd");
						}) */
			requestAnimationFrame(draw);
		}
		draw();
		// Init Function 만들어야 함.
	</script>

</body>
</html>
