<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Quill -->
<script src="//cdn.quilljs.com/1.3.6/quill.js"></script>
<script src="//cdn.quilljs.com/1.3.6/quill.min.js"></script>
<link href="//cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
<link href="//cdn.quilljs.com/1.3.6/quill.bubble.css" rel="stylesheet">
</head>
<body>
	<div id="quillContents"></div>

	<script type="text/javascript">
	var options = {
			  debug: 'info',
			  readOnly: true,
			  theme: 'bubble'
			};
	var editor= new Quill('#quillContents', options);
	
	
	$(document).ready(function () {
		console.log("${board.getB_title()}");
		console.log(${board.getB_content()});
	});
</script>
</body>
</html>