<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

	<br/>
	<br/>
	
	<br/><br/>
	<img alt="이미지"
				src="${pageContext.request.contextPath}/resources/msg1.png"
				style="background-color: white; width: 110px; height: 110px;" /></a>

	<h1><b>쪽지 보내기</b></h1>
	<br/>
	<br/>

	<form action="insert" method="post"  style="font-size: 15px;">
	
		<div style="margin-right: 220px;">
			<label>보내는 사람</label>
				<input type="text" name="mem_id" value="${loginId}" readonly />
				<br/>
				<br/>
		
			<label>받는 사람</label>
		 		<input type="text" style="margin-left: 15px;" name="mem_id2" placeholder="받는 사람" required />
				<br/>
				<br/>
		</div>		
			<p style="font-weight: bold; margin-right: 430px;" >쪽지 내용</p>
			<textarea style="margin-left: 80px;" rows="8" cols="50" name="msg_content" placeholder="쪽지 내용을 작성해주세요." required></textarea>
			<br/>
			<br/>
			<input type="submit" value="작성 완료"/>
			 &nbsp;&nbsp;&nbsp;&nbsp;
			<input type="reset" value="취소" onclick="history.back()" />
			<br/>
	</form>
	
	</div>
	
<%@ include file="/WEB-INF/views/footer.jspf"%>
</body>
</html>