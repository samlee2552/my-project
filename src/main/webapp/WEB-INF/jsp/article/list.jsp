<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="${boardName} 게시물 리스트" />
<%@ include file="../part/head.jspf"%>

<!-- PC용 -->
<div class="table-box con visible-on-md-up">
	<div>${boardName} 게시판</div>
	<table>
		<colgroup>
			<col width="100" />
			<col width="200" />
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>날짜</th>
				<th>제목</th>
				<th>작성자</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${articles}" var="article">
				<tr>
					<td>${article.id}</td>
					<td>${article.regDate}</td>
					<td>
						<a href="${article.getDetailLink(boardCode)}">${article.title}</a>
					</td>
					<td>${article.extra.writer}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<!-- 모바일 용 -->
<!-- <div class="table-box con visible-on-sm-down">
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${articles}" var="article">
				<tr>
					<td>${article.id}</td>
					<td>
						<a href="${article.getDetailLink(board.code)}">${article.title}</a>
						<br />
						날짜 : ${article.regDate}
						<br />
						작성 : ${article.extra.writer}
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<div class="btn-box con margin-top-20">
	<a class="btn btn-primary" href="./${board.code}-write">글쓰기</a>
</div>
 -->

<%@ include file="../part/foot.jspf"%>