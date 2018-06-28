<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
<meta charset="UTF-8">

<title>내정보 수정</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

</head>

<body>

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
	
</body>

</html>