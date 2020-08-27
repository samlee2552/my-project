<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="${board.name} 게시물 상세보기" />
<%@ include file="../part/head.jspf"%>

<!-- PC용 -->
<div class="article-detail-box table-box con">
	<table>
		<colgroup>
			<col class="table-first-col">
		</colgroup>
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
				<th>작성자</th>
				<td>${article.extra.writer}</td>
			</tr>
			<tr>
				<th>게시판</th>
				<td>${article.extra.boardCode}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${article.title}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${article.body}</td>
			</tr>
		</tbody>
	</table>
	<a href="${listUrl}" class="btn btn-info">리스트</a>
</div>


<div class="btn-box con margin-top-20">
	<a class="btn btn-primary" href="./write">글쓰기</a> 
	<a class="btn btn-info" href="${board.code}-modify?id=${article.id}">수정</a>
	<a onclick="if ( confirm('삭제하시겠습니까?') == false ) return false;" 
	class="btn btn-info" href="${board.code}-delete?id=${article.id}">삭제</a>
</div>

<%@ include file="../part/foot.jspf"%>