<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h2>공통코드그룹 관리</h2>

<a href="/coco/admin/codelist">공통코드관리로 돌아가기</a>

<div class="card">
	<table id="datatable" class="table mt-0 table-striped table-card table-nowrap">
		<thead class="text-uppercase small text-body-secondary">
			<tr>
				<th>선택</th>
				<th>공통코드그룹</th>
				<th>공통코드그룹이름</th>
			</tr>
		</thead>
		<tbody id="tbody">
			<c:forEach items="${codeGrpList }" var="codeGrp">
				<tr>
					<td><input type="radio" name="radioVal" id="radios" value="${codeGrp.comCodeGrp }"></td>
					<td>${codeGrp.comCodeGrp }</td>
					<td>${codeGrp.comCodeGrpNm }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<div>
	<input type="button" value="등록" id="addGroupBtn" data-bs-toggle="modal" 	data-bs-target="#modalForm"> 
	<input type="button" value="수정" id="updateGroupBtn" data-bs-toggle="modal" data-bs-target="#modalForm">
	<input type="button" value="삭제" id="deleteGroupBtn">
</div>

<!-- //////////////////////////////// Modal Page //////////////////////////////// -->

<div class="modal fade" id="modalForm" tabindex="-1" aria-labelledby="modalFormLabel" aria-hidden="true">
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
					<h3 id="modalH3"> 공통코드그룹 <span id="headerText">등록</span>
					</h3>
					<div class="position-relative">
						<div>
							<form id="sFrm" method="post" action="/coco/admin/registerGroup">
								<div id="infotext"></div>
								<div class="input-icon-group mb-3">
									<input type="text" id="comCodeGrp" name="comCodeGrp" class="form-control" placeholder="공통코드그룹 영문명" value="">
								</div>
								<div class="input-icon-group mb-3">
									<input type="text" id="comCodeGrpNm" name="comCodeGrpNm" class="form-control" placeholder="공통코드그룹 한글명">
								</div>
								<div class="d-grid">
									<button class="btn" id="subBtn" type="button">등록</button>
									<button class="btn" type="button" data-bs-dismiss="modal">취소</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>




<script type="text/javascript">
	const updateBtn = document.querySelector("#updateGroupBtn");
	const delBtn = document.querySelector("#deleteGroupBtn");
	const postFrm = document.querySelector("#postFrm");
	const comCodeGrp = document.querySelector("#comCodeGrp");
	const sFrm = $("#sFrm");

	$(function() {
		// 라디오에 부여된 관리코드그룹 가져와서 input hidden의 value값에 넣기
		$("#tbody").on("click", "#radios", function() {
			let val = $(this).val();
			f_inputHidden(val)
		});
		
		function f_inputHidden(val) {
			$("#comCodeGrp").val(val);
		};

		$("#addGroupBtn").on("click", function() {
			$("#headerText").text("등록");
			$("#subBtn").text("등록");
			$("#infotext").text("");
			$("#comCodeGrp").attr("readonly", false);
		});

		$("#updateGroupBtn").on("click", function() {
			$("#headerText").text("수정");
			$("#subBtn").text("수정");
			$("#infotext").text("공통코드그룹은 한글명만 수정 가능합니다.");
			$("#comCodeGrp").attr("readonly", true);

			if ($("#comCodeGrp").val() == null 	|| $("#comCodeGrp").val() == "") {
				$("#comCodeGrp").val("공통코드그룹은 반드시 선택해야합니다.").css("color", "red");
			} else {
				$("#comCodeGrp").css("color", "black");
			};
		});

		// 등록과 수정을 클릭했을때
		$("#subBtn").on("click", function() {
			var btnText = $(this).text();
			if (btnText == "수정") {
				if (confirm("정말로 수정하시겠습니까?")) {
					sFrm.attr("action", "/coco/admin/modifyGroup");
					sFrm.attr("method", "post");
					sFrm.submit();
				} else {
					sFrm.reset();
				}
			} else {
				sFrm.submit();
			}
		});

		$("#deleteGroupBtn").on("click", function() {
			if (confirm("정말로 삭제하시겠습니까?")) {
				sFrm.attr("action", "/coco/admin/removeGroup");
				sFrm.attr("method", "post");
				sFrm.submit();
			} else {
				sFrm.reset();
			}
		});

		$("#addGroupBtn").on("click", function() {
			$("#comCodeGrp").val("");
		});


		$('#datatable').DataTable({
			"filter" : true
		});

		// $("#tbody").on("click", "#radios", function() {
		// 	console.log($(this).val());
		// });

	});
</script>