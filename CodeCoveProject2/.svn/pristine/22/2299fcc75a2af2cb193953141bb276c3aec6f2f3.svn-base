<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#projectListRow {
		margin-left: 10%;
		margin-right: 10%;
	}
	
	#projectListId {
		padding-top: 40px;
		padding-right: 60px;
		padding-bottom: 70px;
	}
</style>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
// 	var btnRegister = $("#btnRegister");
	
// 	btnRegister.on("click", function(){
// 		location.href="/project/register";
// 	});
	
// 	$("#detail").on("click", function(){
// 		location.href="/project/register";
// 	})
});
</script>
<body>
<!-- 	<button id="btnRegister">등록</button> -->
<!-- 	<table border="1"> -->
<!-- 		<tr> -->
<%-- 		<c:choose> --%>
<%-- 			<c:when test="${empty list }"> --%>
<!-- 				<tr>		 -->
<!-- 					<td colspan="5">조회하신 게시글이 존재하지 않습니다.</td> -->
<!-- 				</tr> -->
<%-- 			</c:when> --%>
<%-- 			<c:otherwise> --%>
<%-- 				<c:forEach items="${list }" var="proj"> --%>
<%-- 				<tr onClick="location.href='/project/detail?pjId=${proj.pjId }'"> --%>
<%-- 					<td>${proj.pjName }</td> --%>
<%-- 					<td>${proj.pjPnum }</td> --%>
<!-- 				</tr> -->
<%-- 				</c:forEach> --%>
<%-- 			</c:otherwise> --%>
<%-- 		</c:choose> --%>
<!-- 		</tr> -->
<!-- 	</table> -->
<div class="toolbar py-3 px-3 px-lg-6">
  <div class="position-relative container-fluid px-0">
    <div class="row align-items-center position-relative">
      <div class="col-md-8 mb-4 mb-md-0">
        <h3 class="mb-2">내 프로젝트</h3>

      </div>
    </div>
  </div>
</div>

	
		<c:choose>
			<c:when test="${empty list }">
					프로젝트가 존재하지 않습니다.
			</c:when>
			<c:otherwise>
	<div class="content pt-3 px-3 px-lg-6 ">
            <div class="row" id="projectListRow">
				<c:forEach items="${list }" var="proj">
              <!--Project col-->
              <div class="col-sm-6 col-xl-4">
                <div class="card mb-3 mb-lg-5">
				
                  <!-- Card Image -->
<!--                   <a href="#!.html"> -->
<!--                     <img src="/resources/assets/media/900x600/1.jpg" alt="..." class="card-img-top"> -->
<!--                   </a> -->

                   <!-- Card Body -->
<%--                    <div class="card-body mt-0" onClick="location.href='/project/detail?pjId=${proj.pjId }'"> --%>
                   <div class="card-body mt-0">
<!--                     <span class="badge badge-pill bg-success-subtle text-success">Active</span> -->
					<c:if test="${proj.pjStatusCode eq 'PJST01' }">
	                    <span class="badge badge-pill bg-info-subtle text-info">모집중</span>
					</c:if>
					<c:if test="${proj.pjStatusCode eq 'PJST02' }">
	                    <span class="badge badge-pill bg-success-subtle text-success">진행중</span>
					</c:if>
					<c:if test="${proj.pjStatusCode eq 'PJST03' }">
	                    <span class="badge badge-pill bg-danger-subtle text-danger">완료</span>
					</c:if>
                    <div class="d-flex my-3 align-items-center">
                      
<!--                       <div class="col" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;"> -->
                      <div class="col" style="overflow:hidden;">
                        <h5 class="mb-1" data-tippy-content="${proj.pjName }" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
                          <a href="/coco/project/detail/${proj.pjId }" class="text-reset" id="projectListId">${proj.pjName }</a>
                        </h5>
                        <small class="text-body-secondary d-block mb-2">
