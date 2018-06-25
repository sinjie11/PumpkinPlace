<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pumpkin :: Bulletin Board</title>
</head>
<body>
<h3>#Bulletin Board</h3>

<ul>
	<li><a href="register">새 글 작성</a></li>
</ul>

<form action="search">
	<select name="searchType">
		<option value="1">작성자</option>
		<option value="2">글 제목</option>
		<option value="3">제목 + 내용</option>
	</select>
	<input type="text" name="searchKeyword" 
		placeholder="검색어 입력" required />
	<input type="submit" value="검색" />
</form>

<table>
	<thead>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성시간</th>
			<th>조회수</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="board" items="${boardList}">
			<tr>
				<td>${board.bno}</td>
				<td><a class="table-title-link" href="${board.b_no}">${board.b_title}</a></td>
				<td>${board.b_id}</td>
				<fmt:formatDate value="${board.b_regdate}"
					pattern="yyyy/MM/dd HH:mm:ss"
					var="regdate" />
				<td>${b_regdate}</td>
				<td>${board.b_readcnt}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(function () {
	if (${not empty deleteResult and deleteResult == 'success'}) {
		alert('${bno} 삭제 성공');
	}
	
	$('.page-link').click(function () {
		// <a> 태그의 기본 이벤트 동작(클릭하면 페이지 이동)을 금지
		event.preventDefault();
		// 이동할 페이지 번호
		var targetPage = $(this).attr('href');
		$('#page').val(targetPage);
		// #page-form의 내용을 submit
		var frm = $('#page-form');
		frm.attr('action', 'list');
		frm.attr('method', 'get');
		frm.submit();
	});
	
	$('.table-title-link').click(function () {
		event.preventDefault();
		var bno = $(this).attr('href');
		$('#page-form-bno').val(bno);
		var frm = $('#page-form');
		frm.attr('action', 'detail');
		frm.attr('method', 'get');
		frm.submit();
	});
	
});
</script>

</body>
</html>








