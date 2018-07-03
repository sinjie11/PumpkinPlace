<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>받은 쪽지</title>
</head>
<body>

	<table>
		<thead>
			<tr>
				<th>읽음</th>
				<th>보낸 사람</th>
				<th>내용</th>
				<th>수신 일자</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="message" items="${recieveList}">
				<tr>
					<td>${message.msg_confirm}</td>
					<td>${message.mem_id}</td>
					<td style="font-weight: bold;"><a
						href="/pumpkinplace/message/recievedetail">${message.msg_content}</a></td>
					<fmt:formatDate value="${message.msg_regdate}"
						pattern="yyyy-MM-dd HH:mm:ss" var="msg_regdate" />
					<td>${msg_regdate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>