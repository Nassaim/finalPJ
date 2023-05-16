<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style>
.card div.dataTables_wrapper .dataTables_filter {
	float: right;
}
</style>

          <!--//Page Toolbar//-->
          <div class="toolbar px-3 px-lg-6 py-3">
            <div class="position-relative container-fluid px-0">
              <div class="row align-items-center position-relative">
                <div class="col-md-8 mb-4 mb-md-0">
                  <h3 class="mb-2">커뮤니티</h3>

                </div>
              </div>
            </div>
          </div>
          <!--//Page Toolbar End//-->


		<!-- 탭 네비게이션 -->
		<ul class="nav nav-tabs" id="myTab" role="tablist" style="padding-left : 30px;">
		  <li class="nav-item">
		    <a class="nav-link active" id="tab1-tab" data-bs-toggle="tab" data-bs-target="#tab1" role="tab" aria-controls="tab1" aria-selected="true"><i class="bi bi-universal-access me-2"></i>자유게시판 </a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" id="tab2-tab" data-bs-toggle="tab" data-bs-target="#tab2" role="tab" aria-controls="tab2" aria-selected="false"><i class="bx bx-group me-2"></i>협업게시판</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" id="tab3-tab" data-bs-toggle="tab" data-bs-target="#tab3" role="tab" aria-controls="tab3" aria-selected="false">	<i class="bi bi-pencil-fill me-2"></i>댓글</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" id="tab4-tab" data-bs-toggle="tab" data-bs-target="#tab4" role="tab" aria-controls="tab4" aria-selected="false"><i class="bi bi-question-octagon me-2"></i>문의내역</a>
		  </li>
		</ul>

<!-- 탭내용 -->
<div class="tab-content" id="myTabContent">
  <div class="tab-pane fade show active" id="tab1" role="tabpanel" aria-labelledby="tab1-tab">
             <!--//Page content//-->
          <div class="content pt-3 px-3 px-lg-6 d-flex flex-column-fluid">
            <div class="container-fluid px-0">
            
                <div class="row">
                    <div class="col-12 mb-3 mb-lg-5">
                        <div class="card">
                            <div class="table-responsive">
                                <table id="datatable" class="table mt-0 table-striped table-card table-nowrap">
                                    <thead class="text-uppercase small text-body-secondary">
                                        <tr>
                                            <th>번호</th>
                                            <th>게시글제목</th>
                                            <th>작성일</th>
                                            <th>조회수</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	 <c:choose>
											<c:when test="${empty list }">
												<tr>
													<td colspan="4">작성한 게시글이 존재하지 않습니다.</td>
												</tr>
											</c:when>
											
										    <c:otherwise>
												<c:forEach items="${list }" var="freeboard" varStatus="stat">
													<tr>
														<td>${list.size() - stat.index} </td>
														<td>
															<a href="/freeBoard/read?freeNum=${freeboard.freeNum }">
																${freeboard.freeTitle }
															</a>
														</td>
														<td>${freeboard.freeDate }</td>
														<td>${freeboard.viewNum }</td>
													</tr>
											    </c:forEach>
										    </c:otherwise>
								  	  </c:choose>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
          </div>
        <!--///////////Page content wrapper End///////////////-->
  </div>
  
  <div class="tab-pane fade" id="tab2" role="tabpanel" aria-labelledby="tab2-tab">
          <!--//Page content//-->
          <div class="content pt-3 px-3 px-lg-6 d-flex flex-column-fluid">
            <div class="container-fluid px-0">
            
                <div class="row">
                    <div class="col-12 mb-3 mb-lg-5">
                        <div class="card">
                            <div class="table-responsive">
                                <table id="datatable2" class="table mt-0 table-striped table-card table-nowrap">
                                    <thead class="text-uppercase small text-body-secondary">
                                        <tr>
                                            <th>번호</th>
                                            <th>게시글제목</th>
                                            <th>프로젝트 시작일</th>
                                            <th>프로젝트 종료일</th>
                                            <th>작성일</th>
                                            <th>조회수</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	 <c:choose>
											<c:when test="${empty cooList }">
												<tr>
													<td colspan="4">작성한 게시글이 존재하지 않습니다.</td>
												</tr>
											</c:when>
											
										    <c:otherwise>
												<c:forEach items="${cooList }" var="cooboard" varStatus="stat">
													<tr>
														<td>${cooList.size() - stat.index} </td>
														<td>
															<a href="/coco/cooBoard/read?cooNm=${cooboard.cooNm }">
															${cooboard.cooTitle }
															</a>
														</td>
														<td>${cooboard.cooStartDate }</td>
														<td>${cooboard.cooEndDate }</td>
														<td>${cooboard.cooDate }</td>
														<td>${cooboard.viewNum }</td>
													</tr>
											    </c:forEach>
										    </c:otherwise>
								  	  </c:choose>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
          </div>
        <!--///////////Page content wrapper End///////////////-->
        
  </div>
  <div class="tab-pane fade" id="tab3" role="tabpanel" aria-labelledby="tab3-tab">
		<!--//Page content//-->
          <div class="content pt-3 px-3 px-lg-6 d-flex flex-column-fluid">
            <div class="container-fluid px-0">
            
                <div class="row">
                    <div class="col-12 mb-3 mb-lg-5">
                        <div class="card">
                            <div class="table-responsive">
                                <table id="datatable3" class="table mt-0 table-striped table-card table-nowrap">
                                    <thead class="text-uppercase small text-body-secondary">
                                        <tr>
                                            <th>댓글번호</th>
                                            <th>게시글내용</th>
                                            <th>작성일</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	 <c:choose>
											<c:when test="${empty replyList }">
												<tr>
													<td colspan="4">작성한 댓글이 존재하지 않습니다.</td>
												</tr>
											</c:when>
											
										    <c:otherwise>
												<c:forEach items="${replyList }" var="replyboard" varStatus="stat">
													<tr>
														<td>${replyList.size() - stat.index} </td>
