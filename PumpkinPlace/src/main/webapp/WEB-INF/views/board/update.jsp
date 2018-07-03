<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board</title>
</head>
<body>

<h1>글 수정 페이지</h1>

<form id="form-update" action="update" method="post">
	<input type="hidden" name="urlNo" value="${urlNo}" />
	<input type="number" name="b_no" value="${board.b_no}" readonly />
	<br/>
	<input type="text" name="b_title" value="${board.b_title}" />
	<br/>
	<textarea name="b_content" rows="5" cols="50">${board.b_content}</textarea>
	<br/>
	<input type="text" name="b_id" value="${board.b_id}" readonly />
	<br/>
	<fmt:formatDate value="${board.b_regdate}"
		pattern="yyyy/MM/dd HH:mm:ss"
		var="b_regdate" />
	<input type="text" value="${b_regdate}" readonly />
	<br/>

</form>

<button id="btnUpdate">수정 완료</button>
<button id="btnDelete">삭제</button>
<button id="btnList">메인 리스트로 돌아가기</button>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(function () {
	$('#btnUpdate').click(function () {
		var result = confirm('b_no: ${board.b_no} 정말 수정하실건가요?');
		console.log('result = ' + result);
		if (result) {
			// 웹 서버로 form 데이터를 submit
			$('#form-update').submit();
			
		}
	});
	
	$('#btnList').click(function () {
		location =  '/pumpkinplace/board/list?urlNo=' + ${urlNo};
	});
	
	$('#btnDelete').click(function () {
		var result = confirm('${board.b_no} 정말 삭제?');
		if (result) {
 			location = 'delete?b_no=' + ${board.b_no} + '&urlNo=' + ${urlNo}; 

		}
	});
	
});
</script>

</body>
</html>






