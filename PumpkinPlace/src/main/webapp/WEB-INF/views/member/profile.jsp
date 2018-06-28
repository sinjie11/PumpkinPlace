<%@page import="com.error404.pumpkinplace.domain.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
</head>

	
<body>

<%@ include file="/WEB-INF/views/header.jspf"%>

	<div>
	
		<h1>Profile</h1>
					
			<span>아이디: ${member.mem_id}</span>
			<br/>
			
			<span>비밀번호: ${member.mem_pwd}</span>
			<br/>
			
			<span>이메일: ${member.mem_email}</span>
			<br/>
			
            <span>전화번호: ${member.mem_tel}</span>
            <br/>
            
			<fmt:formatDate value="${member.mem_regdate}" pattern="yyyy-MM-dd"
				var="regdate" />
			<span>가입일자: ${regdate}</span>
				
	</div>
	
<%@ include file="/WEB-INF/views/footer.jspf"%>

</body>

</html>