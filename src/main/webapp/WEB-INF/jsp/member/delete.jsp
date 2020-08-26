<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="회원탈퇴" />
<%@ include file="../part/head.jspf"%>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>

<script>
	var MemberLoginForm__submitDone = false;
	function MemberLoginForm__submit(form) {
		if (MemberLoginForm__submitDone) {
			alert('처리중입니다.');
			return;
		}

		form.loginPw.value = form.loginPw.value.trim();

		if (form.loginPw.value.length == 0) {
			form.loginPw.focus();
			alert('비밀번호를 입력해주세요.');
			return;
		}

		form.loginPwConfirm.value = form.loginPwConfirm.value.trim();

		if (form.loginPwConfirm.value.length == 0) {
			form.loginPwConfirm.focus();
			alert('비밀번호를 확인을 입력해주세요');
			return;
		}

		form.loginPwReal.value = sha256(form.loginPw.value);
		form.loginPw.value = '';

		if (confirm("정말 삭제하시겠습니까??") == false) {
			return;
		} else {
			form.submit();
		}

		MemberLoginForm__submitDone = true;
	}
</script>

<h1>회원탈퇴</h1>
<form class="table-box con form1" method="POST" action="doDelete"
	onsubmit="MemberLoginForm__submit(this); return false;">
	<input type="hidden" name="redirectUri" value="/home/main"> <input
		type="hidden" name="loginPwReal">
	<table>
		<tbody>
			<tr>
				<th>비밀번호</th>
				<td>
					<div class="form-control-box">
						<input type="password" placeholder="비밀번호를 입력해주세요" name="loginPw"
							maxlength="20">
					</div>
				</td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td>
					<div class="form-control-box">
						<input type="password" placeholder="비밀번호를 입력해주세요"
							name="loginPwConfirm" maxlength="20">
					</div>
				</td>
			</tr>
			<tr>
				<th>회원탈퇴</th>
				<td>
					<button class="btn btn-primary" type="submit">로그인</button>
					<button class="btn btn-info" type="button"
						onclick="history.back();">취소</button>
				</td>
			</tr>
		</tbody>
	</table>

</form>

<%@ include file="../part/foot.jspf"%>
