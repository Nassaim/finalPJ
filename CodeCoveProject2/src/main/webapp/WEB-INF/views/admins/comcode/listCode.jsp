<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
	.card-title {
		margin: 15px 0px 5px 10px;
	}
</style>


<!--//Page content//-->
<div class="content pt-0 px-3 px-lg-6 d-flex flex-column-fluid">
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-12 mb-2">
				<form method="POST" action="/coco/admin/codelist" id="searchForm" name="searchForm">
					<input type="hidden" name="page" id="page"/>
					<input type="text" id="searchWord" name="searchWord" class="form-control" placeholder="검색어를 입력하세요" value="${searchWord }" style="text-transform: uppercase;">
				</form>
			</div>
		</div>
		<div class="row" id="cardRow">
			<div class="card">
				<table id="datatable" class="table">
					<thead>
						<tr>
							<th>순번</th>
							<th>공통코드 대분류(한글명)</th>
							<th>공통코드내용</th>
						</tr>
					</thead>
					<tbody id="listTbody">
						<c:set var="codeList" value="${pagingVO.dataList }"/>
						<c:choose>
							<c:when test="${empty codeList }">
								<td colspan="3">조회할 공통코드가 존재하지 않습니다.</td>
							</c:when>
							<c:otherwise>
								<c:forEach items="${codeList }" var="code">
									<tr id="listTrs">
										<td>${code.RNUM }</td>
										<td>${code.comCodeGrp }(${code.comCodeGrpNm })</td>
										<td style="display: none;">${code.comCodeGrp }</td>
										<td style="display: none;">${code.comCodeGrpNm }</td>
										<td style="display: none;">${code.comCode }</td>
										<td>${code.comCodeNm }</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table> 
			</div>
		</div>
		<div class="card-footer clearfix mt-2" id="pagingArea">
			${pagingVO.pagingHTML }
		</div>
		<div class="row">
			<div class="card col-sm-7"  >
				<h5 class="card-title">선택 공통코드 세부조회</h5>
				<table class="table">
					<thead>
						<tr>
							<th>순번</th>
							<th>공통코드 대분류</th>
							<th>공통코드 대분류(한글명)</th>
							<th>공통코드ID</th>
							<th>공통코드내용</th>
						</tr>
					</thead>
					<tbody id="readTbody">
						<tr id="readTrs"> 
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr> 
					</tbody>
				</table>
				<div style="text-align: right;">
					<input type="button" id="selectBtn" value="선택">
				</div>
			</div>
			<div class="card col-sm-5">
				<h5 class="card-title">공통코드 관리</h5>
				<form action="/coco/admin/registerComCode" method="post" id="frm">
					<table>
						<tbody id="formTbody" class="ml-3">
							<tr id="formTrs"> 
								<th class="mr-2">공통코드 대분류(한글)</th>
								<td class="ml-2">
									<c:set value="${grpList }" var="grpList"/>
									<select id="comCodeGrpNm" name="comCodeGrpNm" class="ml-2">
										<option>선택</option>
										<c:forEach items="${grpList }" var="item">
											<option value="${item.comCodeGrpNm }" data-grp="${item.comCodeGrp }">${item.comCodeGrpNm }</option>
										</c:forEach>
									</select>
								</td>
							</tr> 
							<tr> 
								<th class="mr-2">공통코드 대분류</th>
								<td>
									<span id="comCodeGrpSpan"></span>
									<input type="hidden" name="comCodeGrp" id="comCodeGrp" value="">
								</td>
							</tr> 
							<tr> 
								<th class="mr-2">공통코드ID</th>
								<td>
									<input type="text" id="comCode" name="comCode" style="text-transform: uppercase;">
								</td>
							</tr> 
							<tr> 
								<th class="mr-2">공통코드내용</th>
								<td><input type="text" id="comCodeNm" name="comCodeNm"></td>
							</tr> 
						</tbody>
					</table>
					<div class="row d-flex justify-content-evenly pt-1 pb-2" >
						<input type="button" id="registerBtn" class="col-sm-2" value="등록">
						<input type="button" id="modifyBtn" class="col-sm-2" value="수정">
						<input type="button" id="removeBtn" class="col-sm-2" value="삭제">
						<input type="button" id="resetBtn" class="col-sm-2" value="리셋">
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

		

