
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
		/*
		Init
		*/
		var run = "main";
		var resources = "${pageContext.request.contextPath}/resources/images/";
		var png = ".png";
		var cvs = document.getElementById('canvas');
		var ctx = cvs.getContext('2d');
		var shopRun = false;
		var pointText = 0;
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
		var point = new Image();
		var start = new Image();
		var pick = new Image();
		var fan = new Image();
		var end = new Image();
	
		/*
		Setting Images
		*/
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
		point.src = resources + "point" + png;
		start.src = resources + "start" + png;
		pick.src = resources + "pick" + png;
		fan.src = resources + "fan1" + png;
		end.src = resources + "end" + png;
		shopmenu.src = resources + "shopmenu" + png;
		shop.src = resources + "shop" + png;
		/*
		FrameWork
		*/
		document.addEventListener("click", clickController);
		cvs.onmousedown = function(event) {
			console.log("down");
			downController(event);
		};
		cvs.onmouseup = function(event) {
			console.log("up");
			upController(event);
		}
	
		function downController(event) {
			if (run == "run") {
				if ((event.offsetX >= 50 && event.offsetX <= 330) && (event.offsetY >= 2620 && event.offsetY <= 2900)) {
					console.log("run upgrade down");
					upgrade.src = resources + "upgrade2" + png;
				} //ctx.drawImage(buff, 330, 2610); // Draw Btn2
				if (event.offsetX >= 330 && event.offsetX <= 630 && event.offsetY >= 2620 && event.offsetY <= 2900) {
					console.log("run buff down");
					buff.src = resources + "buff2" + png;
				}
			}
		}
		function upController(event) {
			if (run == "run") {
				console.log("run mouse up"); //asd
				upgrade.src = resources + "upgrade1" + png;
				buff.src = resources + "buff1" + png;
			}
		}
	
		function clickController(event) {
			if (run == "main") {
				run = "run";
				console.log("run start1? : " + run);
			}
			if (run == "run") {
				if (event.offsetX >= 840 && event.offsetX <= 1640 && event.offsetY >= 1900 && event.offsetY <= 2600) {
					console.log("player click");
					player.src = resources + "player2" + png; // Player Image
					fan.src = resources + "fan2" + png;
					fire.src = resources + "fire2" + png;
					fanX = 1000;
					//pickY = 1900;
					scoreText += 100;
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
				//600 510
				} else if (event.offsetX >= 120 && event.offsetX <= 570 && event.offsetY >= 2200 && event.offsetY <= 2400) {
					console.log("shop click");
					shopRun = true;
				}
			}
			if (shopRun) {
				if ((event.offsetX >= 1100 && event.offsetX <= 1200 && event.offsetY >= 550 && event.offsetY <= 650) ||
					(event.offsetX <= 245 && event.offsetX >= 1195 && event.offsetY <= 530 && event.offsetY >= 2430)) {
					console.log("shopRun false");
					shopRun = false;
				}
			}
			if (run == "end") {
				run = "main";
			}
			console.log("event.offsetX : " + event.offsetX);
			console.log("event.offsetY : " + event.offsetY);
			document.addEventListener("click", action_coords(event));
		//console.log("click thermometerSpeed : " + thermometerSpeed);
		//console.log("thermometerY : " + thermometerY);
		}
	
	
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
		setInterval(function() {
			if (run == "run") {
				console.log("BasePoint Up");
				pointText += 10;
			}
		}, 30000);
	
		setInterval(function() {
			if (run == "run") {
				console.log("speedUp : " + thermometerSpeed);
				thermometerSpeed += 0.00001;
			}
		}, 1000)
	
		function draw() {
			if (run == "main") {
				ctx.clearRect(0, 0, 1440, 2960);
				ctx.drawImage(bg, 0, 0); // Draw BackGround
				ctx.drawImage(start, 520, 1780);
			} else if (run == "run") {
				/* 				speed += dir;
								pickY += dir; */
				ctx.clearRect(0, 0, 1440, 2960);
				thermometerY += thermometerSpeed;
				thermometerSize += thermometerSpeed;
				ctx.drawImage(bg, 0, 0); // Draw BackGround
				ctx.drawImage(frame, -230, -350);
				ctx.drawImage(sot, 120, 150); // Draw Sot
				ctx.drawImage(title, 0, 0);
				ctx.drawImage(point, 0, 250);
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
				//Point Text
				ctx.font = "160px Gulim";
				ctx.fillText(pointText, 320, 450);
				ctx.font = "160px Gulim";
				ctx.fillText(scoreText, 860, 2800);
				/* 				if (pickY >= 1900) {
									console.log("pickY Low = " + pickY);
									dir = -1;
								}
								if (pickY <= 785) {
									console.log("pickY Hight = " + pickY);
									dir = 1;
								} */
				if (thermometerY >= 770) {
					run = "end";
				}
				if (thermometerY <= 595 && thermometerY >= 515) {
					pickY--;
					console.log("check");
				}
				if (pickY <= 785) {
					console.log("pickY : " + pickY);
					pointText += 100;
					pickY = 1900;
				}
				if (shopRun) {
					ctx.drawImage(shopmenu, 245, 530);
				}
			} else {
				ctx.clearRect(0, 0, 1440, 2960);
				ctx.drawImage(bg, 0, 0); // Draw BackGround
				ctx.drawImage(end, 520, 1780);
				shopRun = false;
				pointText = 0;
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
	</script>

</body>
</html>
