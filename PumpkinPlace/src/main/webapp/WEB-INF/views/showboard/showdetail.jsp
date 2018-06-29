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
	


   <div class="container text-center" style="margin-top: 50px;">

      <div class="row align-items-start">
         <div id="poster">
            <p>
               <img alt="이미지" src="">
            </p>

         </div>

         <!-- 제목 -->
         <div id="en_title">
            <p>
               <label for="event_공연 이름 :">공연 제목: <input id="show_name"
                  name="event" type="text" style="text-align: center; width: 200px;"
                  readonly /></label>
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
               id="startdate" readonly> <input type="text"
               name="starttime" readonly> ~ <input type="text"
               id="enddate" readonly> <input type="text" name="endtime"
               readonly></label>
         </div>
         <br />


         <!-- 지역 -->
         <div id="en_city">
            <p>
               <label for="event_도시:">도시:<input id="event_band_tokens"
                  name="event[band_tokens]" type="text"
                  style="text-align: center; width: 200px;" readonly />
               </label>
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
               style="text-align: center; width: 200px;" readonly />
            </label>
         </div>
         <br />

         <!-- 가격 -->
         <div id="en_price">
            <p>
               <label for="event_현매:"> 가격:<input id="event_door_price"
                  name="event[door_price]" type="number"
                  style="text-align: center; width: 200px; margin-left: 18px;"
                  readonly />
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
            <iframe width="560" height="315"
               src="https://www.youtube.com/embed/1w7OgIMMRc4" frameborder="0"
               allow="autoplay; encrypted-media" allowfullscreen></iframe>




         </div>
      </div>
   </div>
   <!-- end 유투브 -->





   <%@ include file="/WEB-INF/views/footer.jspf"%>

</body>

</html>
