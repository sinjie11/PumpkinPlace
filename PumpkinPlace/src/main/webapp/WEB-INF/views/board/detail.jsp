<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<!-- Quill -->
<script src="//cdn.quilljs.com/1.3.6/quill.js"></script>
<script src="//cdn.quilljs.com/1.3.6/quill.min.js"></script>
<link href="//cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
<link href="//cdn.quilljs.com/1.3.6/quill.bubble.css" rel="stylesheet">
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
}
</style>
</head>
<body>

	<%@ include file="/WEB-INF/views/header.jspf"%>


	<div class="container text-center">
		<h1>${board.b_title}</h1>

		<c:if test="${loginId eq board.b_id}">
			<button class="btn btn-primary" id="update" style="margin-left: 800px;">수정</button>
			<button class="btn btn-primary" id="delete">삭제</button>
			<button class="btn btn-primary" id="backList">목록</button>
		</c:if>

		<div id="quillContents"></div>		
		<button class="btn btn-primary"  id="boardUp">up ${board.b_up}</button>
		<button class="btn btn-primary"  id="boardDown">down ${board.b_down}</button>



		<form action="#"></form>

		<br> <br> <br> <br>
			<div>
				<button class="btn btn-primary" 
		 id="prevBoard">이전 글</button>
				<button class="btn btn-primary" 
		 id="nextBoard">다음 글</button>
			</div>
		
		<form id="update">
		<input type="hidden" name="page" id="page"
			value="${criteria.page}" /> <input type="hidden"
			name="numsPerPage" id="numsPerPage"
			value="${criteria.numsPerPage}" /> <input type="hidden"
			name="b_no" value="${board.b_no}" />
			<input type="hidden" name="urlNo" value="${urlNo}" />
		</form>
			
		<br />

		<form action="#">
		</form>
		<div id="quillContents" style="border: 1px solid black;"></div>
		<br />
		
		
		<br><br><br><br>
		<button class="btn btn-primary">댓글 입력</button>
		<button class="btn btn-primary">댓글 up</button>
		<button class="btn btn-primary">댓글 down</button>
	</div>


	<br />

	<script type="text/javascript">
var options = {
		  debug: 'info',
		  readOnly: true,
		  theme: 'bubble'
		};
var editor= new Quill('#quillContents', options);


$(document).ready(function () {
	editor.updateContents(${board.getB_content()});
	var updownBoolean = true;
	
	$("#update").click(function(){
		location.href='/pumpkinplace/board/update?&b_no=' +  ${board.b_no};
		});
	
	$('#delete').click(function () {
		var result = confirm('${board.b_no} 글을 정말 삭제하시겠습니까?');
		if (result) {
			location.href = '/pumpkinplace/board/delete?urlNo=' + ${board.b_section} + '&b_no=' + ${board.b_no};
		}
	});
	
	$("#backList").click(function (){//메뉴로 보내기
		location.href='/pumpkinplace/board/list?urlNo=' +  ${board.b_section};
	});
	$("#boardUp").click(function(){//up
		if(updownBoolean==true){
			updownBoolean=false;
			alert("해당 게시물을 추천하였습니다");

		$.ajax({
			type : 'get',
			url : '/pumpkinplace/board/pulsUp',
			headers : {
				'Content-Type' : 'application/json',
				'X-HTTP-Method-Override' : 'get'
			},//요청해더
			data : {'b_no': ${board.b_no}}, //서버로 보낼 JSON 객체문자열
			success : function(result) {
				//console.log(result.getB_up());
				console.log(result);
				$("#boardUp").text("up " + result.b_up);
				$("#boardDown").text("down "+result.b_down);
			} 
			});
		}else{
			alert("이미 추천 비추천을 하셧습니다 씨발");
		}
	});
	
	$("#boardDown").click(function(){//up
		if(updownBoolean==true){
			updownBoolean=false;
			alert("해당 게시물을 비추천하였습니다. 이런...");
		$.ajax({
			type : 'get',
			url : '/pumpkinplace/board/pulsDown?',
			headers : {
				'Content-Type' : 'application/json',
				'X-HTTP-Method-Override' : 'get'
			},//요청해더
			data : {'b_no': ${board.b_no}}, //서버로 보낼 JSON 객체문자열
			success : function(result) {
				//console.log(result.getB_up());
				console.log(result);
				$("#boardUp").text("up " + result.b_up);
				$("#boardDown").text("down "+ result.b_down);
			} 
			});
		}else{
			alert("이미 추천 비추천을 하셧습니다 씨발");
		}
	});
	
	$('#prevBoard').click(function () {
		console.log('이전페이지')
		
		$.ajax({
			type : 'post',
			url : '/pumpkinplace/board/prevBoardNo',
			headers : {
				'Content-Type' : 'application/json',
				'X-HTTP-Method-Override' : 'post'
			},//요청해더
			data : JSON.stringify({'b_no': ${board.b_no},
				'b_section': ${board.b_section}
			}),
			//서버로 보낼 JSON 객체문자열
			success : function(result) {
				console.log(result);
				console.log('urlNo:' + ${board.b_section});
				console.log('page:' + ${criteria.page});
				console.log('numsPerPage:' + ${criteria.numsPerPage})
				location='/pumpkinplace/board/detail?page=' + ${criteria.page} 
				+ '&numsPerPage=' + ${criteria.numsPerPage} + '&b_no=' + result + '&urlNo=' + ${board.b_section};
			}
			
			});
	});
	
	$('#nextBoard').click(function () {
		console.log('다음페이지')
		
		$.ajax({
			type : 'post',
			url : '/pumpkinplace/board/nextBoardNo',
			headers : {
				'Content-Type' : 'application/json',
				'X-HTTP-Method-Override' : 'post'
			},//요청해더
			data : JSON.stringify({'b_no': ${board.b_no},
				'b_section': ${board.b_section}
			}),
			//서버로 보낼 JSON 객체문자열
			success : function(result) {
				console.log(result);
				location='/pumpkinplace/board/detail?page=' + ${criteria.page}
				+ '&numsPerPage=' + ${criteria.numsPerPage} + '&b_no=' + result + '&urlNo=' + ${board.b_section};
			}
			
			});
	});
});



/*$('#update').click(function () {
	event.preventDefault();
	var fb = $('#send-update');
	fb.attr('action', '/pumpkinplace/board/update');
	fb.attr('method', 'get');
	fb.submit();
	
	
});*/

</script>


</body>

<!-- footer -->
<%@ include file="/WEB-INF/views/footer.jspf"%>

</html>
