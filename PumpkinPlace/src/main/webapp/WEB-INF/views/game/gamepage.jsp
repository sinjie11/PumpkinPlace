<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<META http-equiv="Expires" content="-1">
<META http-equiv="Pragma" content="no-cache">
<META http-equiv="Cache-Control" content="No-Cache">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<canvas id="canvas" width="1440" height="2960"></canvas>
	<script>
		/* Init *///asd
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
			
		var bg = new Image();
		var title = new Image();
		var player = new Image();
		var fire = new Image();
		var firewood = new Image();
		var tent = new Image();
		var shop = new Image();
		var shopmenu = new Image();
		var upgrade = new Image();
		var buff = new Image();
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
		var select_item = "init_item";
		
		/*
		Setting Images
		*/
		cvs.clientWidth = window.innerWidth;
		cvs.clientHeight = window.innerHeight;
		bg.src = resources + "bg" + png; // BackGround Image
		title.src = resources + "title" + png;
		fire.src = resources + "fire1" + png; // Fire Image
		firewood.src = resources + "firewood" + png;
		tent.src = resources + "tent" + png; // Tent Image
		player.src = resources + "player1" + png; // Player Image
		upgrade.src = resources + "upgrade1" + png; // updgrade Image
		buff.src = resources + "buff1" + png; // buff Image
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
	
		function init() {
			cvs.clientWidth = window.innerWidth;
			cvs.clientHeight = window.innerHeight;
			ctx.clearRect(0, 0, 1440, 2960);
			bg.src = resources + "bg" + png; // BackGround Image
			title.src = resources + "title" + png;
			fire.src = resources + "fire1" + png; // Fire Image
			firewood.src = resources + "firewood" + png;
			tent.src = resources + "tent" + png; // Tent Image
			player.src = resources + "player1" + png; // Player Image
			upgrade.src = resources + "upgrade1" + png; // updgrade Image
			buff.src = resources + "buff1" + png; // buff Image
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
			console.log("mouseOut");
			if ((event.offsetX <= 50 && event.offsetX >= 330) && (event.offsetY <= 2620 && event.offsetY >= 2900)) {
				upgrade.src = resources + "upgrade1" + png;
				console.log("upgrade out");
			}
			if (event.offsetX <= 330 && event.offsetX >= 630 && event.offsetY <= 2620 && event.offsetY >= 2900) {
				buff.src = resources + "buff2" + png;
				console.log("buff out");
			}
		}
	
		function upController(event) {
			if (run == "run") {
				console.log("mouse up");
				upgrade.src = resources + "upgrade1" + png;
				buff.src = resources + "buff1" + png;
				btn_Buy.src = resources + "btn_BuyUp" + png;
				if (event.offsetX >= 544 && event.offsetX <= 894 && event.offsetY >= 1032 && event.offsetY <= 1132) {
					console.log(buy_State);
					if(use_coin == 0){
						alert("선택 바람");
					}
					else if(coinText.valueOf() >= use_coin){
						coinText -= use_coin;
						alert("아이템 구입 성공" + coinText);
						
					}
					else{
						alert("코인 부족");
					}
					//requestAnimationFrame(draw);
				}
			}
			// Item Shop Select Button
			if (shopRun) {
				// Shop Close
				use_coin = 0;
				if ((event.offsetX >= 1100 && event.offsetX <= 1200 && event.offsetY >= 550 && event.offsetY <= 650) ||
					(event.offsetX <= 245 && event.offsetX >= 1195 && event.offsetY <= 530 && event.offsetY >= 2430)) {
					console.log("shopRun false");
					shopRun = false;
					select_item = "init_item";
				}
				// Item Select
				if( (event.offsetX >= 284 && event.offsetX <= 484 && event.offsetY >= 1264 && event.offsetY <= 1464) ) {
					select_item = "detail_character_peulodo";
					use_coin = 150;
					console.log("detail_character_peulodo");
					console.log(btn_character.src);
				}
				if( (event.offsetX >= 508 && event.offsetX <= 708 && event.offsetY >= 1268 && event.offsetY <= 1464) ) {
					select_item = "detail_character_jeiji";
					use_coin = 500;
					console.log("detail_character_jeiji");
					console.log(btn_character.src);
				}
				if( (event.offsetX >= 730 && event.offsetX <= 932 && event.offsetY >= 1268 && event.offsetY <= 1464) ) {
					select_item = "detail_character_eopichi";
					use_coin = 1200;
					console.log("detail_character_eopichi");
					console.log(btn_character.src);
				}
				if( (event.offsetX >= 950 && event.offsetX <= 1154 && event.offsetY >= 1268 && event.offsetY <= 1464) ) {
					select_item = "detail_character_mujicon";
					use_coin = 2000;
					console.log("detail_character_mujicon");
					console.log(btn_character.src);
				}
				if( (event.offsetX >= 284 && event.offsetX <= 488 && event.offsetY >= 2182 && event.offsetY <= 2382) ) {
					select_item = "detail_buff";
					use_coin = 300;
					console.log("detail_buff");
					console.log(btn_character.src);
				}
				if( (event.offsetX >= 284 && event.offsetX <= 488 && event.offsetY >= 1610 && event.offsetY <= 1812) ) {
					use_coin = 500;
					select_item = "detail_item_sheep_pot";
					console.log("detail_item_sheep_pot");
					console.log(btn_character.src);
				}
				if( (event.offsetX >= 618 && event.offsetX <= 820 && event.offsetY >= 1610 && event.offsetY <= 1812) ) {
					use_coin = 200;
					select_item = "detail_item_gita";
					console.log("detail_item_gita");
					console.log(btn_character.src);
				}
				if( (event.offsetX >= 618 && event.offsetX <= 820 && event.offsetY >= 1832 && event.offsetY <= 2034) ) {
					use_coin = 200;
					select_item = "detail_tiem_fish";
					console.log("detail_tiem_fish");
					console.log(btn_character.src);
				}
				if( (event.offsetX >= 952 && event.offsetX <= 1156 && event.offsetY >= 1610 && event.offsetY <= 1812) ) {
					use_coin = 300;
					select_item = "detail_item_hood";
					console.log("detail_item_hood");
					console.log(btn_character.src);
				}
				if( (event.offsetX >= 952 && event.offsetX <= 1156 && event.offsetY >= 1832 && event.offsetY <= 2034) ) {
					use_coin = 300;
					select_item = "detail_item_santa";
					console.log("detail_item_santa");
					console.log(btn_character.src);
				}
				btn_character.src = resources + select_item + png;
	
	
			}
			console.log("event.offsetX : " + event.offsetX);
			console.log("event.offsetY : " + event.offsetY);
		//document.addEventListener("click", action_coords(event));
		//console.log("click thermometerSpeed : " + thermometerSpeed);
		//console.log("thermometerY : " + thermometerY);
		}
	
		function downController(event) {
			if (run == "run") {
				if ((event.offsetX >= 50 && event.offsetX <= 330) && (event.offsetY >= 2620 && event.offsetY <= 2900)) {
					console.log("run upgrade down");
					upgrade.src = resources + "upgrade2" + png;
				}
				if (event.offsetX >= 330 && event.offsetX <= 630 && event.offsetY >= 2620 && event.offsetY <= 2900) {
					console.log("run buff down");
					buff.src = resources + "buff2" + png;
				}
				if (!shopRun) {
					if (event.offsetX >= 840 && event.offsetX <= 1640 && event.offsetY >= 1900 && event.offsetY <= 2680) {
						console.log("player click");
						player.src = resources + "player2" + png; // Player Image
						fan.src = resources + "fan2" + png;
						fire.src = resources + "fire2" + png;
						fanX = 1000;
						//pickY = 1900;
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
							player.src = resources + "player1" + png; // Player Image
							fire.src = resources + "fire1" + png;
							fanX = 460;
						}, 100);
						if (thermometerY <= 360) {
							run = "end";
						}
						thermometerSpeed += 0.00025;
					}
				} else {
					if( (event.offsetX >= 544 && event.offsetX <= 894 && event.offsetY >= 1032 && event.offsetY <= 1132) ) {
						btn_Buy.src = resources + "btn_BuyDown" + png;
					}
				}
			}
		}
	
		function clickController(event) {
			if (run == "main") {
				run = "run";
				console.log("run start1? : " + run);
			}
			if (run == "end") {
				run = "main";
			}
			if (run == "run" && !shopRun) {
				if (event.offsetX >= 135 && event.offsetX <= 535 && event.offsetY >= 2280 && event.offsetY <= 2480) {
					console.log("shop click");
					shopRun = true;
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
			if (run == "run") {
				console.log("BaseCoin Up");
				coinText += 1000;
			}
		}, 30000);
		// 속도 증가
		setInterval(function() {
			if (run == "run" && !shopRun) {
				console.log("speedUp : " + thermometerSpeed);
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
			/* 			console.log("screen.width : " + window.screen.width);
						console.log("screen.height : " + window.screen.height); */
			/* console.log("cvs W : " + cvs.clientWidth);
			console.log("cvs H : " + cvs.clientHeight);
			console.log("window W : " + window.clientWidth);
			console.log("window H : " + window.clientHeight); */
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
					ctx.drawImage(upgrade, 20, 2610); // Draw updgrade
					ctx.drawImage(buff, 330, 2610); // Draw Btn2
					ctx.drawImage(gauge, -60, 820); // Draw Gauge
					ctx.drawImage(pick, 100, pickY);
	
					ctx.drawImage(thermometercheck, 672.5, 520);
					ctx.drawImage(thermometer3, 705, 790, 29, thermometerSize);
					ctx.drawImage(thermometer2, 705, thermometerY);
					ctx.drawImage(thermometer1, 632, 320);
					ctx.drawImage(fan, fanX, 1890);
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
	
/* 						if (!buy_State) {
							alert("아이템 구임?");
						} */
					}
				} else {
					select_item = "init_item";
				}
				ctx.font = "160px a전자시계 보통";
				ctx.fillText(coinText, 320, 450);
				ctx.font = "160px a로케트 보통";
				ctx.fillText(scoreText, 860, 2800);
			}
			if (run == "end") {
				init();
				ctx.clearRect(0, 0, 1440, 2960);
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
			}
			requestAnimationFrame(draw);
		}
		draw();
		// Init Function 만들어야 함.
	</script>

</body>
</html>
