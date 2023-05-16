<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

  <!--///////////Page content wrapper///////////////-->
          <!--//Page Toolbar//-->
          <div class="toolbar px-3 px-lg-6 py-3">
            <div class="position-relative container-fluid px-0">
              <div class="row align-items-center position-relative">
                <div class="col-md-8 mb-4 mb-md-0">
                  <h3 class="mb-2">멘토 신청 내역</h3>

                </div>
              </div>
            </div>
          </div>
          <!--//Page Toolbar End//-->

          <!--//Page content//-->
          <div class="content pt-3 px-3 px-lg-6 d-flex flex-column-fluid">
            <div class="container-fluid px-0">
                <div class="row">
                    <div class="col-12 mb-3 mb-lg-5">
                        <div class="card">
                            <div class="table-responsive">
                                <table class="table mt-0 table-striped table-card table-nowrap">
                                    <thead class="text-uppercase small text-body-secondary">
                                        <tr>
                                            <th>게시글번호</th>
                                            <th>접수번호</th>
                                            <th>신청일</th>
                                            <th>상태</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    
                                            <c:choose>
											<c:when test="${empty list }">
												<tr>
													<td colspan="4">신청내역이 존재하지 않습니다.</td>
												</tr>
											</c:when>
											
										    <c:otherwise>
												<c:forEach items="${list }" var="mentor" varStatus="stat">
													<tr>
														<td>${list.size() - stat.index} </td>
														<td>
															<a href="/coco/modifyMentor/expFormNum=${mentor.expFormNum }">
															${mentor.expFormNum }
															</a>
														</td>
														<td><fmt:formatDate value="${mentor.expRegDate }" pattern="yyyy-MM-dd hh:mm"/></td>
														<td>${mentor.comCodeNm }
															<c:if test="${mentor.comCodeNm eq '승인거절'}">
																<span class="text-danger">(반려사유 : ${mentor.expRefuse })</span>
															</c:if>
														</td>
													</tr>
											    </c:forEach>
										    </c:otherwise>
								  	  </c:choose>
								  	  
                                    </tbody>
                                </table>
                            </div>
                        </div>
					  		<br>
							  <c:if test="${status eq 'g' }">
							  	<button type="button" onclick="location.href='/coco/applyMentor'" class="btn btn-primary" style="float:right; background-color : #00c7ae; border-color : #00c7ae;" >신청하기</button>
							  </c:if>
                    </div>
                </div>
            </div>
          </div>
          <!--//Page content End//-->
        <!--///////////Page content wrapper End///////////////-->
    



