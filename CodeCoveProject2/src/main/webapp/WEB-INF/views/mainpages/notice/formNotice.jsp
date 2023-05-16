<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="container pt-7">
	<div class="row">
		<h4 class="h4 text-center">공지사항 작성</h4>
	</div>
	<hr/>
	<form action="/coco/registerNotice" method="POST" id="registerForm" enctype="multipart/form-data">
		<div class="card">
			<div class="row py-2">
				<div class="d-flex">
					<label for="notiTitle" class="col-sm-2 col-form-label text-center">제목</label>
					<div class="col-sm-10">
						<input type="text" id="notiTitle" name="notiTitle" class="form-control" placeholder="제목을 입력해주세요">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="input-group input-group-outline mb-4"> 
						<textarea class="form-control" rows="20" id="notiContent" name="notiContent"></textarea>
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
<script>
$(function() {
	const registerBtn = $("#registerBtn");
	const cancelBtn = $("#cancelBtn");
	const registerForm = $("#registerForm");
	
	CKEDITOR.replace("notiContent", {
		width : '1600px',  // 입력창의 넓이, 넓이는 config.js 에서 % 로 제어
		height : '300px',  // 입력창의 높이
	});
	
	registerBtn.on("click", function(event) {
		event.preventDefault();
		if ($("#qnaTitle").val() == "") {
			Swal.fire({
		          icon: 'warning',
		          title: '제목을 입력해주세요.',
		          showConfirmButton: false,
		          timer: 1500
		        })
			return false;
		}
		if (CKEDITOR.instances.notiContent.getData() == "") {
			Swal.fire({
		          icon: 'warning',
		          title: '내용을 입력해주세요.',
		          showConfirmButton: false,
		          timer: 1500
		        })
			return false;
		}
		registerForm.submit();
	});
	
	cancelBtn.on("click", function() {
		location.href = "/coco/noticeRetrieve";
		registerForm.reset();
	});
	
});
</script>