<script type="text/javascript">
$(function(){
	const searchForm = $("#searchForm");
	const pagingArea = $("#pagingArea");
	const listTbody = $("#listTbody");
	const listTrs = $("#listTrs");
	const readTbody = $("#readTbody");
	const readTrs = $("#readTrs");
	const frm = $("#frm");
	const selectBtn = $("#selectBtn");
	const registerBtn = $("#registerBtn");
	const modifyBtn = $("#modifyBtn");
	const resetBtn = $("#resetBtn");
	const removeBtn = $("#removeBtn");
	const formTbody = $("#formTbody");
	
	$("#comCode").keyup(function(event) {
		var keyCode = event.keyCode == 0 ? event.charCode : event.keyCode;
	    // 예외키 규정
	    var specialKeys = new Array();
	    specialKeys.push(8); //Backspace
	    specialKeys.push(9); //Tab
	    specialKeys.push(16); //Shift
	    specialKeys.push(17); //Ctrl
	    specialKeys.push(27); //ESC
	    specialKeys.push(46); //Delete
	    specialKeys.push(36); //Home
	    specialKeys.push(35); //End
	    specialKeys.push(37); //Left
	    specialKeys.push(39); //Right
	    var ret = ((keyCode >= 48 && keyCode <= 57) || (keyCode >= 65 && keyCode <= 90) || (keyCode >= 97 && keyCode <= 122) || (specialKeys.indexOf(event.keyCode) != -1 && event.charCode != event.keyCode));
	   // error message
	    if (!ret) { Swal.fire({
	    	icon : 'warning',
	    	title : '공통코드ID는 숫자와 영어만 입력 가능합니다.',
	    	showConfirmButton: false,
	    	timer: 1500
	    	}) }    
	    return ret;
	});
	
	$("#comCode").bind("keyup", function() {
        $(this).val($(this).val().toUpperCase());
    });
	
	$("#searchWord").bind("keyup", function() {
        $(this).val($(this).val().toUpperCase());
    });
	
	formTbody.on("change", "#comCodeGrpNm", function() {
		let dataGrp = $("#comCodeGrpNm option:checked").data("grp")
		$("#comCodeGrpSpan").html(dataGrp);
		
		let text = $("#comCodeGrpSpan").text();
		$("#comCodeGrp").val(text);
	});

	
	registerBtn.on("click", function() {
		if( $("#comCodeGrpNm").val() == "선택" || $("#comCodeGrpNm").val() == null || $("#comCodeGrpNm").val() == "" ) {
			Swal.fire({
		          icon: 'warning',
		          title: '공통코드 대분류는 필수로 선택해야 등록 가능합니다.',
		          showConfirmButton: false,
		          timer: 1500
		        });
		};
		// 중복체크... 어떻게 하지.....
		
		frm.submit();
	});
	
	modifyBtn.on("click", function() {
		frm.attr("action", "/coco/admin/modifyCode");
		frm.submit();
	});
	
	removeBtn.on("click", function() {
		if(confirm("정말로 삭제하시겠습니까?")) {
			frm.attr("method", "post");
			frm.attr("action", "/coco/admin/removeComCode");
			frm.submit();
		} else {
			frm.reset();
		}
	});
	
	resetBtn.on("click", function() {
		$("#comCodeGrpNm").find("option:first").prop('selected', true);
		$("#comCode").val("");
		$("#comCode").attr("readonly", false);
		$("#comCode").off("click");
		$("#comCodeNm").val("");
		$("#comCodeGrpSpan").html("");
		$("#comCodeGrp").val("");
	});
	
	selectBtn.off("click").on("click", function() {
		let selectCodeGrp = $.trim($("#readTrs").find("td:eq(1)").html()); 
		let selectGrpNm = $.trim($("#readTrs").find("td:eq(2)").html());
		let selectCode = $.trim($("#readTrs").find("td:eq(3)").html());
		let selectCodeNm = $.trim($("#readTrs").find("td:eq(4)").html());
		
		$("#comCodeGrpNm:eq(0)").val(selectGrpNm); 
		$("#comCodeGrpSpan").html($.trim(selectCodeGrp));
		$("#comCode").val(selectCode);
		$("#comCode").attr("readonly", true)
		$("#comCode").off("click").on("click", function() {
			Swal.fire({
		          icon: 'warning',
		          title: '공통코드ID는 수정할 수 없습니다.',
		          showConfirmButton: false,
		          timer: 1500
		        });
		});
		$("#comCodeNm").val(selectCodeNm);
		let text = $("#comCodeGrpSpan").text();
		$("#comCodeGrp").val(text);
	});
	
	if(	$("#readTrs").find("td:eq(0)").text() == null || $("#readTrs").find("td:eq(0)").text() == "" 
		|| $("#readTrs").find("td:eq(1)").text() == null || $("#readTrs").find("td:eq(1)").text() == ""
		|| $("#readTrs").find("td:eq(2)").text() == null || $("#readTrs").find("td:eq(2)").text() == ""
		) {
			$("#readTrs").find("td:eq(0)").css("colspan", $("readTrs td").length);
			$("#readTrs").find("td:eq(0)").html("조회할 데이터를 목록에서 선택해주세요.");
		}
		
	listTbody.on("click", "#listTrs", function() {
		let detailRnum = $(this).find("td:eq(0)").html();
		let detailComCodeGrp = $(this).find("td:eq(2)").html();
		let detailComCodeGrpNm = $(this).find("td:eq(3)").html();
		let detailComCode = $(this).find("td:eq(4)").html();
		let detailComCodeNm = $(this).find("td:eq(5)").html();
		
		$("#readTrs").find("td:eq(0)").html(detailRnum);
		$("#readTrs").find("td:eq(1)").html(detailComCodeGrp);
		$("#readTrs").find("td:eq(2)").html(detailComCodeGrpNm);
		$("#readTrs").find("td:eq(3)").html(detailComCode);
		$("#readTrs").find("td:eq(4)").html(detailComCodeNm);
	});
	
	pagingArea.on("click", "a", function(event){
		event.preventDefault();
		var pageNo = $(this).data("page");
		searchForm.find("#page").val(pageNo);
		searchForm.submit();
	});
	
});
</script>
