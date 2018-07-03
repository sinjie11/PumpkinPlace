<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보낸 쪽지함</title>
</head>
<body>

	<h1>보낸 쪽지</h1>

	<table>

		<thead>
			<tr>
				<th>받는 사람</th>
				<th>제목</th>
				<th>내용</th>
				<th>발신 일자</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="message" items="${sendList}">
				<tr>
					<td>${message.mem_id2}</td>
					<td>${message.msg_title}</td>
					<td>${message.msg_content}</td>
					<fmt:formatDate value="${message.msg_regdate}"
						pattern="yyyy-MM-dd HH:mm:ss" var="msg_regdate" />
					<td>${msg_regdate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>


</body>
</html>