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


	<div class="container text-center" style="border: 1px solid lightgrey;">
		<h3>글 제목: ${board.b_title}</h3>
			<p style="text-align: right;">작성자: ${board.b_id}</p>
			<fmt:formatDate value="${board.b_regdate}"
								pattern="yyyy.MM.dd HH:mm" var="b_regdate" />
			<p style="text-align: right;">작성일자: ${b_regdate}</p>
		<hr />
		
		<div id="quillContents"></div>
		<button class="btn btn-primary" id="backList">목록</button>
		<button class="btn btn-primary" id="boardUp">up ${board.b_up}</button>
		<button class="btn btn-primary" id="boardDown">down ${board.b_down}</button>
		<c:if test="${loginId eq board.b_id}">
			<button class="btn btn-primary" id="update" style="margin-left: 800px;">수정</button>
			<button class="btn btn-primary" id="delete">삭제</button>
			<button class="btn btn-primary" id="backList">목록</button>
		</c:if>

		<div id="quillContents"></div>



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
		<div id="quillContents" style="border: 1px solid black; "></div>
		<br />
		
		
		<br><br>
		<div id="replyTesk">
			<hr>
		</div>
		<br><br>
		<textarea rows="5" cols="50" id="replyCibtent" ></textarea>
		<br />
		<br />
		<button class="btn btn-primary" id="insertReply">댓글 입력</button>
		<br><br><br><br>
	</div>


	<br />

	<script type="text/javascript">
	
//quill 을 가져옴
var options = {
		  debug: 'info',
		  readOnly: true,
		  theme: 'bubble'
		};
var editor= new Quill('#quillContents', options);

//TODO 리뎃글 불러오기   style ='display: inline-block;' 인라인을 블럭으로 바꾸기  div 용
function getReReply(r_no){
	
	$.getJSON('/pumpkinplace/reply/selectAll2?b_no='+r_no,function (data) {
		
		var stringfiled = '#rereplyfiled'+r_no;
		$(data).each(function (){
			var list='';
			console.log(this.r_no);
			var date = new Date(this.r_regdate)
			var dateString = date.toLocaleDateString() + ' ' +date.toLocaleTimeString();
			list+= 
				"<tr><td>"+this.r_id+"</td><td>"+this.r_content+"</td><td>"+dateString+
				"</td><td><div><input type='hidden' id='r_no' value="+this.r_no+" readonly/>";
				if("${loginId}"===this.r_id){
					list+="<button id='updateReReply'>수정</button><button id='deleteReply'>삭제</button></div></td></tr>"
				}else{
					list+="</div></td></tr>";
				}
			$('#replyTesk').append(list);
		});
		//$(stringfiled).html(list);
		//console.log(stringfiled);
		//console.log(list);
});
}
//리플을 가져오는 펑션
function getReply(){ 
	$.getJSON('/pumpkinplace/reply/selectAll1?b_no='+${board.b_no},function (data) {
		$('#replyTesk').html('');
		$(data).each(function (){
			var list='';
			console.log(this.r_no);
			var date = new Date(this.r_regdate)
			var dateString = date.toLocaleDateString() + ' ' +date.toLocaleTimeString();
			list+= 
				"<tr><td>"+this.r_id+"&nbsp;</td><td>"+this.r_content+"</td><td>"+dateString+
				"</td><td><div><input type='hidden' id='r_no' value="+this.r_no+" readonly/><div style ='display: inline-block;' id='insertReplyPaddiv'>";
				if("${loginId}"===this.r_id){
					list+="<button id='updateReply'>수정</button><button id='deleteReply'>삭제</button><div id='stringfiled' style ='display: inline-block;'><div id='rereplyBtndiv' style ='display: inline-block;'><button id='rereplyBtn'>답글보기</button></div></div></td></tr>"
				}else{
					//list+="<div id='stringfiled' style ='display: inline-block;'><button id='rereplyBtn'>답글보기</button></div></div></td></tr>";
					list+="<div id='stringfiled' style ='display: inline-block;'><div id='rereplyBtndiv' style ='display: inline-block;'><button id='rereplyBtn'>답글보기</button></div></div></td></tr>";
				}
					//list+="</br><div id='rereplyfiled"+this.r_no+"'></div>";
				
					
					$('#replyTesk').append(list);
			
		});
		
	});	
}

