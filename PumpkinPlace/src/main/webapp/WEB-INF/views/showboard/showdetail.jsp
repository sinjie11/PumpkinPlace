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

</style>
</head>
<body>
	
	<%@ include file="/WEB-INF/views/header.jspf"%>


	<nav class="navbar navbar-inverse navbar-fixed-top">

		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>

			</div>
			<div class="collapse navbar-collapse" id="myNavbar">

				<ul class="nav navbar-nav navbar-right">
					<li><a href="#"><span class="glyphicon glyphicon-log-in"></span>
							Login</a></li>
					<li><a href="#"><span class="glyphicon glyphicon-user"></span>
							Register </a></li>
				</ul>
			</div>
		</div>
		<h1 style="background-color: white; margin: 0%;">

			<img alt="이미지"
				src="${pageContext.request.contextPath}/resources/logo.png"
				style="background-color: white; width: 100%; height: 200px;" />

		</h1>
 
		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#menuNavbar">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>

				</div>


				<div class="collapse navbar-collapse" id="menuNavbar">
					<ul class="nav navbar-nav">
						<li class=""><a href="/pumpkinplace/">Home</a></li>
						<li class="active "><a class="dropdown-toggle"
							data-toggle="dropdown" href="">공연<span class="caret"></span></a>
							<ul class="dropdown-menu-active">
								<li><a href="/pumpkinplace/showboard/showboardmain">공연</a></li>
								<li><a href="/pumpkinplace/showboard/showinsert">공연 등록</a></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">게시판 <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">자유 게시판</a></li>
							</ul></li>

						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">중고 거래<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">기타</a></li>
								<li><a href="#">베이스</a></li>
								<li><a href="#">드럼/퍼커션</a></li>
								<li><a href="#">앰프</a></li>
								<li><a href="#">음향장비</a></li>
								<li><a href="#">etc</a></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">구인 구직<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">구인</a></li>
								<li><a href="#">구직</a></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">Q&A<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">Q&A</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
		</nav>
	</nav>


	<div>
				<p>
				 <img
						id="blah" src="#" alt="your image" /> <br /> <input type='file'
						id="imgInp" name="uploadFile" />
					 <br />
					
				
			</div>






			<!-- 제목 -->
			<div id="en_title">
				<p>
					<label for="event_공연 이름 :">공연 제목: <input id="show_name"
						name="event" type="text" style="text-align: center; width: 200px;"
						readonly/></label>
				</p>
			</div>


			<!-- 뮤지션이름 -->
			<div id="en_bands">
				<p>
					<label for="event_공연하는 밴드:">뮤지션명: <input
						id="event_band_tokens" name="event[band_tokens]" type="text"
						style="text-align: center; width: 200px;" readonly /></label>
				</p>
			</div>

			<div id="en_daytime">
				<label for="event_공연 날짜">공연 날짜 / 시간: <input type="text"
					id="startdate" readonly> <input type="text" name="time1" value="" id="time1"
					required size="8" maxlength="5"> ~ 
					<input type="text"
					id="enddate"  readonly> <input
					type="text" name="time2" value="" id="time2"
					required size="8" maxlength="5"></label>
			</div>
			<br />


			<!-- 지역 -->
			<div id="en_city">
				<p>
					<label for="event_도시:"> 도시: <select id="country"
						name="country"
						style="text-align: center; width: 100px; margin-left: 12px;">
							<option value="seoul">서울</option>
							<option value="kuyngki">경기</option>
							<option value="kwangju">광주</option>
							<option value="daegu">대구</option>
							<option value="busan">부산</option>
							<option value="jeju">제주</option>
					</select></label>
				</p>
			</div>




			<!-- 공연장 -->


			<div id="en_venue">
					<p>
					<label for="event_공연장:"> 공연장: <input
						id="event_venue_tokens" name="event[venue_tokens]" type="text"
						style="text-align: center; width: 200px;" readonly /></label>
				</p>
			</div>
			<br />



			<!-- 연락처 -->
			<div id="en_phone">
				<label for="event_연락처:">연락처: <input id="event_contact"
					name="event[contact]" type="text"
					style="text-align: center; width: 200px;" readonly/>
				</label>
			</div>
			<br />

			<!-- 가격 -->
			<div id="en_price">
				<p>
					<label for="event_현매:"> 가격:<input id="event_door_price"
						name="event[door_price]" type="number"
						style="text-align: center; width: 200px; margin-left: 18px;" readonly/>
					</label>
				</p>
			</div>
			<br />

			<!-- 상세정보 -->
			<div id="en_description">
				<label>상세 정보</label>
				<textarea name="description" rows="10" cols="20" id="text"
					class="froalaeditor" style="width: 100%; text-align: left;"
					readonly></textarea>
				<br />

			</div>
			<br />

	

			<!-- start 유투브 -->



			<div style="margin-right: 50%;">
				<iframe width="560" height="315" src="${youtube}" frameborder="0"
					allow="autoplay; encrypted-media" allowfullscreen></iframe>
				<script>
					jQuery(document).ready(
							function($) {
										$('iframe[src^="https://www.youtube.com/"]').wrap(
										'<div class="youtubeWrap"></div>');
									});
				</script>




			</div>
			<!-- end 유투브 -->



	<!-- end menubar -->
	
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

