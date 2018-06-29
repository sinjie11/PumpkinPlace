<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<title>Pumk</title>
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

.youtubeWrap {
	position: relative;
	width: 100%;
	padding-bottom: 56.25%;
}

.youtubeWrap iframe {
	position: absolute;
	width: 100%;
	height: 100%;
}

td, h5 {
	font-size: 15px;
	font-style: inherit;
}
</style>
</head>
<body>

	<%@ include file="/WEB-INF/views/header.jspf"%>


	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="page-header">
					<div class="container text-center">
						<h1 style="font-size: 50px;">
							<!-- 공연 제목 -->
							<b>David Bowie Ziggy StarDust</b>
						</h1>
						<!-- 날짜 -->
						<h2>1973-07-03</h2>
					</div>

				</div>

				<div class="row">

					<div class="col-md-6">

						<img alt="포스터"
							src="https://i.pinimg.com/originals/3f/34/5b/3f345b5415c304de51b13901198ff712.jpg"
							style="margin-left: 30%;" />

					</div>



					<div class="col-md-6" style="padding-left: 5%;">

						<table class="table table-hover" style="width: 50%;">
							<tr>
								<td width="40%">시간:</td>
								<td>20:00</td>
							</tr>

							<tr>
								<td>입장료:</td>
								<td><i class="price"></i>20,000</td>
							</tr>
							<tr>
								<td>도시:</td>
								<td>London | 런던</td>
							</tr>

							<tr>
								<td>연락처:</td>
								<td>xxx-xxxx-xxxx</td>
							</tr>
						</table>
						<div class="">
							<h5>상세 정보</h5>
							<textarea rows="5" cols="50" readonly="readonly"></textarea>
						</div>

						<br />

						<div>
							<h3>공연장: 45 Queen Caroline St</h3>
							<br />


							<!-- Add Google Maps -->
							<div id="placeMap" style="height: 400px; width: 500px;"></div>

							<script>
								function myMap() {
									var myCenter = new google.maps.LatLng(
											51.491020, -0.224488);
									var map;

									var mapProp = {
										center : myCenter,
										zoom : 16,
										scrollwheel : false,
										draggable : false,
										mapTypeId : google.maps.MapTypeId.ROADMAP
									};
									var map = new google.maps.Map(document
											.getElementById("placeMap"),
											mapProp);
									var marker = new google.maps.Marker({
										position : myCenter
									});
									marker.setMap(map);

								}
							</script>
							<script
								src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBLOpelo4l6yKdCApN_d5uUehocuiw7Uuk&callback=myMap"></script>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<br />
	<div class="container text-center">
		<iframe width="560" height="315"
			src="https://www.youtube.com/embed/3qrOvBuWJ-c" frameborder="0"
			allow="autoplay; encrypted-media" allowfullscreen></iframe>
	</div>
	<br />
	


	<%@ include file="/WEB-INF/views/footer.jspf"%>

</body>

</html>

