<%@page import="com.error404.pumpkinplace.domain.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>마이 페이지</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

</head>


<body>

	<h1>Profile</h1>

	<form action="update">
	
		<span>회원번호 </span>
		<input type="number" name="mem_no" value="${member.mem_no}" readonly/>
		<br/>
		
		<span>아이디 </span>
		<input type="text" name="mem_id" value="${member.mem_id}" readonly/>
		<br/>
		
		<span>이메일 </span>
		<input type="text" value="${member.mem_email}" readonly />
		<br/>
		
		<span>전화번호 </span>
		<input type="text" value="${member.mem_tel}" readonly />
		<br/>
		
		<span>가입일자 </span>
		<fmt:formatDate value="${member.mem_regdate}"
			pattern="yyyy-MM-dd" var="regdate" />

		<input type="text" value="${regdate}" readonly />
		<br/>
		<br/>

		<button id=btnUpdate type="submit">수정</button>
		
	</form>

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

</body>

</html>