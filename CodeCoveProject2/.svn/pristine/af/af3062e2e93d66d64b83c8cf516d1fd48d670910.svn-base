<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


          <!--//Page Toolbar//-->
          <div class="toolbar px-3 px-lg-6 py-3">
            <div class="position-relative container-fluid px-0">
              <div class="row align-items-center position-relative">
                <div class="col-md-8 mb-4 mb-md-0">
                  <h3 class="mb-2">구매내역</h3>

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
                                <table id="datatablePur" class="table mt-0 table-striped table-card table-nowrap">
                                    <thead class="text-uppercase small text-body-secondary">
                                        <tr>
                                            <th>번호</th>
                                            <th>구매번호</th>
                                            <th>상품명</th>
                                            <th>구매일시</th>
                                            <th>결제금액</th>
                                            <th>진행사항</th>
                                            <th>연락</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:choose>
											<c:when test="${empty list }">
												<tr>
													<td colspan="7">조회하신 구매내역이 존재하지 않습니다.</td>
												</tr>
											</c:when>
								
								
										    <c:otherwise>
												<c:forEach items="${list }" var="purchase" varStatus="stat">
													<tr>
														<td>${stat.count }</td>
														<td>
															${purchase.myEprod }
														</td>
														<td>
															<c:if test="${purchase.eprodCateNum eq '템플릿'}">
																<a href="/coco/solution/templateDetail?eprodNum=${purchase.eprodNum }">${purchase.eprodName }</a>
															</c:if>
															<c:if test="${purchase.eprodCateNum eq '멘토링'}">
																<a href="/coco/mentoring/mentoringDetail?eprodNum=${purchase.eprodNum }">${purchase.eprodName }</a>
															</c:if>
															<c:if test="${empty purchase.eprodCateNum }">
																${purchase.eprodName }
															</c:if>
														</td>
														<td><fmt:formatDate value="${purchase.epayDate }" pattern="yyyy-MM-dd hh:mm"/></td>
														<td>
														<fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${purchase.amount }" /></li>
														</td>
														<td>
															<select id="progressChk${stat.count }" name="progressChk${stat.count }" <c:if test="${purchase.progressCode=='완료'}">disabled</c:if>  class="form-select form-select-sm">
																<option value="완료" <c:if test="${purchase.progressCode=='완료'}">selected </c:if>>완료</option>
																<option value="진행중"<c:if test="${purchase.progressCode=='진행중'}">selected</c:if> >진행중</option>
															</select>
														</td>
														<td class="chatBtn" id="chatBtn${stat.count }" style="cursor:pointer;"> <i class="bi bi-chat-dots" style="font-size:20px;"></i></td>
														<input type="hidden" id="epayNum${stat.count }" name="epayNum${stat.count }" value="${purchase.epayNum }" />
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
          <!--//Page content End//-->

<script>

$(function() {
	
	$(".chatBtn").on("click", function() {
		var count = $(this).attr("id").replace("chatBtn", "");
		var epayNum = $("#epayNum"+count).val();
// 		var epayNumStr = epayNum + "";
		console.log("채팅방 중복 확인용 클릭 결제번호 >> ", epayNum);
		
		$.ajax({
			url : "/coco/chatting/roomCheck",
			method : "POST",
			data : {
				'epayNum' : epayNum
			},
			success: function(res) { // roomMap(roomNo / result)
					console.log("res확인 >> ", res);
					if(res.result == 'EXIST') { // 중복채팅방있음
						console.log("채팅방있음");
						window.open('/coco/chatting/chatHome/'+res.roomNo, 'CodeCove', 'width=600,height=700,top=50%,left=50%,scrollbars=yes, resizable=no');
						
					} else if (res.result == 'NOTEXIST') { // 채팅방 없음, insert
						console.log("채팅방 없음, insert Ajax 넣기");
					
						$.ajax({
							url : "/coco/chatting/roomCreate",
							method : "POST",
							data : {
								'epayNum' : epayNum
							},
							success: function(rst) {
									console.log("채팅방 생성 결과화긴 >> " , rst)
									
									if(rst.result == 'OK') { // 중복채팅방있음
										console.log("채팅방생성완");
										window.open('/coco/chatting/chatHome/'+res.roomNo, 'CodeCove', 'width=600,height=700,top=50%,left=50%,scrollbars=yes, resizable=no');
									} 
							} ,  // success
							error : function(error) { // AJAX 요청이 실패했을 때 실행될 콜백 함수
								console.log("채팅방생성대실패쑈");
							}
					  	}); // inset ajax
					}
				} // success
	  		}); // ajax
	}); 

	
	var optionVal = "";
	// select 완료 변경 	
	$("select").on("change", function() {
		optionVal = $(this).val();
		var count = $(this).attr("id").replace("progressChk", "");
		var epayNum = $("#epayNum"+count).val();
	 
		if (optionVal == '완료') {
			
			// alert 띄워서 ok 라면 -> ajax발송
			Swal.fire({
				  title: '선택하신 멘토링의 진행상태를 \'완료\'로 변경하시겠습니까?<br> (변경시 확정됩니다.) ',
				  showDenyButton: true,
				  confirmButtonText: '수정',
				  denyButtonText: `취소`,
				}).then((result) => {
				  if (result.isConfirmed) {
					  
						$.ajax({
							type : "post",
							url : "/coco/progressUpdate",
							data : {
								'epayNum' : epayNum
							},
							success: function(res) {
	// 						    console.log("업데이트 전송 결과  >> ", res);
	
							    Swal.fire({
							        title: '진행상태가 변경되었습니다',
							        icon: 'success',
							        confirmButtonColor: '#3085d6',
							        confirmButtonText: '확인'
							    }).then((result) => {
							        if (result.isConfirmed) {
							            location.href='/coco/myPurchase';
							        }
							    });
							}
	
						}); 
						
				  } else if (result.isDenied) {
				    Swal.fire('변경이 취소되었습니다.', '', 'info');
				    $("#progressChk").val('진행중').prop("selected", true);
				    return;
				  }
				}); 
		}
	});

}); // end 




document.addEventListener("DOMContentLoaded", function() {
	$("#datatablePur").DataTable({
//			"filter":false,
           "length":true,			
           "searching": false, 	  // 검색 끄기
           "lengthChange": false, // entity 끄기
           "bInfo" : false,
           asSorting : [],
           order : [[ 0, "desc"]]
	});
});

</script>    


