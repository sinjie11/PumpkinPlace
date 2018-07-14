<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>받은 쪽지(상세)</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- 부트스트랩 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style>
/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

/* Add a gray background color and some padding to the footer */
footer {
	background-color: #f2f2f2;
	padding: 25px;
}

.carousel-inner img {
	width: 100%; /* Set width to 100% */
	margin: auto;
	min-height: 200px;
}

/* Hide the carousel text when the screen is less than 600 pixels wide */
@media ( max-width : 600px) {
	.carousel-caption {
		display: none;
	}
}

body {

	position: relative; /* For scrollyspy */
	padding-top: 350px; /*Account for fixed navbar */
	background-color: #f8f8f8;

  position: relative; /* For scrollyspy */
  padding-top: 300px;   /*Account for fixed navbar */
  background-color: #f8f8f8;
}

</style>

</head>
<body>
<%@ include file="/WEB-INF/views/header.jspf"%>
	<div class="container text-center">
<br/><br/><br/>
<img alt="이미지"
				src="${pageContext.request.contextPath}/resources/msgdetail.png"
				style="background-color: white; width: 110px; height: 110px;" />
		<br/>		
	<h1><b>받은 쪽지</b></h1>
	<br />
	<br />
	<div class="container text-right">
	<span><a href="/pumpkinplace/message/receive"><button class="btn btn-primary" id="btnshowinsert"
		class="btn btn-primary">목록 보기</button></a></span>
	
	<span id="deleteMsg"><button class="btn btn-primary" id="btnshowinsert"
		class="btn btn-primary">삭제</button></span>
	</div>
	<br/>
	<br/>


	<table class="table">
		<thead>
			<tr>
				<th style="text-align: center;">보낸 사람</th>
				<th style="text-align: center;">상세 내용</th>
				<th style="text-align: center;">수신 일자</th>
			</tr>
		</thead>
		<tbody style="text-align: center;">
				<tr>
					<td>${message.mem_id}</td>
					<td>${message.msg_content}</td>
					<fmt:formatDate value="${message.msg_regdate}"
						pattern="yyyy.MM.dd HH:mm" var="msg_regdate" />
					<td>${msg_regdate}</td>				
				</tr>
		
		</tbody>
	</table>
	</div>
	
	<script>
			
		$(document).ready(function () {
			$('#deleteMsg').click(function () {
				var choice = confirm('※중요※ \n' 
						+ '삭제를 요청하는 쪽지는 데이터베이스에서 영구 삭제 되며, \n' 
						+ '삭제 후 에는 복구 불가 합니다. \n' 
						+ '다시 한번 확인 후 진행 해주시기 바랍니다.');
			
				if (choice) {
					var result = confirm('${message.mem_id}님이 ${msg_regdate} 에 \n' 
							+ '보낸 쪽지를 정말 삭제하시겠습니까?');
					
					if (result || ${not empty deleteResult and deleteResult == 'success'}) {
						alert('쪽지가 삭제 되었습니다.');
						location = 'delete?msg_no=' + ${message.msg_no};
					} // end if(result)
						
				} // end if(choice)	
					
			}); // end click(function())
			
		}); // end ready(function())
	
	</script>
	
	<%@ include file="/WEB-INF/views/footer.jspf"%>
	
</body>
</html>