<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="게시물 작성" />
<%@ include file="../part/head.jspf"%>

<script>
	function ArticleWriteForm__submit(form) {
		if (isNowLoading()) {
			alert('처리중입니다.');
			return;
		}
		
		var maxSizeMb = 50;
		var maxSize = maxSizeMb * 1024 * 1024 //50MB
		if (form.file__article__0__common__attachment__1.value) {
			if (form.file__article__0__common__attachment__1.files[0].size > maxSize) {
				alert(maxSizeMb + "MB 이하의 파일을 업로드 해주세요.");
				return;
			}
		}
		if (form.file__article__0__common__attachment__2.value) {
			if (form.file__article__0__common__attachment__2.files[0].size > maxSize) {
				alert(maxSizeMb + "MB 이하의 파일을 업로드 해주세요.");
				return;
			}
		}
		if (form.file__article__0__common__attachment__3.value) {
			if (form.file__article__0__common__attachment__3.files[0].size > maxSize) {
				alert(maxSizeMb + "MB 이하의 파일을 업로드 해주세요.");
				return;
			}
		}
		var startUploadFiles = function(onSuccess) {
			var needToUpload = form.file__article__0__common__attachment__1.value.length > 0;
			if (!needToUpload) {
				needToUpload = form.file__article__0__common__attachment__2.value.length > 0;
			}
			if (!needToUpload) {
				needToUpload = form.file__article__0__common__attachment__3.value.length > 0;
			}
			if (needToUpload == false) {
				onSuccess();
				return;
			}
			var fileUploadFormData = new FormData(form);
			$.ajax({
				url : './../file/doUploadAjax',
				data : fileUploadFormData,
				processData : false,
				contentType : false,
				dataType : "json",
				type : 'POST',
				success : onSuccess
			});
		}
		startLoading();
		startUploadFiles(function(data) {
			var fileIdsStr = '';
			if (data && data.body && data.body.fileIdsStr) {
				fileIdsStr = data.body.fileIdsStr;
			}
			form.fileIdsStr.value = fileIdsStr;
			form.file__article__0__common__attachment__1.value = '';
			form.file__article__0__common__attachment__2.value = '';
			form.submit();
		});
	}
</script>

<form method="POST" class="table-box con form1"
	action="doWrite"
	onsubmit="ArticleWriteForm__submit(this); return false;">
	<input type="hidden" name="fileIdsStr" /> <input type="hidden"
		name="redirectUri" value="/usr/article/detail?id=#id">

	<table>
		<colgroup>
			<col width="100"></col>
		</colgroup>
		<tbody>

			<tr>
				<th>내용</th>
				<td>
					<div class="form-control-box">
						<textarea placeholder="내용을 입력해주세요." name="body" maxlength="2000"></textarea>
					</div>
				</td>
			</tr>
			<tr>
				<th>첨부1 비디오</th>
				<td>
					<div class="form-control-box">
						<input type="file" accept="video/*"
							name="file__article__0__common__attachment__1">
					</div>
				</td>
			</tr>
			<tr>
				<th>첨부2 비디오</th>
				<td>
					<div class="form-control-box">
						<input type="file" accept="video/*"
							name="file__article__0__common__attachment__2">
					</div>
				</td>
			</tr>
			<tr>
				<th>첨부3 이미지</th>
				<td>
					<div class="form-control-box">
						<input multiple="multiple" type="file" accept="image/*"
							name="file__article__0__common__attachment__3">
					</div>
				</td>
			</tr>
			<tr>
				<th>작성</th>
				<td>
					<button class="btn btn-primary" type="submit" disabled>작성</button> <a
					class="btn btn-info" href="${listUrl}">리스트</a>
				</td>
			</tr>
		</tbody>
	</table>
</form>

<script>
$('input[type=file]').change(function(){
    if($('input[name=file]').val()==''){
        $('button').attr('disabled',true)
    } 
    else{
      $('button').attr('disabled',false);
    }
})

</script>

<%@ include file="../part/foot.jspf"%>