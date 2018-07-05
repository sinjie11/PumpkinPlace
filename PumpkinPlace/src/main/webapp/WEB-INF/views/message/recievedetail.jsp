<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세패이지</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

</head>
<body>

	<h1>쪽지 상세 페이지</h1>


	<table>
		<thead>
			<tr>
				<th>보낸 사람</th>
				<th>받은 사람</th>
				<th>내용</th>
				<th>수신 일자</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="message" items="${recieveDetail}">
				<tr>
					<td>${message.mem_id}</td>
					<td>${message.mem_id2}</td>
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