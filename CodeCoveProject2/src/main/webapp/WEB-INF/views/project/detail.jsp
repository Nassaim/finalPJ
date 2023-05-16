<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<style type="text/css">
.fc-theme-standard th, .fc-theme-standard td, .fc-scrollgrid, .fc-border-color{
    border: 1px solid #cbc7c7 ;
}
.fc .fc-daygrid-day-frame {
    border: 1px solid #cbc7c7;
}

::-webkit-scrollbar {
  display: none;
}
.fixed-size {
  height: 800px; /* 원하는 높이로 지정 */
  overflow: auto; /* 스크롤이 필요한 경우 스크롤이 나타납니다 */
}
#writeModal {
	position: fixed;
	height: 100%;
    width: 100%;
    left: 0;
    top: 0;
    background-color: rgba(0,0,0,0.5);
    display: none;
}

#writeCont{
	width:60%;
	height: 80%;
	margin-top:10%;
	margin-left: 20% ;
	margin-right: 20% ;
	background-color: white;
	color: black;
}

.form_radio_btn {
	width: 47%;
	height : 45px;
	border: 1px solid #EAE7E7;
	border-radius: 10px;
}
.form_radio_btn input[type=radio] {
	display: none;
}
.form_radio_btn label {
	display: block;
	border-radius: 10px;
	margin: 0 auto;
	text-align: center;
	height: -webkit-fill-available;
	line-height: 45px;
}
 
/* Checked */
 
.form_radio_btn input[type=radio]:checked + label {
 	background: #00c7ae;
	color: #fff;
} 

/*
.form_radio_btn input[type=radio][value=WKST01]:checked + label {
	background: #00B2FF;
	color: #fff;
}
.form_radio_btn input[type=radio][value=WKST02]:checked + label {
	background: #00B01C;
	color: #fff;
}
.form_radio_btn input[type=radio][value=WKST03]:checked + label {
	background: #FD7900;
	color: #fff;
}
.form_radio_btn input[type=radio][value=WKST04]:checked + label {
	background: #402A9D;
	color: #fff;
}
.form_radio_btn input[type=radio][value=WKST05]:checked + label {
	background: #777777;
	color: #fff;
}
*/
 
/* Hover */
.form_radio_btn label:hover {
	color: #666;
}
 
/* Disabled */
.form_radio_btn input[type=radio] + label {
	background: #F9FAFC;
	color: #666;
}
#tagInput {
	font-size: 15px;
	height: 30px;
	padding: 15px;
 	width: 25%; 
 	float:left;
}
.tags {
	background-color: #F2F2F2;
	color: black;
	margin-left: 3px;
	margin-top: 3px;
	border: 5px solid #F2F2F2;
	font-weight: 500;
	border-radius: 10px;
	display: inline-block;
}

th {
	text-align:center;
}
td{
	text-align:center;
}
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.9.0/main.min.css">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script> -->
<script type="text/javascript">
$(function() {
    $('#DateS').daterangepicker({
		locale: {
			format: 'YYYY-MM-DD'
		},
		singleDatePicker: true,
		showDropdowns: true,
		minYear: 1901,
		maxYear: parseInt(moment().format('YYYY'),10)
    });
  });
  
$(function() {
    $('#DateE').daterangepicker({
		locale: {
			format: 'YYYY-MM-DD'
		},
		singleDatePicker: true,
		showDropdowns: true,
		minYear: 1901,
		maxYear: parseInt(moment().format('YYYY'),10)
    });
  });
  
document.addEventListener('keydown', function(event) {
  if (event.keyCode === 13) {
    event.preventDefault();
  };
}, true);
</script>
<!--//Page Toolbar//-->
<div class="toolbar px-3 px-lg-6 pt-3 pb-3">
  <div class="position-relative container-fluid px-0">
    <div class="row align-items-center position-relative">
      <div class="col-sm-7 mb-3 mb-sm-0">
         <!-- Dropdown -->
         <c:if test="${loginId == project.pjAdminId }">
         <div class="dropdown" style="float:left;">
           <a href="#" class="btn p-0 text-body border-0 shadow-none size-35 d-flex align-items-center justify-content-center rounded-pill" role="button" data-bs-toggle="dropdown"
             aria-haspopup="true" aria-expanded="false">
             <span class="material-symbols-rounded align-middle">
               more_vert
               </span>
           </a>
           <div class="dropdown-menu mt-1 dropdown-menu-end">
             <a href="/coco/project/modify?pjId=${project.pjId }" class="dropdown-item">
               프로젝트 수정
             </a>
             	<form action="/coco/project/delete" method="post">
					<input type="hidden" name="pjId" value="${project.pjId}">
             		<button type="submit" class="dropdown-item" 
             		onclick="return confirm('삭제하시겠습니까?')">프로젝트 삭제</button>
					</form>
           </div>
         </div>
         </c:if>
        <h3 class="mb-2"><span>${project.pjName }</span></h3>
        <p class="mb-0">${project.pjObjTitle}</p>
      </div>
      	<input type="hidden" id="projectStart" value="${project.pjStartDate }">
      	<input type="hidden" id="projectEnd" value="${project.pjEndDate }">
      <div class="col-sm-5 text-md-end">
        <div class="d-flex justify-content-sm-end align-items-center">
          <div class="d-flex align-items-center">
            <div role="button" id="reportrange" class="btn btn-sm btn-outline-secondary" data-tippy-placement="left"
              data-tippy-content="프로젝트 기간">
              <i class="material-symbols-rounded align-middle fs-5">
                calendar_month
              </i>
              <span class="fs-6 d-inline-block"></span>
            </div>
          </div>
<!--           <a href="#!" data-tippy-placement="left" data-tippy-content="Reload Dashboard" -->
<!--             class="flex-shrink-0 ms-2 p-0 rounded-circle size-35 d-flex align-items-center justify-content-center btn btn-primary"> -->
<!--             <span class="material-symbols-rounded lh-1 fs-4"> -->
<!--               refresh -->
<!--             </span> -->
<!--           </a> -->
        </div>
      </div>
    </div>
  </div>
</div>
<!--//Page Toolbar End//-->
<div class="content d-flex flex-column-fluid">
	<div class="container-fluid px-0">
	    <!--Profile-->
	    <div class="pt-3 px-3 px-lg-6 overflow-hidden">

			<!--Profile content-->
                                <div class="pt-md-3">

                                    <!--Profile Nav Tabs-->
                                    <ul class="nav mb-3 nav-tabs nav-overflow" id="myTab" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link <c:if test="${active eq '1' }">active</c:if>"
                                            id="home-tab" data-bs-toggle="tab" data-bs-target="#home" role="tab" aria-controls="home" aria-selected="true">
                                                홈
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link <c:if test="${active eq '2' }">active</c:if>"
                                            id="work-tab" data-bs-toggle="tab" data-bs-target="#work" role="tab" aria-controls="work" aria-selected="false">
                                                업무
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link <c:if test="${active eq '3' }">active</c:if>"
                                            id="chart-tab" data-bs-toggle="tab" data-bs-target="#chart" role="tab" aria-controls="chart" aria-selected="false">
                                                간트차트
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link <c:if test="${active eq '4' }">active</c:if>"
                                            id="board-tab" data-bs-toggle="tab" data-bs-target="#board" role="tab" aria-controls="board" aria-selected="false">
                                                칸반보드
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="javacsript:void(0);" class="nav-link <c:if test="${active eq '5' }">active</c:if>"
                                            id="calendar-tab" data-bs-toggle="tab" data-bs-target="#calendar" role="tab" aria-controls="calendar" aria-selected="false" onclick="calendar_click();">
                                                캘린더
                                            </a>
                                        </li>
<!--                                         <li class="nav-item"> -->
<%--                                             <a class="nav-link <c:if test="${active eq '6' }">active</c:if>" --%>
<!--                                             id="sheet-tab" data-bs-toggle="tab" data-bs-target="#sheet" role="tab" aria-controls="sheet" aria-selected="false"> -->
<!--                                                 워크시트 -->
<!--                                             </a> -->
<!--                                         </li> -->
                                        <li class="nav-item">
                                            <a class="nav-link <c:if test="${active eq '7' }">active</c:if>"
                                            id="data-tab" data-bs-toggle="tab" data-bs-target="#data" role="tab" aria-controls="data" aria-selected="false">
                                                자료실
                                            </a>
                                        </li>
                                        <c:if test="${loginId == project.pjAdminId }">
                                        <li class="nav-item">
                                            <a class="nav-link <c:if test="${active eq '8' }">active</c:if>"
                                            id="member-tab" data-bs-toggle="tab" data-bs-target="#member" role="tab" aria-controls="data" aria-selected="false">
                                                멤버관리
                                            </a>
                                        </li>
                                        </c:if>
                                    </ul>

                                    <!--Content-->
                                    <div class="tab-content" id="myTabContent">
  									<div class="tab-pane fade <c:if test="${active eq '1' }">show active</c:if>" id="home" role="tabpanel" aria-labelledby="home-tab">
                                    <div class="row">
                                        <div class="col-lg-4">
                                        
                                         <div class="card overflow-hidden" style="margin-bottom:20px;">
                                            <!--Modal example-->
                                            <!-- Button trigger modal -->
                                            <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                                data-bs-target="#inviteModal">
                                                <span class="material-symbols-rounded align-middle" style="margin-left:-20px; margin-right:10px;" >Person_Add</span>초대하기
                                            </button>
                                            
                                            <input type="hidden" id="invitePjName" name="invitePjName" value="${project.pjName }">
                                            <input type="hidden" id="invitePjId" name="invitePjId" value="${project.pjId }">
                                            <div class="modal fade" id="inviteModal" tabindex="-1"
                                                aria-labelledby="inviteModal" aria-hidden="true">
                                                <div class="modal-dialog modal-dialog-centered">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="inviteModalLabel">이메일 초대장 발송</h5>
                                                            <button type="button" class="btn-close"
                                                                data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="col-12 col-md-12 mb-3" style="text-align: center">
														        <div class="form-group">
														            <input type="text" class="form-control" id="inviteMail" name="inviteMail" placeholder="example@coco.team" required="required"/>
														        </div>
														    </div>
														    <div class="col-12 col-md-12 mb-3">
														        <div class="form-group">
														        	<h6>초대내용 입력</h6>
														            <textarea class="form-control" id="inviteContent" name="inviteContent" style="height:200px;">업무관리, 채팅, 파일공유를 한 곳에서! </textarea>
														        </div>
														    </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary"
                                                                data-bs-dismiss="modal">취소</button>
                                                            <button type="button" id="inviteBtn" class="btn btn-primary">초대</button>
                                                        </div>
                                                    </div>
                                            </div>
                                            </div>
                                            
                                            </div>
                                        
                                        <h5>참여자 ${colleagueList.size() }</h5>

                                            <!--Card-->
                                            <div class="card mb-3 mb-lg-5">
                                                <div class="d-flex p-3 pb-0 align-items-center jsutify-content-between">
                                                    <h5 class="mb-0 me-1">프로젝트 매니저</h5>
                                                </div>
                                                <!--Card body-->
                                                <div class="card-body">
                                                    <ul class="list-group list-group-flush">

                                                        <!--User List item-->
                                                        <c:forEach items="${colleagueList }" var="coll" >
                                                        <c:if test="${coll.memId == project.pjAdminId }">
                                                        <li class="list-group-item">
                                                            <div class="row g-2 align-items-center">
                                                                <div class="col-auto">
                                                                    <div
                                                                        class="me-2 avatar sm">
                                                                        <img src="${coll.memProfile }"
                                                                            class="rounded-circle img-fluid" alt="">
                                                                    </div>
                                                                </div>
                                                                <div class="col">
                                                                    <h6 class="mb-0">${coll.memNick}</h6>
                                                                    <small>${coll.memMail }</small>
                                                                </div>
                                                                <div class="col-auto">
                                                                	<c:forEach items="${roleCode }" var="roleCode">
									                             		<c:if test="${coll.workRoleCode eq roleCode.comCode }">
																			<div class="flex-shrink-0">
							                                                      <div class="me-3 avatar d-flex align-items-center justify-content-center bg-primary text-white fw-bolder rounded-circle" style="width: 2rem;height: 2rem;">
												                             			${roleCode.comCodeNm }
							                                                      </div>
							                                                </div>
									                             		</c:if>
										                             	</c:forEach>
<!--                                                                     <div class="dropdown"> -->
<!--                                                                         <a href="#" class="btn p-1 btn-outline-secondary" -->
<!--                                                                             data-bs-toggle="dropdown"> -->
<!--                                                                             <span -->
<!--                                                                                 class="material-symbols-rounded align-middle"> -->
<!--                                                                                 more_vert -->
<!--                                                                             </span> -->
<!--                                                                         </a> -->
<!--                                                                         <div -->
<!--                                                                             class="dropdown-menu dropdown-menu-end"> -->
<!--                                                                             <a href="#!" class="dropdown-item"> -->
<!--                                                                                 <small>Follow</small> -->
<!--                                                                             </a> -->
<!--                                                                             <a href="#!" class="dropdown-item"> -->
<!--                                                                                 <small>Hide this user</small> -->
<!--                                                                             </a> -->
<!--                                                                             <a href="#!" class="dropdown-item"> -->
<!--                                                                                 <small>Block this user</small> -->
<!--                                                                             </a> -->
<!--                                                                         </div> -->
<!--                                                                     </div> -->
                                                                </div>
                                                            </div>
                                                        </li>
                                                        </c:if>
                                                         </c:forEach>
                                                        </ul>
                                                        
                                                        <div class="d-flex p-3 pb-0 align-items-center jsutify-content-between">
                                                    <h5 class="mb-0 me-1">팀원</h5>
                                                </div>
                                                <!--Card body-->
                                                    <ul class="list-group list-group-flush">
                                                        <!--User List item-->
                                                        <c:forEach items="${colleagueList }" var="coll">
                                                        <c:choose>
	                                                        <c:when test="${coll.memId == project.pjAdminId }">
	                                                        </c:when>
	                                                        <c:otherwise>
	                                                        	<li class="list-group-item">
                                                            <div class="row g-2 align-items-center">
                                                                <div class="col-auto">
                                                                    <div
                                                                        class="me-2 avatar sm">
                                                                        <img src="${coll.memProfile }"
                                                                            class="rounded-circle img-fluid" alt="">
                                                                    </div>
                                                                </div>
                                                                <div class="col">
                                                                    <h6 class="mb-0">${coll.memNick }</h6>
                                                                    <small>${coll.memMail }</small>
                                                                </div>
                                                                <div class="col-auto">
                                                                <c:forEach items="${roleCode }" var="roleCode">
								                             		<c:if test="${coll.workRoleCode eq roleCode.comCode }">
																		<div class="flex-shrink-0">
						                                                      <div class="me-3 avatar d-flex align-items-center justify-content-center bg-secondary text-white fw-bolder rounded-circle" style="width: 2rem;height: 2rem;">
											                             			${roleCode.comCodeNm }
						                                                      </div>
						                                                </div>
								                             		</c:if>
									                             	</c:forEach>
<!--                                                                     <div class="dropdown"> -->
<!--                                                                         <a href="#" class="btn p-1 btn-outline-secondary" -->
<!--                                                                             data-bs-toggle="dropdown"> -->
<!--                                                                             <span -->
<!--                                                                                 class="material-symbols-rounded align-middle"> -->
<!--                                                                                 more_vert -->
<!--                                                                             </span> -->
<!--                                                                         </a> -->
<!--                                                                         <div -->
<!--                                                                             class="dropdown-menu dropdown-menu-end"> -->
<!--                                                                             <a href="#!" class="dropdown-item"> -->
<!--                                                                                 <small>Follow</small> -->
<!--                                                                             </a> -->
<!--                                                                             <a href="#!" class="dropdown-item"> -->
<!--                                                                                 <small>Hide this user</small> -->
<!--                                                                             </a> -->
<!--                                                                             <a href="#!" class="dropdown-item"> -->
<!--                                                                                 <small>Block this user</small> -->
<!--                                                                             </a> -->
<!--                                                                         </div> -->
<!--                                                                     </div> -->
                                                                </div>
                                                            </div>
                                                        </li>
	                                                        </c:otherwise>
                                                        </c:choose>
                                                        
                                                        </c:forEach>
                                                        
                                                    </ul>
                                                    
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-8">
                                        
                                        <!-- 모달  -->
                                    <div class="card overflow-hidden">
                                        <div class="card-header">
<!--                                             <h5 class="mb-0">Basic Modal</h5> -->
                                            <h5 class="mb-0"></h5>
                                        </div>
                                        <div class="card-body">
                                            <!--Modal example-->
                                            <!-- Button trigger modal -->
                                            <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                                data-bs-target="#exampleModal">
                                                업무 등록
                                            </button>


                                            <!-- Modal -->
                                            <form action="/coco/work/register/${project.pjId }" method="post" enctype="multipart/form-data">
                                            
<%--                                             <input type="hidden" name="pjId" value="${project.pjId }"/> --%>
                                            
                                            <div class="modal fade" id="exampleModal" tabindex="-1"
                                                aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content" style="width: 130%;">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel">업무 작성
                                                            </h5>
                                                            <button type="button" class="btn-close"
                                                                data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="col-12 col-md-12 mb-3" style="text-align: center">
														        <div class="form-group">
														            <input type="text" class="form-control" id="workTitle" name="workTitle" placeholder="제목을 입력해주세요" required="required"/>
														        </div>
														    </div>
                                                            <div class="col-12 col-md-12 mb-3">
														        <div class="form-group">
																	<div class="form_toggle row-vh d-flex flex-row justify-content-between" >
														        	<span class="material-symbols-rounded" style="margin-right: 10px; margin-top:10px;">update</span>
																		<div class="form_radio_btn radio_male">
																			<input id="radio-1" class="workStatusCode" type="radio" name="workStatusCode" value="WKST01">
																			<label for="radio-1">요청</label>
																		</div>
																									 
																		<div class="form_radio_btn">
																			<input id="radio-2" class="workStatusCode" type="radio" name="workStatusCode" value="WKST02">
																			<label for="radio-2">진행</label>
																		</div>

																		<div class="form_radio_btn">
																			<input id="radio-3" class="workStatusCode" type="radio" name="workStatusCode" value="WKST03">
																			<label for="radio-3">피드백</label>
																		</div>

																		<div class="form_radio_btn">
																			<input id="radio-4" class="workStatusCode" type="radio" name="workStatusCode" value="WKST04">
																			<label for="radio-4">완료</label>
																		</div>

																		<div class="form_radio_btn">
																			<input id="radio-5" class="workStatusCode" type="radio" name="workStatusCode" value="WKST05">
																			<label for="radio-5">보류</label>
																		</div>
																	</div>
																</div>
														    </div>
														    
														    <div class="col-12 col-md-12 mb-3">
														        <div class="form-group">
														            <span class="material-symbols-rounded" style="margin-right:10px; margin-top:5px; float:left">account_circle</span>
<!-- 														            	<div id="tagArea" style="float:left;"></div> -->
<!-- 																		<input type="text" name="assignMemId" id="tagInput" class="form-control" placeholder="담당자 추가"> -->
															            <div style="float:left; width:90%;">
<!-- 																	    	<input type="text" id="assignMemId" name="assignMemId" class="form-control" placeholder="담당자 추가" data-choices='{"silent": true,"removeItems": "true","removeItemButton": "true", "itemSelectText":""}'> -->
																	    	<select id="assignMemId" name="assignMemId" multiple class="form-control" data-choices='{"silent": true,"removeItems": "true","removeItemButton": "true", "itemSelectText":""}'>
																	    		<c:forEach items="${colleagueList }" var="workAssign">
													                           		<option value="${workAssign.colNum }">${workAssign.memNick }</option>
												                           		</c:forEach>
																	    	</select>
															            </div>
														        </div>
														    </div>
														    <br>
														    <br>

														    <div class="col-12 col-md-4 mb-3">
														        <div class="form-group" style="margin-top:20px;">
														            <span class="material-symbols-rounded" style="margin-right:10px; margin-top:5px; float:left;">calendar_today</span>
														            <input class="form-control" id="DateS" name="workStartDate" placeholder="시작일 추가" type="text" style="width:80%;">
														        </div>
														    </div>
														    <div class="col-12 col-md-4 mb-3">
														        <div class="form-group">
														            <span class="material-symbols-rounded" style="margin-right:10px; margin-top:5px; float:left;">calendar_today</span>
														            <input class="form-control" id="DateE" name="workEndDate" placeholder="마감일 추가" type="text" style="width:80%;">
														        </div>
														    </div>
														    
														    <div class="col-12 col-md-4 mb-3">
														        <div class="form-group">
														            <span class="material-symbols-rounded" style="margin-right:10px; margin-top:10px; float:left;">Flag</span>
														            <div style="float:left; width:80%;">
												                       <select id="chBasic" class="form-control" name="workPriority"
												                           data-choices='{"searchEnabled":false, "itemSelectText":""}'>
												                           <c:forEach items="${priCode }" var="priCode">
													                           <option value="${priCode.comCode }">${priCode.comCodeNm }</option>
												                           </c:forEach>
												                       </select>
														            </div>
														        </div>
														    </div>
														    
														    <div class="col-12 col-md-12 mb-3">
														        <div class="form-group">
														            <textarea class="form-control" id="workContent" name="workContent" style="height:200px; margin-top:85px;"></textarea>
