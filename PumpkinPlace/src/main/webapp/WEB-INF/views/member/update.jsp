<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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


<title>내정보 수정</title>

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
</style>


</head>

<body>
	<%@ include file="/WEB-INF/views/header.jspf"%>
	<div class="container text-center">
	<br/>
	<br/>
	<img alt="이미지"
				src="${pageContext.request.contextPath}/resources/profile.png"
				style="background-color: white; width: 110px; height: 110px;" />
	<h1><b>회원정보 수정</b></h1>

	<form id="form-update" action="update" method="post">
	
	<br/>
		<span style="font-size:18px; margin-right: 15px;"><b>회원번호</b> </span>
		<input type="number" name="mem_no" style="background-color: lightgray;" value="${member.mem_no}" readonly />
		<br/>
		<br/>
		<span style="font-size:18px; margin-right: 30px;"><b>아이디</b></span>
		<input type="text" name="mem_id" style="background-color: lightgray;" value="${member.mem_id}" readonly />
		<br/>
		<br/>
		<span style="font-size:18px; margin-right: 15px;"><b>비밀번호</b> </span>
		<input type="password" name="mem_pwd" value="${member.mem_pwd}" />
		<br/>
		<br/>
		<span style="font-size:18px; margin-right: 30px;"><b>이메일</b></span>		
		<input type="text" name="mem_email" value="${member.mem_email}" />
		<br/>
		<br/>
		<span style="font-size:18px; margin-right: 15px;"><b>전화번호</b></span>
		<input type="text" name="mem_tel" value="${member.mem_tel}" />
		<br/>
		<br/>
		<span style="font-size:18px; margin-right: 15px;"><b>가입일자</b></span>		
		<fmt:formatDate value="${member.mem_regdate}"
			pattern="yyyy.MM.dd"   var="regdate"  />

		<input type="text" style="background-color: lightgray;" value="${regdate}" readonly  />
		<br/>
		<br/>
		
		<button class="btn btn-primary" id="btnshowinsert"
		class="btn btn-primary">수정 완료</button>

		<br /><br />

	</form>
	</div>

	<%@ include file="/WEB-INF/views/footer.jspf"%>
</body>

</html>