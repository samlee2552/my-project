<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="${member.name} 프로필" />
<%@ include file="../part/head.jspf"%>

<style>
.profile-img {
  object-fit:cover;
  height:20vw;
  width:20vw;
  max-height:200px;
  max-width:200px;
  min-height:100px;
  min-width:100px;
}

i {
  font-size:1.5rem;
}

table {
  max-width:700px;
  margin:auto;
};


/*Extra small devices (portrait phones, less than 576px) */
@media (max-width: 575.98px) { 
  table {
    font-size:9px;
  }
}

/* Small devices (landscape phones, less than 768px) */
@media (max-width: 767.98px) { 
    table {
    font-size:12px;
  }
   i {
    font-size:1rem;
  }
 }

/* Medium devices (tablets, less than 992px) */
@media (max-width: 991.98px) {
  table {
    font-size:14px;
  }
}

/* Large devices (desktops, less than 1200px) */
@media (max-width: 1199.98px) {

}


td {

}

tr{

}
</style>

<div class="container">
  <table class="table text-center table-borderless">
    <tbody>
      <tr>
        <td rowspan="3" class="w-25 align-middle p-">
          <img src="https://i.pinimg.com/originals/ce/d4/e1/ced4e117b0f2f490c79e9e820d14cd99.jpg" class="rounded-circle profile-img"/>
        </td>

        <td colspan="" class="align-bottom font-weight-bold w-25">${member.nickname}</td>
        <td colspan="" class="align-bottom">
          <a href="#" class="btn btn-link btn-sm text-dark" role="button" aria-pressed="true"><i class="fas fa-user-edit"></i></a>
        
          </div>
        </td>
        <td colspan="" class="align-bottom">
          <a href="#" class="btn btn-link btn-sm text-dark" role="button" aria-pressed="true"><i class="fas fa-user-cog"></i></a>
        
          </div>
        </td>  

        
      </>
      <tr>
        <td colspan="" class="align-middle"><i class="far fa-images"></i></td>  
        <td colspan="" class="align-middle">팔로워</td>
        <td colspan="" class="align-middle">팔로우</td>
        
      </tr>
      <tr>
        <td colspan="" class="align-top">123</td>
        <td colspan="" class="align-top">234</td>
        <td colspan="" class="align-top">345</td>
      </tr>
      <tr>
        <td colspan="4" class="text-left">
        		${member.profile_text}
<a href="#" class="text-dark p-2"><i class="fas fa-pen fa-sm"></i></a>
        </td>     
      </tr>
    </tbody>
  </table>
</div>


<%@ include file="../part/foot.jspf"%>