<!-- 														            <textarea class="form-control" id="workContent" name="workContent"></textarea> -->
														        </div>
														    </div>

														    <div class="col-12 col-md-12 mb-3">
														        <div class="form-group">
							                                    	<input class="form-control" type="file" id="formFile" name="postFiles" multiple="multiple">
														        </div>
														    </div>
														    
														    
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="submit" class="btn btn-primary">등록</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                    </form>
                                            
                                        </div>
                                    </div>
                                    <!-- 모달 -->
                                    <hr>

									<c:choose>
										<c:when test="${empty workList }">
												등록된 업무가 존재하지 않습니다.
										</c:when>
										<c:otherwise>
										<div class="fixed-size">
											<c:forEach items="${workList }" var="work">
											<script type="text/javascript">
											$(function() {
// 												("#workDateS${work.workNum }").datepicker( "option", "disabled", true );
// 											    $('#workDateS${work.workNum }').daterangepicker({
// 													locale: {
// 														format: 'YYYY-MM-DD'
// 													},
// 													singleDatePicker: true,
// 													showDropdowns: true,
// 													minYear: 1901,
// 													maxYear: parseInt(moment().format('YYYY'),10),
// 													disabled: true
// 											    });
											  });
											  
											$(function() {
// 											    $('#workDateE${work.workNum }').daterangepicker({
// 													locale: {
// 														format: 'YYYY-MM-DD'
// 													},
// 													singleDatePicker: true,
// 													showDropdowns: true,
// 													minYear: 1901,
// 													maxYear: parseInt(moment().format('YYYY'),10)
// 											    });
											  });

											$(function() {
											    $('#updateDateS${work.workNum }').daterangepicker({
													locale: {
														format: 'YYYY-MM-DD'
													},
													singleDatePicker: true,
													showDropdowns: true,
													minYear: 1901,
													maxYear: parseInt(moment().format('YYYY'),10)
											    });
											  });
											  
											$(function() {
											    $('#updateDateE${work.workNum }').daterangepicker({
													locale: {
														format: 'YYYY-MM-DD'
													},
													singleDatePicker: true,
													showDropdowns: true,
													minYear: 1901,
													maxYear: parseInt(moment().format('YYYY'),10)
											    });
											  });
											  
											$(document).ready(function() {
												  $('#workProgress${work.workNum}').on('input', function() {
												    var progressValue = $(this).val();
												    $('#progress-value${work.workNum}').text(progressValue + '%');
												  });

												  $('#workProgress${work.workNum}').on('change', function() {
												    var progressValue = $(this).val();
												    var newProgressValue = Math.round(progressValue / 10) * 10;
												    $(this).val(newProgressValue);
												    $('#progress-value${work.workNum}').text(newProgressValue + '%');
												    console.log("퍼센트" + newProgressValue);
												  });
												});
											
											$(function(){
												var workUpdateBtn = $("#workUpdateBtn${work.workNum }");
												var pjId = "${project.pjId}";
												var workNum = document.getElementById('workNum${work.workNum }');
												var workTitle = document.getElementById('workTitle${work.workNum }');
												var updateDateS = document.getElementById('updateDateS${work.workNum }');
												var updateDateE = document.getElementById('updateDateE${work.workNum }');
												var workPriority = document.getElementById('workPriority${work.workNum }');
												var workProgress = document.getElementById('workProgress${work.workNum}');
												var workContent = document.getElementById('workContent${work.workNum}');
												
												workUpdateBtn.on("click",function(){
													var workStatusCode = $("input[type=radio][name=workStatusCode${work.workNum }]:checked").val();
													var assignMemId = $('#assignMemId${work.workNum }').val();
// 													console.log(pjId);
// 													console.log(workNum.value);
// 													console.log(workTitle.value);
// 													console.log(workStatusCode);
// 													console.log(assignMemId);
// 													console.log(updateDateS.value);
// 													console.log(updateDateE.value);
// 													console.log(workPriority.value);
// 													console.log(workProgress.value);
// 													console.log(workContent.value);

// 													var form = $('#formFile${work.workNum }')[0].files[0];
// 												    var formData = new FormData(form);
// 													console.log(formData);
													$.ajax({
														type : "post",
// 														enctype: 'multipart/form-data',
														url : "/coco/work/modify",
														data : {
															pjId : pjId,
															workNum : workNum.value,
															workTitle : workTitle.value,
															workStatusCode : workStatusCode,
															assignMemId : assignMemId,
															workStartDate : updateDateS.value,
															workEndDate : updateDateE.value,
															workPriority : workPriority.value,
															workProgress : workProgress.value,
															workContent :  workContent.value
// 															postFiles : formData
														},
// 														contentType : false,
// 												        processData : false, 
														success : function(result){
															if(result == "SUCCESS")
																location.href = "/coco/project/detail/" + pjId;
														}
													});
												});
												
											});
											
											</script>
											
											<div class="modal fade" id="updateWorkModal${work.workNum }" tabindex="-1"
                                               aria-labelledby="updateWorkModalLabel${work.workNum }" aria-hidden="true">
                                               <div class="modal-dialog">
                                                   <div class="modal-content" style="width: 130%; background-color:white;">
                                                       <div class="modal-header">
                                                           <h5 class="modal-title" id="updateWorkModalLabel${work.workNum }">업무 수정
                                                           </h5>
                                                           <button type="button" class="btn-close"
                                                               data-bs-dismiss="modal" aria-label="Close"></button>
                                                       </div>
                                                       
                                                       <div class="modal-body">
                                                           <div class="col-12 col-md-12 mb-3" style="text-align: center">
														        <div class="form-group">
														            <input type="text" class="form-control" id="workTitle${work.workNum }" name="workTitle" value="${work.workTitle }"/>
														        </div>
														    </div>
                                                            <div class="col-12 col-md-12 mb-3">
														        <div class="form-group">
																	<div class="form_toggle row-vh d-flex flex-row justify-content-between" >
														        	<span class="material-symbols-rounded" style="margin-right: 10px; margin-top:10px;">update</span>
																		<div class="form_radio_btn radio_male">
																			<input id="update1${work.workNum }" class="workStatusCode" type="radio" name="workStatusCode${work.workNum }" value="WKST01" <c:if test="${work.workStatusCode eq 'WKST01' }">checked</c:if>>
																			<label for="update1${work.workNum }">요청</label>
																		</div>
																									 
																		<div class="form_radio_btn">
																			<input id="update2${work.workNum }" class="workStatusCode" type="radio" name="workStatusCode${work.workNum }" value="WKST02" <c:if test="${work.workStatusCode eq 'WKST02' }">checked</c:if>>
																			<label for="update2${work.workNum }">진행</label>
																		</div>

																		<div class="form_radio_btn">
																			<input id="update3${work.workNum }" class="workStatusCode" type="radio" name="workStatusCode${work.workNum }" value="WKST03" <c:if test="${work.workStatusCode eq 'WKST03' }">checked</c:if>>
																			<label for="update3${work.workNum }">피드백</label>
																		</div>

																		<div class="form_radio_btn">
																			<input id="update4${work.workNum }" class="workStatusCode" type="radio" name="workStatusCode${work.workNum }" value="WKST04" <c:if test="${work.workStatusCode eq 'WKST04' }">checked</c:if>>
																			<label for="update4${work.workNum }">완료</label>
																		</div>

																		<div class="form_radio_btn">
																			<input id="update5${work.workNum }" class="workStatusCode" type="radio" name="workStatusCode${work.workNum }" value="WKST05" <c:if test="${work.workStatusCode eq 'WKST05' }">checked</c:if>>
																			<label for="update5${work.workNum }">보류</label>
																		</div>
																	</div>
																</div>
														    </div>
														    
														    <div class="col-12 col-md-12 mb-3">
														        <div class="form-group">
														            <span class="material-symbols-rounded" style="margin-right:10px; margin-top:5px; float:left">account_circle</span>
															            <div style="float:left; width:90%;">
																	    	<select id="assignMemId${work.workNum }" name="assignMemId" multiple class="form-control" data-choices='{"silent": true,"removeItems": "true","removeItemButton": "true", "itemSelectText":""}'>
																	    		<c:forEach items="${colleagueList }" var="workAssign">
												                           			<c:set value="true" var="flag"/>
																		    		<c:forEach items="${work.colleagueVOList }" var="workColleague">
	<%-- 													                           		<option value="${workAssign.colNum }" <c:if test="${workColleague.colNum eq workAssign.colNum }">selected</c:if>>${workAssign.memNick }</option> --%>
														                           		<c:if test="${workColleague.colNum eq workAssign.colNum }">
														                           			<option value="${workAssign.colNum }" selected>${workAssign.memNick }</option>
														                           			<c:set value="false" var="flag"/>
																		    		    </c:if>
													                           		</c:forEach>
													                           		<c:if test="${flag }">
														                           		<option value="${workAssign.colNum }">${workAssign.memNick }</option>
													                           		</c:if>
												                           		</c:forEach>
																	    	</select>
															            </div>
														        </div>
														    </div>
														    <br>
														    <br>

														    <div class="col-12 col-md-4 mb-3">
														        <div class="form-group" style="margin-top:20px;">
														            <span class="material-symbols-rounded" style="margin-right:10px; margin-top:5px; float:left;">calendar_today</span>
														            <input class="form-control" id="updateDateS${work.workNum }" name="workStartDate" value="${work.workStartDate }" type="text" style="width:80%;">
														        </div>
														    </div>
														    <div class="col-12 col-md-4 mb-3">
														        <div class="form-group">
														            <span class="material-symbols-rounded" style="margin-right:10px; margin-top:5px; float:left;">calendar_today</span>
														            <input class="form-control" id="updateDateE${work.workNum }" name="workEndDate" value="${work.workEndDate }" type="text" style="width:80%;">
														        </div>
														    </div>
														    
														    <div class="col-12 col-md-4 mb-3">
														        <div class="form-group">
														            <span class="material-symbols-rounded" style="margin-right:10px; margin-top:10px; float:left;">Flag</span>
														            <div style="float:left; width:80%;">
												                       <select id="workPriority${work.workNum }" class="form-control" name="workPriority"
												                           data-choices='{"searchEnabled":false, "itemSelectText":""}'>
												                           <c:forEach items="${priCode }" var="priCode">
													                           <option value="${priCode.comCode }"  <c:if test="${work.workPriority eq priCode.comCode }">selected</c:if>>${priCode.comCodeNm }</option>
												                           </c:forEach>
												                       </select>
														            </div>
														        </div>
														    </div>
														    
														    <br>
														    <br>
														    
														    <div class="col-12 col-md-6 mb-3">
														        <div class="form-group" style="margin-top:10px;">
														            <span class="material-symbols-rounded" style="margin-right:10px; margin-top:5px; float:left;">Monitoring</span>
															        <div class="card" style="width:52%; float:left; margin-right:10px;">
	               													<div class="card-body" style="margin-top:-7px; margin-bottom:-7px;">
																	    <input type="range" class="form-range" min="0" max="100" step="10" style="float:left; margin-right:15px;"
													                    	id="workProgress${work.workNum}" name="workProgress" value="${work.workProgress }">
															        </div>
															        </div>
												                    <span id="progress-value${work.workNum}">${work.workProgress }%</span>
														        </div>
														    </div>
														    
														    <div class="col-12 col-md-12 mb-3">
														        <div class="form-group">
														            <textarea class="form-control" id="workContent${work.workNum}" name="workContent" style="height:200px; margin-top:40px;">${work.workContent }</textarea>
<!-- 														            <textarea class="form-control" id="workContent" name="workContent"></textarea> -->
														        </div>
														    </div>
														    
														    <div class="col-12 col-md-12 mb-3">
														        <div class="form-group">
<!-- 														        <div class="card-body"> -->
<!-- 														        <div class="card" style="border:1px; solid; black;"> -->
														        
														            <c:forEach items="${work.workFile.attatchList }" var="workFile">
														            <div id="file${workFile.attatchOrder }${workFile.attatchNum}">
												                    <c:choose>
												                    	<c:when test="${fn:substring(workFile.attatchType,0,5) == 'image'}">
												                    	<div style="float:left;">
														                    <img src="/upload/${workFile.saveNm}" width=120px; height=120px; alt="image" style="margin-bottom:10px;"/>
														                    <button type="button" id="fileBtn${workFile.attatchOrder }${workFile.attatchNum}" class="text-body lh-1" style="background-color:white; border:0px;">
													                           <span class="align-middle material-symbols-rounded">
													                             delete
													                           </span>
													                         </button>
													                         </div>
												                    	</c:when>
												                    	<c:otherwise>
																			<br><br><br><br><br><br>
												                    	<div>
												                    		<div class="p-3 border rounded-3 mb-1 d-flex align-items-center">
												                    		
												                    		<c:if test="${fn:containsIgnoreCase(workFile.attatchType, 'hwp')}">
																	        <img src="/resources/assets/img/projects/6.png" alt="" class="height-40 me-3 flex-shrink-0 w-auto">
																	       </c:if>
																	      <c:if test="${fn:containsIgnoreCase(workFile.attatchType, 'xlsx')}">
																	        <img src="/resources/assets/img/projects/4.png" alt="" class="height-40 me-3 flex-shrink-0 w-auto">
																	      </c:if>
																	      <c:if test="${fn:containsIgnoreCase(workFile.attatchType, 'zip')}">
																	        <img src="/resources/assets/img/projects/3.png" alt="" class="height-40 me-3 flex-shrink-0 w-auto">
																	      </c:if>
																	      <c:if test="${fn:containsIgnoreCase(workFile.attatchType, 'text')}">
																	        <img src="/resources/assets/img/projects/7.png" alt="" class="height-40 me-3 flex-shrink-0 w-auto">
																	      </c:if>
<!-- 											                                  <img src="/resources/assets/media/icons/files/css.svg" class="height-40 me-3 flex-shrink-0 w-auto" alt=""> -->
											                                  <div class="flex-grow-1 overflow-hidden">
											                                    <p class="mb-1 lh-sm text-truncate">${workFile.originNm }</p>
											                                    <div class="d-flex align-items-center justify-content-between">
											                                      <small class="text-body-secondary">
											                                      <c:choose>
														                            <c:when test="${workFile.attatchSize < 1024}">
														                            	${workFile.attatchSize } B
														                            </c:when>
														                            <c:when test="${workFile.attatchSize >= 1024}">
														                            	${String.format("%.2f", workFile.attatchSize / 1024)} KB
														                            </c:when>
														                            <c:when test="${workFile.attatchSize >= 1048576}">
														                            	${String.format("%.2f", workFile.attatchSize / 1048576)} MB
														                            </c:when>
														                          </c:choose>
											                                      </small>
											                                      <button type="button" id="fileBtn${workFile.attatchOrder }${workFile.attatchNum}" class="text-body" style="background-color:white; border:0px;">
											                                        <span class="material-symbols-rounded align-middle">
											                                        delete
											                                        </span>
											                                      </button>
											                                    </div>
											                                  </div>
											                                </div>
											                                <small class="d-block text-body-secondary">${workFile.attatchDate }</small>
											                                </div>
												                    	</c:otherwise>
												                    </c:choose>
												                    </div>
												                    <script type="text/javascript">
												                    $(function(){
												                    	var fileBtn = $("#fileBtn${workFile.attatchOrder }${workFile.attatchNum}");
												                    	var workNum = "${work.workNum}";
												                    	var workFileOrder = "${workFile.attatchOrder}"
												                    	
												                    	fileBtn.on("click",function(){
												                    		console.log(workNum);
												                    		console.log(workFileOrder);
												                    		$.ajax({
																				type : "post",
																				url : "/coco/attatch/delete",
																				data : {
																					attatchOrder : workFileOrder,
																					attatchPlace : workNum
																				},
																				success : function(result){
																					$('#file${workFile.attatchOrder }${workFile.attatchNum}').remove();
																				}
																			});
												                    	});
												                    });
												                    </script>
												                    </c:forEach>
												                    
<!-- 												                    </div> -->
<!-- 												                    </div> -->
																	
<%-- 																	<form id="updateFile${work.workNum }"> --%>
																	<div class="col-12 col-md-12 mb-3">
																        <div class="form-group">
																        <input class="form-control" type="file" id="formFile${work.workNum }" name="postFiles" multiple="multiple">
																        </div>
																    </div>
<%-- 																    </form> --%>
																    
														        </div>
														    </div>
														    
                                                       </div>
                                                       
                                                       <div class="modal-footer">
                                                           <button type="button" class="btn btn-secondary"
                                                               data-bs-dismiss="modal">취소</button>
                                                           <button type="button" id="workUpdateBtn${work.workNum }" class="btn btn-primary">수정</button>
                                                       </div>
                                                   </div>
                                               </div>
                                           </div>
											
                                            <!--Post card start-->
                                            <c:forEach items="${colleagueList }" var="coll" >
                                            <c:if test="${coll.memId == work.workReq }">
                                            
                                            <div class="card mb-3 mb-lg-5">
                                                <div class="card-body">
                                                    <div class="d-flex justify-content-start align-items-center mb-3">
                                                        <span
                                                            class="avatar flex-shrink-0 rounded-circle d-inline-block">
                                                            <img src="${coll.memProfile }" alt="avatar"
                                                                class="img-fluid rounded-circle">
                                                        
                                                        </span>
                                                        <div class="ps-3" style="margin-right: auto;">
                                                            <h6 class="mb-0">${coll.memNick }</h6>
                                                            <small class="text-body-subtle">${work.workCreateDate }</small>
                                                        </div>
                                                        
												         <div class="dropdown" class="ps-3" style="float:left;">
												           <a href="#" class="btn p-0 text-body border-0 shadow-none size-35 d-flex align-items-center justify-content-center rounded-pill" role="button" data-bs-toggle="dropdown"
												             aria-haspopup="true" aria-expanded="false">
												             <span class="material-symbols-rounded align-middle">
												               more_vert
												               </span>
												           </a>
												           <div class="dropdown-menu mt-1 dropdown-menu-end">
												             <button type="button" class="dropdown-item" data-bs-toggle="modal"
                                                				data-bs-target="#updateWorkModal${work.workNum }">업무 수정
												             </button>
												             
	                                                        <c:choose>
	                                                        <c:when test="${loginId == work.workReq }">
												             	<form action="/coco/work/delete" method="post">
																	<input type="hidden" name="pjId" value="${project.pjId}">
																	<input type="hidden" name="workNum" value="${work.workNum}">
												             		<button type="submit" class="dropdown-item" 
												             		onclick="return confirm('삭제하시겠습니까?')">업무 삭제</button>
																</form>
	                                                        </c:when>
	                                                        <c:when test="${loginId == project.pjAdminId }">
												             	<form action="/coco/work/delete" method="post">
																	<input type="hidden" name="pjId" value="${project.pjId}">
																	<input type="hidden" name="workNum" value="${work.workNum}">
												             		<button type="submit" class="dropdown-item" 
												             		onclick="return confirm('삭제하시겠습니까?')">업무 삭제</button>
																</form>
	                                                        </c:when>
	                                                        </c:choose>
												             
												           </div>
												         </div>
												         
                                                        
                                                    </div>
                                                    <br>
                                                    <p>${work.workTitle }</p>
