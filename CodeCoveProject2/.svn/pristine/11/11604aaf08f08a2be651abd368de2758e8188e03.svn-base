<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 

<div class="container-fluid">
	<div class="row">
		<div class="card">
			<form action="/coco/admin/registerExpert" method="post" id="rFrm">
				<h5 class="h5 mt-2">멘토신청서 정보</h5>
				<div class="row d-flex">
					<div class="col-sm-4 d-flex">
						<label for="expFormNum" class="col-sm-4 col-form-label text-center">신청서 식별코드</label>
						<div class="col-sm-8">
							<input type="text" id="expFormNum" name="expFormNum" class="form-control text-center" value="${expertVO.expFormNum }" readonly="readonly">
						</div>
					</div>
					<div class="col-sm-4 d-flex">
						<label for="comCodeNm" class="col-sm-4 col-form-label text-center">진행상태</label>
						<div class="col-sm-8">
							<input type="text" id="comCodeNm" name="comCodeNm" class="form-control text-center" value="${expertVO.codeList[0].comCodeNm}"  readonly="readonly">
						</div>
					</div>
					<div class="col-sm-4 d-flex">
						<label for="expRegDate" class="col-sm-4 col-form-label text-center">신청날짜</label>
						<div class="col-sm-8"> 
							<input type="text" id="expRegDate" class="form-control text-center" value="<fmt:formatDate value="${expertVO.expRegDate }" pattern="YYYY-MM-DD"/>" readonly="readonly">
						</div>
					</div>
				</div>
				
				<h5 class="h5 mt-2">멘토신청 회원정보</h5>
				<div class="row d-flex">
					<div class="row">
						<div class="col d-flex">
							<label for="formId" class="col-sm-4 col-form-label text-center">회원ID</label>
							<div class="col-sm-8">
								<input type="text" id="formId" name="expertId" class="form-control text-center" value="${expertVO.formId }" readonly="readonly">
							</div>
						</div>
						<div class="col d-flex">
							<label for="memName" class="col-sm-4 col-form-label text-center">회원이름</label>
							<div class="col-sm-8">
								<input type="text" id="memName" name="memName" class="form-control text-center" value="${expertVO.memberList[0].memName}" readonly="readonly">
							</div>
						</div>
						<div class="col d-flex">
							<label for="memNick" class="col-sm-4 col-form-label text-center">회원별명</label>
							<div class="col-sm-8">
								<input type="text" id="memNick" name="memNick" class="form-control text-center"  value="${expertVO.memberList[0].memNick}" readonly="readonly">
							</div>
						</div>
						<div class="col d-flex">
							<label for="memMail" class="col-sm-4 col-form-label text-center">회원E-mail</label>
							<div class="col-sm-8">
								<input type="text" id="memMail" name="memMail" class="form-control text-center" value="${expertVO.memberList[0].memMail}" readonly="readonly">
							</div>
						</div>
						<div class="col d-flex">
							<label for="memHP" class="col-sm-4 col-form-label text-center">회원연락처</label>
							<div class="col-sm-8">
								<input type="text" id="memHP" name="memHP" class="form-control text-center" value="${expertVO.memberList[0].memHP}" readonly="readonly">
							</div>
						</div>
					</div>
				</div>
				
				<h5 class="h5 mt-2">멘토신청자 경력정보</h5>
				<div class="row"> 
					<div class="input-group text-center">
						<span class="input-group-text col-sm-1 text-center">자기소개</span>
						<div class="col-sm-11">
							<textarea rows="6" class="form-control" name="presentation" aria-label="자기소개" readonly="readonly" style="resize: none;">${expertVO.expFormContent}</textarea>
						</div>
					</div>
					<div class="input-group mt-2 text-center">
						<span class="input-group-text col-sm-1 text-center">포트폴리오 링크</span>
						<div class="col-sm-11">
							<textarea rows="1" class="form-control" name="assume" aria-label="포트폴리오 링크" readonly="readonly" style="resize: none;">${expertVO.expFormAssume}</textarea>
						</div>
					</div>
					<div class="row">포트폴리오 파일</div>
					<div class="row d-flex mt-2">
						<div class="col-sm-12 d-flex" style="border: solid 1px lightgray; height: 180px; border-radius: 8px;">
							<div class="col-sm-3" id="pplist" style="overflow-y: scroll; overflow-x: hidden;">
								<table class="table table-hover" style="width: 100%;">
									<tbody id="tbody">
										<c:forEach items="${expertVO.attatchList}" var="files" varStatus="status">
											<tr> 
												<td onclick="f_dispImg('${files.saveNm}')">
													${files.originNm }
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div class="col-sm-9" id="disp">
								<div style="height: 130px">
									<img src="" alt="image" id="dispIMG" style="width: 130px; height: 100%; padding: 5px;">
								</div>
								<div class="row d-flex flex-row-reverse">
									<div class="col-sm-2">
										<input type="button" value="선택항목 다운로드" class="btn">
									</div>
									<div class="col-sm-2">
										<input type="button" value="전체 다운로드" class="btn">
									</div>
								</div>
							</div>
						</div>
					</div>
					
					
					<h5 class="h5">직무정보</h5>
					<div class="row mt-2">
						<div class="col-sm-4 d-flex">
							<label for="expJobMajor" class="col-sm-4 col-form-label text-center">주요직무</label>
							<div class="col-sm-8"> 
								<input type="text" id="expJobMajor" name="expJobMajor" class="form-control text-center" value="${expertVO.expJobMajor}" readonly="readonly">
							</div>
						</div>
						<div class="col-sm-4 d-flex">
							<label for="expJobLevel" class="col-sm-4 col-form-label text-center">경력기간</label>
							<div class="col-sm-8"> 
								<input type="text" id="expJobLevel" name="expJobLevel" class="form-control text-center" value="${expertVO.expJobLevel}" readonly="readonly">
							</div>
						</div>
						<div class="col-sm-4 d-flex">
							<label for="expJobCurrent" class="col-sm-4 col-form-label text-center">현재직업</label>
							<div class="col-sm-8"> 
								<input type="text" id="expJobCurrent" name="expJobCurrent" class="form-control text-center" value="${expertVO.expJobCurrent}" readonly="readonly">
							</div>
						</div>
					</div>
				</div>
			</form>
			<div class="row d-flex justify-content-end my-3">
				<div class="col-2">
					<input type="button" id="listBtn" value="목록" class="btn">
				</div>
				<div class="col-2">
					<input type="button" id="approvalBtn" value="승인" class="btn">
				</div>
				<div class="col-2">
					<input type="button" value="반려" class="btn" data-bs-toggle="modal" data-bs-target="#modalForm">
				</div>
			</div>
		</div>
	</div>
