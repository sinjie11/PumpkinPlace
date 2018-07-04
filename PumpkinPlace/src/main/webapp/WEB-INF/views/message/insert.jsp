<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지 보내기</title>
</head>
<body>

	<h1>쪽지 보내기</h1>

	<form action="insert" method="post">

		<span>보내는 사람</span> 
		<input type="text" name="mem_id" value="${loginId}" readonly />
		<br />
		<br />
		
		<span>받는 사람</span> <input type="text" name="mem_id2" placeholder="받는사람" required />
		<br />
		<br />
		
		<span>쪽지내용</span>
		<textarea rows="8" cols="50" name="msg_content" placeholder="쪽지 내용 작성" required></textarea>
		<br />
		<br />
		 
		<input type="submit" value="작성 완료" />
	</form>

</body>
</html>