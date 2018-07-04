<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보낸 쪽지함</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

</head>
<body>

	<h1>보낸 쪽지</h1>

	<table>

		<thead>
			<tr>
				<th>받는 사람</th>
				<th>내용</th>
				<th>발신 일자</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="message" items="${sendList}">
				<tr>
					<td>${message.mem_id2}</td>
					<td><a class="table-title-link">${message.msg_content}</a></td>
					<fmt:formatDate value="${message.msg_regdate}"
						pattern="yyyy-MM-dd HH:mm:ss" var="msg_regdate" />
					<td>${msg_regdate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

<div class="container text-center">
			<ul class="pagination">
				<c:if test="${pageMaker.hasPrev}">
					<li><a class="page-link" href="${pageMaker.startPageNo - 1}">이전</a></li>
				</c:if>
				<c:forEach begin="${pageMaker.startPageNo}"
					end="${pageMaker.endPageNo}" var="num">
					<li><a class="page-link" href="${num}">${num}</a></li>
				</c:forEach>
				<c:if test="${pageMaker.hasNext}">
					<li><a class="page-link" href="${pageMaker.endPageNo + 1}">다음</a></li>
				</c:if>
			</ul>
		</div>
		
	<form id="page-form">
		<input type="hidden" name="page" id="page"
			value="${pageMaker.criteria.page}" /> <input type="hidden"
			name="numsPerPage" id="numsPerPage"
			value="${pageMaker.criteria.numsPerPage}" /> <input type="hidden"
			name="msg_no" id="page-form-msg_no" />
			<input type="hidden" name="msg_no" value="${msg_no}" />
	</form>

<script>
$('.page-link').click(function () {
	event.preventDefault();
	var targetPage = $(this).attr('href');
	$('#page').val(targetPage);
	var frm = $('#page-form');
	frm.attr('action', 'send');
	frm.attr('method', 'get');
	frm.submit();
});


$('.table-title-link').click(function () {
	event.preventDefault();
	var msg_no = $(this).attr('href');
	$('#page-form-msg_no').val(msg_no);
	var frm = $('#page-form');
	frm.attr('action', 'recievedetail');
	frm.attr('method', 'get');
	frm.submit();
});

</script>

</body>
</html>