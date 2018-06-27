<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pumpkin :: Register Form</title>
</head>
<body>
	<h3>#Write a new post</h3>

	<form action="register" method="post">
			<input type="number" name="b_section" placeholder="게시판유형" required />
		<br>
		<input type="text" name="b_title" placeholder="글 제목" required /> <br />
		<textarea rows="5" cols="50" name="b_content" placeholder="내용 작성"
			required></textarea>
		<br /> <input type="text" name="b_img" placeholder="이미지"  />
		<br /> <input type="text" name="b_video" placeholder="비디오"  />
		<br /> <input type="text" name="b_id" placeholder="작성자 아이디" required />
		<br /> <input type="submit" value="작성 완료" />
	</form>

</body>
</html>