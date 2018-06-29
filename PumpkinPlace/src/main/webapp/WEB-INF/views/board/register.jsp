<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
<title>PumpkinPlace</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- 부트스트랩 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style>
/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

/* Add a gray background color and some padding to the footer */
footer {
	background-color: #f2f2f2;
	padding: 25px;
}

.carousel-inner img {
	width: 100%; /* Set width to 100% */
	margin: auto;
	min-height: 200px;
}

/* Hide the carousel text when the screen is less than 600 pixels wide */
@media ( max-width : 600px) {
	.carousel-caption {
		display: none;
	}
}

body {
	position: relative; /* For scrollyspy */
	padding-top: 300px; /*Account for fixed navbar */
	background-color: #f8f8f8;
}
}
</style>
</head>
<body>

	<%@ include file="/WEB-INF/views/header.jspf"%>

	<br/>
<h5><b> 카테고리: 게시판 > 자유게시판 > 새 글쓰기</b></h5>
	<!-- end MenuBar -->
	<div class="text-center">
	<br/><br/>
		<h1>새 글쓰기</h1>
		<br/>
		<form action="register" method="post">
			<input type="text" name="title" style="width: 385px;" placeholder="글 제목" required /> <br />
			<br/>
			<textarea rows="5" cols="50" style="width: 385px;" name="content" placeholder="내용 작성"
			required></textarea><br/>
			<br /> <input type="text"  style="width: 385px;" name="userid" value="${loginId}"
				readonly="readonly"><br/><br /> <input type="submit"
				value="작성 완료" />
		</form>



		<!-- footer -->
		<footer class="container-fluid text-center">

			<div class="row">
				<!-- Add Google Maps -->
				<div id="googleMap"
					style="height: 400px; width: 500px; float: right; margin-right: 200px;"></div>
				<div class="col-sm-7 slideanim">
					<h2 class="text-center" style="margin-left: 230px;">CONTACT</h2>
					<br /> <br />
					<div class="col-sm-7 slideanim" style="margin-left: 350px;">
						<div class="row">
							<div class="col-sm-6 form-group">
								<input class="form-control" id="name" name="name"
									placeholder="Name" type="text" required>
							</div>
							<div class="col-sm-6 form-group">
								<input class="form-control" id="email" name="email"
									placeholder="Email" type="email" required>
							</div>
						</div>
						<textarea class="form-control" id="comments" name="comments"
							placeholder="Comment" rows="5"></textarea>
						<br>
						<div class="row">
							<div class="col-sm-12 form-group">
								<button class="btn btn-default pull-right" type="submit">Send</button>
							</div>
						</div>
					</div>
				</div>
			</div>

			<script>
				function myMap() {
					var myCenter = new google.maps.LatLng(37.499685, 127.031535);
					var map;

					var mapProp = {
						center : myCenter,
						zoom : 16,
						scrollwheel : false,
						draggable : false,
						mapTypeId : google.maps.MapTypeId.ROADMAP
					};
					var map = new google.maps.Map(document
							.getElementById("googleMap"), mapProp);
					var marker = new google.maps.Marker({
						position : myCenter
					});
					marker.setMap(map);

				}

				$(document).ready(function() {
					console.log('jhd');
				});
			</script>

			<script
				src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBLOpelo4l6yKdCApN_d5uUehocuiw7Uuk&callback=myMap"></script>

			<!--
		To use this code on your website, get a free API key from Google.
		Read more at: https://www.w3schools.com/graphics/google_maps_basic.asp
		-->

		</footer>

		<%@ include file="/WEB-INF/views/footer.jspf"%>
		
</body>
</html>

