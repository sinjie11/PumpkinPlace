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
	width: 300px;
}

.controls:focus {
	border-color: #4d90fe;
}

.title {
	font-weight: bold;
}

#map {
	width: 600px;
	height: 550px;
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
	<br />
	<h5>
		<b> 카테고리: 공연 > 공연등록 </b>
	</h5>

	<%@ include file="/WEB-INF/views/header.jspf"%>

	<br />

		<div style="margin: 0; padding: 0; display: inline">
			<input name="utf8" type="hidden" value="&#x2713;" /> <input
				name="authenticity_token" type="hidden"
				value="V/YmJsJD2LJVCi0HoeIknFutTxFudHJCyCNYLsakG/U=" />

			<div class="container-fluid">
				<div class="row">
					<div class="col align-self-center">
						<div style="margin-left: 50%;">
							<h1>공연 등록</h1>
							<br /> <br />
						</div>
						<div class="row">
							<div class="col-md-6">
								<div class="col align-self-end" style="margin-left: 5%;">
									<div style="font-size: 15px; margin-left: 25%;">

										<b>공연 포스터</b> <input type='file' id="imgInp" name="uploadFile" />

										<div></div>

										<p>
											<small>공연을 위한 포스터를 업로드해주세요. 그렇지 않을 경우 대체 이미지가 사용됩니다.</small>
										</p>


										<br /> <img id="blah" src="#" alt="" width="570px;"
											height="796px;" /> <br /> <br />

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


										<!-- 유튜브 -->
										<label for="event_영상:">영상: <input id="youtube"
											name="sb_video" type="text"
											style="text-align: center; width: 300px; margin-left: 12px;"
											placeholder="YouTube 링크를 입력해주세요" />
										</label> <br /> <br />
									</div>
									<script>
                              $(document).ready(function (){
                                 var youtube = $('#youtube').val();
                                 var youtube = $('#sb_video').val();
                                 console.log('youtube :' + youtube);
                              });
                           </script>
									<div style="width: 570px; margin-left: 25%;">
										<iframe width="560" height="315"
											src="https://www.youtube.com/embed/${youtube}"
											frameborder="0" allow="autoplay; encrypted-media"
											allowfullscreen></iframe>
									</div>
									<script>
                              
                     jQuery(document).ready(
                           function($) {
                              $('iframe[src^="https://www.youtube.com/${youtube}"]').wrap(
                              '<div class="youtubeWrap"></div>');
                           });
                        </script>

								</div>
							</div>
							<div class="col-md-6">
								<div class="col align-self-end" style="margin-left: 20%;">

									<!-- 제목 -->
									<div id="en_title">
										<p>
											<label for="event_공연 이름 :">공연 제목: <input
												id="show_name" name="sb_title" type="text"
												style="text-align: center; width: 200px;" required />
											</label>
										</p>
									</div>


									<!-- 뮤지션이름 -->
									<div id="en_bands">
										<p>
											<label for="event_공연하는 밴드:">뮤지션 명: <input
												id="event_band_tokens" name="sb_nm" type="text"
												style="text-align: center; width: 200px;" required /></label>
										</p>
									</div>

									<div id="en_daytime">
										<label for="event_공연 날짜">공연 날짜 / 시간:<br /> <input
											type="text" id="startdate" placeholder="공연 시작 날짜 선택" /> 
											<input
											type="text" placeholder="시간 입력" id="starttime" required
											size="10" maxlength="5"> ~ <input type="text"
											id="enddate" placeholder="공연 종료 날짜 선택" required /> 
											<input
											type="text" placeholder="시간 입력" id="endtime" required
											size="10" maxlength="5">
										</label>
									</div>
									<br />

									
									<script>
									$(function() {
										<!-- 날짜 선택 -->
  $("#startdate, #enddate").datepicker({
    dateFormat : 'yy/mm/dd'
  });
	<!-- 시간 -->   
	 $("#starttime, #endtime").timepicker({
	        timeFormat: 'HH:mm ',
	        interval: 30,
	        minTime: '00:00',
	        maxTime: '23:00',
	        defaultTime: '18',
	        startTime: '18:00',
	        dynamic: false,
	        dropdown: true,
	        scrollbar: true
	    });
									});
                  </script>


									<!-- 지역 -->
									<div id="sb_city">
										<p>
											<label for="sb_city"> 도시: <select id="country"
												name="sb_city"
												style="text-align: center; width: 100px; margin-left: 12px;">
													<option value="seoul/서울">서울</option>
													<option value="kyungki/경기">경기</option>
													<option value="kwangju/광주">광주</option>
													<option value="daegu/대구">대구</option>
													<option value="busan/부산">부산</option>
													<option value="jeju/제주">제주</option>
											</select></label>
										</p>
									</div>

									<!-- 공연장 -->

									<div id="en_venue">
										<input id="pac-input" class="controls" type="text"
											name="sb_locinfo" placeholder="Enter a location">
										<div id="map"></div>
										<div id="infowindow-content">
											<span id="place-name" class="title"><br/></span><br>
											<span id="place-id" style="display: none;" ></span>
											<br> 
											<span id="place-address">
											<br/></span>
										
										</div>
										<br />
									
								
										

										<script>
										 var sb_placeid = null;
											function initMap() {
										        var map = new google.maps.Map(document.getElementById('map'), {
										          center: {lat: 37.498145, lng: 127.027612},
										          
										      
										          zoom: 16
										        });

										        var input = document.getElementById('pac-input');

										        var autocomplete = new google.maps.places.Autocomplete(
										            input, {placeIdOnly: true});
										        autocomplete.bindTo('bounds', map);

										        map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

										        var infowindow = new google.maps.InfoWindow();
										        var infowindowContent = document.getElementById('infowindow-content');
										        infowindow.setContent(infowindowContent);
										        var geocoder = new google.maps.Geocoder;
										        var marker = new google.maps.Marker({
										          map: map
										        });
										        marker.addListener('click', function() {
										          infowindow.open(map, marker);
										        });

										        autocomplete.addListener('place_changed', function() {
										          infowindow.close();
										          var place = autocomplete.getPlace();

										          if (!place.place_id) {
										            return;
										          }
										          
										          sb_placeid = place.place_id;
										          console.log('placeId :' + place.place_id);
										          console.log('sb_placeid :' + sb_placeid);
										          geocoder.geocode({'placeId': place.place_id}, function(results, status) {
										        	  
										        	  

										            if (status !== 'OK') {
										              window.alert('Geocoder failed due to: ' + status);
										              return;
										            }
										            map.setZoom(16);
										            map.setCenter(results[0].geometry.location);
										            // Set the position of the marker using the place ID and location.
										            marker.setPlace({
										              placeId: place.place_id,
										              location: results[0].geometry.location
										            });
										            marker.setVisible(true);
										            infowindowContent.children['place-name'].textContent = place.name;
										            infowindowContent.children['place-id'].textContent = place.place_id;
										            infowindowContent.children['place-address'].textContent =
										                results[0].formatted_address;
										            
										            
										            
										            
										            infowindow.open(map, marker);
										          });
										        });
										      }
      
    </script>
										<script async defer
											src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBLOpelo4l6yKdCApN_d5uUehocuiw7Uuk&libraries=places&callback=initMap"></script>
									</div>

									<!-- 연락처 -->
									<div id="sb_tel">
										<label for="event_연락처:">연락처: <input id="event_contact"
											name="sb_tel" type="text"
											style="text-align: center; width: 200px;" />
										</label>
									</div>
									<br />

									<!-- 가격 -->
									<div id="en_price">
										<p>
											<label for="sb_price"> 가격:<input
												id="event_door_price" name="sb_price" type="number"
												style="text-align: center; width: 200px; margin-left: 18px;" />
											</label>
										</p>
									</div>

									<!-- 상세정보 -->
									<div id="en_description">
										<label>상세 정보</label>
										<p>
											<textarea name="description" rows="5" cols="50" name="sb_content"
												id="showinserttext" required></textarea>
										</p>
										<br />
									</div>
									<br /> <br />
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br /> 
		<!-- <input  class="btn btn-primary"
			name="uploadFile" type="submit" value="등록"
			style="margin-bottom: 50px; margin-left: 50%;" /> -->
			
	<button type="button" class="btn btn-primary" id="btnshowinsert" class="btn btn-primary"  style="margin-bottom: 50px; margin-left: 50%;">등록</button>

	<script>
	
	
	$('#btnshowinsert').click(function () {
 	var sb_nm = $('#event_band_tokens').val();
	var sb_title = $('#show_name').val();
	var sb_content = $('#showinserttext').val();
	var sb_city = $('#country').val();
	var sb_price = $('#event_door_price').val();
	var sb_tel = $('#event_contact').val();
	var sb_locinfo = $('#pac-input').val();
	var sb_img = $('#imgInp').val();
	var sb_video = $('#youtube').val(); 
	var startdate = $('#startdate').val();
	var starttime = $('#starttime').val();
	var enddate = $('#enddate').val();
	var endtime = $('#endtime').val();
	var startdatetime = startdate + ' ' + starttime;
	var sb_startdate = new Date(startdatetime);
	var enddatetime = enddate + ' ' + endtime;
	var sb_enddate = new Date(enddatetime);

	console.log('sb_nm :' + sb_nm);
	console.log('sb_title :' + sb_title);
	console.log('sb_content :' + sb_content);
	console.log('sb_city :' + sb_city);
	console.log('sb_price :' + sb_price);
	console.log('sb_tel :' + sb_tel);
	console.log('sb_locinfo :' + sb_locinfo);
	console.log('sb_img :' + sb_img);
	console.log('sb_video :' + sb_video);
	console.log('startdate :' + startdate);
	console.log('starttime :' + starttime);
	console.log('enddate :' + enddate);
	console.log('endtime :' + endtime);
	console.log('startdatetime :' + startdatetime);
	console.log('enddatetime :' + enddatetime);
	console.log('sb_startdate :' + sb_startdate);
	console.log('sb_enddate :' + sb_enddate);
	console.log('sb_placeId :' + sb_placeid);	
	
	
	$.ajax({
		type: 'post',
		url: '/pumpkinplace/showboard/showinsert/',
		headers: {
			'Content-Type': 'application/json',
			'X-HTTP-Method-Override' : 'post'
		},
		data: JSON.stringify({
			'sb_nm': sb_nm,
			'sb_title': sb_title,
			'sb_content': sb_content,
			'sb_city': sb_city,
			'sb_price': sb_price,
			'sb_tel': sb_tel,
			'sb_locinfo': sb_locinfo,
			'sb_img': sb_img,
			'sb_video': sb_video,
			'sb_startdate': sb_startdate,
			'sb_enddate': sb_enddate,
			'sb_placeid' : sb_placeid
		}),
		success: function (result){
				alert(sb_nm + '님 공연 등록 성공');
				location = '/pumpkinplace/showboard/showboardmain';
			}
		
		});
	});
</script>


</body>

<%@ include file="/WEB-INF/views/footer.jspf"%>


</html>