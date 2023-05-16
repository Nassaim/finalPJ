<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<main class="container-fluid px-6">
	<div class="row align-items-center position-relative">
		<div class="col-sm-8">
			<h3 class="mb-3">협업게시판</h3>
			<nav aria-label="breadcrumb" class="py-2 my-2">
				<ol class="breadcrumb mb-0">
					<li class="breadcrumb-item">
						<a href="index.html">Home</a>
					</li>
					<li class="breadcrumb-item active">협업게시판</li>
					<li class="breadcrumb-item active">글쓰기</li>
				</ol>
			</nav>
			<form class="row gx-4 mb-2" id="insertForm" action="/coco/cooBoard/insert" method="post" enctype="multipart/form-data">
				<div class="row pb-2">
					<input type="text" name="cooTitle" class="form-control" placeholder="제목을 입력해주세요...">
				</div>
				<div class="row">
					<textarea class="form-control" rows="20" id="cooContent" name="cooContent"></textarea>
				</div>
				<div class="row">
					<p class="text-sm"></p>
					<p class="text-sm"></p>
					<h6 class="mb-1">※협업신청시 필요한 서류와 같은 파일들을 첨부할 수 있어요.(게시글에 보여주고자 하는 이미지파일은 에디터로 직접 등록해주세요.)</h6>
					<div class="col">
						<input type="file" class="form-control" name="postFiles" multiple="multiple">
					</div>
				</div>
				<input type="hidden" id="pjStartDate" name="cooStartDate" value=""/>
				<input type="hidden" id="pjEndDate" name="cooEndDate" value=""/>								
				<input type="hidden" id="pjPnum" name="cooPeopleNum" value=""/>
				<input type="hidden" id="pjProgress" name="pjProgress" value=""/>
				<input type="hidden" id="projectId" name="pjId" value=""/>
				<div class="row">
					<div class="d-flex justify-content-end pt-3">
						<button type="button" class="btn btn-primary col-sm-2 px-1 mx-1" id="insertBtn" >등록</button>
						<button type="button" class="btn btn-primary col-sm-2 px-1 mx-1" onclick="javascript:location.href='/cooBoard/list'">목록</button>
					</div>
				</div>
			</form>	
		</div>
		
		<!--///////////////////////제목 내용/////////////////////////////  -->
		
		<div class="col-sm-4">
			<div class="width-20px">
				<select id="projectSelect" class="form-control form-control-sm" data-choices='{"searchEnabled":false,"allowHTML":true,"itemSelectText":""}'>
					<option value="" disabled selected>프로젝트를 선택해주세요.</option>
					<c:if test="${not empty projectList }">
						<c:forEach items="${projectList }" var="project">
							<option value="${project.pjName }"
								data-projectnum="${project.pjId }">${project.pjName }</option>
						</c:forEach>
					</c:if>
				</select>
			</div>
			<div data-aos="fade-up" class="mb-4 border rounded py-5 px-4 shadow-sm">
				<h5 class="mb-4">프로젝트 상세정보</h5>
				<small class="text-body-secondary mb-2 d-block">프로젝트 시작일</small>
				<p class="mb-0"></p>
				<hr class="my-3">
				<small class="text-body-secondary mb-2 d-block">프로젝트 종료일</small>
				<p class="mb-0"></p>
				<hr class="my-3">
				<small class="text-body-secondary mb-2 d-block">프로젝트 참가 인원(참가인원/최대인원)</small>
				<p class="mb-0"></p>
				<hr class="my-3">
				<small class="text-body-secondary mb-2 d-block">프로젝트 진행도</small>
				<p class="mb-0"></p>
			</div>
		
		</div>
	</div>
</main>

<!--/////////////////////////프로젝트 선택란////////////////////////////-->
<!-- sweet alert style -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="/resources/ckeditor/ckeditor.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
	

	
		$(function() {
			CKEDITOR.replace("cooContent", {

			});
			
			
			var insertBtn = $("#insertBtn");
			var cancelBtn = $("#cancelBtn");
			var listBtn = $("#listBtn");
		
			
			insertBtn.on("click", function() {
				if ($("#cooTitle").val() == "") {
					  Swal.fire({
					        icon: 'warning',
					        title: '제목을 입력해주세요.',
					        showConfirmButton: true,
					      })
					return false;
				}
				if (CKEDITOR.instances.cooContent.getData() == "") {
					  Swal.fire({
					        icon: 'warning',
					        title: '내용을 입력해주세요.',
					        showConfirmButton: true,
					      })
					return false;
				}
				
				if($("#projectId").val()=="" || $("#projectId").val() == null){
					  Swal.fire({
					        icon: 'warning',
					        title: '프로젝트 선택은 필수 사항입니다.',
					        showConfirmButton: true,
					      })
					return false;
				}
				
				console.log("프젝 값 확인:  ", $("#projectId").val());
				insertForm.submit();
			});
		
		});
	</script>
	<!--Select scripts-->
	<script src="/resources/assets/vendor/node_modules/js/choices.min.js"></script>
	<script>
		$("#projectSelect").on(
						"change",
						function() {
							var value = $(this).val();
							var pjnum = $(this).find("option:selected").data("projectnum");
							// input hidden에 값 채워넣기
							$("#projectId").val(pjnum);
							console.log("projectnum 넘어오나 체크: ", pjnum);
							console.log("값 채워넣은거 확인 : ", $("#projectId").val());
							
							$.ajax({
										url : "/coco/cooBoard/CooProjectAjax", // AJAX 요청을 보낼 URL
										contentType : "application/json;charset=utf-8",
										method : "POST", // HTTP 요청 메서드
										data : JSON.stringify({
											pjId : pjnum
										}), // 요청에 포함할 데이터
										dataType : "json", // 응답 데이터 형식
										success : function(response) { // AJAX 요청이 성공했을 때 실행될 콜백 함수
											// 응답으로 받은 데이터를 사용하여 프로젝트 상세정보 출력
											console.log("아작스 성공 결과 확인 >>",response);
											$("div[data-aos='fade-up'] small:nth-of-type(1) + p").text(response.pjStartDate);	 // 시작일
											$("div[data-aos='fade-up'] small:nth-of-type(2) + p").text(response.pjEndDate); 	// 종료일
											$("div[data-aos='fade-up'] small:nth-of-type(3) + p").text(response.memCount + "/" + response.pjPnum+"명"); 		// 참가 인원
											$("div[data-aos='fade-up'] small:nth-of-type(4) + p").text(response.pjProgress);	// 진행도
													
											$("#pjStartDate").val(response.pjStartDate);		
											$("#pjEndDate").val(response.pjEndDate);		
											$("#pjPnum").val(response.pjPnum);		
											$("#pjProgress").val(response.pjProgress);		
											
											console.log("pjStartDate : ", $("#pjStartDate").val());
											console.log("pjEndDate : ", $("#pjEndDate").val());
											console.log("pjPnum : ", $("#pjPnum").val());
											console.log("pjStartDate : ", $("#pjProgress").val());
													
													
										},
										error : function(xhr, status, error) { // AJAX 요청이 실패했을 때 실행될 콜백 함수
											console.error(error); // 에러 메시지 출력
										}
									});

						});
		//ckeditor 이미지 직접 업로드 탭 추가
		 CKEDITOR.replace('cooContent', {
         footnotesPrefix : 'a',
         filebrowserUploadUrl : '${pageContext.request.contextPath }/imageUpload.do'
      });
	</script>