<!--                                                     <img src="assets/media/900x600/5.jpg" -->
<!--                                                         class="img-fluid mb-3 rounded-3 shadow" alt=""> -->
                                                    <hr style="border: 1px solid gray">
                                                    
                                                    <div class="col-12 col-md-12 mb-3">
                                                    
                                                    <input type="hidden" name="workStatusCode" value="WS01" />
                                                    
												        <div class="form-group">
															<div class="form_toggle row-vh d-flex flex-row justify-content-between" >
												        	<span class="material-symbols-rounded" style="margin-right: 10px; margin-top:10px;">update</span>
																<div class="form_radio_btn radio">
																	<input id="radio-d1${work.workNum }" class="" type="radio" name="workStatusCode${work.workNum }r" value="WKST01" <c:if test="${work.workStatusCode eq 'WKST01' }">checked</c:if>>
																	<label for="radio-d1${work.workNum }">요청</label>
																</div>
																							 
																<div class="form_radio_btn">
																	<input id="radio-d2${work.workNum }" class="" type="radio" name="workStatusCode${work.workNum }r" value="WKST02" <c:if test="${work.workStatusCode eq 'WKST02' }">checked</c:if>>
																	<label for="radio-d2${work.workNum }">진행</label>
																</div>
	
																<div class="form_radio_btn">
																	<input id="radio-d3${work.workNum }" class="" type="radio" name="workStatusCode${work.workNum }r" value="WKST03" <c:if test="${work.workStatusCode eq 'WKST03' }">checked</c:if>>
																	<label for="radio-d3${work.workNum }">피드백</label>
																</div>
	
																<div class="form_radio_btn">
																	<input id="radio-d4${work.workNum }" class="" type="radio" name="workStatusCode${work.workNum }r" value="WKST04" <c:if test="${work.workStatusCode eq 'WKST04' }">checked</c:if>>
																	<label for="radio-d4${work.workNum }">완료</label>
																</div>
	
																<div class="form_radio_btn">
																	<input id="radio-d5${work.workNum }" class="" type="radio" name="workStatusCode${work.workNum }r" value="WKST05" <c:if test="${work.workStatusCode eq 'WKST05' }">checked</c:if>>
																	<label for="radio-d5${work.workNum }">보류</label>
																</div>
															</div>
														</div>
												    </div>
                                                    <div class="col-12 col-md-12 mb-3">
												        <div class="form-group">
												            <span class="material-symbols-rounded" style="margin-right:10px; margin-top:10px; float:left">account_circle</span>
												            <div style="float:left; width:90%;">
														    	<input type="text" class="form-control" value="${work.assignMemId }" data-choices='{"silent": true,"removeItems": "true","removeItemButton": "", "itemSelectText":"", "readonly":"true"}'>
												            </div>
												        </div>
												    </div>
												    <br>
												    <br>
												    <br>
												    
												    <div class="col-12 col-md-4 mb-3">
												        <div class="form-group">
												            <span class="material-symbols-rounded" style="margin-right:10px; margin-top:5px; float:left;">calendar_today</span>
												            <input class="form-control" id="workDateS${work.workNum }" name="workStartDate" value="${work.workStartDate }" type="text" style="width:80%;">
												        </div>
												    </div>
												    <div class="col-12 col-md-4 mb-3">
												        <div class="form-group">
												            <span class="material-symbols-rounded" style="margin-right:10px; margin-top:5px; float:left;">calendar_today</span>
												            <input class="form-control" id="workDateE${work.workNum }" name="workEndDate" value="${work.workEndDate }" type="text" style="width:80%;">
												        </div>
												    </div>
												    
												    <div class="col-12 col-md-4 mb-3">
												        <div class="form-group">
												            <span class="material-symbols-rounded" style="margin-right:10px; margin-top:10px; float:left;">Flag</span>
												            <div style="float:left; width:80%;">
												            	<select id="chBasic" class="form-control" name="workPriority"
						                                            data-choices='{"searchEnabled":false, "itemSelectText":"" }'>
<%-- 						                                            <option value="WP01" <c:if test="${work.workPriority eq 'WP01' }">selected</c:if>>낮음</option> --%>
						                                            <c:forEach items="${priCode }" var="priCode">
											                           <option value="${priCode.comCode }" disabled="disabled" <c:if test="${work.workPriority eq priCode.comCode }">selected</c:if>>${priCode.comCodeNm }</option>
										                           </c:forEach>
						                                        </select>
												            </div>
												        </div>
												    </div>
												    
												    <br>
												    <br>
												    <br>
												    
												    <div class="col-12 col-md-6 mb-3">
												        <div class="form-group">
												            <span class="material-symbols-rounded" style="margin-right:10px; float:left;">Monitoring</span>
<!-- 														    <input type="range" class="form-range" min="0" max="100" step="10" style="width:50%; float:left; margin-right:15px;" -->
<%-- 										                    	id="workProgress${work.workNum}" name="workProgress" value="${work.workProgress }"> --%>
<%-- 										                    <span id="progress-value${work.workNum}">${work.workProgress }%</span> --%>
																 <div class="progress mb-3" style="height: 20px; width:55%; float:left">
											                     <div class="progress-bar" role="progressbar"
											                      aria-valuemin="0" aria-valuemax="100" style="width: ${work.workProgress }%"></div>
											                   	 </div>
											                      <div style="float:left; margin-left:10px;">${work.workProgress }%</div>
											                      
												        </div>
												    </div>
												    
												     <br>
												     <br>
								                    
								                    <p>${work.workContent }</p>
								                    <c:forEach items="${work.workFile.attatchList }" var="workFile">
								                    <c:choose>
								                    	<c:when test="${fn:substring(workFile.attatchType,0,5) == 'image'}">
										                    <img src="/upload/${workFile.saveNm}" width=120px; height=120px; alt="image" style="margin-bottom:10px;"/>
								                    	</c:when>
								                    	<c:otherwise>
								                    		<div class="p-3 border rounded-3 mb-1 d-flex align-items-center">
								                    		
								                    		<c:if test="${fn:containsIgnoreCase(workFile.attatchType, 'hwp')}">
												        <img src="/resources/assets/img/projects/6.png" alt="" class="height-40 me-3 flex-shrink-0 w-auto">
												       </c:if>
												      <c:if test="${fn:containsIgnoreCase(workFile.attatchType, 'xlsx')}">
												        <img src="/resources/assets/img/projects/4.png" alt="" class="height-40 me-3 flex-shrink-0 w-auto">
												      </c:if>
												      <c:if test="${fn:containsIgnoreCase(workFile.attatchType, 'zip')}">
												        <img src="/resources/assets/img/projects/3.png" alt="" class="height-40 me-3 flex-shrink-0 w-auto">
												      </c:if>
												      <c:if test="${fn:containsIgnoreCase(workFile.attatchType, 'text')}">
												        <img src="/resources/assets/img/projects/7.png" alt="" class="height-40 me-3 flex-shrink-0 w-auto">
												      </c:if>
								                    		
<!-- 							                                  <img src="/resources/assets/media/icons/files/css.svg" class="height-40 me-3 flex-shrink-0 w-auto" alt=""> -->
							                                  <div class="flex-grow-1 overflow-hidden">
							                                    <p class="mb-1 lh-sm text-truncate">${workFile.originNm }</p>
							                                    <div class="d-flex align-items-center justify-content-between">
							                                      <small class="text-body-secondary">
							                                      <c:choose>
										                            <c:when test="${workFile.attatchSize < 1024}">
										                            	${workFile.attatchSize } B
										                            </c:when>
										                            <c:when test="${workFile.attatchSize >= 1024}">
										                            	${String.format("%.2f", workFile.attatchSize / 1024)} KB
										                            </c:when>
										                            <c:when test="${workFile.attatchSize >= 1048576}">
										                            	${String.format("%.2f", workFile.attatchSize / 1048576)} MB
										                            </c:when>
										                          </c:choose>
							                                      </small>
							                                      <a href="#!" class="text-body"
							                                      href="/upload/${workFile.saveNm}"
																	download="/upload/${workFile.originNm}">
							                                        <span class="material-symbols-rounded align-middle">
							                                          download
							                                        </span>
							                                      </a>
							                                    </div>
							                                  </div>
							                                </div>
							                                <small class="d-block text-body-secondary">${workFile.attatchDate }</small>
								                    	</c:otherwise>
								                    </c:choose>
								                    </c:forEach>
												    
												    
										<!--Reaction list-->

                                                     <!--Likes-->
                                                     <div
                                                     class="d-flex pb-3 mb-3 border-bottom align-items-center small">

                                                     <!--Comments-->
                                                     <a href="#!"
                                                         class="d-flex align-items-center ms-auto">
                                                         <span
                                                             class="fs-5 align-middle me-2 material-symbols-rounded">
                                                             comment
                                                         </span>
                                                         <span>${work.issueList.size()}</span>
                                                     </a>
                                                 </div>

                                                    <!--Comments list-->
                                                    <ul class="list-group" id="comment-list${work.workNum }">
			                                            <c:forEach items="${work.issueList }" var="issue">
			                                            
                                                        <c:forEach items="${colleagueList }" var="collIssue">
                                                        <c:if test="${issue.issueReq == collIssue.memId }">
                                                        <li class="list-group-item" id="issueSelectDel${issue.issueNum }">
                                                            <div class="d-flex align-items-stretch" style="float:left;">
                                                                <a href="#!" class="flex-shrink-0 d-block me-2">
                                                                    <img src="${collIssue.memProfile }"
                                                                        class="avatar sm rounded-circle" alt="">
                                                                
                                                                </a>
                                                                <!--Coomments and replies-->
                                                                <div>
<!--                                                                     <div class="py-2 mb-1 px-3 bg-body rounded-3"> -->
                                                                    <div class="py-2 mb-1 px-3 rounded-3">
<!--                                                                         <div class="d-flex justify-content-between"> -->
                                                                        <div class="d-flex">
                                                                            <h6 class="mb-0">${collIssue.memNick }</h6>
                                                                            <small class="text-body-secondary" style="margin-left:10px;">${issue.issueDate }</small>
                                                                        </div>
                                                                        <p class="mb-0">${issue.issueContent }</p>
                                                                    </div>
<!--                                                                     Reply link -->
<!--                                                                     <div class="mb-2 small"> -->
<!--                                                                         <a href="#!" class="text-reset">Reply</a> -->
<!--                                                                     </div> -->
<!--                                                                     Reply -->
<!--                                                                     <div class="d-flex align-items-stretch"> -->
<!--                                                                         <a href="#!" class="flex-shrink-0 d-block me-2"> -->
<!--                                                                             <img src="assets/media/avatars/02.jpg" -->
<!--                                                                                 class="avatar xs rounded-circle" alt=""> -->
<!--                                                                         </a> -->
<!--                                                                         Reply -->
<!--                                                                         <div> -->
<!--                                                                             <div -->
<!--                                                                                 class="py-2 mb-1 px-3 bg-body rounded-3"> -->
<!--                                                                                 <div -->
<!--                                                                                     class="d-flex justify-content-between"> -->
<!--                                                                                     <h6 class="mb-0">Milana Myles</h6> -->
<!--                                                                                     <small class="text-body-secondary">12:43 -->
<!--                                                                                         PM</small> -->
<!--                                                                                 </div> -->
<!--                                                                                 <p class="mb-0"> -->
<!--                                                                                     Lorem ipsum, or lipsum as it is -->
<!--                                                                                     sometimes known. -->
<!--                                                                                 </p> -->
<!--                                                                             </div> -->
<!--                                                                             Reply link -->
<!--                                                                             <div class="mb-0 small"> -->
<!--                                                                                 <a href="#!" -->
<!--                                                                                     class="text-reset">Reply</a> -->
<!--                                                                             </div> -->
<!--                                                                         </div> -->

<!--                                                                     </div> -->
                                                                </div>
                                                            </div>
                                                             <div>
<!--                                                              	<button type="button" class="btn btn-outline-danger" style="float: right;">삭제</button> -->
																<c:choose>
																<c:when test="${loginId == issue.issueReq }">
                                                              		<button type="button" id="issueDel${issue.issueNum }" class="issueDel badge bg-danger-subtle text-danger" style="float: right; border:0px;">삭제</button>
																</c:when>
																<c:when test="${loginId == project.pjAdminId }">
                                                              		<button type="button" id="issueDel${issue.issueNum }" class="issueDel badge bg-danger-subtle text-danger" style="float: right; border:0px;">삭제</button>
																</c:when>
																<c:otherwise></c:otherwise>
																</c:choose>
                                                             </div>
                                                        </li>
                                                        <input type="hidden" id="issueNum${issue.issueNum }" name="issueNum" value="${issue.issueNum }" >

                                                        <script type="text/javascript">
                                                        	$(function(){
		                                                        var issueDel = $("#issueDel${issue.issueNum }");
		    													var issueNum = document.getElementById('issueNum${issue.issueNum }');
		    													
		    													issueDel.on("click",function(){
		    														if(confirm("정말로 삭제하시겠습니까?")){
			    														console.log(issueNum.value);
			    														$.ajax({
			    															type : "post",
			    															url : "/coco/issue/delete",
			    															data : {
			    																issueNum : issueNum.value
			    															},
			    															success : function(result){
			    																$('#issueSelectDel${issue.issueNum }').remove();
			    																$('#wtIssueSelectDel${issue.issueNum }').remove();
			    															}
			    														});
	                                                        		}
		    													});
		    													
                                                        	});
														</script>

														</c:if>
														<!-- issueList 안에 collList 끝 -->
                                                        </c:forEach>
                                                        
                                                        <!-- issueList끝 -->
                                                        </c:forEach>
                                                        </ul>
                                                        
                                                        <ul class="list-group">
                                                        <li class="list-group-item bg-body">
                                                            <!--Add comment-->
                                                            <h6>Comment</h6>
<%--                                                             <form action="#!"> --%>
                                                                <textarea id="issueContent${work.workNum }" name="issueContent" rows="2"
                                                                    class="form-control mb-2"></textarea>
                                                                <div class="text-end">
                                                                    <button type="button" class="btn btn-primary btn-sm" id="issueBtn${work.workNum }">
                                                                        작성</button>
                                                                </div>
<%--                                                             </form> --%>
                                                        </li>
                                                    </ul>
												
												<c:forEach items="${colleagueList }" var="collIssue">
												<c:if test="${loginId == collIssue.memId }">
												<input type="hidden" id="memProfile${coll.colNum }" name="" value="${collIssue.memProfile }" >
												<input type="hidden" id="memName${coll.colNum }" name="" value="${collIssue.memNick }" >
												</c:if>
												</c:forEach>

                                                </div>
                                            </div>
                                            
                                            <input type="hidden" id="workNum${work.workNum }" name="workNum" value="${work.workNum }" >
                                            <!--/.Post card end-->
                                            <script type="text/javascript">
												$(function(){
													var issueBtn = $("#issueBtn${work.workNum }");
													var issueContent = document.getElementById('issueContent${work.workNum }');
													var workNum = document.getElementById('workNum${work.workNum }');
													var memProfile = $("#memProfile${coll.colNum }")
													var memName = $("#memName${coll.colNum }")
													
// 													var insertIssueDelBtn = null;
// 													var insertIssueNum = null;
													
													issueBtn.on("click", function(){
														console.log(issueContent.value);
														console.log(workNum.value);
														console.log(memProfile.val());
														console.log(memName.val());
														$.ajax({
															type : "post",
															url : "/coco/issue/register",
															data : {
																issueContent : issueContent.value,
																workNum : workNum.value
															},
															success : function(result){
																var insertIssueNum = result.issueNum;
																var newItem = '<li class="insertIssueSelectDel'+ insertIssueNum +' list-group-item" id="insertIssueSelectDel'+ insertIssueNum +'">';
																newItem += '<div class="d-flex align-items-stretch" style="float:left;">';
																newItem += '<div class="d-flex align-items-stretch">';
																newItem += '<a href="#!" class="flex-shrink-0 d-block me-2">'; 
																newItem += '<img src="'+memProfile.val()+'" class="avatar sm rounded-circle" alt="">';  
													            newItem += '</a>';
													            newItem += '<div>';
													            newItem += '<div class="py-2 mb-1 px-3 rounded-3">';
													            newItem += '<div class="d-flex">';
													            newItem += '<h6 class="mb-0">'+ memName.val() +'</h6>';
													            newItem += '<small class="text-body-secondary" style="margin-left:10px;">'+result.issueDate +'</small>';
													            newItem += '</div>';
													            newItem += '<p class="mb-0">' + issueContent.value + '</p>';
													            newItem += '</div>';
													            newItem += '</div>';
													            newItem += '</div>';
													            newItem += '</div>';
													            newItem += '<button type="button" id="issueDel' + result.issueNum + '" class="issueDel' + result.issueNum + ' badge bg-danger-subtle text-danger" style="float: right; border:0px;">삭제</button>';
													            newItem += '</div>';
													            newItem += '</li>';
													            
													            $('#comment-list${work.workNum }').append(newItem);
													            $('#wtComment-list${work.workNum }').append(newItem);
													            
													            issueContent.value = '';
													            
// 													            var insertIssueDelBtn = $("#issueDel" + result.issueNum);
													            var insertIssueDelBtn = $(".issueDel" + result.issueNum);
													            
													            insertIssueDelBtn.on("click",function(){
														            console.log(insertIssueDelBtn);
														            console.log(insertIssueNum);
																	if(confirm("정말로 삭제하시겠습니까?")){
			    														$.ajax({
			    															type : "post",
			    															url : "/coco/issue/delete",
			    															data : {
			    																issueNum : insertIssueNum
			    															},
			    															success : function(result){
			    																$('.insertIssueSelectDel'+insertIssueNum).remove();
			    																$('.wtInsertIssueSelectDel'+insertIssueNum).remove();
			    															}
			    														});
			                                                		}
																});
													            
															}
														});
													});
													
												});
											</script>
											<!-- colleagueList 포문 끝 -->
                                            </c:if>
                                            </c:forEach>
                                            
                                            <!-- workList 포문 끝 -->
                                            </c:forEach>
                                            </div>
										</c:otherwise>
									</c:choose>
                                            
                            </div>
                            </div>
                            <!-- 탭div -->
                            </div>
                            
                            <div class="tab-pane fade <c:if test="${active eq '2' }">show active</c:if>" id="work" role="tabpanel" aria-labelledby="work-tab">
                            <!-- 민수고침2 -->
                            <div class="row justify-content-end">
                              <div class="col-auto">
	                            <button type="button" id="excelDownBtn" class="btn btn-primary mb-2 me-1">
				                    <i style="color:white;  font-weight:bold;" class="bi bi-file-excel"></i>
				                  			  다운로드
				                </button>
				              </div>
			                </div>
                            <!-- 민수고침2 -->
                            <div  id="work">
								<div class="row">
					                <div class="col-12 mb-3 mb-lg-5">
					                  <div class="overflow-hidden card table-nowrap table-card">
					                    <div class="card-header d-flex justify-content-between align-items-center">
					                      <h6 class="mb-0"></h6>
<!-- 					                      <a href="#!" class="btn btn-outline-secondary btn-sm">View All</a> -->
					                    </div>
					                    <div class="table-responsive">
					                    <!-- 민수확인3 엑셀다운로드용 form -->
					                     <form id="excelForm" name="excelForm" action="/coco/project/excelDownload?pjid=${project.pjId}" method="post">
					                      <button type="submit" id="hiddenExcelDownBtn" style="display:none;">보이면안되는버튼</button>
					                      <table class="table mb-0" id="wtTable">
