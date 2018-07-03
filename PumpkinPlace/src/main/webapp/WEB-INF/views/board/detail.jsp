<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>#Board</title>
</head>
<body>

<h1>#글 상세 보기 페이지</h1>

<form action="update">
	<input type="hidden" name="urlNo" value="${urlNo}"/>
	<input type="number" name="b_no" value="${board.b_no}" readonly />
	<br/>
	<input type="text" value="${board.b_title}" readonly />
	<br/>
	<textarea rows="5" cols="50" readonly>${board.b_content}</textarea>
	<br/>
	<input type="text" value="${board.b_id}" readonly />
	<br/>
	<fmt:formatDate value="${board.b_regdate}"
		pattern="yyyy/MM/dd HH:mm:ss"
		var="b_regdate" />
	<input type="text" value="${b_regdate}" readonly />
	<br/>
	<!-- <input type="submit" value="수정" /> -->
	<button type="submit">수정</button>
	<button type="button" id="btnList">메인 페이지로 돌아가기</button>
</form>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script>
$(document).ready(function () {
	if (${not empty updateResult and updateResult == 'success'}) {
		alert('${board.b_no} 게시글이 수정됐습니다!');
	}
	
	$('#btnList').click(function () {
/* 		location = 'list?page=' + ${criteria.page}
			+ "&numsPerPage=" + ${criteria.numsPerPage}; */
			
			location =  '/pumpkinplace/board/list?urlNo=' + ${urlNo};
	});
});
</script>

</body>
</html>






