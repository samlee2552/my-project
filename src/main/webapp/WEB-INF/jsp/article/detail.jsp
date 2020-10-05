<%@ page import="com.sbs.sbl.mp.util.Util"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 모바일에서 사이트가 PC에서의 픽셀크기 기준으로 작동하게 하기(반응형 하려면 필요) -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- 구글 폰트 불러오기 -->
<!-- rotobo(400/700/900), notosanskr(400/600/900) 	-->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&family=Roboto:wght@400;700&display=swap"
	rel="stylesheet">

<!-- 폰트어썸 불러오기 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css">


<!-- 제이쿼리 불러오기 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js">
</script>

<!-- 공통(라이브러리) CSS -->
<link rel="stylesheet" href="/resource/common.css" />

<!-- 공통(라이브러리) JS -->
<script src="/resource/common.js"></script>

<!-- 공통 JS -->
<script src="/resource/app.js"></script>
<!-- bootstrap css 
<link rel="stylesheet" href="/resource/bootstrap.css" />
-->

<!-- boostrap JS -->

<!-- bootstrap css -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

<style>

body {
	background:#FAFAFA;
}

/* input focus outline override */
textarea:focus, 
textarea.form-control:focus, 
input.form-control:focus, 
input[type=text]:focus, 
input[type=password]:focus, 
input[type=email]:focus, 
input[type=number]:focus, 
[type=text].form-control:focus, 
[type=password].form-control:focus, 
[type=email].form-control:focus, 
[type=tel].form-control:focus, 
[contenteditable].form-control:focus {
  box-shadow: inset 0 0 0 0 #162739;
}


.article-detail-box img, .article-detail-box video {
  height:40vw;
  width:auto;
  max-height:400px;
  max-width:auto;
  object-fit:cover;
  padding:7px 10px;
  border-radius:0;
}

.reply-modify-form-modal {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: rgba(0, 0, 0, 0.4);
	display: none;
}
.reply-modify-form-modal-actived .reply-modify-form-modal
	{
	display: flex;
}


</style>

<%="<script>"%>
var activeProfile = '${activeProfile}';
<%="</script>"%>
<%="<script>"%>
var param = ${paramJson};
<%="</script>"%>


</head>






<div class="article-detail-box table-box table-box-vertical container d-flex justify-content-center">
	<table>
		<colgroup>
			<col class="table-first-col">
		</colgroup>
		<tbody>
			<tr>
				<th>날짜</th>
				<td>${article.regDate}</td>
			</tr>
		
			<c:forEach var="i" begin="1" end="3" step="1">
				<c:set var="fileNo" value="${String.valueOf(i)}" />
				<c:set var="file" value="${article.extra.file__common__attachment[fileNo]}" />
				<c:if test="${file != null}">
					<tr>
			
						<td>
							<c:if test="${file.fileExtTypeCode == 'video'}">
								<div class="video-box">
									<video controls src="/usr/file/streamVideo?id=${file.id}&updateDate=${file.updateDate}"></video>
								</div>
							</c:if>
							<c:if test="${file.fileExtTypeCode == 'img'}">
								<div class="img-box img-box-auto">
									<img src="/usr/file/img?id=${file.id}&updateDate=${file.updateDate}" alt="" />
								</div>
							</c:if>
						</td>
					</tr>
				</c:if>
			</c:forEach>
			
			
			<tr>
				<th>내용</th>
				<td>
				    ${article.body}
				</td>
			</tr>
			
			
		</tbody>
	</table>
</div>

<div class="btn-box con margin-top-20 container">
	<c:if test="${article.extra.actorCanModify}">
		<a class="btn btn-info" href="modify?id=${article.id}&listUrl=${Util.getUriEncoded(listUrl)}">수정</a>
	</c:if>
	<c:if test="${article.extra.actorCanDelete}">
		<a class="btn btn-danger" href="doDelete?id=${article.id}" onclick="if ( confirm('삭제하시겠습니까?') == false ) return false;">삭제</a>
	</c:if>

	<a href="${listUrl}" class="btn btn-info">목록</a>
</div>

<c:if test="${isLogined}">
	<h2 class="con">댓글 작성</h2>

	<script>
		function ArticleWriteReplyForm__submit(form) {
			form.body.value = form.body.value.trim();
			if (form.body.value.length == 0) {
				alert('댓글을 입력해주세요.');
				form.body.focus();
				return;
			}
			$.post('./../reply/doWriteReplyAjax', {
				relId : param.id,
				relTypeCode : 'article',
				body : form.body.value
			}, function(data) {
			}, 'json');
			form.body.value = '';
		}
	</script>

	<form class="table-box con form1" action=""
		onsubmit="ArticleWriteReplyForm__submit(this); return false;">

		<table>
			<tbody>
				<tr>
					<th>내용</th>
					<td>
						<div class="form-control-box">
							<textarea maxlength="300" name="body" placeholder="내용을 입력해주세요."
								class="height-300"></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th>작성</th>
					<td><input type="submit" value="작성"></td>
				</tr>
			</tbody>
		</table>
	</form>

