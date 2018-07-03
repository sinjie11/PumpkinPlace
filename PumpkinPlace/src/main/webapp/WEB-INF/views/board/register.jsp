<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
<title>PumpkinPlace</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
}
</style>
</head>
<body>

	<%@ include file="/WEB-INF/views/header.jspf"%>
	
	<div class="container text-center">
	<c:if test="${urlNo eq 1}">
		<h5 style="text-align: left;"><b> 카테고리: 게시판 > 자유게시판 > 새 글쓰기</b></h5>
	</c:if>
	<c:if test="${urlNo eq 8}">
		<h5 style="text-align: left;"><b> 카테고리: 구인구직 > 구인 > 새 글쓰기</b></h5>
	</c:if>
	<c:if test="${urlNo eq 9}">
		<h5 style="text-align: left;"><b> 카테고리: 구인구직 > 구직 > 새 글쓰기</b></h5>
	</c:if>
	<c:if test="${urlNo eq 20}">
		<h5 style="text-align: left;"><b> 카테고리: Q & A > 새 글쓰기</b></h5>
	</c:if>
	<br/>
	<br/>


		<div class="container text-center">
			<br />
			<br />
			<h1>새 글쓰기</h1>
			<br />
			<form>
				<input type="text" id="title" style="width: 385px;"
					placeholder="글 제목" required name= "title"/> <br /> <br />
			</form>
		</div>
		<div id="quillContents"></div>
				<br />
				<div class="text-center"><button id="submit" >작성완료</button></div>
	</div>
	<br />
	<br />
	<br />

			<script>
				function myMap() {
					var myCenter = new google.maps.LatLng(37.499685, 127.031535);
					var map;

					var mapProp = {
						center : myCenter,
						zoom : 16,
						scrollwheel : false,
						draggable : false,
						mapTypeId : google.maps.MapTypeId.ROADMAP
					};
					var map = new google.maps.Map(document
							.getElementById("googleMap"), mapProp);
					var marker = new google.maps.Marker({
						position : myCenter
					});
					marker.setMap(map);

				}

				
				
			</script>
			<script type="text/javascript">
			var options = {
					  debug: 'info',
					  modules: {
					    toolbar: 
					    [['bold','italic','underline','strike' ]
					    ,[{'color':[]},{'background':[]}]
					    ,['blockquote','code-block']			//코드 적기
					    ,[{'header':[1,2,3,4,5,6]}]		//해드 
					    ,[{'list':'ordered'},{'list':'bullet'}]	//표정리
					    ,[{'script':'sub'},{'script':'super'}]	//제곱 위치 
					    ,[{'indent':'-1'},{'indent':'+1'}]		//들여 쓰기
					    ,[{'direction':'rtl'}]					//오른쪽 정렬 
					    ,[{'size':['small',false,'large','huge']}]
					    ,['image','formula','link','video']		//첨부
					    ,[{'font':[]}],[{'align':[]}]			//글정렬
					    ]},
					  placeholder: '입력하고 싶은 글을 입력하세요',
					  readOnly: false,
					  theme: 'snow'
					};
			var quillContents = new Quill('#quillContents', options);
			
				$('#submit').click(function() {
					var contents = quillContents.getContents();
					var jsonContents =JSON.stringify(contents);
					
					$.ajax({
						type : 'post',
						url : '/pumpkinplace/board/insert/',
						headers : {
							'Content-Type' : 'application/json',
							'X-HTTP-Method-Override' : 'post'
						},//요청해더
						data : JSON.stringify({//오브 잭트를 문자열로 변환
							'b_section' : "${urlNo}", // 제형이가 전달할 섹션 넘버 
							'b_title' : $('#title').val(),
							'b_id' : "${loginId}",
							'b_content' :jsonContents
						}), //서버로 보낼 JSON 객체문자열
						success : function(result) {
							location = '/pumpkinplace/board/list?urlNo=' +  ${urlNo};
						} 
					});
				
				});
			</script>
			<script
				src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBLOpelo4l6yKdCApN_d5uUehocuiw7Uuk&callback=myMap"></script>

		</footer>


		<%@ include file="/WEB-INF/views/footer.jspf"%>
		
</body>
</html>

