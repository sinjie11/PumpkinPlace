<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>game</title>

<script type="text/javascript">
	function onLoad() {
		var params = window.location.search.substring(1).split('&');
		var height;
		for (var i = 0, l = params.length; i < l; ++i) {
			var parts = params[i].split('=');
			switch (parts[0]) {
			case 'height':
				height = parseInt(parts[1]);
				break;
			}
		}
		if (typeof ( height ) == 'number') {
			window.top.updateIFrame(height);
		}
	}

	window.onload = onLoad;
</script>
<style>
.gameview_Wrap {
	border: none;
	width: 1000;
	height: 1000;
	scrolling: "no";
	/* 	position: relative;
	width: 100vw;
	height: 100vh; */
	/* width: window.innerWidth;
   padding-bottom: window.innerHeight; */
}

/* .iframe {
	width: 100vw;
	height: 100vh;
} */
testcss {
	border: 1px;
	bordercolor: "red";
	width: 100vw;
	height: 100vh;
	scrolling: "no";
}

.wrapper {
	width: 100%;
	height: 100%;
	margin: 0 auto;
	background: #ffffff;
}

.h_iframe {
	position: relative;
}

.h_iframe .ratio {
	display: block;
	width: auto;
	height: 100%;
}

.h_iframe iframe {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
}
</style>
</script>

</head>
<body>
	<!-- 	<div class="wrapper">
		<div class="h_iframe">
			a transparent image is preferable
			<img class="ratio"
				src="http://192.168.11.28:8181/pumpkinplace/game/gamepage" />
			<iframe frameborder="0" height="100vh" width="100vw" scrolling="no" src="http://192.168.11.28:8181/pumpkinplace/game/gamepage"
				 allowfullscreen></iframe>
		</div>
	</div> -->
	<!-- src="http://www.brightontheday.com/wp-content/uploads/2013/07/placeholder300.png" /> -->
	<!-- src="http://currentlyobsessed.me/api/v1/get_widget?wid=30&blog=Brighton+The+Day&widgetid=38585" -->
	<!-- <iframe width="100%" height="100%" src="http://192.168.11.29:8181/pumpkinplace/game/gamepage" frameborder="0" allow="autoplay;" ></iframe> -->
	<!-- <iframe width="100%" height="100%" src="http://localhost:8181/pumpkinplace/game/gamepage" frameborder="0" allow="autoplay;" ></iframe> -->
	<!-- <iframe style="testcss" src="http://192.168.11.4:8181/pumpkinplace/game/gamepage"></iframe> -->
	<div style="padding: 10px; height: 100%; width: 100%; max-height:2960; max-width:1440; overflow: auto; scrolling="no">
		<iframe id="testiframe"
			src="http://192.168.11.28:8181/pumpkinplace/game/gamepage"
			height="100%" width="100%" scrolling="no" allowfullscreen></iframe>
		<script>
			var iframe = document.getElementById("tsetframe");
			iframe.width = innerWidth;
			iframe.height = innerHeight;
		</script>
		<!-- 	<script>
		jQuery(document).ready(
			function($) {
				$('iframe[src^="http://192.168.11.29:8181/pumpkinplace/game/gamepage"]').wrap(
					'<div class="gameview_Wrap"></div>');
			});
		console.log("window.innerWidth1 : " + window.innerWidth);
		console.log("window.innerHeight1 : " + window.innerHeight);
	</script> -->


		<!-- <iframe src="http://192.168.11.29:8181/pumpkinplace/game/gamepage" style="display:block; width:100vw; height: 100vh"></iframe> -->
		<!-- <iframe src="http://localhost:8181/pumpkinplace/WEB-INF/views/game/gamepage.jsp" style="display:block; width:100vw; height: 100vh"></iframe> -->
	</div>

<!--  <iframe width="1440" height="2960" src="http://192.168.11.28:8181/pumpkinplace/game/gamepage" frameborder="0" ></iframe>-->
<iframe frameborder="10" 
scrolling="no"src="http://192.168.11.28:8181/pumpkinplace/game/gamepage" width="200" 
height="400" allowFullScreen="true" webkitallowfullscreen="true" 
mozallowfullscreen="true">
</iframe>
</body>
</html>
