<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
	.
	title
	{
	font-weight
	:
	bold;
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
							<b>${showboard.sb_title}</b>
						</h1>
						<!-- 날짜 -->
						<fmt:formatDate value="${showboard.sb_startdate}"
							pattern="yyyy-MM-dd" var="startdate" />
						<h2>${startdate}</h2>
					</div>

				</div>


				<div class="row">

					<div class="col-md-6">

						<img alt="포스터"
							src="${pageContext.request.contextPath}/resources/assets/img/showboard/${showboard.sb_img}"
							style="margin-left: 30%; width: 570px; height: 796px;" />

					</div>



					<div class="col-md-6" style="padding-left: 5%;">
						<h3>공연 정보</h3>
						<table class="table table-hover" style="width: 50%;">

							<tr>
								<td width="40%">시간:</td>
								<fmt:formatDate value="${showboard.sb_startdate}"
									pattern="HH:mm" var="starttime" />
								<td>${starttime}</td>
							</tr>

							<tr>
								<td>입장료:</td>
								<td><i class="price"></i> <fmt:formatNumber
										value="${showboard.sb_price}" pattern="#,### 원"></fmt:formatNumber>
								</td>
							</tr>
							<tr>
								<td>도시:</td>
								<td>${showboard.sb_city}</td>
							</tr>

							<tr>
								<td>연락처:</td>
								<td>${showboard.sb_tel}</td>
							</tr>
						</table>
						<div class="">
							<h5>상세 정보</h5>
							<textarea rows="6" cols="68" readonly="readonly">${showboard.sb_content}</textarea>
						</div>

						<br />

						<div>
							<h3>공연장: ${showboard.sb_locinfo}</h3>
							<br />


							<script type="text/javascript">
							function initMap() {
								  // jQuery('.site-content').prepend('<div id=\"map-container\"><div id=\"map-canvas\"></div></div>');

								  var request = {
								    placeId: 'ChIJwRvyh8SYfDURcCKVXGVMYUA'
								  };

								  function callback(place, status) {
								    if (status == google.maps.places.PlacesServiceStatus.OK) {
								      var marker = new google.maps.Marker({
								        map: map,
								        position: place.geometry.location
								      });
								      map.setCenter(marker.getPosition());
								    }
								  }

								  var map = new google.maps.Map(document.getElementById('map-canvas'), {
								    zoom: 15
								  });

								  service = new google.maps.places.PlacesService(map);
								  service.getDetails(request, callback);
								} 
								google.maps.event.addDomListener(window,'load',initializeGoogleMaps);
							</script>

							<div id="map-canvas" style="height: 500px; width: 500px;"></div></div>
							<script async defer
								src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBLOpelo4l6yKdCApN_d5uUehocuiw7Uuk&libraries=places&callback=initMap">
								
							</script>
							
							
							<br />


							<button style="size: small; margin-left: 50%;">수정하기(작성자만
								보이기 위치는 어디로 할까요?)</button>
						</div>
					</div>
				</div>
			</div>

		</div>

		<br />
		<div class="container text-center">
			<iframe width="560" height="315"
				src="https://www.youtube.com/embed/${showboard.sb_video}"
				frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
		</div>
		<br />

</div>



		<%@ include file="/WEB-INF/views/footer.jspf"%>
</body>

</html>
