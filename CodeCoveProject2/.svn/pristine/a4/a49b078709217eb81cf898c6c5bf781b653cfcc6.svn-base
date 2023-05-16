<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="content pt-0 px-3 px-lg-6 d-flex flex-column-fluid">
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-12 mb-2">
				<form method="POST" action="/coco/admin/codeGroupList" 	id="searchForm" name="searchForm">
					<input type="hidden" name="page" id="page" /> 
					<input type="text" 	id="searchWord" name="searchWord" class="form-control" 	placeholder="검색어를 입력하세요" value="${searchWord }" style="text-transform: uppercase;">
				</form>
			</div>
		</div>
		<div class="row">
			<div class="card">
				<table class="table" id="tbody">
					<thead>
						<tr>
							<th>순번</th>
							<th>선택</th>
							<th>공통코드그룹</th>
							<th>공통코드그룹이름</th>
						</tr>
					</thead>
					<tbody>
						<c:set value="${pagingVO.dataList }" var="grpList" />
						<c:choose>
							<c:when test="${empty grpList }">
								<td colspan="3">조회하실 공통코드그룹이 존재하지 않습니다.</td>
							</c:when>
							<c:otherwise>
								<c:forEach items="${grpList }" var="item">
									<tr>
										<td>${item.RNUM }</td>
										<td>
											<input type="radio" name="radioVal" id="radios" value="${item.comCodeGrp }">
										</td>
										<td>${item.comCodeGrp}</td>
										<td>${item.comCodeGrpNm}</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>
		<div>
			<div class="card-footer mt-2" id="pagingArea">
				${pagingVO.pagingHTML }</div>
			</div>
		<div class="row">
			<div class="card">
				<h4 class="card-title pt-3">관리영역</h4>
				<form method="POST" action="/coco/admin/registerGroup" id="frm">
					<table class="table">
						<tbody id="readTbody">
							<tr>
								<th>공통코드그룹</th>
								<td>
									<input type="text" id="comCodeGrp" name="comCodeGrp" class="form-control" value="">
								</td>
							</tr>
							<tr>
								<th>공통코드그룹이름</th>
								<td>
									<input type="text" id="comCodeGrpNm" name="comCodeGrpNm" class="form-control" value="">
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>
		<div class="row d-flex justify-content-evenly pt-2 mt-1" >
			<input type="button" id="registerBtn" class="btn btn-primary col-sm-2" value="등록">
			<input type="button" id="modifyBtn" class="btn btn-primary col-sm-2" value="수정">
			<input type="button" id="removeBtn" class="btn btn-primary col-sm-2" value="삭제">
			<input type="button" id="resetBtn" class="btn btn-primary col-sm-2" value="리셋">
		</div>
	</div>
</div>





<script type="text/javascript">
	const pagingArea = $("#pagingArea");
	const searchForm = $("#searchForm");
	const frm = $("#frm");
	const registerBtn = $("#registerBtn");
	const modifyBtn = $("#modifyBtn");
	const removeBtn = $("#removeBtn");
	const resetBtn = $("#resetBtn");

	$(function() {
		registerBtn.on("click", function() {
			frm.submit();
		});
		
		modifyBtn.on("click", function() {
			frm.attr("action", "/coco/admin/modifyGroup");
			frm.submit();
		});
		
		removeBtn.on("click", function() {
			if(confirm("정말로 삭제하시겠습니까?")) { 
				frm.attr("action", "/coco/admin/removeGroup");
				frm.submit();
			} else {
				frm.reset();
			}
		});

		resetBtn.on("click", function() {
			$("#comCodeGrp").val("");
			$("#comCodeGrp").attr("readonly", false);
			$("#comCodeGrpNm").val("");
		});
		
		$("#tbody").on("click", "#radios", function() {
			$("#readTbody").find("#comCodeGrp").val($(this).val());
			$("#comCodeGrp").attr("readonly", true);
			$("#comCodeGrp").off("click").on("click", function() {
				Swal.fire({
			          icon: 'warning',
			          title: '공통코드그룹은 수정이 불가합니다.',
			          showConfirmButton: false,
			          timer: 1500
			        })
			});
		});

		$("#searchWord").bind("keyup", function() {
			$(this).val($(this).val().toUpperCase());
		});

		pagingArea.on("click", "a", function(event) {
			event.preventDefault();
			var pageNo = $(this).data("page");
			searchForm.find("#page").val(pageNo);
			searchForm.submit();
		});

	});
</script>