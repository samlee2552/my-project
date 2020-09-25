<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="${member.name} 프로필" />
<%@ include file="../part/head.jspf"%>

<style>
.profile-name {
  font-size:1.3rem;  
}

.profile-img {
  object-fit:cover;
  height:20vw;
  width:20vw;
  max-height:200px;
  max-width:200px;
  min-height:180px;
  min-width:180px;
}

table i {
  font-size:1.3rem;
}

table {
  max-width:800px;
  margin:auto;
 	
}


/* mobile profile*/
.mobile-profile-img {
  object-fit:cover;
  height:20vw;
  width:20vw;
  max-height:120px;
  max-width:120px;
  min-height:80px;
  min-width:80px;
  
} 

.mobile-con {
  max-width:767.98px;
  margin:auto;
}

.mobile-profile i { 
  font-size:25px;
}

.mobile-profile-text, .mobile-profile-text i {
  font-size:0.8rem;
  
}
/* Medium devices (tablets, less than 992px) */
@media (max-width: 991.98px) {
  table {
    font-size:14px;
  }
}

/*Gallery part*/


.gallery img, .gallery video {
  height:32vw;
  width:32vw;
  max-height:308px;
  max-width:308px;
  object-fit:cover;
  padding:7px 10px;
  border-radius:9%;

}

.con {
  max-width:950px;

}

@media (max-width: 767.98px) { 
 .gallery img, .gallery video {
    padding:1px 3px;
  }
 }

.vid-icon{
    right:7%;
    top:7%;
    color: rgba(112, 112, 112, 0.9);
    
}

</style>

<!-- mobile -->
<div class="mobile-profile mobile-con d-block d-sm-none px-2">
  <div class="row d-flex text-center align-items-center">
    <div class="col-4 mt-2 mb-1">
      <img class="rounded-circle mobile-profile-img" src="https://i.pinimg.com/originals/ce/d4/e1/ced4e117b0f2f490c79e9e820d14cd99.jpg" alt="">
      <br>
        <span class="font-weight-bold">${member.nickname}</span>
    </div>
    <div class="col-4 ml-1 pb-3">
      <a href="#" class="btn btn-link btn-sm text-dark" role="button" aria-pressed="true"><i class="fas fa-user-edit"></i></a>
    </div>
    <div class="col-3 pb-3">
      <a href="#" class="btn btn-link btn-sm text-dark" role="button" aria-pressed="true"><i class="fas fa-user-cog"></i></a>
    </div>
  </div>
   <div class="row border-top p-1">
    <div class="col mobile-profile-text mb-1">
      <span>
      ${member.profile_text} <button type="button" class="btn btn-light" data-toggle="modal" data-target="#exampleModal">
  <i class="fas fa-pen fa-sm"></i>
</button>      
      </span>

    </div>
  </div>
  
  <div class="row d-flex text-center align-items-center font-weight-bold pt-1">
    <div class="col">
      <i class="far fa-images"></i>
    </div>
    <div class="col">
      팔로워
    </div>
    <div class="col">
      팔로우
    </div>
  </div>
<div class="row text-center font-weight-light">
    <div class="col">
      123
    </div>
    <div class="col">
      234
    </div>
    <div class="col">
      345
    </div>
  </div>
</div>    
  



<!-- PC -->
<div class="container-fluid con">
  <table class="table text-center table-borderless d-none d-sm-block">
    <tbody>
      <tr>
        <td rowspan="3" class="w-25 align-middle">
          <img src="https://i.pinimg.com/originals/ce/d4/e1/ced4e117b0f2f490c79e9e820d14cd99.jpg" class="rounded-circle profile-img"/>
        </td>
       
        <td colspan="" class="align-bottom font-weight-bold w-25 profile-name" >${member.nickname}</td>
        <td colspan="" class="align-bottom">
          <a href="#" class="btn btn-link btn-sm text-dark" role="button" aria-pressed="true"><i class="fas fa-user-edit"></i></a>
        </td>
        <td colspan="" class="align-bottom">
          <a href="#" class="btn btn-link btn-sm text-dark" role="button" aria-pressed="true"><i class="fas fa-user-cog"></i></a>
        </td>
      </tr>
      <tr>
        <td colspan="" class="align-middle"><i class="far fa-images"></i></td>  
        <td colspan="" class="align-middle">팔로워</td>
        <td colspan="" class="align-middle">팔로우</td>
        
      </tr>
      <tr>
        <td colspan="" class="align-top pt-1">123</td>
        <td colspan="" class="align-top pt-1">234</td>
        <td colspan="" class="align-top pt-1">345</td>
      </tr>
      <tr>
        <td colspan="12" class="text-left border-top">
        		<span>${member.profile_text}</span>
				<button type="button" class="btn btn-light" data-toggle="modal" data-target="#edit_profile_modal">
  					<i class="fas fa-pen fa-sm"></i>
				</button>
        </td>     
      </tr>
    </tbody>
  </table>

<!-- edit profile text modal -->


<form method="POST" action="" id="edit_profile_text_form">
<div class="modal fade" id="edit_profile_modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body">
        <input type="hidden" name="redirectUri"	value="/usr/member/profile?memberId=${loginedMemberId}" />
          <div class="form-group">
            <label for="profile-text" class="col-form-label sr-only">
              profile_text
            </label>
            <textarea class="form-control" id="message-text" placeholder="본인을 소개해주세요!" name="profile_text">${member.profile_text}</textarea>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="submit" class="btn btn-primary">수정</button>
      </div>
    </div>
  </div>
</div>
</form>

<script>

$(function sumbit_edit_form() {

    $('#edit_profile_text_form').submit(function() {
        $.ajax({
            type: "POST",
            url: "../member/editProfileTextAjax",
            data: $('form').serialize(),
            success: function(response) {
                alert('수정되었습니다');
            },
            error: function() {
                alert('Error');
            }
        });
        return false;
    });
});

</script>




<!-- gallery -->
<div class="gallery my-4">
  <div class="row">
 	
 	<c:forEach items="${articles}" var="article">
  		<c:forEach var="i" begin="1" end="3" step="1">
				<c:set var="fileNo" value="${String.valueOf(i)}" />
				<c:set var="file" value="${article.extra.file__common__attachment[fileNo]}" />
				<c:if test="${file != null}">
					 <div class="col-4-sm ">
							<c:if test="${file.fileExtTypeCode == 'video'}">
								<div class="video-box position-relative ">
									<video src="/usr/file/streamVideo?id=${file.id}&updateDate=${file.updateDate}"></video>
									<span class="position-absolute vid-icon"><i class="fas fa-video"></i></span>
								</div>
							</c:if>
							<c:if test="${file.fileExtTypeCode == 'img'}">
								<div class="img-box img-box-auto">
									<img src="/usr/file/img?id=${file.id}&updateDate=${file.updateDate}" alt="" />
								</div>
							</c:if>
					</div>
				</c:if>
			</c:forEach>
		  </c:forEach>
  		</div>
	</div>
</div>



<%@ include file="../part/foot.jspf"%>