<!-- 					                        <thead class="small text-uppercase text-body-secondary" style="background:#D7E1DF"> -->
					                        <thead class="bg-body small text-uppercase text-body-secondary">
					                          <tr>
					                            <th onclick="sortTable(0)">업무명</th>
					                            <th onclick="sortTable(1)">상태</th>
					                            <th onclick="sortTable(2)">우선순위</th>
					                            <th onclick="sortTable(3)">담당자</th>
					                            <th onclick="sortTable(4)">시작일</th>
					                            <th onclick="sortTable(5)">마감일</th>
					                            <th onclick="sortTable(6)">등록일</th>
					                            <th class="text-end"></th>
					                          </tr>
					                        </thead>
					                        <tbody>
					                        <c:choose>
												<c:when test="${empty workList }">
														<!-- 민수확인1 -->
														<tr>
															<td colspan="7">등록된 업무가 존재하지 않습니다.</td>
														</tr>
												</c:when>
												<c:otherwise>
													<c:forEach items="${workList }" var="work">
													
													<script type="text/javascript">
													
														$(function() {
														    $('#wtUpdateDateS${work.workNum }').daterangepicker({
																locale: {
																	format: 'YYYY-MM-DD'
																},
																singleDatePicker: true,
																showDropdowns: true,
																minYear: 1901,
																maxYear: parseInt(moment().format('YYYY'),10)
														    });
														  });
														  
														$(function() {
														    $('#wtUpdateDateE${work.workNum }').daterangepicker({
																locale: {
																	format: 'YYYY-MM-DD'
																},
																singleDatePicker: true,
																showDropdowns: true,
																minYear: 1901,
																maxYear: parseInt(moment().format('YYYY'),10)
														    });
														  });
														  
														$(document).ready(function() {
															  $('#wtWorkProgress${work.workNum}').on('input', function() {
															    var progressValue = $(this).val();
															    $('#wtProgress-value${work.workNum}').text(progressValue + '%');
															  });
			
															  $('#wtWorkProgress${work.workNum}').on('change', function() {
															    var progressValue = $(this).val();
															    var newProgressValue = Math.round(progressValue / 10) * 10;
															    $(this).val(newProgressValue);
															    $('#wtProgress-value${work.workNum}').text(newProgressValue + '%');
															    console.log("퍼센트" + newProgressValue);
															  });
															});
														
														$(function(){
															var workUpdateBtn = $("#wtWorkUpdateBtn${work.workNum }");
															var pjId = "${project.pjId}";
															var workNum = document.getElementById('wtWorkNum${work.workNum }');
															var workTitle = document.getElementById('wtWorkTitle${work.workNum }');
															var updateDateS = document.getElementById('wtUpdateDateS${work.workNum }');
															var updateDateE = document.getElementById('wtUpdateDateE${work.workNum }');
															var workPriority = document.getElementById('wtWorkPriority${work.workNum }');
															var workProgress = document.getElementById('wtWorkProgress${work.workNum}');
															var workContent = document.getElementById('wtWorkContent${work.workNum}');
															
															workUpdateBtn.on("click",function(){
																var workStatusCode = $("input[type=radio][name=wtWorkStatusCode${work.workNum }]:checked").val();
																var assignMemId = $('#wtAssignMemId${work.workNum }').val();
																$.ajax({
																	type : "post",
																	url : "/coco/work/modify",
																	data : {
																		pjId : pjId,
																		workNum : workNum.value,
																		workTitle : workTitle.value,
																		workStatusCode : workStatusCode,
																		assignMemId : assignMemId,
																		workStartDate : updateDateS.value,
																		workEndDate : updateDateE.value,
																		workPriority : workPriority.value,
																		workProgress : workProgress.value,
																		workContent :  workContent.value
																	},
																	success : function(result){
																		if(result == "SUCCESS")
																			location.href = "/coco/project/detail/" + pjId + "?active=2";
																	}
																});
															});
														});
														
														
														</script>
													
														<div class="modal fade" id="wtUpdateWorkModal${work.workNum }" tabindex="-1"
			                                               aria-labelledby="wtUpdateWorkModalLabel${work.workNum }" aria-hidden="true">
			                                               <div class="modal-dialog">
			                                                   <div class="modal-content" style="width: 130%; background-color:white;">
			                                                       <div class="modal-header">
			                                                           <h5 class="modal-title" id="wtUpdateWorkModalLabel${work.workNum }">업무 수정
			                                                           </h5>
			                                                           <button type="button" class="btn-close"
			                                                               data-bs-dismiss="modal" aria-label="Close"></button>
			                                                       </div>
			                                                       
			                                                       <div class="modal-body">
			                                                           <div class="col-12 col-md-12 mb-3" style="text-align: center">
																	        <div class="form-group">
																	            <input type="text" class="form-control" id="wtWorkTitle${work.workNum }" name="workTitle" value="${work.workTitle }"/>
																	        </div>
																	    </div>
			                                                            <div class="col-12 col-md-12 mb-3">
																	        <div class="form-group">
																				<div class="form_toggle row-vh d-flex flex-row justify-content-between" >
																	        	<span class="material-symbols-rounded" style="margin-right: 10px; margin-top:10px;">update</span>
																					<div class="form_radio_btn radio_male">
																						<input id="wtUpdate1${work.workNum }" class="workStatusCode" type="radio" name="wtWorkStatusCode${work.workNum }" value="WKST01" <c:if test="${work.workStatusCode eq 'WKST01' }">checked</c:if>>
																						<label for="wtUpdate1${work.workNum }">요청</label>
																					</div>
																												 
																					<div class="form_radio_btn">
																						<input id="wtUpdate2${work.workNum }" class="workStatusCode" type="radio" name="wtWorkStatusCode${work.workNum }" value="WKST02" <c:if test="${work.workStatusCode eq 'WKST02' }">checked</c:if>>
																						<label for="wtUpdate2${work.workNum }">진행</label>
																					</div>
			
																					<div class="form_radio_btn">
																						<input id="wtUpdate3${work.workNum }" class="workStatusCode" type="radio" name="wtWorkStatusCode${work.workNum }" value="WKST03" <c:if test="${work.workStatusCode eq 'WKST03' }">checked</c:if>>
																						<label for="wtUpdate3${work.workNum }">피드백</label>
																					</div>
			
																					<div class="form_radio_btn">
																						<input id="wtUpdate4${work.workNum }" class="workStatusCode" type="radio" name="wtWorkStatusCode${work.workNum }" value="WKST04" <c:if test="${work.workStatusCode eq 'WKST04' }">checked</c:if>>
																						<label for="wtUpdate4${work.workNum }">완료</label>
																					</div>
			
																					<div class="form_radio_btn">
																						<input id="wtUpdate5${work.workNum }" class="workStatusCode" type="radio" name="wtWorkStatusCode${work.workNum }" value="WKST05" <c:if test="${work.workStatusCode eq 'WKST05' }">checked</c:if>>
																						<label for="wtUpdate5${work.workNum }">보류</label>
																					</div>
																				</div>
																			</div>
																	    </div>
																	    
																	    <div class="col-12 col-md-12 mb-3">
																	        <div class="form-group">
																	            <span class="material-symbols-rounded" style="margin-right:10px; margin-top:5px; float:left">account_circle</span>
																		            <div style="float:left; width:90%;">
																				    	<select id="wtAssignMemId${work.workNum }" name="assignMemId" multiple class="form-control" data-choices='{"silent": true,"removeItems": "true","removeItemButton": "true", "itemSelectText":""}'>
																				    		<c:forEach items="${colleagueList }" var="workAssign">
															                           			<c:set value="true" var="flag"/>
																					    		<c:forEach items="${work.colleagueVOList }" var="workColleague">
																	                           		<c:if test="${workColleague.colNum eq workAssign.colNum }">
																	                           			<option value="${workAssign.colNum }" selected>${workAssign.memNick }</option>
																	                           			<c:set value="false" var="flag"/>
																					    		    </c:if>
																                           		</c:forEach>
																                           		<c:if test="${flag }">
																	                           		<option value="${workAssign.colNum }">${workAssign.memNick }</option>
																                           		</c:if>
															                           		</c:forEach>
																				    	</select>
																		            </div>
																	        </div>
																	    </div>
																	    <br>
																	    <br>
			
																	    <div class="col-12 col-md-4 mb-3">
																	        <div class="form-group" style="margin-top:20px;">
																	            <span class="material-symbols-rounded" style="margin-right:10px; margin-top:5px; float:left;">calendar_today</span>
																	            <input class="form-control" id="wtUpdateDateS${work.workNum }" name="workStartDate" value="${work.workStartDate }" type="text" style="width:80%;">
																	        </div>
																	    </div>
																	    <div class="col-12 col-md-4 mb-3">
																	        <div class="form-group">
																	            <span class="material-symbols-rounded" style="margin-right:10px; margin-top:5px; float:left;">calendar_today</span>
																	            <input class="form-control" id="wtUpdateDateE${work.workNum }" name="workEndDate" value="${work.workEndDate }" type="text" style="width:80%;">
																	        </div>
																	    </div>
																	    
																	    <div class="col-12 col-md-4 mb-3">
																	        <div class="form-group">
																	            <span class="material-symbols-rounded" style="margin-right:10px; margin-top:10px; float:left;">Flag</span>
																	            <div style="float:left; width:80%;">
															                       <select id="wtWorkPriority${work.workNum }" class="form-control" name="workPriority"
															                           data-choices='{"searchEnabled":false, "itemSelectText":""}'>
															                           <c:forEach items="${priCode }" var="priCode">
																                           <option value="${priCode.comCode }"  <c:if test="${work.workPriority eq priCode.comCode }">selected</c:if>>${priCode.comCodeNm }</option>
															                           </c:forEach>
															                       </select>
																	            </div>
																	        </div>
																	    </div>
																	    
																	    <br>
																	    <br>
																	    
																	    <div class="col-12 col-md-6 mb-3">
																	        <div class="form-group" style="margin-top:10px;">
																	            <span class="material-symbols-rounded" style="margin-right:10px; margin-top:5px; float:left;">Monitoring</span>
																		        <div class="card" style="width:52%; float:left; margin-right:10px;">
				               													<div class="card-body" style="margin-top:-7px; margin-bottom:-7px;">
																				    <input type="range" class="form-range" min="0" max="100" step="10" style="float:left; margin-right:15px;"
																                    	id="wtWorkProgress${work.workNum}" name="workProgress" value="${work.workProgress }">
																		        </div>
																		        </div>
															                    <span id="wtProgress-value${work.workNum}">${work.workProgress }%</span>
																	        </div>
																	    </div>
																	    
																	    <div class="col-12 col-md-12 mb-3">
																	        <div class="form-group">
																	            <textarea class="form-control" id="wtWorkContent${work.workNum}" name="workContent" style="height:200px; margin-top:40px;">${work.workContent }</textarea>
																	        </div>
																	    </div>
																	    
																	    <div class="col-12 col-md-12 mb-3">
																	        <div class="form-group">
																	        
																	            <c:forEach items="${work.workFile.attatchList }" var="workFile">
																	            <div id="wtFile${workFile.attatchOrder }${workFile.attatchNum}">
															                    <c:choose>
															                    	<c:when test="${fn:substring(workFile.attatchType,0,5) == 'image'}">
															                    	<div style="float:left;">
																	                    <img src="/upload/${workFile.saveNm}" width=120px; height=120px; alt="image" style="margin-bottom:10px;"/>
																	                    <button type="button" id="wtFileBtn${workFile.attatchOrder }${workFile.attatchNum}" class="text-body lh-1" style="background-color:white; border:0px;">
																                           <span class="align-middle material-symbols-rounded">
																                             delete
																                           </span>
																                         </button>
																                         </div>
															                    	</c:when>
															                    	<c:otherwise>
																						<br><br><br><br><br><br>
															                    	<div>
															                    		<div class="p-3 border rounded-3 mb-1 d-flex align-items-center">
															                    		
															                    		<c:if test="${fn:containsIgnoreCase(workFile.attatchType, 'hwp')}">
																					        <img src="/resources/assets/img/projects/6.png" alt="" class="height-40 me-3 flex-shrink-0 w-auto">
																					       </c:if>
																					      <c:if test="${fn:containsIgnoreCase(workFile.attatchType, 'xlsx')}">
																					        <img src="/resources/assets/img/projects/4.png" alt="" class="height-40 me-3 flex-shrink-0 w-auto">
																					      </c:if>
																					      <c:if test="${fn:containsIgnoreCase(workFile.attatchType, 'zip')}">
																					        <img src="/resources/assets/img/projects/3.png" alt="" class="height-40 me-3 flex-shrink-0 w-auto">
																					      </c:if>
																					      <c:if test="${fn:containsIgnoreCase(workFile.attatchType, 'text')}">
																					        <img src="/resources/assets/img/projects/7.png" alt="" class="height-40 me-3 flex-shrink-0 w-auto">
																					      </c:if>
															                    		
<!-- 														                                  <img src="/resources/assets/media/icons/files/css.svg" class="height-40 me-3 flex-shrink-0 w-auto" alt=""> -->
														                                  <div class="flex-grow-1 overflow-hidden">
														                                    <p class="mb-1 lh-sm text-truncate">${workFile.originNm }</p>
														                                    <div class="d-flex align-items-center justify-content-between">
														                                      <small class="text-body-secondary">
														                                      <c:choose>
																	                            <c:when test="${workFile.attatchSize < 1024}">
																	                            	${workFile.attatchSize } B
																	                            </c:when>
																	                            <c:when test="${workFile.attatchSize >= 1024}">
																	                            	${String.format("%.2f", workFile.attatchSize / 1024)} KB
																	                            </c:when>
																	                            <c:when test="${workFile.attatchSize >= 1048576}">
																	                            	${String.format("%.2f", workFile.attatchSize / 1048576)} MB
																	                            </c:when>
																	                          </c:choose>
														                                      </small>
														                                      <button type="button" id="wtFileBtn${workFile.attatchOrder }${workFile.attatchNum}" class="text-body" style="background-color:white; border:0px;">
														                                        <span class="material-symbols-rounded align-middle">
														                                        delete
														                                        </span>
														                                      </button>
														                                    </div>
														                                  </div>
														                                </div>
														                                <small class="d-block text-body-secondary">${workFile.attatchDate }</small>
														                                </div>
															                    	</c:otherwise>
															                    </c:choose>
															                    </div>
															                    <script type="text/javascript">
															                    $(function(){
															                    	var fileBtn = $("#wtFileBtn${workFile.attatchOrder }${workFile.attatchNum}");
															                    	var workNum = "${work.workNum}";
															                    	var workFileOrder = "${workFile.attatchOrder}"
															                    	
															                    	fileBtn.on("click",function(){
															                    		console.log(workNum);
															                    		console.log(workFileOrder);
															                    		$.ajax({
																							type : "post",
																							url : "/coco/attatch/delete",
																							data : {
																								attatchOrder : workFileOrder,
																								attatchPlace : workNum
																							},
																							success : function(result){
																								$('#wtFile${workFile.attatchOrder }${workFile.attatchNum}').remove();
																							}
																						});
															                    	});
															                    });
															                    </script>
															                    </c:forEach>
																				
																				<div class="col-12 col-md-12 mb-3">
																			        <div class="form-group">
																			        <input class="form-control" type="file" id="wtFormFile${work.workNum }" name="postFiles" multiple="multiple">
																			        </div>
																			    </div>
																			    
																	        </div>
																	    </div>
			                                                       </div>
			                                                       
			                                                       <div class="modal-footer">
			                                                           <button type="button" class="btn btn-secondary"
			                                                               data-bs-dismiss="modal">취소</button>
			                                                           <button type="button" id="wtWorkUpdateBtn${work.workNum }" class="btn btn-primary">수정</button>
			                                                       </div>
			                                                   </div>
			                                               </div>
			                                           </div>
													
							                          <tr class="align-middle">
							                            <td>
							                              <div class="d-flex align-items-center" data-tippy-content="${work.workTitle }">
							                                 <div class="h6 mb-0 lh-1" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${work.workTitle }</div>
							                              </div>
							                            </td>
						                             	<c:forEach items="${statCode }" var="statCode">
						                             		<c:if test="${work.workStatusCode eq statCode.comCode }">
<%-- 						                             		<c:choose> --%>
<%-- 						                             		<c:when test="${statCode.comCode eq 'WKST01' }"> --%>
<%-- 								                            	<td style="background:#00B2FF; border-radius: 10px; color:#ffffff; text-align:center;"><span class="d-inline-block align-middle">${statCode.comCodeNm }</span></td> --%>
<%-- 						                             		</c:when> --%>
<%-- 						                             		<c:when test="${statCode.comCode eq 'WKST02' }"> --%>
<%-- 								                            	<td style="background:#00B01C; border-radius: 10px; color:#ffffff; text-align:center;"><span class="d-inline-block align-middle">${statCode.comCodeNm }</span></td> --%>
<%-- 						                             		</c:when> --%>
<%-- 						                             		<c:when test="${statCode.comCode eq 'WKST03' }"> --%>
<%-- 								                            	<td style="background:#FD7900; border-radius: 10px; color:#ffffff; text-align:center;"><span class="d-inline-block align-middle">${statCode.comCodeNm }</span></td> --%>
<%-- 						                             		</c:when> --%>
<%-- 						                             		<c:when test="${statCode.comCode eq 'WKST04' }"> --%>
<%-- 								                            	<td style="background:#402A9D; border-radius: 10px; color:#ffffff; text-align:center;"><span class="d-inline-block align-middle">${statCode.comCodeNm }</span></td> --%>
<%-- 						                             		</c:when> --%>
<%-- 						                             		<c:when test="${statCode.comCode eq 'WKST05' }"> --%>
<%-- 								                            	<td style="background:#777777; border-radius: 10px; color:#ffffff; text-align:center;"><span class="d-inline-block align-middle">${statCode.comCodeNm }</span></td> --%>
<%-- 						                             		</c:when> --%>
<%-- 						                             		</c:choose> --%>
							                            	<td style="text-align:center;"><span class="d-inline-block align-middle">${statCode.comCodeNm }</span></td>
							                            	</c:if>
						                                </c:forEach>
						                             	<c:forEach items="${priCode }" var="priCode">
						                             		<c:if test="${work.workPriority eq priCode.comCode }">
							                            	<td><span class="d-inline-block align-middle">${priCode.comCodeNm }</span></td>
							                            	</c:if>
						                                </c:forEach>
							                            <td>
							                            <c:choose>
							                            <c:when test="${fn:contains(work.assignMemId, ',')}">
							                            	<c:set var="assignMemIds" value="${fn:split(work.assignMemId, ',')}" />
							                            	<c:set var="assignMemIdsSize" value="${fn:length(assignMemIds)}" />
							                            	${assignMemIds[0]} 외 ${assignMemIdsSize-1 }명
							                            </c:when>
							                            <c:otherwise>
								                            ${work.assignMemId}
							                            </c:otherwise>
							                            </c:choose>
							                            </td>
							                            <td>${work.workStartDate }</td>
							                            <td>${work.workEndDate }</td>
							                            <td>
							                            <fmt:parseDate value="${work.workCreateDate }" var="workCreateDate" pattern="yyyy-MM-dd HH:mm:ss" />
														<fmt:formatDate value="${workCreateDate}" pattern="yyyy-MM-dd" />
							                            </td>
							                            <td>
		                                                <div class="d-flex justify-content-end align-items-center">
		                                                    <button type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasScrolling${work.workNum }" aria-controls="offcanvasScrolling"
		                                                    style="background-color:white; border:0px;">
		                                                        <span class="material-symbols-rounded align-middle fs-5 text-body">visibility</span>
		                                                    </button>
		                                                    
