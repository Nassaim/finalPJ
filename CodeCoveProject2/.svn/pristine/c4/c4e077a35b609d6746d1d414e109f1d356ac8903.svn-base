<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<style>

::-webkit-scrollbar {
  display: none;
}

</style>
<!--//Page Toolbar//-->
<div class="toolbar py-3 px-3 px-lg-6">
    <div class="position-relative container-fluid px-0">
        <div class="row align-items-center position-relative">
            <div class="col-md-7 mb-4 mb-md-0">
                <h3 class="mb-2">모아보기 - 칸반보드</h3>

            </div>
        </div>
    </div>
</div>
<!--//Page Toolbar End//-->

<!--//Page content//-->
<div class="content d-flex flex-column-fluid py-3 px-3 px-lg-6">

   <div class="container-fluid px-0">
        <!--Kanban board begin-->
    <div class="board row mb-3 mb-lg-5">
        <!--Kanban task column-->
        <div class="tasks mb-7 mb-md-0 col-md-2" data-dragula="tasks"
            data-containers='["WKST01", "WKST02", "WKST03", "WKST04", "WKST05"]'>
            <div>
                <h6 class="mb-4 text-body-secondary">요청</h6>
            </div>

            <!--Task initials-->
            <div id="WKST01" class="task-list-items">

                <!-- Task card begins-->
                <c:choose>
                	<c:when test="${empty workMyBoardList }">
                	
                	</c:when>
                	<c:otherwise>
                		<c:forEach items="${workMyBoardList }" var="work">
<%--                 		<p>${work }</p> --%>
                		<c:if test="${work.workStatusCode eq 'WKST01' }">
                		<c:set var="btAssign" value="${work.assignMemId}"/>
				        <c:set var="btAssignList" value="${fn:split(btAssign, ',')}" />
                		
		                <div
		                    class="card card-body shadow-none border-0 mt-3 mt-lg-5 hover-lift transition-base" style="background:${work.workColor };">
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
		                            <small>${work.pjName }</small>
		                            <h6 class="mb-4 fs-5 fw-medium"><a href="#!.html" class="text-reset">${work.workTitle }</a></h6>
		
		                            <!--Task assignees-->
		                            <div>
		                                <div class="avatar-group justify-content-end">
		                                	<c:choose>
                                            <c:when test="${fn:length(btAssignList) <= 3 }">
                                            	<c:forEach items="${work.colleagueVOList }" var="btCollList">
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
                                            	<c:forEach items="${work.colleagueVOList }" var="btCollList">
                                            	<c:forEach items="${btAssignList }" var="btAssign" end="2" varStatus="stat">
                                            		<c:if test="${btCollList.memNick == stat.current }">
		                                              	<c:choose>
		                                              	<c:when test="${stat.index == 2 }">
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


