<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<main>
	<section class="overflow-hidden position-relative">
		<div class="container px-xl-7 py-9 pt-lg-8 position-relative">
			<div class="row">
				<div class="col-lg-8 mx-auto">
					<div class="d-flex flex-column flex-md-row align-items-md-end">
						<div class="flex-grow-1">
							<h2 class="display-7">${cooBoardVO.cooTitle }</h2>
							<ul class="list-inline w-100 small">
								<li class="list-inline-item me-3 text-body-secondary">작성자:
									${cooBoardVO.memNick }</li>
								<br>
								<li class="list-inline-item me-3 text-body-secondary">작성일:
									${cooBoardVO.cooDate }</li>
							</ul>
							<div style="text-align: right;">
								<c:if test="${cooBoardVO.writerId eq memId }">
									<li class="list-inline-item"><a href="/coco/cooBoard/update?cooNm=${cooBoardVO.cooNm}">수정</a> | <a
										href="#">삭제</a></li>
								</c:if>
							</div>
						</div>
					</div>
					<hr class="mb-7 mb-lg-2">
					<p class="mb-4">${cooBoardVO.cooContent }</p>
					<div class="row">
						<p style="font: bolder; color: gray;">첨부파일</p>
						<hr class="mb-7 mb-lg-2">
					</div>
					<!--//////////////////////////////첨부파일 시작////////////////////////////// -->
					<div class="row">
						<div>
							<c:if test="${not empty cooBoardVO.attatchList }">
								<div>
									<c:forEach items="${cooBoardVO.attatchList }" var="attatches">
										<i class='bx bx-paperclip'></i>
										<a href="#" class="download"
											data-attnum="${attatches.attatchNum }"
											data-attorder="${attatches.attatchOrder }">${attatches.originNm }</a>
										<br>
									</c:forEach>
								</div>
							</c:if>
						</div>
					</div>
					<form action="/download" id="downForm">
						<input type="hidden" name="attatchNum" id="attatchNum"> <input
							type="hidden" name="attatchOrder" id="attatchOrder">
					</form>
					<button type="button" class="btn btn-primary"
						onclick="javascript:location.href='/coco/cooBoard/list'"
						style="float: right;">목록</button>
					<!-- /////////////////////////////첨부파일 끝////////////////////////////////// -->
				</div>
				<div class="col-md-4 position-relative">

					<!--신청하기-->
					<c:if test="${cooBoardVO.cooDoneYn eq 'N' && memberCnt ne cooBoardVO.cooPeopleNum}">
						<div data-aos="fade-up"
							class="d-none rounded d-md-block mb-4 border py-5 px-4 shadow-sm">
							<h5 class="mb-3" style="font-weight: bold;">협업 신청하기</h5>
							<p>신청하기 버튼을 클릭해 프로젝트 참여 신청을 해보세요!</p>
							<a href="#modalForm" data-bs-toggle="modal" aria-expanded="false"
								class="btn btn-primary">신청하기</a>
							<!--신청 모달  시작-->
							<!--Modal Form-->
							<div class="modal fade" id="modalForm" tabindex="-1"
								aria-labelledby="modalFormLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content border-0">
										<div class="position-relative border-0 pe-4">
											<button type="button"
												class="btn btn-gray-200 p-0 border-2 width-3x height-3x rounded-circle flex-center position-absolute end-0 top-0 mt-3 me-3 z-1"
												data-bs-dismiss="modal" aria-label="Close">
												<i class="bx bx-x fs-5"></i>
											</button>
										</div>
										<div class="modal-body py-5 border-0">
											<div class="px-3">

												<h3 class="mb-1 display-6">협업 신청하기</h3>
												<p class="mb-4 text-body-secondary">간단한 자기소개 및 서류 제출을
													해주세요</p>
												<div class="position-relative">
													<div>
														<form id="insertForm" action="/coco/cooBoard/apply"
															method="post" enctype="multipart/form-data">
															<div class="input-icon-group mb-3">
																<span class="input-icon"> <i
																	class='bx bxs-user-circle'></i>
																</span> <input type="text" class="form-control"
																	placeholder="${memberVO.memNick }" readonly="readonly">
																<input type="hidden" value="${memberVO.memId }"
																	name="applicantId">
															</div>
															<div class="input-icon-group mb-3">
																<textarea rows="10%" cols="45%" autofocus="autofocus"
																	name="cooFormContent"></textarea>
																<p class="text-sm"></p>
																<div class="input-group input-group-outline">
																	<input type="file" class="form-control"
																		name="postFiles" multiple="multiple"> <input
																		type="hidden" value="${cooBoardVO.cooNm }"
																		name="cooNm">
																</div>
															</div>
															<div class="mb-3 d-flex justify-content-between">
																<div></div>
															</div>
															<div class="d-grid">
																<button class="btn btn-primary" type="submit"
																	id="applyBtn">신청서 제출</button>
															</div>
														</form>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<!--신청 모달  끝 -->
						</div>
					</c:if>
					<c:if test="${cooBoardVO.cooDoneYn eq 'Y' || memberCnt eq cooBoardVO.cooPeopleNum}">
						<div data-aos="fade-up"
							class="d-none rounded d-md-block mb-4 border py-5 px-4 shadow-sm">
							<h5 class="mb-3" style="font-weight: bold;">협업 신청하기</h5>
							<p class="mb-0" style="color: red;">종료되거나 모집이 완료된 프로젝트 입니다.</p>
						</div>
					</c:if>
					<!--Job description-->
					<div data-aos="fade-up"
						class="mb-4 border rounded py-5 px-4 shadow-sm">
						<h5 class="mb-4">프로젝트 상세정보</h5>
						<small class="text-body-secondary mb-2 d-block">프로젝트명</small>
						<p class="mb-0">${cooBoardVO.pjName }</p>
						<hr class="my-3">
						<small class="text-body-secondary mb-2 d-block">프로젝트 시작일</small>
						<p class="mb-0">${cooBoardVO.cooStartDate }</p>
						<hr class="my-3">
						<small class="text-body-secondary mb-2 d-block">프로젝트 종료일</small>
						<p class="mb-0">${cooBoardVO.cooEndDate }</p>
						<hr class="my-3">
						<small class="text-body-secondary mb-2 d-block">프로젝트 참가 인원(참가인원/최대인원)</small>
						<p class="mb-0">${memberCnt }/${cooBoardVO.cooPeopleNum }명</p>
						<hr class="my-3">
						<small class="text-body-secondary mb-2 d-block">프로젝트 종료 여부</small>
						<c:if test="${cooBoardVO.cooDoneYn eq 'Y'}">
							<p class="mb-0" style="color: red;">종료된 프로젝트</p>
						</c:if>
						<c:if test="${cooBoardVO.cooDoneYn eq 'N'}">
							<p class="mb-0" style="color: green;">진행중인 프로젝트</p>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</section>
</main>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="/resources/js/fileDownload.js"></script>
<!--begin:Footer-->
<script type="text/javascript">
	// form submit 이벤트 리스너 등록
	document.querySelector('#insertForm').addEventListener('submit', function (e) {
	  e.preventDefault(); // 기본 이벤트 제거
	  
	  // AJAX 요청
	  let xhr = new XMLHttpRequest();
	  xhr.open(this.method, this.action);
	  xhr.onload = function () {
	    if (xhr.status === 200) { // 요청이 성공적으로 처리됨
	      // sweetalert 알림창 띄우기
	      Swal.fire({
	        icon: 'success',
	        title: '신청이 완료되었습니다!',
	        confirmButtonText: '확인'
	      }).then((result) => {
	        if (result.isConfirmed) { // 확인 버튼 클릭 시 모달 닫기
	          $('#modalForm').modal('hide');
	        }
	      });
	    } else { // 요청이 실패한 경우
	      alert('에러 발생');
	    }
	  };
	  xhr.send(new FormData(this));
	});



	</script>