</div>

<input type="hidden" id="inputNm" value="">

<div class="modal fade" id="modalForm" tabindex="-1" aria-labelledby="modalFormLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content border-0">
			<div class="position-relative border-0 pe-4">
				<button type="button" class="btn btn-gray-200 p-0 border-2 width-3x height-3x rounded-circle flex-center position-absolute end-0 top-0 mt-3 me-3 z-1" data-bs-dismiss="modal" aria-label="Close">
					<i class="bx bx-x fs-5"></i>
				</button>
			</div>
			<div class="modal-body py-5 px-5 border-0">
				<div class="position-relative">
					<form id="expAppfrm" method="post" action="/coco/admin/refuseExpert">
						<h5 class="h5">반려처리</h5>
						<div class="row d-flex">
							<label for="refuseDate" class="col-sm-4 col-form-label text-center">반려일</label>
							<div class="col-sm-8">
								<input type="text" id="refuseDate" class="form-control text-center" value="" readonly="readonly">
							</div>
						</div>
						
						<div class="row">
							<label for="expRefuse" class="col-sm-4 col-form-label text-center">반려사유 입력</label>
							<textarea id="expRefuse" name="expRefuse" rows="4" class="form-control overflow-scroll" style="resize: none;"></textarea>
							<input type="hidden" name="expFormNum" value="${expertVO.expFormNum }">
						</div>
						
						<div class="row d-flex justify-content-end">
							<div class="col-2">
								<input type="button" id="cancleBtn" value="취소" class="btn">
							</div>
							<div class="col-2">
								<input type="button" id="refuseBtn" value="반려" class="btn">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">

const dispIMG = $("#dispIMG");
function f_dispImg(p_arg) {
	let src = "/upload/" + p_arg;
	dispIMG.attr("src", src)
}

const approvalBtn = $("#approvalBtn");
const rFrm = $("#rFrm");

approvalBtn.on("click", function() {
	rFrm.submit();
});

$(document).ready(function() {
	const listBtn = $("#listBtn");
	const refuseBtn = $("#refuseBtn");
	const expAppfrm = $("#expAppfrm");
	const tbody = $("#tbody");
	const imgTD = tbody.find("td:eq(0)");
	const saveNm = $("#saveNm");
	
	refuseBtn.on("click", function(event) {
		event.preventDefault();
		if ($("#expRefuse").val() == null || $.trim($("#expRefuse").val()) == "") {
			Swal.fire({
		          icon: 'warning',
		          title: '반려 시, 반려사유를 반드시 입력하여야 합니다.',
		          showConfirmButton: false,
		          timer: 1500
		        })
		} else {
			expAppfrm.submit();
		}
	});
	
	$("#refuseDate").val(new Date(+new Date() + 3240 * 10000 ).toISOString().split("T")[0]);

	
	listBtn.on("click", function() {
		location.href = "/coco/admin/expApplyList";
	});
	
});
	
	
</script>