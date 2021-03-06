<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="회원정보 수정" />
<%@ include file="../part/head.jspf"%>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>

<script>
	var MemberModifyForm__submitDone = false;
	function MemberModifyForm__submit(form) {
		if (MemberModifyForm__submitDone) {
			alert('처리중입니다.');
			return;
		}

		form.loginPw.value = form.loginPw.value.trim();

		if (form.loginPw.value.length == 0) {
			form.loginPw.focus();
			alert('비밀번호를 입력해주세요.');
			return;
		}

		if (form.loginPw.value.length < 5) {
			form.loginPw.focus();
			alert('비밀번호를 5자 이상 입력해주세요.');
			return;
		}

		if (form.loginPwConfirm.value.length == 0) {
			form.loginPwConfirm.focus();
			alert('비밀번호 확인을 입력해주세요.');

			return;
		}

		if (form.loginPw.value != form.loginPwConfirm.value) {
			form.loginPwConfirm.focus();
			alert('비밀번호가 일치하지 않습니다.');

			return;
		}

		form.nickname.value = form.nickname.value.trim();

		if (form.nickname.value.length == 0) {
			form.nickname.focus();
			alert('변경할 닉네임을 입력해주세요.');

			return;
		}

		form.email.value = form.email.value.trim();

		if (form.email.value.length == 0) {
			form.email.focus();
			alert('이메일을 입력해주세요.');

			return;
		}

		if (form.cellphoneNo.value.length == 0) {
			form.cellphoneNo.focus();
			alert('휴대전화번호를 입력해주세요.');
			return;
		}

		if (form.cellphoneNo.value.length < 10) {
			form.cellphoneNo.focus();
			alert('휴대폰번호를 10자 이상 입력해주세요.');
			return;
		}

		form.loginPwReal.value = sha256(form.loginPw.value);
		form.loginPw.value = '';
		form.loginPwConfirm.value = '';

		form.loginId.value = '${member.loginId}';

		form.submit();
		MemberModifyForm__submitDone = true;
	}
</script>

<h1 class="d-flex justify-content-center">회원정보 수정</h1>
<form class="table-box con form1 d-flex justify-content-center" method="POST" action="doModify"
	onsubmit="MemberModifyForm__submit(this); return false;">
	<input type="hidden" name="redirectUri" value="/usr/member/login">
	<input type="hidden" name="loginPwReal">
	<input type="hidden" name="loginId">
	<table>
		<tbody>
			<tr>
				<th>로그인 아이디</th>
				<td>
					<div class="form-control-box">
						<input type="text" value="${member.loginId}" disabled>
					</div>
				</td>
			</tr>
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
				<th>이름</th>
				<td>
					<div class="form-control-box">
						<input type="text" value="${member.name}" placeholder="아이디를 입력해주세요" name="name" >
					</div>
				</td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td>
					<div class="form-control-box">
						<input type="text" value="${member.nickname}" placeholder="닉네임을 입력해주세요" name="nickname">
					</div>
				</td>
			</tr>
			<tr>
				<th>이메일 주소</th>
				<td>
					<div class="form-control-box">
						<input type="email" value="${member.email}" placeholder="이메일을 입력해주세요" name="email"
							maxlength="30">
					</div>
				</td>
			</tr>
			<tr>
				<th>휴대전화 번호</th>
				<td>
					<div class="form-control-box">
						<input type="tel"
							oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
							value="${member.cellphoneNo}" placeholder="휴대전화 번호를 입력해주세요" name="cellphoneNo"
							maxlength="11">
					</div>
				</td>
			</tr>
			<tr>
				<th>회원정보 수정</th>
				<td>
					<button class="btn btn-primary" type="submit">수정</button>
					<button class="btn btn-info" type="button"
						onclick="history.back();">취소</button>
				</td>
			</tr>
		</tbody>
	</table>

</form>

<%@ include file="../part/foot.jspf"%>
