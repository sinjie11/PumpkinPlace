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

	<h1>수정 페이지</h1>

	<form id="form-update" action="update" method="post">
	
	
		<span>회원번호 </span>
		<input type="number" name="mem_no" value="${member.mem_no}" readonly />
		<br/>
		
		<span>아이디 </span>
		<input type="text" name="mem_id" value="${member.mem_id}" readonly />
		<br/>
		
		<span>비밀번호 </span>
		<input type="password" name="mem_pwd" value="${member.mem_pwd}" />
		<br/>
		
		<span>이메일 </span>		
		<input type="text" name="mem_email" value="${member.mem_email}" />
		<br/>
		
		<span>전화번호 </span>
		<input type="text" name="mem_tel" value="${member.mem_tel}" />
		<br/>
		
		<span>가입일자 </span>		
		<fmt:formatDate value="${member.mem_regdate}"
			pattern="yyyy-MM-dd" var="regdate" />

		<input type="text" value="${regdate}" readonly />
		<br/>
		<br/>
		
		<button>수정 완료</button>
		
	</form>

	<%@ include file="/WEB-INF/views/footer.jspf"%>

</body>

</html>