<!-- 		                                                    <span class="border-start mx-2 d-block height-20"></span> -->
<!-- 		                                                    <a href="#!" data-tippy-content="Edit"> -->
<!-- 		                                                        <span class="material-symbols-rounded align-middle fs-5 text-body">edit</span> -->
<!-- 		                                                    </a> -->
<!-- 		                                                     <span class="border-start mx-2 d-block height-20"></span> -->
<!-- 		                                                    <a href="#!" data-tippy-content="Delete"> -->
<!-- 		                                                        <span class="material-symbols-rounded align-middle fs-5 text-body">delete</span> -->
<!-- 		                                                    </a> -->
		                                                </div>
		                                           		</td>
							                          </tr>
							                          
						                          	<div class="offcanvas offcanvas-end" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" id="offcanvasScrolling${work.workNum }" aria-labelledby="offcanvasScrollingLabel"
		                                            style="background-color:white; width:45%;">
		                                              <div class="offcanvas-header">
		                                                <h5 class="offcanvas-title" id="offcanvasScrollingLabel">${project.pjName }</h5>
		                                                <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
		                                              </div>
		                                              
		                                              <!-- 사이드캔버스 바디 -->
		                                              <div class="offcanvas-body">
		                                              <c:forEach items="${colleagueList }" var="coll" >
                                            		  	<c:if test="${coll.memId == work.workReq }">
		                                              	
		                                              	<div class="d-flex justify-content-start align-items-center mb-3">
                                                        <span
                                                            class="avatar flex-shrink-0 rounded-circle d-inline-block">
                                                            <img src="${coll.memProfile }" alt="avatar"
                                                                class="img-fluid rounded-circle">
                                                        
                                                        </span>
                                                        <div class="ps-3" style="margin-right: auto;">
                                                            <h6 class="mb-0">${coll.memNick }</h6>
                                                            <small class="text-body-subtle">${work.workCreateDate }</small>
                                                        </div>
                                                        
												         <div class="dropdown" class="ps-3" style="float:left;">
												           <a href="#" class="btn p-0 text-body border-0 shadow-none size-35 d-flex align-items-center justify-content-center rounded-pill" role="button" data-bs-toggle="dropdown"
												             aria-haspopup="true" aria-expanded="false">
												             <span class="material-symbols-rounded align-middle">
												               more_vert
												               </span>
												           </a>
												           <div class="dropdown-menu mt-1 dropdown-menu-end">
												             <button type="button" class="dropdown-item" data-bs-toggle="modal"
                                                				data-bs-target="#wtUpdateWorkModal${work.workNum }">업무 수정
												             </button>
												             
	                                                        <c:choose>
	                                                        <c:when test="${loginId == work.workReq }">
												             	<form action="/coco/work/delete" method="post">
																	<input type="hidden" name="pjId" value="${project.pjId}">
																	<input type="hidden" name="workNum" value="${work.workNum}">
												             		<button type="submit" class="dropdown-item" 
												             		onclick="return confirm('삭제하시겠습니까?')">업무 삭제</button>
																</form>
	                                                        </c:when>
	                                                        <c:when test="${loginId == project.pjAdminId }">
												             	<form action="/coco/work/delete" method="post">
																	<input type="hidden" name="pjId" value="${project.pjId}">
																	<input type="hidden" name="workNum" value="${work.workNum}">
												             		<button type="submit" class="dropdown-item" 
												             		onclick="return confirm('삭제하시겠습니까?')">업무 삭제</button>
																</form>
	                                                        </c:when>
	                                                        </c:choose>
												             
												           </div>
												         </div>
                                                   		 </div>
                                                   		 
                                                   		 <br>
	                                                    <p>${work.workTitle }</p>
	                                                    <hr style="border: 1px solid gray">

	                                                    <div class="col-12 col-md-12 mb-3">
													        <div class="form-group">
																<div class="form_toggle row-vh d-flex flex-row justify-content-between" >
													        	<span class="material-symbols-rounded" style="margin-right: 10px; margin-top:10px;">update</span>
																	<div class="form_radio_btn radio">
																		<input id="wtRadio1${work.workNum }" class="" type="radio" name="wtWorkStatusCode${work.workNum }r" value="WKST01" <c:if test="${work.workStatusCode eq 'WKST01' }">checked</c:if>>
																		<label for="wtRadio1${work.workNum }">요청</label>
																	</div>
																								 
																	<div class="form_radio_btn">
																		<input id="wtRadio2${work.workNum }" class="" type="radio" name="wtWorkStatusCode${work.workNum }r" value="WKST02" <c:if test="${work.workStatusCode eq 'WKST02' }">checked</c:if>>
																		<label for="wtRadio2${work.workNum }">진행</label>
																	</div>
		
																	<div class="form_radio_btn">
																		<input id="wtRadio3${work.workNum }" class="" type="radio" name="wtWorkStatusCode${work.workNum }r" value="WKST03" <c:if test="${work.workStatusCode eq 'WKST03' }">checked</c:if>>
																		<label for="wtRadio3${work.workNum }">피드백</label>
																	</div>
		
																	<div class="form_radio_btn">
																		<input id="wtRadio4${work.workNum }" class="" type="radio" name="wtWorkStatusCode${work.workNum }r" value="WKST04" <c:if test="${work.workStatusCode eq 'WKST04' }">checked</c:if>>
																		<label for="wtRadio4${work.workNum }">완료</label>
																	</div>
		
																	<div class="form_radio_btn">
																		<input id="wtRadio5${work.workNum }" class="" type="radio" name="wtWorkStatusCode${work.workNum }r" value="WKST05" <c:if test="${work.workStatusCode eq 'WKST05' }">checked</c:if>>
																		<label for="wtRadio5${work.workNum }">보류</label>
																	</div>
																</div>
															</div>
													    </div>
													    
													    <div class="col-12 col-md-12 mb-3">
												        <div class="form-group">
												            <span class="material-symbols-rounded" style="margin-right:10px; margin-top:10px; float:left">account_circle</span>
												            <div style="float:left; width:90%;">
														    	<input type="text" class="form-control" value="${work.assignMemId }" data-choices='{"silent": true,"removeItems": "true","removeItemButton": "", "itemSelectText":"", "readonly":"true"}'>
												            </div>
												        </div>
												    </div>
												    <br>
												    <br>
												    <br>
												    
												    <div class="col-12 col-md-4 mb-3">
												        <div class="form-group">
												            <span class="material-symbols-rounded" style="margin-right:10px; margin-top:5px; float:left;">calendar_today</span>
												            <input class="form-control" id="wtWorkDateS${work.workNum }" name="workStartDate" value="${work.workStartDate }" type="text" style="width:80%;" readonly="readonly">
												        </div>
												    </div>
												    <div class="col-12 col-md-4 mb-3">
												        <div class="form-group">
												            <span class="material-symbols-rounded" style="margin-right:10px; margin-top:5px; float:left;">calendar_today</span>
												            <input class="form-control" id="wtWorkDateE${work.workNum }" name="workEndDate" value="${work.workEndDate }" type="text" style="width:80%;" readonly="readonly">
												        </div>
												    </div>
												    
												    <div class="col-12 col-md-4 mb-3">
												        <div class="form-group">
												            <span class="material-symbols-rounded" style="margin-right:10px; margin-top:10px; float:left;">Flag</span>
												            <div style="float:left; width:80%;">
												            	<select id="wtWorkPriority" class="form-control" name="workPriority"
						                                            data-choices='{"searchEnabled":false, "itemSelectText":"" }'>
						                                            <c:forEach items="${priCode }" var="priCode">
											                           <option value="${priCode.comCode }" disabled="disabled" <c:if test="${work.workPriority eq priCode.comCode }">selected</c:if>>${priCode.comCodeNm }</option>
										                           </c:forEach>
						                                        </select>
												            </div>
												        </div>
												    </div>
												    <br>
												    <br>
												    <br>
												    
												    <div class="col-12 col-md-6 mb-3">
												        <div class="form-group">
												            <span class="material-symbols-rounded" style="margin-right:10px; float:left;">Monitoring</span>
																 <div class="progress mb-3" style="height: 20px; width:55%; float:left">
											                     <div class="progress-bar" role="progressbar"
											                      aria-valuemin="0" aria-valuemax="100" style="width: ${work.workProgress }%"></div>
											                   	 </div>
											                      <div style="float:left; margin-left:10px;">${work.workProgress }%</div>
												        </div>
												    </div>
												    <br>
												    <br>
												    
												    <p>${work.workContent }</p>
								                    <c:forEach items="${work.workFile.attatchList }" var="workFile">
								                    <c:choose>
								                    	<c:when test="${fn:substring(workFile.attatchType,0,5) == 'image'}">
										                    <img src="/upload/${workFile.saveNm}" width=120px; height=120px; alt="image" style="margin-bottom:10px;"/>
								                    	</c:when>
								                    	<c:otherwise>
								                    		<div class="p-3 border rounded-3 mb-1 d-flex align-items-center">
								                    		
								                    		<c:if test="${fn:containsIgnoreCase(workFile.attatchType, 'hwp')}">
												        <img src="/resources/assets/img/projects/6.png" alt="" class="height-40 me-3 flex-shrink-0 w-auto">
												       </c:if>
												      <c:if test="${fn:containsIgnoreCase(workFile.attatchType, 'xlsx')}">
												        <img src="/resources/assets/img/projects/4.png" alt="" class="height-40 me-3 flex-shrink-0 w-auto">
												      </c:if>
												      <c:if test="${fn:containsIgnoreCase(workFile.attatchType, 'zip')}">
												        <img src="/resources/assets/img/projects/3.png" alt="" class="height-40 me-3 flex-shrink-0 w-auto">
												      </c:if>
												      <c:if test="${fn:containsIgnoreCase(workFile.attatchType, 'text')}">
												        <img src="/resources/assets/img/projects/7.png" alt="" class="height-40 me-3 flex-shrink-0 w-auto">
												      </c:if>
								                    		
<!-- 							                                  <img src="/resources/assets/media/icons/files/css.svg" class="height-40 me-3 flex-shrink-0 w-auto" alt=""> -->
							                                  <div class="flex-grow-1 overflow-hidden">
							                                    <p class="mb-1 lh-sm text-truncate">${workFile.originNm }</p>
							                                    <div class="d-flex align-items-center justify-content-between">
							                                      <small class="text-body-secondary">
							                                      <c:choose>
										                            <c:when test="${workFile.attatchSize < 1024}">
										                            	${workFile.attatchSize } B
										                            </c:when>
										                            <c:when test="${workFile.attatchSize >= 1024}">
										                            	${String.format("%.2f", workFile.attatchSize / 1024)} KB
										                            </c:when>
										                            <c:when test="${workFile.attatchSize >= 1048576}">
										                            	${String.format("%.2f", workFile.attatchSize / 1048576)} MB
										                            </c:when>
										                          </c:choose>
							                                      </small>
							                                      <a href="#!" class="text-body"
							                                      href="/upload/${workFile.saveNm}"
																	download="/upload/${workFile.originNm}">
							                                        <span class="material-symbols-rounded align-middle">
							                                          download
							                                        </span>
							                                      </a>
							                                    </div>
							                                  </div>
							                                </div>
							                                <small class="d-block text-body-secondary">${workFile.attatchDate }</small>
								                    	</c:otherwise>
								                    </c:choose>
								                    </c:forEach>
								                    
								                    <div class="d-flex pb-3 mb-3 border-bottom align-items-center small">
	                                                    <span class="fs-5 align-middle me-2 material-symbols-rounded d-flex align-items-center ms-auto">
	                                                        comment</span>
	                                                    <span>${work.issueList.size()}</span>
                                                 	</div>
                                                
                                                	<!--Comments list-->
                                                    <ul class="list-group" id="wtComment-list${work.workNum }">
			                                            <c:forEach items="${work.issueList }" var="issue">
                                                        <c:forEach items="${colleagueList }" var="collIssue">
                                                        <c:if test="${issue.issueReq == collIssue.memId }">
                                                        <li class="list-group-item" id="wtIssueSelectDel${issue.issueNum }">
                                                            <div class="d-flex align-items-stretch" style="float:left;">
                                                                <a href="#!" class="flex-shrink-0 d-block me-2">
                                                                    <img src="${collIssue.memProfile }"
                                                                        class="avatar sm rounded-circle" alt="">
                                                                </a>
                                                                <!--Coomments and replies-->
                                                                <div>
                                                                    <div class="py-2 mb-1 px-3 rounded-3">
                                                                        <div class="d-flex">
                                                                            <h6 class="mb-0">${collIssue.memNick }</h6>
                                                                            <small class="text-body-secondary" style="margin-left:10px;">${issue.issueDate }</small>
                                                                        </div>
                                                                        <p class="mb-0">${issue.issueContent }</p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div>
																<c:choose>
																<c:when test="${loginId == issue.issueReq }">
	                                                             		<button type="button" id="wtIssueDel${issue.issueNum }" class="badge bg-danger-subtle text-danger" style="float: right; border:0px;">삭제</button>
																</c:when>
																<c:when test="${loginId == project.pjAdminId }">
	                                                             		<button type="button" id="wtIssueDel${issue.issueNum }" class="badge bg-danger-subtle text-danger" style="float: right; border:0px;">삭제</button>
																</c:when>
																<c:otherwise></c:otherwise>
																</c:choose>
                                                            </div>
                                                        </li>
                                                        <input type="hidden" id="wtIssueNum${issue.issueNum }" name="issueNum" value="${issue.issueNum }" >

                                                        <script type="text/javascript">
                                                        	$(function(){
		                                                        var issueDel = $("#wtIssueDel${issue.issueNum }");
		    													var issueNum = document.getElementById('wtIssueNum${issue.issueNum }');
		    													
		    													issueDel.on("click",function(){
		    														if(confirm("정말로 삭제하시겠습니까?")){
			    														console.log(issueNum.value);
			    														$.ajax({
			    															type : "post",
			    															url : "/coco/issue/delete",
			    															data : {
			    																issueNum : issueNum.value
			    															},
			    															success : function(result){
			    																$('#issueSelectDel${issue.issueNum }').remove();
			    																$('#wtIssueSelectDel${issue.issueNum }').remove();
			    															}
			    														});
	                                                        		}
		    													});
		    													
                                                        	});
														</script>

														</c:if>
														<!-- issueList 안에 collList 끝 -->
                                                        </c:forEach>
                                                        
                                                        <!-- issueList끝 -->
                                                        </c:forEach>
                                                        </ul>
                                                        
                                                        <ul class="list-group">
                                                        <li class="list-group-item bg-body">
                                                            <!--Add comment-->
                                                            <h6>Comment</h6>
                                                                <textarea id="wtIssueContent${work.workNum }" name="issueContent" rows="2"
                                                                    class="form-control mb-2"></textarea>
                                                                <div class="text-end">
                                                                    <button type="button" class="btn btn-primary btn-sm" id="wtIssueBtn${work.workNum }">
                                                                        작성</button>
                                                                </div>
                                                        </li>
                                                    </ul>
												
													<c:forEach items="${colleagueList }" var="collIssue">
													<c:if test="${loginId == collIssue.memId }">
														<input type="hidden" id="wtMemProfile${coll.colNum }" name="" value="${collIssue.memProfile }" >
														<input type="hidden" id="wtMemName${coll.colNum }" name="" value="${collIssue.memNick }" >
													</c:if>
													</c:forEach>
                                                	
                                                	<input type="hidden" id="wtWorkNum${work.workNum }" name="workNum" value="${work.workNum }" >
		                                            <!--/.Post card end-->
		                                            <script type="text/javascript">
														$(function(){
															var issueBtn = $("#wtIssueBtn${work.workNum }");
															var issueContent = document.getElementById('wtIssueContent${work.workNum }');
															var workNum = document.getElementById('wtWorkNum${work.workNum }');
															var memProfile = $("#wtMemProfile${coll.colNum }")
															var memName = $("#wtMemName${coll.colNum }")
															
															
															issueBtn.on("click", function(){
																console.log(issueContent.value);
																console.log(workNum.value);
																console.log(memProfile.val());
																console.log(memName.val());
																$.ajax({
																	type : "post",
																	url : "/coco/issue/register",
																	data : {
																		issueContent : issueContent.value,
																		workNum : workNum.value
																	},
																	success : function(result){
																		var insertIssueNum = result.issueNum;
																		var newItem = '<li class="insertIssueSelectDel'+ insertIssueNum +' list-group-item" id="wtInsertIssueSelectDel'+ insertIssueNum +'">';
																		newItem += '<div class="d-flex align-items-stretch" style="float:left;">';
																		newItem += '<div class="d-flex align-items-stretch">';
																		newItem += '<a href="#!" class="flex-shrink-0 d-block me-2">'; 
																		newItem += '<img src="'+memProfile.val()+'" class="avatar sm rounded-circle" alt="">';  
															            newItem += '</a>';
															            newItem += '<div>';
															            newItem += '<div class="py-2 mb-1 px-3 rounded-3">';
															            newItem += '<div class="d-flex">';
															            newItem += '<h6 class="mb-0">'+ memName.val() +'</h6>';
															            newItem += '<small class="text-body-secondary" style="margin-left:10px;">'+result.issueDate +'</small>';
															            newItem += '</div>';
															            newItem += '<p class="mb-0">' + issueContent.value + '</p>';
															            newItem += '</div>';
															            newItem += '</div>';
															            newItem += '</div>';
															            newItem += '</div>';
															            newItem += '<button type="button" id="wtIssueDel' + result.issueNum + '" class="issueDel' + result.issueNum + ' badge bg-danger-subtle text-danger" style="float: right; border:0px;">삭제</button>';
															            newItem += '</div>';
															            newItem += '</li>';
															            
															            $('#comment-list${work.workNum }').append(newItem);
															            $('#wtComment-list${work.workNum }').append(newItem);
															            
															            issueContent.value = '';
															            
// 															            var insertIssueDelBtn = $("#wtIssueDel" + result.issueNum);
															            var wtInsertIssueDelBtn = $(".issueDel" + result.issueNum);
															            
															            wtInsertIssueDelBtn.on("click",function(){
																			if(confirm("정말로 삭제하시겠습니까?")){
					    														$.ajax({
					    															type : "post",
					    															url : "/coco/issue/delete",
					    															data : {
					    																issueNum : insertIssueNum
					    															},
					    															success : function(result){
					    																$('.insertIssueSelectDel'+insertIssueNum).remove();
					    																$('.wtInsertIssueSelectDel'+insertIssueNum).remove();
					    															}
					    														});
					                                                		}
																		});
															            
																	}
																});
															});
															
														});
													</script>                                                	
                                                
                                                	</c:if>
                                                	</c:forEach>   		 
		                                            </div>
                                                   	<!-- 사이드캔버스 바디  end-->
                                                   		 
		                                            </div>
					                          			
					                          </c:forEach>
					                          </c:otherwise>
					                          </c:choose>
					                        </tbody>
					                      </table>
				                      </form> 
				                      <!-- 민수확인3 엑셀다운로드용 form -->
					                      <script type="text/javascript">
					                      // 민수스크립트여기
													
											//민수확인6
											$(document).ready(function() {
												const excelForm = $("#excelForm");
												const excelDownBtn = $("#excelDownBtn");
												const hiddenExcelDownBtn = $("#hiddenExcelDownBtn");
												
												excelDownBtn.on("click", function() {
													console.log("엑셀 버튼 작동 확인");
// 													hiddenExcelDownBtn.click();
													excelForm.submit();
												});
											});
														
					                      function sortTable(col) {
											  var table, rows, switching, i, x, y, shouldSwitch;
											  table = document.getElementById("wtTable");
											  switching = true;
											  while (switching) {
											    switching = false;
											    rows = table.getElementsByTagName("tr");
											    for (i = 1; i < (rows.length - 1); i++) {
											      shouldSwitch = false;
											      x = rows[i].getElementsByTagName("td")[col];
											      y = rows[i + 1].getElementsByTagName("td")[col];
											      if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
											        shouldSwitch = true;
											        break;
											      }
											    }
											    if (shouldSwitch) {
											      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
											      switching = true;
											    }
											  }
											}
					                      </script>
					                      
					                    </div>
					                  </div>
					                </div>
					        	</div>
							</div>
                            </div>

                            <div class="tab-pane fade <c:if test="${active eq '3' }">show active</c:if>" id="chart" role="tabpanel" aria-labelledby="chart-tab">
                            <div  id="chart">
                            <script>
	                            function init() {
	                            	var pjId = "${project.pjId}";
	                            	$.ajax({
	                            		type : "post",
	                            		url : "/coco/gantt/list",
	                            		data : {pjId : pjId},
	                            		dataType : "json",
	                            		success : function(resp){
	                            			var datas = resp
	                            			console.log(datas);
	                            			var ganttConfig = {
	                            		    		data: datas
	                            		    };
	                            			gantt.config.date_format = "%Y-%m-%d %H:%i:%s";
	                            			gantt.init("gantt_container");
	                            		    gantt.parse(ganttConfig);
	                            			
	                            		}
	                            	})
	                            }
							</script>
                            	<div id="gantt_container" style="width:100%;height:600px;"></div>
                            </div>
                            </div>
                            
                            <div class="tab-pane fade <c:if test="${active eq '4' }">show active</c:if>" id="board" role="tabpanel" aria-labelledby="board-tab">
                            <div  id="board">
                            <!--//Page content//-->
		                    <div class="content d-flex flex-column-fluid py-3 px-3 px-lg-6">
		
		                       <div class="container-fluid px-0">
		                            <!--Kanban board begin-->
		                        <div class="board row mb-3 mb-lg-5">
		                            <!--Kanban task column-->
		                            <div class="tasks mb-7 mb-md-0 col-md-2" data-dragula="tasks"
		                                data-containers='["WKST01", "WKST02", "WKST03", "WKST04", "WKST05"]'>
		                                <div>
