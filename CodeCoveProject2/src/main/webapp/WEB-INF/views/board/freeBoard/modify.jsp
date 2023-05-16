<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="toolbar px-3 px-lg-6 py-3"></div>
<div>
	<main class="page-content d-flex flex-column flex-row-fluid">
		<div class="position-relative container-fluid px-0">
			<div class="row align-items-center position-relative">
				<div class="col-md-8 mb-4 mb-md-0">
					<h3 class="mb-3">자유게시판</h3>

					<nav aria-label="breadcrumb">
						<ol class="breadcrumb mb-0">
							<li class="breadcrumb-item"><a href="index.html">Home</a></li>
							<li class="breadcrumb-item active">자유게시판</li>
							<li class="breadcrumb-item active">글쓰기</li>
						</ol>
					</nav>
				</div>
				<div class="col-md-4 text-md-end">
					<a href="https://datatables.net/" target="_blank" class="text-body">
						<span class="material-symbols-rounded align-middle ms-1 fs-5">
					</span>
					</a>
				</div>
			</div>
		</div>
		<form class="row gx-4 mb-2" id="insertForm" action="/freeBoard/insert"
			method="post" enctype="multipart/form-data">
			<div>
				<div>
					<input type="text" name="freeTitle" class="form-control"
						style="width: 970px" value="${freeBoardVO.freeTitle }">
				</div>
			</div>
			<div style="height: 20px"></div>
			<div class="col-md-12">
				<div class="input-group input-group-outline mb-4">
					<textarea class="form-control" rows="20" id="freeContent"
						name="freeContent">${freeBoardVO.freeContent }</textarea>
				</div>
			</div>
			<ul>
				<div>
					<c:if test="${not empty freeBoardVO.attatchList }">
						<div>
							<c:forEach items="${freeBoardVO.attatchList }" var="attatches">
								<li><a href="#" class="download"
									data-attnum="${attatches.attatchNum }"
									data-attorder="${attatches.attatchOrder }">${attatches.originNm }</a>
									<span
									class="btn btn-default btn-sm float-right attachmentFileDel"
									id="span_${attatches.attatchNum }"> <i
										class="fas fa-times"></i>
								</span> <br></li>
							</c:forEach>
						</div>
					</c:if>
			</ul>
		</form>
		<div class="col-md-5">
			<div class="mb-5 ps-3">
				<h6 class="mb-1">첨부파일</h6>
				<p class="text-sm">업로드 할 파일을 선택해주세요.</p>
				<div class="input-group input-group-outline">
					<input type="file" class="form-control" name="postFiles"
						multiple="multiple">
				</div>
				<div class="col-md-12">
					<button type="button" class="btn btn-primary" id="insertBtn">등록</button>
					<button type="button" class="btn btn-primary"
						onclick="javascript:location.href='/freeBoard/list'"
						style="float: right;">목록</button>
				</div>
			</div>
		</div>
</div>

<script src="/resources/ckeditor/ckeditor.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		CKEDITOR.replace("freeContent", {

		});
		var insertBtn = $("#insertBtn");
		var cancelBtn = $("#cancelBtn");
		var listBtn = $("#listBtn");

		insertBtn.on("click", function() {
			if ($("#freeTitle").val() == "") {
				alert("제목을 입력해주세요");
				return false;
			}
			if (CKEDITOR.instances.freeContent.getData() == "") {
				alert("내용을 입력해주세요");
				return false;
			}
			insertForm.submit();
		});
		$(".attachmentFileDel")
				.on(
						"click",
						function() {
							var id = $(this).prop("id");
							var idx = id.indexOf("_");
							var attatchNum = id.substring(idx + 1);
							var ptrn = "<input type='text' name='delAttatchNum' value='%V' hidden='hidden'/>";
							$("#insertForm").append(
									ptrn.replace("%V", attatchNum));
							$(this).parents("li:first").hide();
						});

	});
</script>