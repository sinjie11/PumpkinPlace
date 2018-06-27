<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
<title>Pumk</title>
<meta charset="utf-8">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/css/form-elements.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/css/style.css">

<style>
#register {
	margin-top: 100px;
	margin-bottom: 200px;
	background-color: #f2f2f2;
	padding: 30px;
	border-radius: 10px;
	width: 70%;
	max-width: 800px; /* 최대 크기 지정 */
	margin: auto;
}
</style>
</head>
<body>
	<h1 style="margin-top: 100px; margin-bottom: 100px;">회원 가입 페이지</h1>


	<div id="register">
		<p>회원가입을 위해 필요한 정보를 아래와 같이 입력해 주십시오</p>
		<br />

		<form id="regForm" action="register" method="post">

			<input type="text" name="mem_id" id="mem_id" placeholder="아이디 입력"required style="width: 50%;" />
			<br/>
			 
			<span id="valid-mem" style="color: green; display: none; height: 70%;">
			 	사용가능한	아이디입니다. 
			 </span> 
			
			<span id="invalid-mem" style="color: red; display: none; height: 70%;">
			 	사용할 수 없는 아이디입니다. 
			</span> 
			<br/> 
			
			<input type="password" name="mem_pwd" id="mem_pwd" placeholder="비밀번호 입력" required 
			style="margin: 5px; width: 50%;" /> 
			<br/>
			<br/>
			
			<input type="email" name="mem_email" id="mem_email" placeholder="이메일 입력" required 
			style="width: 50%;" /> <br /> <br />

			<input type="text" name="mem_tel" id="mem_tel" placeholder="전화번호 입력" required 
			style="margin: 5px; width: 50%;" /> <br /> <br />

			<button type="button" id="btnRegister" class="btn" 
			style="margin-right: 10px; width: 30%;">회원 가입</button>
			
			<input type="reset" value="취소" onclick="history.back()" 
			class="btn btn-link-1 btn-link-1-google-plus" style="padding-top: 0px; width: 20%;">

		</form>
	</div>


	<script>
$(document).ready(function () {
	var validId = false;
	
	$('#mem_id').change(function () {
		var id = $(this).val();
		console.log('mem_id = ' + id);
		// $.post(url, data, callback)
		// 	url: Ajax POST 방식 요청을 보낼 주소
		//  data: 서버로 보낼 데이터(object)
		//  callback: 서버에서 HttpStatus.OK 응답이 왔을 때 실행할 콜백 함수
		$.post('/pumpkinplace/member/checkMemid',
				{'mem_id': id},
				function (data) {
					console.log('data = ' + data);
					if (data) {
						validId = true;
						$('#valid-mem').show();
						$('#invalid-mem').hide();
					} else {
						validId = false;
						$('#valid-mem').hide();
						$('#invalid-mem').show();
					}
				}); // end post()
		
		/*
		$.ajax({
			type: 'post',
			url: '',
			headers: {},
			data: JSON.stringify(),
			success: function () {}
		});
		*/
	}); // end change()
	
	$('#btnRegister').click(function() {
		if (!validId) {
			alert('아이디를 확인하세요!');
		} else {
			if ($('#mem_pwd').val().length >= 1) {
				
				if($('#mem_email').val().length >= 1) {
				
					if ($('#mem_tel').val().length >= 1) {
						$('#regForm').submit();
					} else {
						alert('전화번호를 확인하세요!');
					}
					
				} else {
					alert('이메일을 확인하세요!');
				}
			} else {
				alert('비밀번호를 확인하세요!');
			}
		}
	});
	
});

</script>

</body>

</html>