<!-- 		                                    <h6 class="mb-4 text-info">요청</h6> -->
		                                    <h6 class="mb-4 text-body-secondary" style="text-align:center;">요청</h6>
		                                </div>
		
		                                <!--Task request-->
		                                <div id="WKST01" class="task-list-items">
		
		                                    <!-- Task card begins-->
		                                    <c:choose>
												<c:when test="${empty workList }">
														등록된 업무가 존재하지 않습니다.
												</c:when>
												<c:otherwise>
													<c:forEach items="${workList }" var="work">
													<c:if test="${work.workStatusCode eq 'WKST01' }">
													<c:set var="btAssign" value="${work.assignMemId}"/>
				                                    <c:set var="btAssignList" value="${fn:split(btAssign, ',')}" />
													 
				                                    <div class="card card-body shadow-none border-0 mt-3 mt-lg-5 hover-lift transition-base" style="background:${work.workColor };">
				                                        <div class="d-flex align-items-center justify-content-between">
				                                            <div>
				                                            	<input type="hidden" id="workNum${work.workNum }" value="${work.workNum }">
				                                                <!--Task date-->
				                                                <span class="d-flex align-items-center mb-2 small text-body-secondary"><span class="align-middle me-2 material-symbols-rounded fs-5">
																today</span>
																<fmt:parseDate value="${work.workCreateDate }" var="workCreateDate" pattern="yyyy-MM-dd HH:mm:ss" />
																<fmt:formatDate value="${workCreateDate}" pattern="yyyy-MM-dd" />
																</span>
				                                                <!--Task Heading-->
				                                                <h6 class="mb-4 fs-5 fw-medium"><a href="#" class="text-reset">${work.workTitle }</a></h6>
				
				                                                <!--Task assignees-->
				                                                <div>
				                                                <div class="avatar-group justify-content-end">
				                                                <c:choose>
				                                                <c:when test="${fn:length(btAssignList) <= 3 }">
				                                                	<c:forEach items="${colleagueList }" var="btCollList">
				                                                	<c:forEach items="${btAssignList }" var="btAssign" varStatus="stat">
				                                                		<c:if test="${btCollList.memNick == stat.current }">
					                                                        <a href="#!.html"
					                                                            class="avatar-group-item avatar xs rounded-circle"
					                                                            data-tippy-placement="top"
					                                                            data-tippy-content="${btCollList.memNick }">
					                                                            <img src="${btCollList.memProfile }" alt="..."
					                                                                class="avatar-group-img rounded-circle">
					                                                        </a>
					                                                    </c:if>
				                                                	</c:forEach>
				                                                	</c:forEach>
				                                                </c:when>
				                                                <c:otherwise>
				                                                	<c:forEach items="${colleagueList }" var="btCollList">
				                                                	<c:forEach items="${btAssignList }" var="btAssign" end="2" varStatus="stat">
				                                                		<c:if test="${btCollList.memNick == stat.current }">
						                                                	<c:choose>
						                                                	<c:when test="${stat.index == 1 }">
							                                                	<a href="#!.html"
						                                                            class="avatar-group-item text-body-secondary bg-body d-inline-flex align-items-center justify-content-center avatar xs rounded-circle"
						                                                            data-tippy-placement="top"
						                                                            data-tippy-content="${fn:length(btAssignList)-2 } more members">
						                                                            <b class="small">+${fn:length(btAssignList)-2 }</b>
						                                                        </a>
						                                                	</c:when>
						                                                	<c:otherwise>
						                                                		<a href="#!.html"
						                                                            class="avatar-group-item avatar xs rounded-circle"
						                                                            data-tippy-placement="top"
						                                                            data-tippy-content="${btCollList.memNick }">
						                                                            <img src="${btCollList.memProfile }" alt="..."
						                                                                class="avatar-group-img rounded-circle">
						                                                        </a>
						                                                	</c:otherwise>
						                                                	</c:choose>
			                                                        	</c:if>
			                                                        </c:forEach>
			                                                        </c:forEach>
				                                                </c:otherwise>
				                                                </c:choose>
				                                                </div>
				                                                </div>
				                                                
				                                            </div>
				                                        </div>
				                                    </div>
		                                    
		                                    </c:if>
		                                    </c:forEach>
		                                    </c:otherwise>
		                                    </c:choose>
		                                    <!--/. Task card ends-->
		
		                                    <!--Create task button-->
<!-- 		                                    <div class="d-grid pt-4"> -->
<!-- 		                                        <a href="#!" class="btn btn-outline-primary"> -->
<!-- 		                                            <span class="align-middle me-2 material-symbols-rounded">add</span> Create new task</a> -->
<!-- 		                                    </div> -->
		
		                                </div>
		                            </div>
		                            <!--Kanban task column-->
		                            <div class="tasks mb-7 mb-md-0 col-md-2">
		                                <div>
<!-- 		                                    <h6 class="mb-4 text-success">진행</h6> -->
		                                    <h6 class="mb-4 text-body-secondary" style="text-align:center;">진행</h6>
		                                </div>
		
		                                <!--Task progress-->
		                                <div id="WKST02" class="task-list-items">
		
		                                    <!-- Task card begins-->
		                                    <c:choose>
												<c:when test="${empty workList }">
														등록된 업무가 존재하지 않습니다.
												</c:when>
												<c:otherwise>
													<c:forEach items="${workList }" var="work">
													<c:if test="${work.workStatusCode eq 'WKST02' }">
													<c:set var="btAssign" value="${work.assignMemId}"/>
				                                    <c:set var="btAssignList" value="${fn:split(btAssign, ',')}" />
													 
				                                    <div class="card card-body shadow-none border-0 mt-3 mt-lg-5 hover-lift transition-base" style="background:${work.workColor };">
				                                        <div class="d-flex align-items-center justify-content-between">
				                                            <div>
				                                                <!--Task date-->
				                                                <input type="hidden" id="workNum${work.workNum }" value="${work.workNum }">
				                                                <span class="d-flex align-items-center mb-2 small text-body-secondary"><span class="align-middle me-2 material-symbols-rounded fs-5">
																today</span>
																<fmt:parseDate value="${work.workCreateDate }" var="workCreateDate" pattern="yyyy-MM-dd HH:mm:ss" />
																<fmt:formatDate value="${workCreateDate}" pattern="yyyy-MM-dd" />
																</span>
				                                                <!--Task Heading-->
				                                                <h6 class="mb-4 fs-5 fw-medium"><a href="#" class="text-reset">${work.workTitle }</a></h6>
				
				                                                <!--Task assignees-->
				                                                <div>
				                                                <div class="avatar-group justify-content-end">
				                                                <c:choose>
				                                                <c:when test="${fn:length(btAssignList) <= 3 }">
				                                                	<c:forEach items="${colleagueList }" var="btCollList">
				                                                	<c:forEach items="${btAssignList }" var="btAssign" varStatus="stat">
				                                                		<c:if test="${btCollList.memNick == stat.current }">
					                                                        <a href="#!.html"
					                                                            class="avatar-group-item avatar xs rounded-circle"
					                                                            data-tippy-placement="top"
					                                                            data-tippy-content="${btCollList.memNick }">
					                                                            <img src="${btCollList.memProfile }" alt="..."
					                                                                class="avatar-group-img rounded-circle">
					                                                        </a>
					                                                    </c:if>
				                                                	</c:forEach>
				                                                	</c:forEach>
				                                                </c:when>
				                                                <c:otherwise>
				                                                	<c:forEach items="${colleagueList }" var="btCollList">
				                                                	<c:forEach items="${btAssignList }" var="btAssign" end="2" varStatus="stat">
				                                                		<c:if test="${btCollList.memNick == stat.current }">
						                                                	<c:choose>
						                                                	<c:when test="${stat.index == 1 }">
							                                                	<a href="#!.html"
						                                                            class="avatar-group-item text-body-secondary bg-body d-inline-flex align-items-center justify-content-center avatar xs rounded-circle"
						                                                            data-tippy-placement="top"
						                                                            data-tippy-content="${fn:length(btAssignList)-2 } more members">
						                                                            <b class="small">+${fn:length(btAssignList)-2 }</b>
						                                                        </a>
						                                                	</c:when>
						                                                	<c:otherwise>
						                                                		<a href="#!.html"
						                                                            class="avatar-group-item avatar xs rounded-circle"
						                                                            data-tippy-placement="top"
						                                                            data-tippy-content="${btCollList.memNick }">
						                                                            <img src="${btCollList.memProfile }" alt="..."
						                                                                class="avatar-group-img rounded-circle">
						                                                        </a>
						                                                	</c:otherwise>
						                                                	</c:choose>
			                                                        	</c:if>
			                                                        </c:forEach>
			                                                        </c:forEach>
				                                                </c:otherwise>
				                                                </c:choose>
				                                                </div>
				                                                </div>
				                                                
				                                            </div>
				                                        </div>
				                                    </div>
		                                    
		                                    </c:if>
		                                    </c:forEach>
		                                    </c:otherwise>
		                                    </c:choose>
		                                    <!--/. Task card ends-->
		                                </div>
		                            </div>
		                            <!--Kanban task column-->
		                            <div class="tasks mb-7 mb-md-0 col-md-2">
		                                <div>
<!-- 		                                    <h6 class="mb-4 text-warning">피드백</h6> -->
		                                    <h6 class="mb-4 text-body-secondary" style="text-align:center;">피드백</h6>
		                                </div>
		
		                                <!--Task feedback-->
		                                <div id="WKST03" class="task-list-items">
		
		                                    <!-- Task card begins-->
		                                    <c:choose>
												<c:when test="${empty workList }">
														등록된 업무가 존재하지 않습니다.
												</c:when>
												<c:otherwise>
													<c:forEach items="${workList }" var="work">
													<c:if test="${work.workStatusCode eq 'WKST03' }">
													<c:set var="btAssign" value="${work.assignMemId}"/>
				                                    <c:set var="btAssignList" value="${fn:split(btAssign, ',')}" />
													 
				                                    <div class="card card-body shadow-none border-0 mt-3 mt-lg-5 hover-lift transition-base" style="background:${work.workColor };">
				                                        <div class="d-flex align-items-center justify-content-between">
				                                            <div>
				                                                <!--Task date-->
				                                                <input type="hidden" id="workNum${work.workNum }" value="${work.workNum }">
				                                                <span class="d-flex align-items-center mb-2 small text-body-secondary"><span class="align-middle me-2 material-symbols-rounded fs-5">
																today</span>
																<fmt:parseDate value="${work.workCreateDate }" var="workCreateDate" pattern="yyyy-MM-dd HH:mm:ss" />
																<fmt:formatDate value="${workCreateDate}" pattern="yyyy-MM-dd" />
																</span>
				                                                <!--Task Heading-->
				                                                <h6 class="mb-4 fs-5 fw-medium"><a href="#" class="text-reset">${work.workTitle }</a></h6>
				
				                                                <!--Task assignees-->
				                                                <div>
				                                                <div class="avatar-group justify-content-end">
				                                                <c:choose>
				                                                <c:when test="${fn:length(btAssignList) <= 3 }">
				                                                	<c:forEach items="${colleagueList }" var="btCollList">
				                                                	<c:forEach items="${btAssignList }" var="btAssign" varStatus="stat">
				                                                		<c:if test="${btCollList.memNick == stat.current }">
					                                                        <a href="#!.html"
					                                                            class="avatar-group-item avatar xs rounded-circle"
					                                                            data-tippy-placement="top"
					                                                            data-tippy-content="${btCollList.memNick }">
					                                                            <img src="${btCollList.memProfile }" alt="..."
					                                                                class="avatar-group-img rounded-circle">
					                                                        </a>
					                                                    </c:if>
				                                                	</c:forEach>
				                                                	</c:forEach>
				                                                </c:when>
				                                                <c:otherwise>
				                                                	<c:forEach items="${colleagueList }" var="btCollList">
				                                                	<c:forEach items="${btAssignList }" var="btAssign" end="2" varStatus="stat">
				                                                		<c:if test="${btCollList.memNick == stat.current }">
						                                                	<c:choose>
						                                                	<c:when test="${stat.index == 1 }">
							                                                	<a href="#!.html"
						                                                            class="avatar-group-item text-body-secondary bg-body d-inline-flex align-items-center justify-content-center avatar xs rounded-circle"
						                                                            data-tippy-placement="top"
						                                                            data-tippy-content="${fn:length(btAssignList)-2 } more members">
						                                                            <b class="small">+${fn:length(btAssignList)-2 }</b>
						                                                        </a>
						                                                	</c:when>
						                                                	<c:otherwise>
						                                                		<a href="#!.html"
						                                                            class="avatar-group-item avatar xs rounded-circle"
						                                                            data-tippy-placement="top"
						                                                            data-tippy-content="${btCollList.memNick }">
						                                                            <img src="${btCollList.memProfile }" alt="..."
						                                                                class="avatar-group-img rounded-circle">
						                                                        </a>
						                                                	</c:otherwise>
						                                                	</c:choose>
			                                                        	</c:if>
			                                                        </c:forEach>
			                                                        </c:forEach>
				                                                </c:otherwise>
				                                                </c:choose>
				                                                </div>
				                                                </div>
				                                                
				                                            </div>
				                                        </div>
				                                    </div>
		                                    
		                                    </c:if>
		                                    </c:forEach>
		                                    </c:otherwise>
		                                    </c:choose>
		                                    <!--/. Task card ends-->
		                                </div>
		                            </div>
		
		                            <!--Kanban task column-->
		                            <div class="tasks mb-7 mb-md-0 col-md-2">
		                                <div>
		                                    <h6 class="mb-4 text-body-secondary" style="text-align:center;">완료</h6>
		                                </div>
		
		                                <!--Task done-->
		                                <div id="WKST04" class="task-list-items">
		
		                                   <!-- Task card begins-->
		                                   <c:choose>
												<c:when test="${empty workList }">
														등록된 업무가 존재하지 않습니다.
												</c:when>
												<c:otherwise>
													<c:forEach items="${workList }" var="work">
													<c:if test="${work.workStatusCode eq 'WKST04' }">
													<c:set var="btAssign" value="${work.assignMemId}"/>
				                                    <c:set var="btAssignList" value="${fn:split(btAssign, ',')}" />
													 
				                                    <div class="card card-body shadow-none border-0 mt-3 mt-lg-5 hover-lift transition-base" style="background:${work.workColor };">
				                                        <div class="d-flex align-items-center justify-content-between">
				                                            <div>
				                                                <!--Task date-->
				                                                <input type="hidden" id="workNum${work.workNum }" value="${work.workNum }">
				                                                <span class="d-flex align-items-center mb-2 small text-body-secondary"><span class="align-middle me-2 material-symbols-rounded fs-5">
																today</span>
																<fmt:parseDate value="${work.workCreateDate }" var="workCreateDate" pattern="yyyy-MM-dd HH:mm:ss" />
																<fmt:formatDate value="${workCreateDate}" pattern="yyyy-MM-dd" />
																</span>
				                                                <!--Task Heading-->
				                                                <h6 class="mb-4 fs-5 fw-medium"><a href="#" class="text-reset">${work.workTitle }</a></h6>
				
				                                                <!--Task assignees-->
				                                                <div>
				                                                <div class="avatar-group justify-content-end">
				                                                <c:choose>
				                                                <c:when test="${fn:length(btAssignList) <= 3 }">
				                                                	<c:forEach items="${colleagueList }" var="btCollList">
				                                                	<c:forEach items="${btAssignList }" var="btAssign" varStatus="stat">
				                                                		<c:if test="${btCollList.memNick == stat.current }">
					                                                        <a href="#!.html"
					                                                            class="avatar-group-item avatar xs rounded-circle"
					                                                            data-tippy-placement="top"
					                                                            data-tippy-content="${btCollList.memNick }">
					                                                            <img src="${btCollList.memProfile }" alt="..."
					                                                                class="avatar-group-img rounded-circle">
					                                                        </a>
					                                                    </c:if>
				                                                	</c:forEach>
				                                                	</c:forEach>
				                                                </c:when>
				                                                <c:otherwise>
				                                                	<c:forEach items="${colleagueList }" var="btCollList">
				                                                	<c:forEach items="${btAssignList }" var="btAssign" end="2" varStatus="stat">
				                                                		<c:if test="${btCollList.memNick == stat.current }">
						                                                	<c:choose>
						                                                	<c:when test="${stat.index == 1 }">
							                                                	<a href="#!.html"
						                                                            class="avatar-group-item text-body-secondary bg-body d-inline-flex align-items-center justify-content-center avatar xs rounded-circle"
						                                                            data-tippy-placement="top"
						                                                            data-tippy-content="${fn:length(btAssignList)-2 } more members">
						                                                            <b class="small">+${fn:length(btAssignList)-2 }</b>
						                                                        </a>
						                                                	</c:when>
						                                                	<c:otherwise>
						                                                		<a href="#!.html"
						                                                            class="avatar-group-item avatar xs rounded-circle"
						                                                            data-tippy-placement="top"
						                                                            data-tippy-content="${btCollList.memNick }">
						                                                            <img src="${btCollList.memProfile }" alt="..."
						                                                                class="avatar-group-img rounded-circle">
						                                                        </a>
						                                                	</c:otherwise>
						                                                	</c:choose>
			                                                        	</c:if>
			                                                        </c:forEach>
			                                                        </c:forEach>
				                                                </c:otherwise>
				                                                </c:choose>
				                                                </div>
				                                                </div>
				                                                
				                                            </div>
				                                        </div>
				                                    </div>
		                                    
		                                    </c:if>
		                                    </c:forEach>
		                                    </c:otherwise>
		                                    </c:choose>
		                               <!--/. Task card ends-->
		                                </div>
		                            </div>
		
		
		                            <!--Kanban task column-->
		                            <div class="tasks col-md-2">
		                                <div>