</c:if>

<h2 class="con">댓글 리스트</h2>

<div class="reply-list-box table-box con">
	<table>
		<colgroup>
			<col width="80">
			<col width="180">
			<col width="180">
			<col>
			<col width="200">
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>날짜</th>
				<th>작성자</th>
				<th>내용</th>
				<th>비고</th>
			</tr>
		</thead>
		<tbody>

		</tbody>
	</table>
</div>

<style>
.reply-modify-form-modal {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: rgba(0, 0, 0, 0.4);
	display: none;
}
.reply-modify-form-modal-actived .reply-modify-form-modal
	{
	display: flex;
}
</style>

<div class="reply-modify-form-modal flex flex-ai-c flex-jc-c">
	<form action="" class="form1 bg-white padding-10"
		onsubmit="ReplyList__submitModifyForm(this); return false;">
		<input type="hidden" name="id" />
		<div class="form-row">
			<div class="form-control-label">내용</div>
			<div class="form-control-box">
				<textarea name="body" placeholder="내용을 입력해주세요."></textarea>
			</div>
		</div>
		<div class="form-row">
			<div class="form-control-label">수정</div>
			<div class="form-control-box">
				<button type="submit">수정</button>
				<button type="button"
					onclick="ReplyList__hideModifyFormModal();">취소</button>
			</div>
		</div>
	</form>
</div>

<script>
	var ReplyList__$box = $('.reply-list-box');
	var ReplyList__$tbody = ReplyList__$box.find('tbody');
	var ReplyList__lastLodedId = 0;
	var ReplyList__submitModifyFormDone = false;
	function ReplyList__submitModifyForm(form) {
		if (ReplyList__submitModifyFormDone) {
			alert('처리중입니다.');
			return;
		}
		form.body.value = form.body.value.trim();
		if (form.body.value.length == 0) {
			alert('내용을 입력해주세요.');
			form.body.focus();
			return;
		}
		var id = form.id.value;
		var body = form.body.value;
		ReplyList__submitModifyFormDone = true;
		$.post('../reply/doModifyReplyAjax', {
			id : id,
			body : body
		}, function(data) {
			if (data.resultCode && data.resultCode.substr(0, 2) == 'S-') {
				// 성공시에는 기존에 그려진 내용을 수정해야 한다.!!
				var $tr = $('.reply-list-box tbody > tr[data-id="' + id
						+ '"] .reply-body');
				$tr.empty().append(body);
			}
			ReplyList__hideModifyFormModal();
			ReplyList__submitModifyFormDone = false;
		}, 'json');
	}
	function ReplyList__showModifyFormModal(el) {
		$('html').addClass('reply-modify-form-modal-actived');
		var $tr = $(el).closest('tr');
		var originBody = $tr.data('data-originBody');
		var id = $tr.attr('data-id');
		var form = $('.reply-modify-form-modal form').get(0);
		form.id.value = id;
		form.body.value = originBody;
	}
	function ReplyList__hideModifyFormModal() {
		$('html').removeClass('reply-modify-form-modal-actived');
	}
	function ReplyList__loadMoreCallback(data) {
		if (data.body.replies && data.body.replies.length > 0) {
			ReplyList__lastLodedId = data.body.replies[data.body.replies.length - 1].id;
			ReplyList__drawReplies(data.body.replies);
		}
		setTimeout(ReplyList__loadMore, 2000);
	}
	function ReplyList__loadMore() {
		$.get('../reply/getForPrintReplies', {
			articleId : param.id,
			from : ReplyList__lastLodedId + 1
		}, ReplyList__loadMoreCallback, 'json');
	}
	function ReplyList__drawReplies(replies) {
		for (var i = 0; i < replies.length; i++) {
			var reply = replies[i];
			ReplyList__drawReply(reply);
		}
	}
	function ReplyList__delete(el) {
		if (confirm('삭제 하시겠습니까?') == false) {
			return;
		}
		var $tr = $(el).closest('tr');
		var id = $tr.attr('data-id');
		$.post('./../reply/doDeleteReplyAjax', {
			id : id
		}, function(data) {
			$tr.remove();
		}, 'json');
	}
	function ReplyList__drawReply(reply) {
		var html = '';
		html += '<tr data-id="' + reply.id + '">';
		html += '<td>' + reply.id + '</td>';
		html += '<td>' + reply.regDate + '</td>';
		html += '<td>' + reply.extra.writer + '</td>';
		html += '<td class="reply-body">' + reply.body + '</td>';
		html += '<td>';
		if (reply.extra.actorCanDelete) {
			html += '<button type="button" onclick="ReplyList__delete(this);">삭제</button>';
		}
		if (reply.extra.actorCanModify) {
			html += '<button type="button" onclick="ReplyList__showModifyFormModal(this);">수정</button>';
		}
		html += '</td>';
		html += '</tr>';
		var $tr = $(html);
		$tr.data('data-originBody', reply.body);
		ReplyList__$tbody.prepend($tr);
	}
	ReplyList__loadMore();
</script>
