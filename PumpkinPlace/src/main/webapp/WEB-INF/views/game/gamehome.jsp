<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:choose>
	<c:when test="${urlNo eq 1}">
	<title>자유 게시판</title>
	</c:when>
	
	<c:when test="${urlNo eq 2}">
	<title>기타</title>
	</c:when>
	
	<c:when test="${urlNo eq 3}">
	<title>베이스</title>
	</c:when>
	
	<c:when test="${urlNo eq 4}">
	<title>드럼/퍼커션</title>
	</c:when>
	
	<c:when test="${urlNo eq 5}">
	<title>앰프</title>
	</c:when>
	
	<c:when test="${urlNo eq 6}">
	<title>음향장비</title>
	</c:when>
	
	<c:when test="${urlNo eq 7}">
	<title>etc</title>
	</c:when>
	
	<c:when test="${urlNo eq 8}">
	<title>구인</title>
	</c:when>
	
	<c:when test="${urlNo eq 9}">
	<title>구직</title>
	</c:when>
	
	<c:when test="${urlNo eq 11}">
	<title>전체보기(구인구직)</title>
	</c:when>
	
	<c:when test="${urlNo eq 12}">
	<title>전체보기(중고거래)</title>
	</c:when>
	
	<c:when test="${urlNo eq 20}">
	<title>Q&A</title>
	</c:when>
	
</c:choose>

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
}

</style>
</head>
<body>

	<%@ include file="/WEB-INF/views/header.jspf"%>

  <a  id="show_game" href="/pumpkinplace/game/gamepage">
      <img alt="이미지" 
      src="${pageContext.request.contextPath}/resources/startbutton.png"
        style="background-color: white;" />
    </a>

		<div class="container text-right">
			<form action="search">
				<ul>
					<c:if test="${urlNo ne 11 and urlNo ne 12}">
						<a id="register" href="/pumpkinplace/board/list?urlNo=${urlNo}">
						<button class="btn btn-primary" type="button">글쓰기</button></a>
					</c:if>
				</ul>

			</form>
		</div>
		${board.b_no}
		<div class="container text-center">
			<table class="table">
				<thead>
					<tr>
						<th class="text-center">순위</th>
						<th class="text-center">사용자</th>
						<th class="text-center">점수</th>
					</tr>
				</thead>
				<tbody>
				<% int i=0; %>
					<c:forEach var="game" items="${gameList}">

						<tr>
							<td><%= i++%></td>
							<td>${game.mem_id}</td>
							<td>${game.mem_gamescore}</td>
				
						</tr>
						
					</c:forEach>
				</tbody>
			</table>
		</div>

   </div>
   <br />

   <form id="page-form">
      <input type="hidden" name="page" id="page"
         value="${pageMaker.criteria.page}" /> <input type="hidden"
         name="numsPerPage" id="numsPerPage"
         value="${pageMaker.criteria.numsPerPage}" /> <input type="hidden"
         name="b_no" id="page-form-bno" />
         <input type="hidden" name="urlNo" value="${urlNo}" />
   </form>



	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

</body>

<!-- footer -->
<%@ include file="/WEB-INF/views/footer.jspf"%>

</html>