<!-- 		                                    <h6 class="mb-4 text-secondary">보류 ()</h6> -->
		                                    <h6 class="mb-4 text-body-secondary" style="text-align:center;">보류</h6>
		                                </div>
		
		                                <!--Tasks postpone-->
		                                <div id="WKST05" class="task-list-items">
		
		                                    <!-- Task card begins-->
		                                    <c:choose>
												<c:when test="${empty workList }">
														등록된 업무가 존재하지 않습니다.
												</c:when>
												<c:otherwise>
													<c:forEach items="${workList }" var="work">
													<c:if test="${work.workStatusCode eq 'WKST05' }">
													<c:set var="btAssign" value="${work.assignMemId}"/>
				                                    <c:set var="btAssignList" value="${fn:split(btAssign, ',')}" />
													 
				                                    <div class="card card-body shadow-none border-0 mt-3 mt-lg-5 hover-lift transition-base" style="background:${work.workColor };">
				                                        <div class="d-flex align-items-center justify-content-between">
				                                            <div>
				                                                <!--Task date-->
				                                                <input type="hidden" id="workNum${work.workNum }" value="${work.workNum }">
				                                                <span class="d-flex align-items-center mb-2 small text-body-secondary"><span class="align-middle me-2 material-symbols-rounded fs-5">
																today</span>
																<fmt:parseDate value="${work.workCreateDate }" var="workCreateDate" pattern="yyyy-MM-dd HH:mm:ss" />
																<fmt:formatDate value="${workCreateDate}" pattern="yyyy-MM-dd" />
																</span>
				                                                <!--Task Heading-->
				                                                <h6 class="mb-4 fs-5 fw-medium"><a href="#" class="text-reset">${work.workTitle }</a></h6>
				
				                                                <!--Task assignees-->
				                                                <div>
				                                                <div class="avatar-group justify-content-end">
				                                                <c:choose>
				                                                <c:when test="${fn:length(btAssignList) <= 3 }">
				                                                	<c:forEach items="${colleagueList }" var="btCollList">
				                                                	<c:forEach items="${btAssignList }" var="btAssign" varStatus="stat">
				                                                		<c:if test="${btCollList.memNick == stat.current }">
					                                                        <a href="#!.html"
					                                                            class="avatar-group-item avatar xs rounded-circle"
					                                                            data-tippy-placement="top"
					                                                            data-tippy-content="${btCollList.memNick }">
					                                                            <img src="${btCollList.memProfile }" alt="..."
					                                                                class="avatar-group-img rounded-circle">
					                                                        </a>
					                                                    </c:if>
				                                                	</c:forEach>
				                                                	</c:forEach>
				                                                </c:when>
				                                                <c:otherwise>
				                                                	<c:forEach items="${colleagueList }" var="btCollList">
				                                                	<c:forEach items="${btAssignList }" var="btAssign" end="2" varStatus="stat">
				                                                		<c:if test="${btCollList.memNick == stat.current }">
						                                                	<c:choose>
						                                                	<c:when test="${stat.index == 1 }">
							                                                	<a href="#!.html"
						                                                            class="avatar-group-item text-body-secondary bg-body d-inline-flex align-items-center justify-content-center avatar xs rounded-circle"
						                                                            data-tippy-placement="top"
						                                                            data-tippy-content="${fn:length(btAssignList)-2 } more members">
						                                                            <b class="small">+${fn:length(btAssignList)-2 }</b>
						                                                        </a>
						                                                	</c:when>
						                                                	<c:otherwise>
						                                                		<a href="#!.html"
						                                                            class="avatar-group-item avatar xs rounded-circle"
						                                                            data-tippy-placement="top"
						                                                            data-tippy-content="${btCollList.memNick }">
						                                                            <img src="${btCollList.memProfile }" alt="..."
						                                                                class="avatar-group-img rounded-circle">
						                                                        </a>
						                                                	</c:otherwise>
						                                                	</c:choose>
			                                                        	</c:if>
			                                                        </c:forEach>
			                                                        </c:forEach>
				                                                </c:otherwise>
				                                                </c:choose>
				                                                </div>
				                                                </div>
				                                                
				                                            </div>
				                                        </div>
				                                    </div>
		                                    
		                                    </c:if>
		                                    </c:forEach>
		                                    </c:otherwise>
		                                    </c:choose>
		                                    <!--/. Task card ends-->
		
		
		                                </div>
		                            </div>
		                        </div>
		                       </div>
		                    </div>
		                    <!--//Page content End//-->
                            </div>
                            </div>
                            
                            <div class="tab-pane fade <c:if test="${active eq '5' }">show active</c:if>" id="calendar" role="tabpanel" aria-labelledby="calendar-tab" style="background:white; border-radius: 20px;">
                            <div  id="calendar">
                            <!--//Page content//-->
                            
                            
		                    <div class="content pt-3 px-3 px-lg-6 d-flex flex-column-fluid">
		                        <div class="container-fluid px-0 mb-3 mb-lg-5">
		                        
		                        <div class="modal fade" id="updateCalendarModal" tabindex="-1"
	                                aria-labelledby="updateCalendarModal" aria-hidden="true">
	                                <div class="modal-dialog modal-dialog-centered">
	                                    <div class="modal-content">
	                                        <div class="modal-header">
	                                            <h5 class="modal-title" id="updateCalendarModalLabel">업무 수정</h5>
	                                            <button type="button" class="btn-close"
	                                                data-bs-dismiss="modal" aria-label="Close"></button>
	                                        </div>
	                                        <div class="modal-body">
	                                        	<input type="hidden" class="form-control" id="workNum" name="workNum"/>
	                                            <div class="col-12 col-md-12 mb-3">
											      <div class="form-group">
											      	  <label>업무명</label>
											          <input type="text" class="form-control" id="calUpdateWorkTitle" name="workTitle"/>
											      </div>
											  	</div>
											  	<div class="col-4 col-md-4 mb-3">
											      <div class="form-group">
											      	<label>시작일</label>
											      	<input type="text" class="form-control" id="calUpdateWorkStartDate" name="workStartDate"/>
											      </div>
											  	</div>
	                                            <div class="col-4 col-md-4 mb-3">
											      <div class="form-group">
											      	<label>마감일</label>
											      	<input type="text" class="form-control" id="calUpdateWorkEndDate" name="workEndDate"/>
											      </div>
											  	</div>
											  	<div class="col-12 col-md-12 mb-3">
											      <div class="form-group">
											      	<label>업무내용</label>
											          <textarea class="form-control" id="calUpdateWorkContent" name="workContent" style="height:100px;"></textarea>
											      </div>
											  	</div>
											  	<div class="col-12 col-md-12 mb-3">
											      <div class="form-group">
											      	<label>업무색상</label>
											      	<input type="color" class="form-select" id="calUpdateWorkColor" name="workColor"/>
											      </div>
											  	</div>
	                                        </div>
	                                        <div class="modal-footer">
	                                            <button type="button" class="btn btn-secondary"
	                                                data-bs-dismiss="modal" id="calWorkUpdateCancel">취소</button>
	                                            <button type="button" id="calWorkUpdateBtn" class="btn btn-primary">수정</button>
	                                        </div>
	                                    </div>
	                            </div>
	                            </div>

		                        <div class="modal fade active" id="detailCalendarModal" tabindex="-1"
	                                aria-labelledby="detailCalendarModal" aria-hidden="true">
	                                <div class="modal-dialog modal-dialog-centered">
	                                    <div class="modal-content">
	                                        <div class="modal-header">
	                                            <h5 class="modal-title" id="detailCalendarModalLabel">업무 상세 보기</h5>
	                                            <button type="button" class="btn-close"
	                                                data-bs-dismiss="modal" aria-label="Close"></button>
	                                        </div>
	                                        <div class="modal-body">
	                                            <div class="col-12 col-md-12 mb-3">
											      <div class="form-group">
											      	<label>업무명</label>
											      	<input type="text" class="form-control" id="calDetailWorkTitle" name="workTitle" value=" " readonly="readonly"/>
											      </div>
											  	</div>
	                                            <div class="col-4 col-md-4 mb-3">
											      <div class="form-group">
											      	<label>시작일</label>
											      	<input type="text" class="form-control" id="calDetailWorkStartDate" name="workStartDate" readonly="readonly"/>
											      </div>
											  	</div>
	                                            <div class="col-4 col-md-4 mb-3">
											      <div class="form-group">
											      	<label>마감일</label>
											      	<input type="text" class="form-control" id="calDetailWorkEndDate" name="workEndDate" readonly="readonly"/>
											      </div>
											  	</div>
											  	<div class="col-12 col-md-12 mb-3">
											      <div class="form-group">
											      	<label>업무내용</label>
											          <textarea class="form-control" id="calDetailWorkContent" name="workContent" style="height:100px;"></textarea>
											      </div>
											  	</div>
	                                        </div>
	                                        <div class="modal-footer">
	                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	                                            <button type="button" id="calWorkUpdateMoveBtn" class="btn btn-primary">일정 수정</button>
	                                        </div>
	                                    </div>
	                            </div>
	                            </div>
	                            
		                           <!--calendar-->
			                    		<div id="calendar"></div>
		                        </div>
		                    </div>
		                    <!--//Page content End//-->

                            </div>
                            </div>
                            
<%--                             <div class="tab-pane fade <c:if test="${active eq '6' }">show active</c:if>" id="sheet" role="tabpanel" aria-labelledby="sheet-tab"> --%>
<!--                             <div id="sheet">워크시트탭</div> -->
<!--                             </div> -->
                            
                            <div class="tab-pane fade <c:if test="${active eq '7' }">show active</c:if>" id="data" role="tabpanel" aria-labelledby="data-tab">
                            <div id="data">
                            <div class="row">
				                <div class="col-12 mb-3 mb-lg-5">
				                  <div class="card table-card table-nowrap overflow-hidden">
				                    <div class="card-header d-flex align-items-center">
<!-- 				                      <h5 class="mb-0 pe-3 flex-grow-1 text-truncate">Projects Stats</h5> -->
<!-- 				                      <a href="#!" class="flex-shrink-0 btn btn-sm btn-outline-secondary">History</a> -->
				                    </div>
				                    <div class="table-responsive">
				                      <table class="table align-middle mb-0">
				                        <!--::begin table head-->
				                        <thead class="bg-body text-body-secondary small text-uppercase">
				                          <tr>
				                            <th>파일명</th>
				                          <th>용량</th>
				                          <th>등록자</th>
				                          <th>등록일</th>
				                          </tr>
				                        </thead>
				                        <!--/::end table head-->
				                        <tbody>
				                          <!--::begin table-row-->
				                          <c:forEach items="${workList }" var="work">
				                          <c:forEach items="${work.workFile.attatchList }" var="workAllFile">
				                          <tr>
				                            <td>
				                              <!--::begin project thumbnail and name-->
				                              <div class="d-flex align-items-center">
				                                <div class="width-70 h-auto me-3">
				                                	<c:if test="${fn:containsIgnoreCase(workAllFile.attatchType, 'hwp')}">
												        <img src="/resources/assets/img/projects/6.png" alt="" class="img-zoom img-fluid" style="width: 50%; height: 50%;">
												       </c:if>
												      <c:if test="${fn:containsIgnoreCase(workAllFile.attatchType, 'xlsx')}">
												        <img src="/resources/assets/img/projects/4.png" alt="" class="img-zoom img-fluid" style="width: 50%; height: 50%;">
												      </c:if>
												      <c:if test="${fn:containsIgnoreCase(workAllFile.attatchType, 'zip')}">
												        <img src="/resources/assets/img/projects/3.png" alt="" class="img-zoom img-fluid" style="width: 50%; height: 50%;">
												      </c:if>
												      <c:if test="${fn:containsIgnoreCase(workAllFile.attatchType, 'image')}">
												        <img src="/upload/${workAllFile.saveNm}" alt="" class="img-zoom img-fluid" style="width: 50%; height: 50%;" id="image-container${workAllFile.attatchPlace }${workAllFile.attatchOrder}">
												      </c:if>
												      <c:if test="${fn:containsIgnoreCase(workAllFile.attatchType, 'text')}">
												        <img src="/resources/assets/img/projects/7.png" alt="" class="img-zoom img-fluid" style="width: 50%; height: 50%;">
												      </c:if>
<!-- 				                                  <img src="assets/media/900x600/1.jpg" class="img-fluid rounded" alt=""> -->
				                                </div>
				                                <div class="d-flex justify-content-start flex-column">
				                                  <a href="/upload/${workAllFile.saveNm}" download="${workAllFile.originNm}" class="h6 mb-1">${workAllFile.originNm }</a>
<!-- 				                                  <span class="text-body-secondary d-block fs-6">Allie Grater</span> -->
				                                </div>
				                              </div>
				                              <!--/::end project thumbnail and name-->
				                            </td>
				                            <td><span class="text-body-secondary">
				                            <c:choose>
				                            <c:when test="${workAllFile.attatchSize < 1024}">
				                            	${workAllFile.attatchSize }	B
				                            </c:when>
				                            <c:when test="${workAllFile.attatchSize >= 1024}">
				                            	${String.format("%.2f", workAllFile.attatchSize / 1024)} KB
				                            </c:when>
				                            <c:when test="${workAllFile.attatchSize >= 1048576}">
				                            	${String.format("%.2f", workAllFile.attatchSize / 1048576)} MB
				                            </c:when>
				                            </c:choose>
				                            </span></td>
				                            <td>
				                            	<c:forEach items="${colleagueList }" var="coll">
				                            		<c:if test="${coll.memId eq work.workReq }">
				                            			${coll.memNick }
				                            		</c:if>
				                            	</c:forEach>
				                            </td>
				                            <td>${workAllFile.attatchDate }</td>
				                          </tr>
				                          <script>
				                          	for(var i=0; i<${workList.size()}; i++){
				                          		
											  var container = document.getElementById("image-container${workAllFile.attatchPlace }${workAllFile.attatchOrder}");
											  let preview = null;
											
											  container.onmouseover = function() {
											    // create preview element
											    preview = document.createElement("div");
											    preview.innerHTML = `<img src="/upload/${workAllFile.saveNm}" alt="" class="img-fluid" style="width: 300px; height: auto;">`;
											    preview.style.position = "fixed";
											    preview.style.top = "50%";
											    preview.style.left = "50%";
											    preview.style.transform = "translate(-50%, -50%)";
											    preview.style.border = "1px solid black";
											    preview.style.background = "white";
											    preview.style.padding = "10px";
											    document.body.appendChild(preview);
											  }
											
											  container.onmouseout = function() {
											    // remove preview element
											    if (preview) {
											      document.body.removeChild(preview);
											      preview = null;
											    }
											  }
				                          	}
										  </script>
				                          </c:forEach>
				                          </c:forEach>
				                          <!--/::end table-row-->
				                          
				                        </tbody>
				                      </table>
				                    </div>
				                  </div>
				                </div>
				              </div>
                            </div>
                            </div>

                            <div class="tab-pane fade <c:if test="${active eq '8' }">show active</c:if>" id="member" role="tabpanel" aria-labelledby="member-tab">
                            <div id="member">
                            
                            <div class="row">
				                <div class="col-12 mb-3 mb-lg-5">
				                  <div class="overflow-hidden card table-nowrap table-card">
				                    <div class="card-header d-flex justify-content-between align-items-center">
				                      <h5 class="mb-0">신청 현황</h5>
				                    </div>
				                    <c:choose>
				                        <c:when test="${empty cooFormList }">
<!-- 												<h6>신청한 회원이 없습니다. </h6> -->
				                        </c:when>
				                        <c:otherwise>
						                    <div class="table-responsive">
						                      <table class="table mb-0">
						                        <thead class="small text-uppercase bg-body text-body-secondary">
						                          <tr>
						                            <th>이름</th>
						                            <th>이메일</th>
						                            <th>신청일</th>
						                            <th class="text-end"></th>
						                          </tr>
						                        </thead>
						                        <tbody>
						                        
							                   		<c:forEach items="${cooFormList }" var="cooFormList">
							                   		
							                   		<div class="modal fade" id="cooFormModal${cooFormList.memId }" tabindex="-1"
		                                                aria-labelledby="cooFormModal" aria-hidden="true">
		                                                <div class="modal-dialog modal-dialog-centered">
		                                                    <div class="modal-content" style="background:#ffffff;">
		                                                        <div class="modal-header">
		                                                            <h5 class="modal-title" id="cooFormModalLabel">${cooFormList.memNick }님 신청서 상세보기</h5>
		                                                            <button type="button" class="btn-close"
		                                                                data-bs-dismiss="modal" aria-label="Close"></button>
		                                                        </div>
		                                                        <div class="modal-body">
																    <div class="col-12 col-md-12 mb-3">
																        <div class="form-group">
																        	<h6>신청 내용</h6>
																            <textarea class="form-control" id="mtCooFormContent" name="mtCooFormContent" style="height:200px;" readonly="readonly">${cooFormList.cooFormContent }</textarea>
																        </div>
																    </div>
																    
																    <c:forEach items="${cooFormList.cooFormFile.attatchList }" var="cooFormFile">
												                    <c:choose>
												                    	<c:when test="${fn:substring(cooFormFile.attatchType,0,5) == 'image'}">
														                    <img src="/upload/${cooFormFile.saveNm}" width=120px; height=120px; alt="image" style="margin-bottom:10px;"/>
												                    	</c:when>
												                    	<c:otherwise>
												                    		<div class="p-3 border rounded-3 mb-1 d-flex align-items-center">
												                    		
												                    		<c:if test="${fn:containsIgnoreCase(cooFormFile.attatchType, 'hwp')}">
												        <img src="/resources/assets/img/projects/6.png" alt="" class="height-40 me-3 flex-shrink-0 w-auto">
												       </c:if>
												      <c:if test="${fn:containsIgnoreCase(cooFormFile.attatchType, 'xlsx')}">
												        <img src="/resources/assets/img/projects/4.png" alt="" class="height-40 me-3 flex-shrink-0 w-auto">
												      </c:if>
												      <c:if test="${fn:containsIgnoreCase(cooFormFile.attatchType, 'zip')}">
												        <img src="/resources/assets/img/projects/3.png" alt="" class="height-40 me-3 flex-shrink-0 w-auto">
												      </c:if>
												      <c:if test="${fn:containsIgnoreCase(cooFormFile.attatchType, 'text')}">
												        <img src="/resources/assets/img/projects/7.png" alt="" class="height-40 me-3 flex-shrink-0 w-auto">
												      </c:if>
												                    		
