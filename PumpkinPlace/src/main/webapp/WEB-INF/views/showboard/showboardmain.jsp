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

<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

<!-- datepicker -->
<link
	href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.2.2/css/bootstrap-combined.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" media="screen"
	href="http://tarruda.github.com/bootstrap-datetimepicker/assets/css/bootstrap-datetimepicker.min.css">
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
	<br/>
<h5><b> 카테고리: 공연 </b></h5>
	<%@ include file="/WEB-INF/views/header.jspf"%>
	<br />
	<!-- 가운데 정렬 -->
	<div class="container text-center">
		<div class="tab-content">
			
			<form action="showboardsearch"
				style="float: right; margin-bottom: 50px;">
				<div id="datetimepicker4" class="input-append date">
					<input type="text" placeholder="공연 날짜 선택"></input> <span
						class="add-on"> <i data-time-icon="icon-time"
						data-date-icon="icon-calendar"></i>
					</span>
					<input type="submit" value="선택" />
				</div>
				
			</form>

			<!-- 검색창 -->
			<form action="showboardsearch"
				style="float: right; margin-bottom: 50px;">
				<input type="text" name="searchKeyword" placeholder="검색어 입력"
					required /> <input type="submit" value="검색" />
			</form>

		</div>
	</div>

	<!-- 바디부분 -->

	<div class="container text-center">
		<div class="row justify-content-md-center">
			<div class="row align-items-start">
				<div class="row align-items-start">
					<c:forEach var="showboard" items="${showboardList}">
						<div class="col-md-3">
							<a class="table-title-link" href="${showboard.sb_no}"> <img
								alt="Bootstrap Image Preview"
								src="http://ticketimage.interpark.com/Play/image/large/18/18008332_p.gif" />
							</a> <label class="table-title-link" href="${showboard.sb_no}">
								<div class="card">
									<h5 class="card-header">
										<b>${showboard.sb_title}</b>
									</h5>
									<div class="card-body">
										<p class="card-text">${showboard.sb_nm}</p>
									</div>
									<fmt:formatDate value="${showboard.sb_startdate}"
										pattern="yyyy년 MM월 dd일 HH시 mm분" var="startdate" />
									<div class="card-footer">${startdate}</div>
								</div>
							</label>
						</div>
					</c:forEach>
				</div>
			</div>

			<nav>
				<ul class="pagination">
					<c:if test="${pageMaker.hasPrev}">
						<li class="page-item"><a class="page-link"
							href="${pageMaker.startPageNo - 1}">Previous</a></li>
					</c:if>
					<c:forEach begin="${pageMaker.startPageNo}"
						end="${pageMaker.endPageNo}" var="num">
						<li class="page-item"><a class="page-link" href="${num}">${num}</a></li>
					</c:forEach>
					<c:if test="${pageMaker.hasNext}">
						<li class="page-item"><a class="page-link"
							href="${pageMaker.endPageNo + 1}">Next</a></li>
					</c:if>
				</ul>
				<form id="page-form">
					<input type="" name="page" id="page"
						value="${pageMaker.criteria.page}" style="display: none;" /> <input
						type="" name="numsPerPage" id="numsPerPage"
						value="${pageMaker.criteria.numsPerPage}" style="display: none;" />
					<input type="" name="sb_no" id="page-form-sb_no"
						style="display: none;" />
				</form>
			</nav>
		</div>



	</div>





	<script>
		$(document).ready(function() {
			$(function() {
				$("#startdate, #enddate").datepicker({
					dateFormat : 'yy.mm.dd'
				});
			});

			$('.page-link').click(function() {
				// <a> 태그의 기본 이벤트 동작(클릭하면 페이지 이동)을 금지
				event.preventDefault();
				// 이동할 페이지 번호
				var targetPage = $(this).attr('href');
				$('#page').val(targetPage);
				// #page-form의 내용을 submit
				var frm = $('#page-form');
				frm.attr('action', 'showboardmain');
				frm.attr('method', 'get');
				frm.submit();
			});

			$('.table-title-link').click(function() {
				event.preventDefault();
				var sb_no = $(this).attr('href');
				$('#page-form-sb_no').val(sb_no);
				var frm = $('#page-form');
				frm.attr('action', 'showdetail');
				frm.attr('method', 'get');
				frm.submit();
			});
		});
	</script>


	<!-- datepicker -->
	<script type="text/javascript"
		src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.8.3/jquery.min.js">
		
	</script>
		
	<script type="text/javascript"
		src="http://tarruda.github.com/bootstrap-datetimepicker/assets/js/bootstrap-datetimepicker.min.js">
		
	</script>
	<script type="text/javascript"
		src="http://tarruda.github.com/bootstrap-datetimepicker/assets/js/bootstrap-datetimepicker.pt-BR.js">
		
	</script>
	<script type="text/javascript">
		$('#datetimepicker4').datetimepicker({
			format : 'yyyy/MM/dd',
			pickTime : false
		});
	</script>

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
					zoom : 12,
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

