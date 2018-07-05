<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board</title>
</head>
<body>

<h1>${searchKeyword} 검색 결과 페이지</h1>
<table>
	<thead>
		<tr>
			<th>글 번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성시간</th>
			<th>조회수</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="board" items="${boardList}">
			<tr>
				<td>${board.bno}</td>
				<td>
					<a href="detail?bno=${board.bno}">${board.title}</a>
				</td>
				<td>${board.userid}</td>
				<fmt:formatDate value="${board.regdate}"
					pattern="yyyy/MM/dd HH:mm:ss"
					var="regdate" />
				<td>${regdate}</td>
				<td>${board.readcnt}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

</body>
</html>








