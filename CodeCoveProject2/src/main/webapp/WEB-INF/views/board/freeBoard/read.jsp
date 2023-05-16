<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<body>
	<section class="position-relative border-bottom">
		<div class="container pb-9 pb-lg-2">
			<div class="row">
				<div class="col-xl-9 mx-auto">
					<div class="position-relative pb-3 pb-lg-0">
						<div class="d-flex align-items-center w-100"></div>
						<div>
							<h5 class="my-2 display-6">${freeBoardVO.freeTitle }</h5>
							<div class="d-flex pt-2 mb-0 small align-items-center">
								<small class="text-body-secondary">${freeBoardVO.freeDate }</small>
								<span class="text-body-secondary d-inline-block"></span><br>
							</div>
							By ${freeBoardVO.memNick }
						</div>
						<div style="text-align: right;">
							<a href="/freeBoard/${freeBoardVO.freeNum}/update">수정</a> | <a
								href="/freeBoard/${freeBoardVO.freeNum}/delete">삭제</a>
						</div>
						<!-- 신고하기 modal시작                   -->
						<a href="#modalForm" data-bs-toggle="modal" aria-expanded="false"
							class="btn btn-outline-danger" style="float: right;">신고하기</a>


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

											<h2 class="mb-1 display-6">Welcome back!</h2>
											<p class="mb-4 text-body-secondary">Please Sign In with
												details...</p>
											<div class="position-relative">
												<div>
													<form>
														<div class="input-icon-group mb-3">
															<span class="input-icon"> <i
																class="bx bx-envelope"></i>
															</span> <input type="email" class="form-control" autofocus=""
																placeholder="Username">
														</div>
														<div class="input-icon-group mb-3">
															<span class="input-icon"> <i class="bx bx-key"></i>
															</span> <input type="password" class="form-control"
																placeholder="Password">
														</div>
														<div class="mb-3 d-flex justify-content-between">
															<div class="form-check">
																<input class="form-check-input" type="checkbox" value=""
																	id="flexCheckDefault"> <label
																	class="form-check-label" for="flexCheckDefault">
																	Remember me </label>
															</div>
															<div>
																<label class="text-end d-block small mb-0"><a
																	href="#" class="text-body-secondary link-decoration">Forget
																		Password?</a></label>
															</div>
														</div>

														<div class="d-grid">
															<button class="btn btn-primary" type="submit">
																Sign in</button>
														</div>
													</form>

													<!---->
													<p class="pt-4 text-body-secondary">
														Don’t have an account yet? <a href="#"
															class="ms-2 text-dark fw-semibold link-underline">Sign
															Up</a>
													</p>
													<!--Divider-->
													<div class="d-flex align-items-center py-3">
														<span class="flex-grow-1 border-bottom pt-1"></span> <span
															class="d-inline-flex flex-center lh-1 width-2x height-2x rounded-circle mx-2 text-mono">or</span>
														<span class="flex-grow-1 border-bottom pt-1"></span>
													</div>
													<div class="d-grid">
														<a href="#!"
															class="d-flex hover-lift btn-gray-200 mb-2 btn position-relative flex-center">
															<!--Main Icon-->
															<div class="position-relative d-flex align-items-center">
																<img src="assets/img/brands/google.svg" alt=""
																	class="width-2x me-2"> <span>sign in with
																	google</span>
															</div>
														</a> <a href="#!"
															class="d-flex hover-lift btn-gray-200 btn position-relative flex-center">
															<!--Main Icon-->
															<div class="position-relative d-flex align-items-center">
																<img src="assets/img/brands/Facebook.svg" alt=""
																	class="width-2x me-2"> <span>sign in with
																	facebook</span>
															</div>
														</a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- 신고하기 modal끝                   -->
						<hr style="height: 20px;">
						<article class="article mb-9">
							<p class="mb-5">${freeBoardVO.freeContent }</p>
							<div class="row">
								<div class="col-md-6"></div>
								<div class="col-md-6"></div>
							</div>
							<div style="height: 200px;"></div>
							<!--//////////////////////////////첨부파일 시작////////////////////////////// -->
							<div>
								<c:if test="${not empty freeBoardVO.attatchList }">
									<div>
										<c:forEach items="${freeBoardVO.attatchList }" var="attatches">
											<a href="#" class="download"
												data-attnum="${attatches.attatchNum }"
												data-attorder="${attatches.attatchOrder }">${attatches.originNm }</a>
											<br>
										</c:forEach>
									</div>
								</c:if>
							</div>
							<form action="/download" id="downForm">
								<input type="hidden" name="attatchNum" id="attatchNum">
								<input type="hidden" name="attatchOrder" id="attatchOrder">
							</form>

							<!-- /////////////////////////////첨부파일 끝////////////////////////////////// -->
						</article>
						<!--/.article-->
						<div class="d-flex justify-content-end align-items-center mb-9">
							<div></div>
						</div>
						<button type="button" class="btn btn-primary"
							onclick="javascript:location.href='/freeBoard/list'"
							style="float: right;">목록</button>
						<!--/////////////////////////////댓글 시작/////////////////////////////-->
						<!--/.comments-->
						<h4 class="mb-4">댓글</h4>
						<jsp:include page="freeBoardReply.jsp" />
					</div>
				</div>
				<!--/////////////////////////////댓글 끝/////////////////////////////-->
			</div>
	</section>

	<!-- 	</main> -->
	<!-- begin Back to Top button -->
	<a href="#" class="toTop"> <i class="bx bxs-up-arrow"></i>
	</a>
	<!-- scripts -->
	<script src="/resources/js/fileDownload.js"></script>
	<script src="/resources/assets/js/theme.bundle.min.js"></script>

</body>
</html>
