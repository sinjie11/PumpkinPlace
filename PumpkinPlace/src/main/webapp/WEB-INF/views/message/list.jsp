<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지함</title>

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
	
	<!-- 본문 작성 -->
	<div class="container text-center">
	</br></br>
	<img alt="이미지"
				src="${pageContext.request.contextPath}/resources/post.png"
				style="background-color: white; width: 110px; height: 110px;" /></a>
	<h1><b>쪽지함</b></h1>
	</div>

	<div class="container text-center" style="display: flex;">
	<div style="margin: 140px; margin-left: 60px; margin-top: 80px;"  >
	<img alt="이미지"
				src="${pageContext.request.contextPath}/resources/msg1.png"
				style="background-color: white; width: 150px; height: 150px;" /></a><br/><br/>
	<a href="/pumpkinplace/message/insert" style="text-align: left; font-size: 20px;
	font-style: inherit; ">쪽지 보내기</a>
	</div>
	
	
	<div style="margin: 140px; margin-top: 80px;" >
	<img alt="이미지"
				src="${pageContext.request.contextPath}/resources/msg2.png"
				style="background-color: white; width: 150px; height: 150px;" /></a><br/><br/>
	<a href="/pumpkinplace/message/recieve" style="text-align: center;font-size: 20px;
	font-style: inherit; "">받은 쪽지함</a>
	</div>

	<div style="margin: 140px; margin-top: 80px;">
	<img alt="이미지"
				src="${pageContext.request.contextPath}/resources/msg3.png"
				style="background-color: white; width: 150px; height: 150px;" /></a><br/><br/>
	<a href="/pumpkinplace/message/send" style="text-align:right;font-size: 20px;
	font-style: inherit; "">보낸 쪽지함</a>
	</div>	
	</div>

	<%@ include file="/WEB-INF/views/footer.jspf"%>
</body>
</html>