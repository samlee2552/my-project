<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="${board.name} 게시물 수정" />
<%@ include file="../part/head.jspf"%>
<h1>게시물 수정</h1>
<script>
	var ArticleModifyForm__sumbitDone = false;
	function ArticleModifyForm__submit(form) {
		if (ArticleModifyForm__submitDone) {
			alert('처리중입니다');
			return;
		}

		form.title.value = form.title.value.trim();

		if (form.title.value.length == 0) {
			form.title.focus();
			alert('제목을 입력해주세요.');

			return;
		}

		form.body.value = form.body.value.trim();

		if (form.body.value.length == 0) {
			form.body.focus();
			alert('내용을 입력해주세요.');

			return;
		}

		ArticleModifyForm__submitDone = true;
		form.submit();
	}
</script>

<form class="table-box con form1" method="POST"
	action="doModify"
	onsubmit="ArticleModifyForm__submit(this); return false;">
	<input type="hidden" name="redirectUri"
		value="/usr/article/detail?id=${article.id}" /> <input
		type="hidden" name="id" value="${article.id}" />
	<table>
		<tbody>
			<tr>
				<th>번호</th>
				<td>${article.id}</td>
			</tr>
			<tr>
				<th>날짜</th>
				<td>${article.regDate}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
					<div class="form-control-box">
						<input type="text" value="${article.title}" name="title"
							placeholder="제목을 입력해주세요." />
					</div>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<div class="form-control-box">
						<textarea name="body" placeholder="내용을 입력해주세요.">${article.body}</textarea>
					</div>
				</td>
			</tr>
			<tr>
				<th>글 수정</th>
				<td>
					<div class="btn-box margin-top-20">
						<button type="submit" class="btn btn-primary">수정</button>
					</div>
				</td>
			</tr>
		</tbody>
	</table>
</form>

<%@ include file="../part/foot.jspf"%>