<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<div class="container">
	<div class="row">
		<h3 class="mb-3">문의게시판</h3>
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb mb-0">
				<li class="breadcrumb-item">
					<a href="index.html">Home</a>
				</li>
				<li class="breadcrumb-item active">문의게시판</li>
				<li class="breadcrumb-item active">글쓰기</li>
			</ol>
		</nav>
	</div>
	
	<form id="registerForm" action="/coco/QnARegister" method="post" enctype="multipart/form-data">
		<div class="row py-2"> 
			<div class="d-flex col-sm-10">
				<label for="qnaTitle" class="col-sm-2 col-form-label">제목</label>
				<div class="col-sm-10">
					<input type="text" id="qnaTitle" name="qnaTitle" class="form-control" placeholder="제목을 입력해주세요">
				</div>
			</div>
			<div class="d-flex col-sm-2">
				<label for="qnaPublicYn" class="col-sm-4 col-form-label text-center text-center">공개여부</label>
				<div class="col">
					<input type="checkbox" id="qnaPublicYn" name="qnaPublicYn" class="form-check mx-2 my-1 pt-2 text-center" value="N">
				</div>
			</div>
		</div>
		
		<div class="row py-2"> 
			<div class="d-flex">
				<label for="qnaPass" class="col-sm-2 col-form-label">게시글 비밀번호</label>
				<div class="col-sm-10">
					<input type="password" id="qnaPass" name="qnaPass" class="form-control">
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-12">
				<div class="input-group input-group-outline mb-4"> 
					<textarea class="form-control" rows="20" id="qnaContent" name="qnaContent"></textarea>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="d-flex">
				<label for="formFileMultiple" class="col-sm-1 col-form-label text-center">첨부파일</label>
				<div class="col-sm-11">
					<input class="form-control" type="file" name="postFiles" id="formFileMultiple" multiple="multiple">
				</div>
			</div>
		</div>
	</form>
	<div class="row my-3">
		<div class="d-flex justify-content-end">
			<button type="button" class="btn btn-primary mx-1 me-2" id="registerBtn">등록</button>
			<button type="button" class="btn btn-primary mx-1" id="cancelBtn" >취소</button>
		</div>
	</div>
</div>


<script src="/resources/ckeditor/ckeditor.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		CKEDITOR.replace("qnaContent", {
			width : '1600px',  // 입력창의 넓이, 넓이는 config.js 에서 % 로 제어
			height : '300px',  // 입력창의 높이
		});
			
		const registerBtn = $("#registerBtn");
		const cancelBtn = $("#cancelBtn");
		const registerForm = $("#registerForm");
		const qnaPublicYn = $("#qnaPublicYn");
		
		qnaPublicYn.on("click", function() {
			result = "";
			if($(this).is(":checked")) {
				result = "N";
			} else {
				result = "Y";
			}
			qnaPublicYn.val(result);
			$("#qnaPass").focus();
		});
		
		
		registerBtn.on("click", function(event) {
			event.preventDefault();
			if ($("#qnaTitle").val() == "") {
				alert("제목을 입력해주세요.");
				return false;
			}
			if (CKEDITOR.instances.qnaContent.getData() == "") {
				alert("내용을 입력해주세요.");
				return false;
			}
			if ($("#qnaPublicYn").is(":checked") && ( $("#qnaPass").val() == null || $("#qnaPass").val() == "" )) {
				alert("비공개 글은 비밀번호를 필수로 입력해야 합니다.");
				return false;
			}
			registerForm.submit();
		});
		
		cancelBtn.on("click", function() {
			location.href = "/coco/QnABoard";
			registerForm.reset();
		});

	});
</script>