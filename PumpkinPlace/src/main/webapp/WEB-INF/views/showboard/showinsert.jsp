<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html lang="en">
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
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>



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
/* Always set the map height explicitly to define the size of the div
       * element that contains the map. */

/* Optional: Makes the sample page fill the window. */
.controls {
	background-color: #fff;
	border-radius: 2px;
	border: 1px solid transparent;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
	box-sizing: border-box;
	font-family: Roboto;
	font-size: 15px;
	font-weight: 300;
	height: 29px;
	margin-left: 17px;
	margin-top: 10px;
	outline: none;
	padding: 0 11px 0 13px;
	text-overflow: ellipsis;
	width: 400px;
}

.controls:focus {
	border-color: #4d90fe;
}

.title {
	font-weight: bold;
}

#infowindow-content {
	display: none;
}

#map #infowindow-content {
	display: inline;
}
</style>
</head>
<body>



	<%@ include file="/WEB-INF/views/header.jspf"%>



	<div class="container text-center">
		<h2 class="container text-center">New Event</h2>
		<hr>


		<form action="showinsert" method="post" enctype="multipart/form-data">
			<div style="margin: 0; padding: 0; display: inline">
				<input name="utf8" type="hidden" value="&#x2713;" /> <input
					name="authenticity_token" type="hidden"
					value="V/YmJsJD2LJVCi0HoeIknFutTxFudHJCyCNYLsakG/U=" />
			</div>

			<div>
				<p>
					<label for="event_공연 포스터:">공연 포스터 <br /> <br /> <img
						id="blah" src="#" alt="your image" /> <br /> <input type='file'
						id="imgInp" name="uploadFile" />
					</label> <br />
					<!-- <input type="file" name="uploadFile" id="imgInp" />   -->
					<!-- 업로드 버튼(나중에 삭제) -->
					<!-- 	<input type="submit" value="Upload" /></label> -->
					<!-- end 업로드 -->
				</p>
				<p>공연을 위한 포스터를 업로드해주세요. 그렇지 않을 경우 대체 이미지가 사용됩니다.</p>
				<br />
			</div>


			<!-- 사진 저장 -->
			<script>
				$(document).ready(function() {
			if (${not empty saved}) {
				alert('${saved}' + 'SAVED');
			}
				});
			</script>
			<!-- 사진저장 -->

			<!-- 사진 미리보기 -->
			<script type="text/javascript">
        $(function() {
            $("#imgInp").on('change', function(){
                readURL(this);
            });
        });

        function readURL(input) {
            if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                    $('#blah').attr('src', e.target.result);
                }

              reader.readAsDataURL(input.files[0]);
            }
        }


    </script>
			<!-- end 미리보기 -->




			<!-- 제목 -->
			<div id="en_title">
				<p>
					<label for="event_공연 이름 :">공연 제목: <input id="show_name"
						name="event" type="text" style="text-align: center; width: 200px;"
						required /></label>
				</p>
			</div>


			<!-- 뮤지션이름 -->
			<div id="en_bands">
				<p>
					<label for="event_공연하는 밴드:">뮤지션명: <input
						id="event_band_tokens" name="event[band_tokens]" type="text"
						style="text-align: center; width: 200px;" required /></label>
				</p>
			</div>

			<div id="en_daytime">
				<label for="event_공연 날짜">공연 날짜 / 시간: <input type="text"
					id="startdate" placeholder="공연 시작 날짜 선택" required> 
					<input type="text" name="time1" value="" placeholder="시간 입력" id="time1"
					required size="8" maxlength="5"> ~ <input type="text"
					id="enddate" placeholder="공연 종료 날짜 선택" required> <input
					type="text" name="time2" value="" placeholder="시간 입력" id="time2"
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
						style="text-align: center; width: 200px;" required /></label>
				</p>
			</div>
			<br />



			<!-- 연락처 -->
			<div id="en_phone">
				<label for="event_연락처:">연락처: <input id="event_contact"
					name="event[contact]" type="text"
					style="text-align: center; width: 200px;" />
				</label>
			</div>
			<br />

			<!-- 가격 -->
			<div id="en_price">
				<p>
					<label for="event_현매:"> 가격:<input id="event_door_price"
						name="event[door_price]" type="number"
						style="text-align: center; width: 200px; margin-left: 18px;" />
					</label>
				</p>
			</div>
			<br />

			<!-- 상세정보 -->
			<div id="en_description">
				<label>상세 정보</label>
				<textarea name="description" rows="10" cols="20" id="text"
					class="froalaeditor" style="width: 100%; text-align: left;"
					required></textarea>
				<br />

			</div>
			<br />

			<div id="en_player">


				<div class="links"></div>
				<p>

					<label for="event_영상:">영상: <input id="youtube"
						name="${youtube}" type="text"
						style="text-align: center; width: 300px; margin-left: 12px;"
						placeholder="YouTube 링크를 입력해주세요" />
					</label>
				</p>
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



			<br /> <input class="btn btn-primary" name="uploadFile"
				type="submit" value="등록" style="margin-bottom: 50px;" />

		</form>





	</div>

	<!-- 날짜 선택 -->
	<script>
		$(function() {
			$("#startdate, #enddate").datepicker({
				dateFormat : 'yy.mm.dd'
			});
		});
	</script>







</body>

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
			var map = new google.maps.Map(document.getElementById("googleMap"),
					mapProp);
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

<!-- footer -->
<footer class="container-fluid text-center">


	<!-- Container (Contact Section) -->
	<div id="contact" class="container-fluid bg-grey">


		<div class="row">
			<div class="col-sm-5">
				<!-- 가운데 정렬해주는거 -->
				<div class="container text-center" style="margin-left: 370px;">
					<p>Contact us and we'll get back to you within 24 hours.</p>
					<p>
						<span class="glyphicon glyphicon-map-marker"></span> Team
						Error404, KOR
					</p>
					<p>
						<span class="glyphicon glyphicon-phone"></span> +00 1515151515
					</p>
					<p>
						<span class="glyphicon glyphicon-envelope"></span>
						doojinzzang@something.com
					</p>
				</div>

			</div>
		</div>
	</div>
</footer>


</html>