<%-- 															<a href="/test/detail?boNo=${purchase.epayNum }"> --%>
<!-- 															</a> -->
														<td>${replyboard.replyContent }</td>
														<td><fmt:formatDate value="${replyboard.replyDate }" pattern="yyyy-MM-dd hh:mm"/></td>
													</tr>
											    </c:forEach>
										    </c:otherwise>
								  	  </c:choose>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
          </div>
        <!--///////////Page content wrapper End///////////////-->
  </div>
  <div class="tab-pane fade" id="tab4" role="tabpanel" aria-labelledby="tab4-tab">
    	<!--//Page content//-->
          <div class="content pt-3 px-3 px-lg-6 d-flex flex-column-fluid">
            <div class="container-fluid px-0">
            
                <div class="row">
                    <div class="col-12 mb-3 mb-lg-5">
                        <div class="card">
                            <div class="table-responsive">
                                <table id="datatable4" class="table mt-0 table-striped table-card table-nowrap">
                                    <thead class="text-uppercase small text-body-secondary">
                                        <tr>
 											<th>번호</th>
                                            <th>게시글제목</th>
                                            <th>조회수</th>
                                            <th>작성일</th>
                                            <th>답변일</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	 <c:choose>
											<c:when test="${empty qnaList }">
												<tr>
													<td colspan="5">작성한 게시글이 존재하지 않습니다.</td>
												</tr>
											</c:when>
											
										    <c:otherwise>
												<c:forEach items="${qnaList }" var="qnaboard" varStatus="stat">
													<tr>
														<td>${qnaList.size() - stat.index} </td>
														
														<td><a href="/coco/QnABoardRead?qnaNum=${qnaboard.qnaNum }">
															${qnaboard.qnaTitle }
														</a></td>
														<td>${qnaboard.viewNum }</td>
														<td><fmt:formatDate value="${qnaboard.qnaDate }" pattern="yyyy-MM-dd hh:mm"/></td>
														<td><fmt:formatDate value="${qnaboard.answerDate }" pattern="yyyy-MM-dd hh:mm"/></td>
													</tr>
											    </c:forEach>
										    </c:otherwise>
								  	  </c:choose>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
          </div>
        <!--///////////Page content wrapper End///////////////-->
  </div>
</div>




<script>
	document.addEventListener("DOMContentLoaded", function() {
		$("#datatable").DataTable({
// 			"filter":false,
               "length":true,
               "bInfo" : false,
               "lengthChange": false, // entity 끄기
               asSorting : [],
               order : [[ 0, "desc"]]
		});
	});

	document.addEventListener("DOMContentLoaded", function() {
		$("#datatable2").DataTable({
// 			"filter":false,
               "length":true,
               "bInfo" : false,
               "lengthChange": false, // entity 끄기
               asSorting : [],
               order : [[ 0, "desc"]]
		});
	});
	
	

	document.addEventListener("DOMContentLoaded", function() {
		$("#datatable3").DataTable({
// 			"filter":false,
               "length":true,
               "bInfo" : false,
               "lengthChange": false, // entity 끄기
               asSorting : [],
               order : [[ 0, "desc"]]
		});
	});

	
	document.addEventListener("DOMContentLoaded", function() {
		$("#datatable4").DataTable({
// 			"filter":false,
               "length":true,
               "bInfo" : false,
               "lengthChange": false, // entity 끄기
               asSorting : [],
               order : [[ 0, "desc"]]
		});
	});
	
</script>    


