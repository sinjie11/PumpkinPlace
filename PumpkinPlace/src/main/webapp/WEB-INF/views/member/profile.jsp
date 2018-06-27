<%@page import="com.error404.pumpkinplace.domain.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
</head>

<%@ include file="/WEB-INF/views/header.jspf"%>
<body>


	<div>
		<h1>Profile</h1>
		<div>
			<script>
				console.log('fdfdsf');
			</script>
			<p>아이디: ${member.mem_id} 비밀번호: ${member.mem_pwd} 이메일:
				${member.mem_email}</p>

			tel: ${member.mem_tel}

			<fmt:formatDate value="${member.mem_regdate}" pattern="yyyy-MM-dd"
				var="regdate" />
			가입일자: ${regdate}
		</div>
	</div>

<%@ include  file="/WEB-INF/views/footer.jspf"%>

</body>
</html>