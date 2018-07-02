<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	padding-top: 350px; /*Account for fixed navbar */
	background-color: #f8f8f8;

  position: relative; /* For scrollyspy */
  padding-top: 300px;   /*Account for fixed navbar */
  background-color: #f8f8f8;
}
</style>
</head>
<body>

	<%@ include file="/WEB-INF/views/header.jspf"%>
	<br/>


	<div class="container text-center">
		<c:if test="${urlNo eq 1}">
			<h5 style="text-align: left;"><b> 카테고리: 게시판 > 자유게시판 </b></h5>
			<br/>
			<br/>
			<h1>자유 게시판</h1>
		</c:if>
		
		<c:if test="${urlNo eq 8}">
			<h5 style="text-align: left;"><b> 카테고리: 구인구직 > 구인 </b></h5>
			<br/>
			<br/>
			<h1>구 인</h1>
		</c:if>
		
		<c:if test="${urlNo eq 9}">
			<h5 style="text-align: left;"><b> 카테고리: 구인구직 > 구직 </b></h5>
			<br/>
			<br/>
			<h1>구 직</h1>
		</c:if>
		
		<c:if test="${urlNo eq 20}">
			<h5 style="text-align: left;"><b> 카테고리: Q & A </b></h5>
			<br/>
			<br/>
			<h1>Q & A</h1>
		</c:if>

		<div class="container text-right">
			<form action="search">
				<ul>
					<select name="searchType">
						<option value="1">10개씩 보기</option>
						<option value="2">20개씩 보기</option>
						<option value="3">40개씩 보기</option>
					</select>

				</ul>
				<a id="register" href="register"><button type="button">글쓰기</button></a>
			</form>
		</div>

		<div class="container text-center">
			<table class="table">
				<thead>
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성시간</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="board" items="${boardList}">
						<tr>
							<td>${board.b_no}</td>
							<td><a class="table-title-link" href="${board.b_no}">${board.b_title}</a></td>
							<td>${board.b_id}</td>
							<fmt:formatDate value="${board.b_regdate}"
								pattern="yyyy/MM/dd HH:mm:ss" var="b_regdate" />
							<td>${b_regdate}</td>
							<td>${board.b_readcnt}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="container text-center">
			<ul class="pagination">
				<c:if test="${pageMaker.hasPrev}">
					<li><a class="page-link" href="${pageMaker.startPageNo - 1}">이전</a></li>
				</c:if>
				<c:forEach begin="${pageMaker.startPageNo}"
					end="${pageMaker.endPageNo}" var="num">
					<li><a class="page-link" href="${num}">${num}</a></li>
				</c:forEach>
				<c:if test="${pageMaker.hasNext}">
					<li><a class="page-link" href="${pageMaker.endPageNo + 1}">다음</a></li>
				</c:if>
			</ul>
		</div>
		<form action="search">
			<select name="searchType">
				<option value="1">작성자</option>
				<option value="2">글 제목</option>
				<option value="3">제목 + 내용</option>
			</select> <input type="text" name="searchKeyword" placeholder="검색어 입력"
				required /> <input type="submit" value="검색" />
		</form>

	</div>


	<form id="page-form">
		<input type="hidden" name="page" id="page"
			value="${pageMaker.criteria.page}" /> <input type="hidden"
			name="numsPerPage" id="numsPerPage"
			value="${pageMaker.criteria.numsPerPage}" /> <input type="hidden"
			name="bno" id="page-form-bno" />
	</form>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>
	$(document).ready(function () {
	if (${not empty deleteResult and deleteResult == 'success'}) {
		alert('${b_no} 삭제 성공');
	}
	
	$('.page-link').click(function () {
		event.preventDefault();
		var targetPage = $(this).attr('href');
		$('#page').val(targetPage);
		var frm = $('#page-form');
		frm.attr('action', 'list');
		frm.attr('method', 'get');
		frm.submit();
	});
	
	$('.table-title-link').click(function () {
		event.preventDefault();
		var b_no = $(this).attr('href');
		$('#page-form-bno').val(b_no);
		var frm = $('#page-form');
		frm.attr('action', 'detail');
		frm.attr('method', 'get');
		frm.submit();
	});
	
	console.log('boardSectionNo: ${boarSectionNo}'); // 보드 구분번호
	
	$('#register').click(function () { // qna
		event.preventDefault();
		$('#url-no').val(${urlNo});
		var fb = $('#url-form');
		fb.attr('action', '/pumpkinplace/board/register');
		fb.attr('method', 'get');
		fb.submit();
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
				zoom : 12,
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
<%@ include file="/WEB-INF/views/footer.jspf"%>

</html>