<!--                 <div class="d-grid pt-4"> -->
<!--                     <a href="#!" class="btn btn-outline-primary"> -->
<!--                         <span class="align-middle me-2 material-symbols-rounded">add</span> Create new task</a> -->
<!--                 </div> -->

            </div>
        </div>

        <!--Kanban task column-->
        <div class="tasks mb-7 mb-md-0 col-md-2">
            <div>
                <h6 class="mb-4 text-body-secondary">진행</h6>
            </div>

            <div id="WKST02" class="task-list-items">

               <!-- Task card begins-->
               <c:choose>
                	<c:when test="${empty workMyBoardList }">
                	
                	</c:when>
                	<c:otherwise>
                		<c:forEach items="${workMyBoardList }" var="work">
                		<c:if test="${work.workStatusCode eq 'WKST02' }">
                		<c:set var="btAssign" value="${work.assignMemId}"/>
				        <c:set var="btAssignList" value="${fn:split(btAssign, ',')}" />
                		
		                <div
		                    class="card card-body shadow-none border-0 mt-3 mt-lg-5 hover-lift transition-base" style="background:${work.workColor };">
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
		                            <small>${work.pjName }</small>
		                            <h6 class="mb-4 fs-5 fw-medium"><a href="#!.html" class="text-reset">${work.workTitle }</a></h6>
		
		                            <!--Task assignees-->
		                            <div>
		                                <div class="avatar-group justify-content-end">
		                                	<c:choose>
                                            <c:when test="${fn:length(btAssignList) <= 3 }">
                                            	<c:forEach items="${work.colleagueVOList }" var="btCollList">
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
                                            	<c:forEach items="${work.colleagueVOList }" var="btCollList">
                                            	<c:forEach items="${btAssignList }" var="btAssign" end="2" varStatus="stat">
                                            		<c:if test="${btCollList.memNick == stat.current }">
		                                              	<c:choose>
		                                              	<c:when test="${stat.index == 2 }">
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
                <h6 class="mb-4 text-body-secondary">피드백</h6>
            </div>

            <!--Tasks done-->
            <div id="WKST03" class="task-list-items">

                <!-- Task card begins-->
                <c:choose>
                	<c:when test="${empty workMyBoardList }">
                	
                	</c:when>
                	<c:otherwise>
                		<c:forEach items="${workMyBoardList }" var="work">
                		<c:if test="${work.workStatusCode eq 'WKST03' }">
                		<c:set var="btAssign" value="${work.assignMemId}"/>
				        <c:set var="btAssignList" value="${fn:split(btAssign, ',')}" />
                		
		                <div
		                    class="card card-body shadow-none border-0 mt-3 mt-lg-5 hover-lift transition-base" style="background:${work.workColor };">
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
		                            <small>${work.pjName }</small>
		                            <h6 class="mb-4 fs-5 fw-medium"><a href="#!.html" class="text-reset">${work.workTitle }</a></h6>
		
		                            <!--Task assignees-->
		                            <div>
		                                <div class="avatar-group justify-content-end">
		                                	<c:choose>
                                            <c:when test="${fn:length(btAssignList) <= 3 }">
                                            	<c:forEach items="${work.colleagueVOList }" var="btCollList">
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
                                            	<c:forEach items="${work.colleagueVOList }" var="btCollList">
                                            	<c:forEach items="${btAssignList }" var="btAssign" end="2" varStatus="stat">
                                            		<c:if test="${btCollList.memNick == stat.current }">
		                                              	<c:choose>
		                                              	<c:when test="${stat.index == 2 }">
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
                <h6 class="mb-4 text-body-secondary">완료</h6>
            </div>

            <!--Tasks done-->
            <div id="WKST04" class="task-list-items">

                <!-- Task card begins-->
                <c:choose>
                	<c:when test="${empty workMyBoardList }">
                	
                	</c:when>
                	<c:otherwise>
                		<c:forEach items="${workMyBoardList }" var="work">
                		<c:if test="${work.workStatusCode eq 'WKST04' }">
                		<c:set var="btAssign" value="${work.assignMemId}"/>
				        <c:set var="btAssignList" value="${fn:split(btAssign, ',')}" />
                		
		                <div
		                    class="card card-body shadow-none border-0 mt-3 mt-lg-5 hover-lift transition-base" style="background:${work.workColor };">
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
		                            <small>${work.pjName }</small>
		                            <h6 class="mb-4 fs-5 fw-medium"><a href="#!.html" class="text-reset">${work.workTitle }</a></h6>
		
		                            <!--Task assignees-->
		                            <div>
		                                <div class="avatar-group justify-content-end">
		                                	<c:choose>
                                            <c:when test="${fn:length(btAssignList) <= 3 }">
                                            	<c:forEach items="${work.colleagueVOList }" var="btCollList">
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
                                            	<c:forEach items="${work.colleagueVOList }" var="btCollList">
                                            	<c:forEach items="${btAssignList }" var="btAssign" end="2" varStatus="stat">
                                            		<c:if test="${btCollList.memNick == stat.current }">
		                                              	<c:choose>
		                                              	<c:when test="${stat.index == 2 }">
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
                <h6 class="mb-4 text-body-secondary">보류</h6>
            </div>

            <!--Tasks done-->
            <div id="WKST05" class="task-list-items">

                <!-- Task card begins-->
                <c:choose>
                	<c:when test="${empty workMyBoardList }">
                	
                	</c:when>
                	<c:otherwise>
                		<c:forEach items="${workMyBoardList }" var="work">
                		<c:if test="${work.workStatusCode eq 'WKST05' }">
                		<c:set var="btAssign" value="${work.assignMemId}"/>
				        <c:set var="btAssignList" value="${fn:split(btAssign, ',')}" />
                		
		                <div
		                    class="card card-body shadow-none border-0 mt-3 mt-lg-5 hover-lift transition-base" style="background:${work.workColor };">
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
		                            <small>${work.pjName }</small>
		                            <h6 class="mb-4 fs-5 fw-medium"><a href="#!.html" class="text-reset">${work.workTitle }</a></h6>
		
		                            <!--Task assignees-->
		                            <div>
		                                <div class="avatar-group justify-content-end">
		                                	<c:choose>
                                            <c:when test="${fn:length(btAssignList) <= 3 }">
                                            	<c:forEach items="${work.colleagueVOList }" var="btCollList">
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
                                            	<c:forEach items="${work.colleagueVOList }" var="btCollList">
                                            	<c:forEach items="${btAssignList }" var="btAssign" end="2" varStatus="stat">
                                            		<c:if test="${btCollList.memNick == stat.current }">
		                                              	<c:choose>
		                                              	<c:when test="${stat.index == 2 }">
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
<script type="text/javascript">
!function (r) {
    "use strict";
    function t() { this.$body = r("body") } t.prototype.init = function () {
        r('[data-dragula="tasks"]').each(function () {
            var t = r(this).data("containers"), a = []; if (t) for (var n = 0; n < t.length; n++)a.push(r("#" + t[n])[0]);
            else a = [r(this)[0]]; var i = r(this).data("handleclass"); i ? dragula(a,
                { moves: function (t, a, n) { return n.classList.contains(i) } }) : dragula(a)
                .on('drop', function (el, target, source, sibling) {
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