<!--                           Updated yestarday -->
                        </small>
                        
                      </div>
                      <!-- Dropdown -->
                      <c:if test="${loginId == proj.pjAdminId }">
                      <div class="dropdown">
                        <a href="#" class="btn p-0 text-body border-0 shadow-none size-35 d-flex align-items-center justify-content-center rounded-pill" role="button" data-bs-toggle="dropdown"
                          aria-haspopup="true" aria-expanded="false">
                          <span class="material-symbols-rounded align-middle">
                            more_vert
                            </span>
                        </a>
                        <div class="dropdown-menu mt-1 dropdown-menu-end">
                          <a href="/coco/project/modify?pjId=${proj.pjId }" class="dropdown-item">
                            프로젝트 수정
                          </a>
<!--                           <a href="javascript:void(0);" onclick="javascript:frm.submit();" class="dropdown-item"> -->
<!--                             프로젝트 삭제 -->
<!--                           </a> -->
                          	<form action="/coco/project/delete" method="post">
								<input type="hidden" name="pjId" value="${proj.pjId}">
                          		<button type="submit" class="dropdown-item" 
                          		onclick="return confirm('삭제하시겠습니까?')">프로젝트 삭제</button>
							</form>
                        </div>
                      </div>
                      </c:if>
                      
                    </div>
                    <p class="mb-0" data-tippy-content="${proj.pjObjTitle }" data-tippy-placement="bottom-start" class="btn btn-secondary m-1" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${proj.pjObjTitle }</p>
                  </div>

                  <!--card Footer -->
                  <div class="card-footer">
                    <div class="row align-items-center">
                      <div class="col">
                        <div class="row align-items-center g-0">
                          <div class="col-auto">
                            <small class="me-2">${proj.pjProgress }%</small>
                          </div>
                          <div class="col">

                            <!-- Progress bar -->
                            <div class="progress bg-success-subtle" style="height: 4px;">
                              <div class="progress-bar bg-success" role="progressbar" style="width: ${proj.pjProgress}%;"
                                aria-valuenow="65" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>

                          </div>
                        </div>
                      </div>
                      <div class="col-auto">

                        <!-- Avatars group -->
                        <div class="avatar-group justify-content-end">
                        <c:choose>
                        <c:when test="${proj.pjColleagueVOList.size() <= 3 }">
	                        <c:forEach items="${proj.pjColleagueVOList }" var="pjColl">
	                          <a href="#!.html" class="avatar-group-item avatar sm rounded-circle" data-tippy-placement="top"
	                            data-tippy-content="${pjColl.memNick }">
	                            <img src="${pjColl.memProfile }" alt="..." class="avatar-group-img rounded-circle">
	                          </a>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                        
	                        <c:forEach items="${proj.pjColleagueVOList }" var="pjColl" end="2" varStatus="status">
	                        <c:choose>
	                        	<c:when test="${status.index == 2}">
		                          <a href="#!.html"
		                              class="avatar-group-item d-flex align-items-center justify-content-center bg-body-secondary text-body avatar sm rounded-circle"
		                              data-tippy-placement="top" data-tippy-content="${proj.pjColleagueVOList.size()-2} more members">
		                              <b>+${proj.pjColleagueVOList.size()-2}</b>
		                            </a>
	                        	</c:when>
	                        	<c:otherwise>
		                          <a href="#!.html" class="avatar-group-item avatar sm rounded-circle" data-tippy-placement="top"
		                            data-tippy-content="${pjColl.memNick }">
		                            <img src="${pjColl.memProfile }" alt="..." class="avatar-group-img rounded-circle">
		                          </a>
	                        	</c:otherwise>
	                        </c:choose>
                            </c:forEach>
                            
                        </c:otherwise>
                        </c:choose>
                        </div>

                      </div>
                    </div> <!-- / .row -->
                  </div>

                </div>
              </div>
				</c:forEach>
             </div>
            </div>
			</c:otherwise>
		</c:choose>
              
</body>
</html>