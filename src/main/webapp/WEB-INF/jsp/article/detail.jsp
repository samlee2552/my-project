<%@ page import="com.sbs.sbl.mp.util.Util"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>


<%="<script>"%>
var activeProfile = '${activeProfile}';
<%="</script>"%>
<%="<script>"%>
var param = ${paramJson};
<%="</script>"%>

<style>

.detail-table #profile-img {
  height:50vw;
  width:50vw;
  max-height:50px;
  max-width:50px;
  object-fit:cover;
} 

.detail-table tr td {
  padding:2px;
  
}

.detail-table #article-file {
  height:100vw;
  width:100vw;
  max-height:550px;
  max-width:550px;
  object-fit:cover;
  padding:0;
}

.con {
  max-width:400px;
  margin:0 auto;
}


.article-text span {
  display:block;
    overflow: hidden;
   display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
  
}  

.reveal-btn {
  display:inline-block;
  cursor: pointer;
}

.hide-btn {
  display:none;
  cursor: pointer;
}

</style>



<div class="container">
<table class="table table-borderless con detail-table">
  <tbody>
    <tr>
      <td rowspan="2" class="align-middle" width="20 ;"><img class="rounded-circle" src="https://i.pinimg.com/originals/ce/d4/e1/ced4e117b0f2f490c79e9e820d14cd99.jpg" alt="" id="profile-img"></td>
      <td colspan="4"class="">${article.extra.writer}</td>
      <td colspan="10" class="d-flex justify-content-end mt-2"><i class="fas fa-ellipsis-h"></i></td>
    </tr>
    <tr>
      <td>Jacob</td>
      <td>10 hours ago</td>
    </tr>
    <tr>
      <td colspan="12" class="">
        <img id="article-file" src="https://i.pinimg.com/originals/ce/d4/e1/ced4e117b0f2f490c79e9e820d14cd99.jpg" alt="">
      </td>
    </tr>
    <tr>
      <td colspan="12" class="article-text align-middle" >
       <span id="article-text">
     ${article.body}
  </span>
        <div class="font-weight-bold reveal-btn" id="reveal-btn" onclick="reveal_body();">...더 보기</div>
               <div class="font-weight-bold hide-btn" id="hide-btn" onclick="hide_body();"><i class="fas fa-chevron-circle-left"></i></div> 
      </td>
    </tr>
    <tr>
      <td colspan="1" class="align-middle text-center">
        <i class="far fa-heart"></i>
      </td>
      <td colspan="9" class=""><textarea placeholder="댓글을 입력해주세요" cols="57" rows="2"></textarea></td>
      <td colspan="2" class="align-middle text-center">
        <div class="btn btn-outline-dark" id="submit-btn">
          작성
        </div>
      </td>
    </tr>
  </tbody>
</table>


<script>
var reveal_button = document.getElementById("reveal-btn");
var hide_button = document.getElementById("hide-btn");

function reveal_body() {
document.getElementById("article-text").style.display = "inline";
hide_button.style.display = "inline";
reveal_button.style.display = "none"
}

function hide_body() {
hide_button.style.display = "none";
 document.getElementById("article-text").style.overflow = "hidden";
document.getElementById("article-text").style.display = "-webkit-box";
reveal_button.style.display = "block"
}


</script>
























<div class="con">
	<table class="table con detail-table">
		<tbody>
			<tr>
				<td rowspan="2" class="align-middle" width="20 ;"><img
					class="rounded-circle"
					src="https://i.pinimg.com/originals/ce/d4/e1/ced4e117b0f2f490c79e9e820d14cd99.jpg"
					alt="" id="profile-img"></td>
				<td colspan="4" class="">이상범</td>
				<td colspan="10" class="d-flex justify-content-end mt-2"><i
					class="fas fa-ellipsis-h"></i></td>
			</tr>
			<tr>
				<td>Jacob</td>
				<td>10 hours ago</td>
			</tr>
			<tr>
				<td colspan="12" class=""><c:forEach var="i" begin="1" end="3"
						step="1">
						<c:set var="fileNo" value="${String.valueOf(i)}" />
						<c:set var="file"
							value="${article.extra.file__common__attachment[fileNo]}" />
						<c:if test="${file != null}">
							<tr>

								<td><c:if test="${file.fileExtTypeCode == 'video'}">
										<div class="video-box">
											<video controls
												src="/usr/file/streamVideo?id=${file.id}&updateDate=${file.updateDate}"></video>
										</div>
									</c:if> <c:if test="${file.fileExtTypeCode == 'img'}">
										<div class="img-box img-box-auto">
											<img
												src="/usr/file/img?id=${file.id}&updateDate=${file.updateDate}"
												alt="" />
										</div>
									</c:if></td>
							</tr>
						</c:if>
					</c:forEach></td>
			</tr>
			<tr>
				<td colspan="12" class="article-text align-middle"><span
					id="article-text"> ${article.body} </span>
					<div class="font-weight-bold reveal-btn" id="reveal-btn"
						onclick="reveal_body();">...더 보기</div>
					<div class="font-weight-bold hide-btn" id="hide-btn"
						onclick="hide_body();">
						<i class="fas fa-chevron-circle-left"></i>
					</div></td>
			</tr>
			<tr>
				<td colspan="1">좋아요</td>
				<td colspan="10"><textarea placeholder="댓글을 입력해주세요" cols="50"></textarea></td>
				<td>쓰기</td>
			</tr>
		</tbody>
	</table>

	<div class="btn-box con margin-top-20 container">
		<c:if test="${article.extra.actorCanModify}">
			<a class="btn btn-info"
				href="modify?id=${article.id}&listUrl=${Util.getUriEncoded(listUrl)}">수정</a>
		</c:if>
		<c:if test="${article.extra.actorCanDelete}">
			<a class="btn btn-danger" href="doDelete?id=${article.id}"
				onclick="if ( confirm('삭제하시겠습니까?') == false ) return false;">삭제</a>
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

.reply-modify-form-modal-actived .reply-modify-form-modal {
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
					<button type="button" onclick="ReplyList__hideModifyFormModal();">취소</button>
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