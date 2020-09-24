<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="test" />
<%@ include file="../part/head.jspf"%>

<!-- Button trigger modal -->
<button type="button" class="btn btn-light" data-toggle="modal" data-target="#exampleModal">
  <i class="fas fa-pen fa-sm"></i>
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="profile-text" class="col-form-label sr-only">
              profile_text
            </label>
            <textarea class="form-control" id="message-text">asdf</textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary">수정</button>
      </div>
    </div>
  </div>
</div>

<%@ include file="../part/foot.jspf"%>