<!-- 											                                  <img src="/resources/assets/media/icons/files/css.svg" class="height-40 me-3 flex-shrink-0 w-auto" alt=""> -->
											                                  <div class="flex-grow-1 overflow-hidden">
											                                    <p class="mb-1 lh-sm text-truncate">${cooFormFile.originNm }</p>
											                                    <div class="d-flex align-items-center justify-content-between">
											                                      <small class="text-body-secondary">
											                                      <c:choose>
														                            <c:when test="${cooFormFile.attatchSize < 1024}">
														                            	${cooFormFile.attatchSize } B
														                            </c:when>
														                            <c:when test="${cooFormFile.attatchSize >= 1024}">
														                            	${String.format("%.2f", cooFormFile.attatchSize / 1024)} KB
														                            </c:when>
														                            <c:when test="${cooFormFile.attatchSize >= 1048576}">
														                            	${String.format("%.2f", cooFormFile.attatchSize / 1048576)} MB
														                            </c:when>
														                          </c:choose>
											                                      </small>
											                                      <a href="#!" class="text-body"
											                                      href="/upload/${cooFormFile.saveNm}"
																					download="/upload/${cooFormFile.originNm}">
											                                        <span class="material-symbols-rounded align-middle">
											                                          download
											                                        </span>
											                                      </a>
											                                    </div>
											                                  </div>
											                                </div>
												                    	</c:otherwise>
												                    </c:choose>
												                    </c:forEach>
																    
		                                                        </div>
		                                                        <div class="modal-footer">
		                                                            <button type="button" id="mtCooFormYBtn${cooFormList.cooFormNum }" class="btn btn-info">승인</button>
		                                                            <button type="button" id="mtCooFormNBtn${cooFormList.cooFormNum }" class="btn btn-danger">거절</button>
		                                                        </div>
		                                                    </div>
		                                            </div>
		                                            </div>
							                   		
							                          <tr class="align-middle">
							                            <td>
							                              <div class="align-items-center">
							                                <div>
							                                  <div class="h6 mb-0 lh-1">${cooFormList.memNick }</div>
							                                </div>
							                              </div>
							                            </td>
							                            <td>${cooFormList.memMail }</td>
							                            <td>
							                            <fmt:parseDate value="${cooFormList.cooFromDate }" var="cooFormDate" pattern="yyyy-MM-dd HH:mm:ss" />
														<fmt:formatDate value="${cooFormDate}" pattern="yyyy-MM-dd" />
							                            </td>
							                            <td class="text-end">
							                            	<button type="button" class="btn btn-outline-primary" data-bs-toggle="modal"
                                               				data-bs-target="#cooFormModal${cooFormList.memId }">신청서</button>
							                            </td>
							                          </tr>
							                          <script type="text/javascript">
							                          $(function(){
				                                             var mtCooFormYBtn = $("#mtCooFormYBtn${cooFormList.cooFormNum }");
				                                             var pjId = "${project.pjId}";
				                                             var pjName = "${project.pjName}";
				                                             var cooFormNum = "${cooFormList.cooFormNum }";
				                                             var memNick = "${cooFormList.memNick }";
				                                             var memId = "${cooFormList.memId }";
				                                             
				                                             mtCooFormYBtn.on("click",function(){
				                                                console.log(pjId);
				                                                console.log(cooFormNum);
				                                                Swal.fire({
				                                                       icon: 'success',
				                                                       title: '승인하시겠습니까?',
				                                                       showCancelButton: true,
				                                                       confirmButtonText: '확인',
				                                                       cancelButtonText: '취소',
				                                                     }).then((result) => {
				                                                        if (result.isConfirmed) {
				                                                      $.ajax({
				                                                         type : "post",
				                                                         url : "/coco/colleague/collRegister",
				                                                         data : {
				                                                            pjId : pjId,
				                                                            cooFormNum : cooFormNum,
				                                                            memId : memId,
				                                                         },
				                                                         success : function(result){
				                                                            if(result == "SUCCESS")
				                                                               sendMsgH(memId, memNick + "님 " + pjName + "프로젝트에 가입되었습니다.", cooFormNum);
				                                                               location.href = "/coco/project/detail/" + pjId +"?active=8";
				                                                         }
				                                                      });

				                                                        } 
				                                                      })
				                                                
				                                             });
				                                          });

							                          $(function(){
															var mtCooFormNBtn = $("#mtCooFormNBtn${cooFormList.cooFormNum }");
															var pjId = "${project.pjId}";
															var cooFormNum = "${cooFormList.cooFormNum }";
															
															mtCooFormNBtn.on("click",function(){
																Swal.fire({
																       icon: 'warning',
																       title: '거절하시겠습니까?',
																       showCancelButton: true,
																       confirmButtonText: '확인',
																       cancelButtonText: '취소',
																     }).then((result) => {
																   	  if (result.isConfirmed) {
																		$.ajax({
																			type : "post",
																			url : "/coco/colleague/cooFormDelete",
																			data : {
																				cooFormNum : cooFormNum,
																			},
																			success : function(result){
																				if(result == "SUCCESS")
																					location.href = "/coco/project/detail/" + pjId + "?active=8";
																			}
																		});

																   	  } 
																   	})
																
															});
														});
							                          
														</script>
							                        </c:forEach>
						                          
						                        </tbody>
						                      </table>
						                    </div>
					              		</c:otherwise>
				                  	</c:choose>
				                  
				                  </div>
				                </div>
							</div>
                            
							<div class="row">
				                <div class="col-12 mb-3 mb-lg-5">
				                  <div class="overflow-hidden card table-nowrap table-card">
				                    <div class="card-header d-flex justify-content-between align-items-center">
				                      <h5 class="mb-0">멤버 목록</h5>
				                    </div>
				                    <div class="table-responsive">
				                      <table class="table mb-0">
				                        <thead class="small text-uppercase bg-body text-body-secondary">
				                          <tr>
				                            <th>이름</th>
				                            <th>이메일</th>
				                            <th>전화번호</th>
				                            <th>가입일</th>
				                            <th class="text-end"></th>
				                          </tr>
				                        </thead>
				                        <tbody>
				                        
				                        <c:forEach items="${colleagueList }" var="mtCollList">
				                        <c:if test="${mtCollList.workRoleCode eq 'WROL01' }">
				                          <tr class="align-middle">
				                            <td>
				                              <div class="d-flex align-items-center">
                                                <c:forEach items="${roleCode }" var="roleCode">
			                             		<c:if test="${mtCollList.workRoleCode eq roleCode.comCode }">
													<div class="flex-shrink-0">
	                                                      <div class="me-3 avatar d-flex align-items-center justify-content-center bg-primary text-white fw-bolder rounded-circle" style="width: 2rem;height: 2rem;">
						                             			${roleCode.comCodeNm }
	                                                      </div>
	                                                </div>
			                             		</c:if>
				                             	</c:forEach>
				                                <div>
				                                  <div class="h6 mb-0 lh-1">${mtCollList.memNick }</div>
				                                </div>
				                              </div>
				                            </td>
				                            <td>${mtCollList.memMail }</td>
				                            <td>${mtCollList.memHp }</td>
				                            <td>
				                            <fmt:parseDate value="${mtCollList.colDate }" var="colDate" pattern="yyyy-MM-dd HH:mm:ss" />
											<fmt:formatDate value="${colDate}" pattern="yyyy-MM-dd" />
				                            </td>
				                            <td class="text-end">
				                            </td>
				                          </tr>
				                          </c:if>
				                          </c:forEach>
				                          
				                        <c:forEach items="${colleagueList }" var="mtCollList">
				                        <c:if test="${mtCollList.workRoleCode ne 'WROL01' }">
				                        
				                        <div class="modal fade" id="updateRoleModal${mtCollList.colNum }" tabindex="-1"
                                                aria-labelledby="updateRoleModal" aria-hidden="true">
                                                <div class="modal-dialog modal-dialog-centered">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="updateRoleModalLabel">역할 변경</h5>
                                                            <button type="button" class="btn-close"
                                                                data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="col-12 col-md-12 mb-3" style="text-align: center">
														        <div class="form-group">
														           <select id="roleUpdateSelect${mtCollList.colNum }" class="form-control" name="workRoleCode"
											                           data-choices='{"searchEnabled":false, "itemSelectText":""}'>
											                           <c:forEach items="${roleCode }" var="roleCode">
											                           	<c:if test="${roleCode.comCode ne 'WROL01' }">
											                           		<option value="${roleCode.comCode }" <c:if test="${mtCollList.workRoleCode eq roleCode.comCode }">selected</c:if>>${roleCode.comCodeNm }</option>
											                            </c:if>
											                           </c:forEach>
											                       </select>
														        </div>
														    </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary"
                                                                data-bs-dismiss="modal">취소</button>
                                                            <button type="button" id="mtUpdateRoleBtn${mtCollList.colNum }" class="btn btn-primary">변경</button>
                                                        </div>
                                                    </div>
                                            </div>
                                            </div>
				                        
				                          <tr class="align-middle">
				                            <td>
				                              <div class="d-flex align-items-center">
                                                <c:forEach items="${roleCode }" var="roleCode">
			                             		<c:if test="${mtCollList.workRoleCode eq roleCode.comCode }">
													<div class="flex-shrink-0">
	                                                      <div class="me-3 avatar d-flex align-items-center justify-content-center bg-secondary text-white fw-bolder rounded-circle" style="width: 2rem;height: 2rem;">
						                             			${roleCode.comCodeNm }
	                                                      </div>
	                                                </div>
			                             		</c:if>
				                             	</c:forEach>
				                                <div>
				                                  <div class="h6 mb-0 lh-1">${mtCollList.memNick }</div>
				                                </div>
				                              </div>
				                            </td>
				                            <td>${mtCollList.memMail }</td>
				                            <td>${mtCollList.memHp }</td>
				                            <td>
				                            <fmt:parseDate value="${mtCollList.colDate }" var="colDate" pattern="yyyy-MM-dd HH:mm:ss" />
											<fmt:formatDate value="${colDate}" pattern="yyyy-MM-dd" />
				                            </td>
				                            <td class="text-end">
				                              <div class="drodown">
				                                <a data-bs-toggle="dropdown" href="#" class="btn btn-outline-secondary p-1">
				                                  <span class="material-symbols-rounded align-middle">
				                                    more_vert
				                                  </span>
				                                </a>
					                                <div class="dropdown-menu dropdown-menu-end">
					                                  <form action="/coco/project/adminModify" method="post" id="adminUpdateForm">
														<input type="hidden" name="pjId" value="${project.pjId}">
														<input type="hidden" name="memId" value="${mtCollList.memId}">
														<button type="button" id="adminUpdate${mtCollList.colNum }" class="dropdown-item">프로젝트 매니저 위임</button>
													  </form>
													  <button type="button" class="dropdown-item" data-bs-toggle="modal"
														data-bs-target="#updateRoleModal${mtCollList.colNum }">역할 변경
													  </button>
					                                  <button type="button" id="colleagueExit${mtCollList.colNum }" class="dropdown-item">멤버 방출</button>
					                                </div>
				                              </div>
				                            </td>
				                          </tr>
				                          <script type="text/javascript">
				                          $(function(){
												var mtUpdateRoleBtn = $("#mtUpdateRoleBtn${mtCollList.colNum }");
												var pjId = "${project.pjId}";
												var colNum = "${mtCollList.colNum }";
												var workRoleCode = document.getElementById('roleUpdateSelect${mtCollList.colNum }');
												
												mtUpdateRoleBtn.on("click",function(){
													console.log(workRoleCode.value);
													$.ajax({
														type : "post",
														url : "/coco/colleague/selectRoleModify",
														data : {
															pjId : pjId,
															colNum : colNum,
															workRoleCode : workRoleCode.value
														},
														success : function(result){
															if(result == "SUCCESS")
																location.href = "/coco/project/detail/" + pjId + "?active=8";
														}
													});
												});
											});
// 				                          var selectBoxChange = function(value){
// 				                        	  	console.log(value);
// 			                        			$("#workRoleCode${mtCollList.colNum }").val(value);
// 				                        	}
				                          
											$(function(){
												$("#adminUpdate${mtCollList.colNum }").on("click",function(){
													
													Swal.fire({
													       icon: 'warning',
													       title: '권한을 위임하시겠습니까?',
													       showCancelButton: true,
													       confirmButtonText: '확인',
													       cancelButtonText: '취소',
													     }).then((result) => {
													   	  if (result.isConfirmed) {
													   	    $("#adminUpdateForm").submit();
													   	  } 
													   	})
												});
											});
											
											$(function(){
												var colleagueExit = $("#colleagueExit${mtCollList.colNum }");
												var pjId = "${project.pjId}";
												var colNum = "${mtCollList.colNum }";
												var memId = "${mtCollList.memId}";
												
												colleagueExit.on("click",function(){
													Swal.fire({
													       icon: 'warning',
													       title: '멤버를 방출하시겠습니까?',
													       showCancelButton: true,
													       confirmButtonText: '확인',
													       cancelButtonText: '취소',
													     }).then((result) => {
													   	  if (result.isConfirmed) {
															$.ajax({
																type : "post",
																url : "/coco/colleague/colleagueExit",
																data : {
																	pjId : pjId,
																	colNum : colNum,
																	memId : memId
																},
																success : function(result){
																	if(result == "SUCCESS")
																		location.href = "/coco/project/detail/" + pjId + "?active=8";
																}
															});

													   	  } 
													   	})
													   	
												});
											});
											</script>
											</c:if>
				                          </c:forEach>
				                          
				                        </tbody>
				                      </table>
				                    </div>
				                  </div>
				                </div>
							</div>
                            </div>
                            </div>
                            
                     </div>
                            
        	</div>
        </div>
    </div>
</div>
<!--App calendar Plugin-->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.9.0/main.min.js"></script>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.9.0/locales-all.min.js'></script>
<script>
$(function(){
	$('#calWorkUpdateMoveBtn').on('click', function(e){
		$("#detailCalendarModal").modal("hide")
		$("#updateCalendarModal").modal("show");
	});
});

$(function(){
	var workNum = document.getElementById('workNum');
	var calUpdateWorkTitle = document.getElementById('calUpdateWorkTitle');
	var calUpdateWorkStartDate = document.getElementById('calUpdateWorkStartDate');
	var calUpdateWorkEndDate = document.getElementById('calUpdateWorkEndDate');
	var calUpdateWorkContent = document.getElementById('calUpdateWorkContent');
	var calUpdateWorkColor = document.getElementById('calUpdateWorkColor');
	$('#calWorkUpdateBtn').on('click', function(e){
		console.log(workNum.value);
		console.log(calUpdateWorkTitle.value);
		console.log(calUpdateWorkStartDate.value);
		console.log(calUpdateWorkEndDate.value);
		console.log(calUpdateWorkContent.value);
		console.log(calUpdateWorkColor.value);
		$.ajax({
			type : "post",
			url : "/coco/calendar/modify",
			data : {
				workNum : workNum.value,
				workTitle : calUpdateWorkTitle.value,
				workStartDate : calUpdateWorkStartDate.value,
				workEndDate : calUpdateWorkEndDate.value,
				workContent : calUpdateWorkContent.value,
				workColor :  calUpdateWorkColor.value
			},
			success : function(result){
	// 			location.href = "/coco/project/detail/" + pjId;
				$("#updateCalendarModal").modal("hide");
				list();
			}
		});
	});
});

$(function() {
    $('#calUpdateWorkStartDate').daterangepicker({
		locale: {
			format: 'YYYY-MM-DD'
		},
		singleDatePicker: true,
		showDropdowns: true,
		minYear: 1901,
		maxYear: parseInt(moment().format('YYYY'),10)
    });
  });
  
$(function() {
    $('#calUpdateWorkEndDate').daterangepicker({
		locale: {
			format: 'YYYY-MM-DD'
		},
		singleDatePicker: true,
		showDropdowns: true,
		minYear: 1901,
		maxYear: parseInt(moment().format('YYYY'),10)
    });
  });

function list(){
	(function(){
		$(function(){
			var pjId = "${project.pjId}";
			console.log(pjId);
			$.ajax({
				type : "post",
				url : "/coco/calendar/list",
				data : {pjId : pjId},
				dataType : "json",
				//async: false,
				success : function(resp) {
					console.log(resp);
					
					let modalDetail = document.getElementById('detailCalendarModal');
					let detailModal = new bootstrap.Modal(modalDetail);
					let modalUpdate = document.getElementById('updateCalendarModal');
					let upModal = new bootstrap.Modal(modalUpdate);
				    // Example events
				    const exampleEvents = resp
				    // Initialize the calendar
				    const calendar = new FullCalendar.Calendar(document.getElementById('calendar'), {
				      events: exampleEvents,
					  expandRows : true, // 화면에 맞게 높이 재설정  
				      headerToolbar: {
				        left: 'prev,next today',
				        center: 'title',
				        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
				      },
				      themeSystem: 'bootstrap',
				      bootstrapFontAwesome: false,
				      buttonText: {
				        today: '오늘',
				        month: '월',
				        week: '주',
				        day: '일',
				        list: '목록',
				        prev: '❮',
				        next: '❯',
				      },
				      dayMaxEvents: true, // allow "more" link when too many events
				      editable : true, // 수정 가능?        
// 					  selectable : true, // 달력 일자 드래그 설정가능
				      droppable: true,
				      locale : 'ko', // 한국어 설정
				      eventChange : function(obj) {
					 	  // 이벤트가 수정되면 발생하는 이벤트          
// 						  console.log(obj);
					  },
					  eventRemove : function(obj) {
					      // 이벤트가 삭제되면 발생하는 이벤트          
						  console.log(obj);
					  },
					  eventClick : function(arg) {
						  	detailModal.show();

						  	setTimeout(()=>{
						  		$("#calDetailWorkTitle").val(arg.event._def.title); //일정상세 글 나오게하기
						  		$("#calDetailWorkStartDate").val(arg.event._instance.range.start.toISOString().substr(0, 10));
								$("#calDetailWorkEndDate").val(arg.event._instance.range.end.toISOString().substr(0, 10));
								$("#calDetailWorkContent").val(arg.event._def.extendedProps.content);
								
								$("#workNum").val(arg.event._def.extendedProps.num);
								$("#calUpdateWorkTitle").val(arg.event._def.title);
								$("#calUpdateWorkStartDate").val(arg.event._instance.range.start.toISOString().substr(0, 10));
								$("#calUpdateWorkEndDate").val(arg.event._instance.range.end.toISOString().substr(0, 10));
								$("#calUpdateWorkContent").val(arg.event._def.extendedProps.content);
								$("#calUpdateWorkColor").val(arg.event._def.ui.backgroundColor);
						  	},200);
						  	/*
						  	console.log("arg",arg);
// 							console.log("this", $(this));
// 							console.log("모달타이틀", $("#calDetailWorkTitle"));
// 							console.log("arg", arg.el.innerText);
							console.log(arg.event._def.extendedProps.num);
							alert("1:"+arg.event._def.title);
							console.log("1111",$("#calDetailWorkTitle"));
							$("#calDetailWorkTitle").val(arg.event._def.title); //일정상세 글 나오게하기
							console.log('arg',arg.event._def.title);
							console.log("2222:",$("#calDetailWorkTitle"));
							console.log("2222:",$("#calDetailWorkTitle").val());
							console.log('arg',$("#calDetailWorkTitle").val()); // undefined?
							
							$("#calDetailWorkStartDate").val(arg.event._instance.range.start.toISOString().substr(0, 10));
							$("#calDetailWorkEndDate").val(arg.event._instance.range.end.toISOString().substr(0, 10));
							$("#calDetailWorkContent").val(arg.event._def.extendedProps.content);
// 							$("#deleteCalendar").find("input[name=calNum]").val(arg.event._def.extendedProps.calId);
							*/
						},
					  eventDrop : function(arg) {
							console.log(arg);
							console.log(arg.event._def.title);
// 							let start = arg.event._instance.range.start;
// 							var date = new Date();
// 							date.setDate(date.getDate());
// 							if (start.toISOString().split("T")[0] < date.toISOString().split("T")[0]) {
// 								  Swal.fire({
// 								        icon: 'warning',
// 								        title: '당일 이전으론 수정할 수 없습니다.',
// 								        showConfirmButton: true
// 								      })
// 								arg.revert();
// 								return;
// 							}
							upModal.show();
						  	setTimeout(()=>{
							$("#workNum").val(arg.event._def.extendedProps.num);
							$("#calUpdateWorkTitle").val(arg.event._def.title);
							$("#calUpdateWorkStartDate").val(arg.event._instance.range.start.toISOString().substr(0, 10));
							$("#calUpdateWorkEndDate").val(arg.event._instance.range.end.toISOString().substr(0, 10));
							$("#calUpdateWorkContent").val(arg.event._def.extendedProps.content);
							$("#calUpdateWorkColor").val(arg.event._def.ui.backgroundColor);
						  	},200);

						},
					  
				    }).render()
				}
			});
		});
	})();
}
function calendar_click(){
	list();
}
</script>
<!--Tasks Kanban Dragula-->
<script type="text/javascript">
!function (r) {
    "use strict";
    function t() { this.$body = r("body") } t.prototype.init = function () {
        r('[data-dragula="tasks"]').each(function () {
            var t = r(this).data("containers"), a = []; if (t) for (var n = 0; n < t.length; n++)a.push(r("#" + t[n])[0]);
            else a = [r(this)[0]]; var i = r(this).data("handleclass"); i ? dragula(a,
                { moves: function (t, a, n) { return n.classList.contains(i) } }) : dragula(a).on('drop', function (el, target, source, sibling) {
                	var workNumInput = el.querySelector('[id^="workNum"]');
	       	        console.log('workNum:', workNumInput.value);
	       	        console.log('workStatusCode:', target.id);    
	       	        
			       	    $.ajax({
							type : "post",
							url : "/coco/work/boardModify",
							data : {
								workNum : workNumInput.value,
								workStatusCode : target.id
							},
							success : function(result){
								
							}
						});
			       	    
	                });
        })
    },
        r.Dragula = new t, r.Dragula.Constructor = t
}(window.jQuery),
    function () { "use strict"; window.jQuery.Dragula.init() }();
</script>

<script type="text/javascript">
function attaDelBtn(el){
	el.css("display", "none");
	el.prev().css("display", "none");
	let attatchNum = el.data("attnum");
	let attatchOrder = el.data("attorder");
	
	let delNum = $("<input>").attr("name", "delAttatchNum").attr("type", "hidden").val(attatchNum);
	let delOrder = $("<input>").attr("name", "delAttatchOrder").attr("type", "hidden").val(attatchOrder);
	
	$("#postForm").append(delNum, delOrder);
}
  
   let arrTag = new Array();
   $("#tagInput").on("keyup",function(key){      
   	if(key.keyCode==13) {
   		let tagInput = $("input[id='tagInput']").val();
   		if(tagInput==""){
   			swal("태그를 입력해주세요");
   		}else{
       		let tagleng = $("span[class='tags']").length;
           	arrTag.push("#"+tagInput);
           	$("#tagArea").append("<span class='tags' data-value ="+tagInput+" data-idx="+tagleng+">"+"#"+tagInput+"<a id='deltag' onclick='DelTag(event)' style='color:#FA5858; padding: 5px;'>x</a></span>")
           	$("input[id='tagInput']").val('');	
           	console.log("배열="+arrTag);
   		}
   		
   	}
   });
  
   
   function DelTag(event){
   	let myTarget = $(event.target);
	let targetVal = myTarget.closest("span").data('value');
	let targetIdx = myTarget.closest("span").data('idx');
   	console.log(targetVal);
   	console.log(targetIdx);
   	$("span[data-idx="+targetIdx+"]").remove();
   	arrTag.splice(targetIdx,1);
   	console.log("삭제후배열="+arrTag);
   }
</script>

<!-- <script src="/resources/ckeditor/ckeditor.js"></script> -->
<script type="text/javascript">
$(function () {
	var inviteBtn = $("#inviteBtn");
	var inviteMail = document.getElementById('inviteMail');
	var inviteContent = document.getElementById('inviteContent');
	var invitePjName = document.getElementById('invitePjName');
	var invitePjId = document.getElementById('invitePjId');
	
	inviteBtn.on("click",function(){
		$.ajax({
			type : "post",
			url : "/coco/project/invite",
			data : {
				inviteMail : inviteMail.value,
				inviteContent : inviteContent.value,
				invitePjName : invitePjName.value,
				invitePjId : invitePjId.value
			},
			success : function(result){
				$('#inviteModal').modal('hide');
				$('#inviteMail').val('');
				$('#inviteContent').val('');
				Swal.fire({
				       icon: 'success',
				       title: '초대코드를 발송하였습니다!',
				       confirmButtonText: '확인'
				     })
			}
		});
	});	
	
// 	CKEDITOR.replace('workContent', {
// 		footnotesPrefix: 'a',
// 		filebrowserUploadUrl : '${pageContext.request.contextPath}/imageUpload.do'
// 	});

    var start = $("#projectStart").val();
    var end =  $("#projectEnd").val();
    	console.log("start"+start);
    	console.log("end"+end);

    function cb(start, end) {
      $('#reportrange span').html(start + ' - ' + end);
    }

    $('#reportrange').daterangepicker({
      startDate: start,
      endDate: end,
      minDate: start,
      maxDate: end,
   	  locale: {
		format: 'YYYY-MM-DD'
	  }
	});
    cb(start, end);
  });
</script>     