$(document).ready(function () {
	
	
	editor.updateContents(${board.getB_content()});
	var replyPad = true;
	var updownBoolean = true;
	var loginId = "${loginId}";
	if(loginId===""){
		var loginStatus = false;
		console.log("로그인안됨");
	}else{
		var loginStatus = true;
		console.log("로그인됨");
	}
	getReply();
	
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
		if(updownBoolean==true&&loginStatus){
			updownBoolean=false;
			alert("해당 게시물을 추천 하였습니다.");

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
		}else if(loginStatus==false){
			alert("로그인 해주세요. ");
			}	
			else{
			alert("이미 추천 or 비추천을 하셨습니다.");
			}
	});
	
	$("#boardDown").click(function(){//u
		if(updownBoolean==true){
			updownBoolean=false;
			alert("해당 게시물을 비 추천 하였습니다.");
		$.ajax({
			type : 'get',
			url : '/pumpkinplace/board/pulsDown',
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
			alert("이미 추천 비 추천을 하셨습니다.");
		}
	});
	$('#delete').click(function () {
		var qqqq = confirm("글을 삭제 하시겠습니까?");
		
		if(qqqq){
			console.log("${board.b_section}");
			location.href='/pumpkinplace/board/delete?b_no='+${board.b_no}+'&urlNo='+${board.b_section};
		}else{
			
		}
	});
	$('#insertReply').click(function(){

		if(loginId != ""){
			var rcontent = $('#replyCibtent').val();
			$.ajax({
				type : 'get',
				url : '/pumpkinplace/reply/insert',
				headers : {
					'Content-Type' : 'application/json',
					'X-HTTP-Method-Override' : 'get'
				},//요청해더
				data : {'b_no': ${board.b_no},
						'r_section': 1,
						'r_content': $(replyCibtent).val() ,
						'r_id':	"${loginId}"
				}, //서버로 보낼 JSON 객체문자열
				success : function(result) {
					$('#replyCibtent').val('');
					getReply();
				}});
		}else{
			alert("로그인 해주세요. ");
		}
	});
	$('#replyTesk').on('click', 'td div #insertReplyPad', function () {
		if(replyPad){
			replyPad =false;
		var list = '<br><textarea rows="3" cols="50" id="rereplyCibtent" ></textarea><br><button id="insertreReply">답글 입력</button><button id = "closePad">닫기</button>';
		$(this).parent().parent().append(list);
		}else{
			replyPad =true;
			getReply();
		}
	});
	$('#replyTesk').on('click', 'td div #insertreReply', function () {
		replyPad =true;
		if(loginId != ""){
			var r_no = $(this).parent().parent().parent().prevAll('#r_no').val();
			var rcontent = $('#rereplyCibtent').val();
			console.log(r_no);
			console.log(rcontent);
			$.ajax({
				type : 'get',
				url : '/pumpkinplace/reply/insert',
				headers : {
					'Content-Type' : 'application/json',
					'X-HTTP-Method-Override' : 'get'
				},//요청해더
				data : {'b_no': r_no,
						'r_section': 2,
						'r_content': $(rereplyCibtent).val() ,
						'r_id':	"${loginId}"
				}, //서버로 보낼 JSON 객체문자열
				success : function(result) {
					getReply();
				}});
		}else{
			alert("로그인 해주세요.");
		}
	});
	
	$('#replyTesk').on('click', 'td div #rereplyBtn', function () {
		var parent = $(this).parent();
		var r_no = $(this).parent().parent().parent().prevAll('#r_no').val();
		console.log(r_no);
		
		parent.empty();
		parent.append("<button id='closeRereply'>닫기</button>");
		parent.append('<textarea rows="1" cols="50" id="rereplyCibtent" ></textarea><button id="insertreReply">답글 입력</button>');
		$.getJSON('/pumpkinplace/reply/selectAll2?b_no='+r_no,function (data) {
			
			var stringfiled = '#rereplyfiled'+r_no;
			$(data).each(function (){
				var list='';
				console.log(this.r_no);
				var date = new Date(this.r_regdate)
				var dateString = date.toLocaleDateString() + ' ' +date.toLocaleTimeString();
				list+= 
					"<tr><td>"+this.r_id+"&nbsp;&nbsp;</td><td>"+this.r_content+"</td><td>"+dateString+
					"</td><td><div><input type='hidden' id='r_no' value="+this.r_no+" readonly/>";
					if("${loginId}"===this.r_id){
						//list+="<button id='updateReReply'>수정</button><button id='deleteReply'>삭제</button></div></td></tr>"
						list+="</div></td></tr>";
					}else{
						list+="</div></td></tr>";
					}
					parent.append(list);
					
			});
			
	});
	});
	
	$('#replyTesk').on('click', 'td div #closePad', function () {
		
	});
	$('#replyTesk').on('click', 'td div #closeRereply', function () {
		var parent = $(this).parent()
		parent.empty();
		parent.append("<button id='rereplyBtn'>답글보기</button>");
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




</script>


</body>

<!-- footer -->
<%@ include file="/WEB-INF/views/footer.jspf"%>

</html>
