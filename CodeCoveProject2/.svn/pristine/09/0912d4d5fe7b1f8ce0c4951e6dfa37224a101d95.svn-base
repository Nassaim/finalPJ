<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

	<div class="container-fluid">
		<form method="POST" action="/coco/admin/expApplyList" id="searchForm" name="searchForm">
			<div class="row mb-2">
				<label for="searchWord" class="col-sm-1 col-form-label text-center">단어검색</label>
				<div class="col-sm-11">
					<input type="hidden" name="page" id="page"/>
					<input type="text" id="searchWord" name="searchWord" class="form-control" placeholder="검색어를 입력해주세요" value="${searchWord }"> 
				</div>
			</div>
			<!-- 상태 -->
			<input type="hidden" id="status" name="status" value="">
			<!-- 담당자 -->
			<input type="hidden" id="" name="charger" value="">
		</form>
		<div class="row mb-2 d-flex" style="display: flex; align-items: center;">
			<div class="col-sm-4 ">
				<div class="form-inline d-flex">
					<label for="searchDate" class="col-sm-3 form-label d-inline-block text-center">검색기간</label>
					<div class="col-sm-9">
						<input id="searchDate" name="searchDate" class="form-control d-inline-block text-center"> 
					</div>
				</div>
			</div>
			
			<div class="col-sm-8 d-flex">
				<div class="col-sm-2">
					<div class="form-check">
						<input type="radio" id="today" name="period"  class="form-check-input">
						<label for="today" class="form-check-label text-center">오늘</label>
					</div>
				</div>
				<div class="col-sm-2">
					<div class="form-check">
						<input type="radio" id="aDay" name="period"  class="form-check-input">
						<label for="aDay" class="form-check-label text-center">1일</label>
					</div>
				</div>
				<div class="col-sm-2">
					<div class="form-check">
						<input type="radio" id="aWeek" name="period"  class="form-check-input">
						<label for="aWeek" class="form-check-label text-center">1주일</label>
					</div>
				</div>
				<div class="col-sm-2">
					<div class="form-check">
						<input type="radio" id="aMonth" name="period" class="form-check-input">
						<label for="aMonth" class="form-check-label text-center">1개월</label>
					</div>
				</div>
				<div class="col-sm-2">
					<div class="form-check">
						<input type="radio" id="threeMonth" name="period" class="form-check-input">
						<label for="threeMonth" class="form-check-label text-center">3개월</label>
					</div>
				</div>
				<div class="col-sm-2">
					<input type="button" id="dateSearchBtn" value="기간검색">
					<form method="POST" action="/coco/admin/expApplyList" id="periodForm">
						<!-- 기간 -->
						<input type="hidden" id="startPeriod" name="startPeriod" value="">
						<input type="hidden" id="endPeriod" name="endPeriod" value="">
					</form>
				</div>
			</div>
		</div>
		
		<div class="row mb-2 d-flex flex-row-reverse">
			<div class="col-sm-2">
				<select class="form-select">
				 	<option>처리담당자</option>
		 		</select>
			</div>
			<div class="col-sm-2">
				 <select id="selectCode" class="form-select">
				 	<option>접수코드별 검색</option>
				 	<c:forEach items="${codeList }" var="item">
						<option value="${item.comCode }">${item.comCodeNm }</option>
					</c:forEach>
				 </select>
				 <form method="POST" action="/coco/admin/expApplyList" id="codeForm">
				 	<input type="hidden" id="searchCode" name="searchCode" value="">
				 </form>
			</div>
			<div class="col-sm-2">
				<input type="button" value="조건초기화" id="resetBtn">
			</div>
		</div>
	</div>

	<div class="card">
		<table id="datatable" class="table table-striped table-card table-nowrap table-hover">
			<thead class="text-body-secondary">
				<tr>
					<th class="col">순번</th>
					<th class="col">신청코드</th>
					<th class="col">회원아이디</th>
					<th class="col">회원닉네임</th>
					<th class="col">회원E-mail</th>
					<th class="col">접수코드</th>
					<th class="col">신청날짜</th>
					<th class="col">담당자</th>
				</tr>
			</thead>
		<tbody id="tbody">
			<c:set value="${pagingVO.dataList }" var="expList"/>
			<c:set value="${start }" var="num"/>
			<c:choose>
				<c:when test="${empty expList }">
					<td colspan="9">조회할 멘토 사용자 신청서가 없습니다.</td>
				</c:when>
				<c:otherwise>
					<c:forEach items="${expList }" var="expInfo">
						<tr id="trs">
							<td>${num }</td>
							<td>${expInfo.expFormNum }</td>
							<td>${expInfo.formId }</td>
							<td>${expInfo.memNick }</td>
							<td>${expInfo.memMail }</td>
							<td>${expInfo.comCodeNm }</td>
							<td>
								<fmt:formatDate value="${expInfo.expRegDate }" pattern="yyyy-MM-dd"/>
							</td>
							<td>admin</td>
						</tr>
						<c:set value="${num - 1 }" var="num"/>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
		</table>
		<form method="get" action="/coco/admin/expApplyDetail" id="readForm">
			<input type="hidden" id="expFormNum" name="expFormNum">
		</form>
		<div class="card-footer clearfix mt-2" id="pagingArea">
			${pagingVO.pagingHTML }
		</div>
	</div>


