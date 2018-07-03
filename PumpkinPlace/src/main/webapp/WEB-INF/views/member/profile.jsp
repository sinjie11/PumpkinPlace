<%@page import="com.error404.pumpkinplace.domain.Member"%>
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

<title>마이 페이지</title>

</head>

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

<div class="container text-center">
	<br/>
	<br/>
	<img alt="이미지"
				src="${pageContext.request.contextPath}/resources/profile.png"
				style="background-color: white; width: 110px; height: 110px;" /></a>
	<%@ include file="/WEB-INF/views/header.jspf"%>
	<h1><b>회원 정보</b></h1>
	<form action="update">
	<br/>
		<span style="font-size:18px; margin-right: 15px;"><b>회원번호</b></span>
		<input type="number" name="mem_no" style="" value="${member.mem_no}" readonly/>
		<br/>
		<br/>	
		<span style="font-size:18px; margin-right: 30px;"><b>아이디</b></span>
		<input type="text" name="mem_id" value="${member.mem_id}" readonly/>
		<br/>
		<br/>
		<span style="font-size:18px; margin-right: 15px;"><b>비밀번호</b></span>
		<input type="text"  style="background-color: lightgray;" readonly/>
		<br/>
		<br/>	
		<span style="font-size:18px; margin-right: 30px;"><b>이메일</b></span>
		<input type="text" value="${member.mem_email}" readonly />
		<br/>
		<br/>
		<span style="font-size:18px; margin-right: 15px;"><b>전화번호</b></span>
		<input type="text" value="${member.mem_tel}" readonly />
		<br/>
		<br/>
		<span style="font-size:18px; margin-right: 15px;"><b>가입일자</b></span>
		<fmt:formatDate value="${member.mem_regdate}"
			pattern="yyyy-MM-dd" var="regdate" />

		<input type="text" value="${regdate}" readonly />
		<br/>
		<br/>

		<button id=btnUpdate type="submit">수정</button>
		<br /><br />
	</form>
</div>
<script>

$(document).ready(function () {
	if (${not empty result and result == 's'}) {
		alert('${member.mem_id} 님의 정보가 수정 되었습니다.');
	}
	
	$('#btnUpdate').click(function () {
		var result = confirm('${member.mem_id} 님의 정보를 수정 하시겠습니까 ?');
		console.log('result = ' + result);
		if (result) {
			// 웹 서버로 form 데이터를 submit
			$('#form-update').submit();
		} else {
			return false;
		}
				
	});
});
</script>

	<%@ include file="/WEB-INF/views/footer.jspf"%>

</body>

</html>