<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지 보내기</title>

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
	<div class="container text-center">
<br/><br/><br/>
<img alt="이미지"
				src="${pageContext.request.contextPath}/resources/msgdetail.png"
				style="background-color: white; width: 110px; height: 110px;" />
		<br/>		
	<h1><b>받은 쪽지 상세 페이지</b></h1>


	<table class="table">
		<thead>
			<tr>
				<th style="text-align: center;">보낸 사람</th>
				<th style="text-align: center;">내용</th>
				<th style="text-align: center;">수신 일자</th>
			</tr>
		</thead>
		<tbody style="text-align: center;">
				<tr>
					<td>${message.mem_id}</td>
					<td>${message.msg_content}</td>
					<fmt:formatDate value="${message.msg_regdate}"
						pattern="yyyy.MM.dd HH:mm" var="msg_regdate" />
					<td>${msg_regdate}</td>
				</tr>
		
		</tbody>
	</table>
	</div>
	<%@ include file="/WEB-INF/views/footer.jspf"%>
</body>
</html>