<script>
$(document).ready(function () {
	const pagingArea = $("#pagingArea");
	// Form
	const searchForm = $("#searchForm");
	const periodForm = $("#periodForm");
	const codeForm = $("#codeForm");
	const readForm = $("#readForm");
	
	const tbody = $("#tbody");
	const trs = $("#trs");	
	const formNum = $("formNum");
	const searchCode = $("#searchCode");
	const dateSearchBtn = $("#dateSearchBtn");
	const selectCode = $("#selectCode");
	const resetBtn = $("#resetBtn");
	
	// 기간 라디오
	const today = $("#today");
	const aDay = $("#aDay");
	const aWeek = $("#aWeek");
	const aMonth = $("#aMonth");
	const threeMonth = $("#threeMonth");
	const Ondate = new Date();
	
	// 디테일페이지 이동
	tbody.on("click", "#trs", function() {
		let expFormNum = $("#expFormNum");
		let applyCode = $(this).find("td:eq(1)").text();
		expFormNum.val(applyCode);
		readForm.submit();
	});
	
	
	// 검색 조건 리셋
	resetBtn.on("click", function() {
		location.replace(location.href);
	});
	
	// 상태코드별 검색
	selectCode.on("change", function() {
 		let code = $("#selectCode option:checked").val();
 		searchCode.val(code);
 		codeForm.submit();
	});
	
	today.on("click", function() {
		set_daterRangePicker(Ondate, Ondate);
	});
	
	aDay.on("click", function() {
		let aDay = new Date(Ondate);
		aDay.setDate(Ondate.getDate()-1);
		set_daterRangePicker(aDay, Ondate)
	});
	
	aWeek.on("click", function() {
		let aWeek = new Date(Ondate);
		aWeek.setDate(Ondate.getDate()-7);
		set_daterRangePicker(aWeek, Ondate)
	});
	
	aMonth.on("click", function() {
		let aMonth = new Date(Ondate);
		aMonth.setDate(Ondate.getDate()-30);
		set_daterRangePicker(aMonth, Ondate)
	});
	
	threeMonth.on("click", function() {
		let threeMonth = new Date(Ondate);
		threeMonth.setDate(Ondate.getDate()-90);
		set_daterRangePicker(threeMonth, Ondate)
	});
	
	// 데이터레인지피커 검색 시작, 검색 종료날짜 함수
	function set_daterRangePicker(p_arg1, p_arg2) {
		$("#searchDate").daterangepicker({
			"locale" : {
				"format":"YYYY-MM-DD",
				"separator":" ~ ",
	    		"applyLabel": "적용",
	    		"cancelLabel": "취소",
				"fromLabel": "From",
				"toLabel": "To",
				"customRangeLabel": "Custom",
				"weekLabel": "W",
		        "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
		        "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
			},
			"startDate": p_arg1,
		    "endDate": p_arg2,
		    "drops": "auto"
			}, function (start, end, label) {
		    	'New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')'	});
	}
	
	dateSearchBtn.on("click", function() {
		let sDate = $("#searchDate").data('daterangepicker').startDate.format('YYYY-MM-DD');
		let eDate = $("#searchDate").data('daterangepicker').endDate.format('YYYY-MM-DD');
		
		$("#searchDate").data('daterangepicker').setStartDate(sDate);
		$("#searchDate").data('daterangepicker').setEndDate(eDate);
		
		$("#startPeriod").val(sDate);
		$("#endPeriod").val(eDate);
		
		periodForm.submit();
	});
	

	// 페이지네이션, 단어검색
	pagingArea.on("click", "a", function(event){
		event.preventDefault();
		var pageNo = $(this).data("page");
		searchForm.find("#page").val(pageNo);
		searchForm.submit();
	});
	
});

</script>


