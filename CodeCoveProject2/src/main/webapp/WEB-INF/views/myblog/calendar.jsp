<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- fullcalendar CDN -->
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<!-- fullcalendar 언어 CDN -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>

<style> /* body 스타일 */
html, body {
	overflow: hidden;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
} /* 캘린더 위의 해더 스타일(날짜가 있는 부분) */
.fc-header-toolbar {
	padding-top: 1em;
	padding-left: 1em;
	padding-right: 1em;
}

.fc-event, .fc-event-dot {
	background-color: #ffffff;
}

/* 모달가운데 위치하게 하기 */
.modal-content {
	width: 60%;
	top: 50%;
	left: 10%;
}
</style>
<c:if test="${not empty message }">
	<script>
		//    swal("${message}");
	</script>
</c:if>
<div class="modal fade bs-example-modal-xl show" tabindex="-1" id="insertCalendar" style="display: none;" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-xl">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">일정 추가</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<form:form method="post" modelAttribute="myCalendarVO" enctype="application/x-www-form-urlencoded" id="insertModal">
				<div class="modal-body">
					<div class="card">
						<div class="card-body">
							<div class="row mb-3">
								<label for="example-search-input" class="col-sm-2 col-form-label">일정명</label>
								<div class="col-sm-10">
									<form:input class="form-control" type="text" path="calTitle" autocomplete="off" placeholder="일정명" />
									<form:errors path="calTitle" element="span" cssClass="error" />
								</div>
							</div>
							<div class="row mb-3">
								<label for="example-search-input" class="col-sm-2 col-form-label">시작일</label>
								<div class="col-sm-10">
									<form:input class="form-control" type="datetime-local" path="calStartDate" />
									<form:errors path="calStartDate" element="span" cssClass="error" />
								</div>
							</div>
							<div class="row mb-3">
								<label for="example-search-input" class="col-sm-2 col-form-label">마감일</label>
								<div class="col-sm-10">
									<form:input class="form-control" type="datetime-local" path="calEndDate" />
									<form:errors path="calEndDate" element="span" cssClass="error" />
								</div>
							</div>
							<div class="row mb-3">
								<label for="example-search-input" class="col-sm-2 col-form-label">일정 내용</label>
								<div class="col-sm-10">
									<form:textarea class="form-control" path="calContent" placeholder="일정 내용"></form:textarea>
									<form:errors path="calContent" element="span" cssClass="error" />
								</div>
							</div>
							<div class="row mb-3">
								<label for="example-search-input" class="col-sm-2 col-form-label">일정 색상</label>
								<div class="col-sm-10">
									<form:input type="color" class="form-select" path="calColor" required="true" />
									<form:errors path="calColor" element="span" cssClass="error" />
								</div>
							</div>
						</div>
					</div>
				</div>
			</form:form>
			<div class="modal-footer">
				<!-- Toogle to second dialog -->
				<button type="button" class="btn btn-light waves-effect" onclick="$('#insertModal').submit()">등록</button>
				<button type="button" class="btn btn-light waves-effect" data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<div class="modal fade bs-example-modal-xl show" tabindex="-1" id="updateCalendar" style="display: none;"
	aria-hidden="true"
>
	<div class="modal-dialog modal-dialog-centered modal-xl">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">일정수정</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="cancel2"></button>
			</div>
			<form:form method="post" modelAttribute="myCalendarVO" action="/blog/${memId}/calendar/updateCal" enctype="application/x-www-form-urlencoded" id="updateModal">
				<input type="hidden" name="_method" value="put">
				<form:input type="hidden" path="calNum" />
				<div class="modal-body">
					<div class="card">
						<div class="card-body">
							<div class="row mb-3">
								<label for="example-search-input" class="col-sm-2 col-form-label">일정명</label>
								<div class="col-sm-10">
									<form:input class="form-control" type="text" path="calTitle" placeholder="일정명" />
									<form:errors path="calTitle" element="span" cssClass="error" />
								</div>
							</div>
							<div class="row mb-3">
								<label for="example-search-input" class="col-sm-2 col-form-label">시작일</label>
								<div class="col-sm-10">
									<form:input class="form-control" type="datetime-local" path="calStartDate" />
									<form:errors path="calStartDate" element="span" cssClass="error" />
								</div>
							</div>
							<div class="row mb-3">
								<label for="example-search-input" class="col-sm-2 col-form-label">마감일</label>
								<div class="col-sm-10">
									<form:input class="form-control" type="datetime-local" path="calEndDate" />
									<form:errors path="calEndDate" element="span" cssClass="error" />
								</div>
							</div>
							<div class="row mb-3">
								<label for="example-search-input" class="col-sm-2 col-form-label">일정 내용</label>
								<div class="col-sm-10">
									<form:textarea id="textArea" class="form-control" path="calContent" placeholder="일정 내용"></form:textarea>
									<form:errors path="calContent" element="span" cssClass="error" />
								</div>
							</div>
							<div class="row mb-3">
								<label for="example-search-input" class="col-sm-2 col-form-label">일정 색상</label>
								<div class="col-sm-10">
									<form:input type="color" class="form-select" path="calColor" required="true" />
									<form:errors path="calColor" element="span" cssClass="error" />
								</div>
							</div>
						</div>
					</div>
				</div>
			</form:form>
			<div class="modal-footer">
				<!-- Toogle to second dialog -->
				<button type="button" class="btn btn-light waves-effect" id="updateBtn" onclick="$('#updateModal').submit()">수정</button>
				<button type="button" class="btn btn-light waves-effect" data-bs-dismiss="modal" id="updateCancel">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- 일정 상세 보기 modal -->
<div class="modal fade bs-example-modal-xl show" tabindex="-1" id="calendarView" style="display: none;"
	aria-hidden="true"
>
	<div class="modal-dialog modal-dialog-centered modal-xl">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">일정 상세 보기</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="cancel"></button>
			</div>
			<div class="modal-body">
				<div class="card">
					<div class="card-body" id="detailTbody">
						<!-- <div class="row mb-3"></div> -->
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<!-- Toogle to second dialog -->
				<button type="button" class="btn btn-light waves-effect" id="calendarUpdateBtn">일정 수정</button>
				<button type="button" class="btn btn-light waves-effect" id="calendarDeleteBtn">일정 삭제</button>
				<button type="button" class="btn btn-light waves-effect" data-bs-dismiss="modal" id="detailCancel">닫기</button>

			</div>
		</div>
	</div>
</div>
<form:form id="deleteCalendar" action="/blog/${memId}/calendar/deleteCal" method="post" enctype="application/x-www-form-urlencoded" modelAttribute="myCalendarVO">
	<input type="hidden" name="_method" value="delete" />
	<form:input type="hidden" path="calNum" />
</form:form>

<!-- calendar 태그 -->
<div id='calendar-container'>
	<div id='calendar'></div>
</div>

<script>
	//모달창 닫으면 지워주기!
	$('#detailCancel').on('click', function(e) {
		$("#insertModal")[0].reset();
	});
	$('#cancel').on('click', function(e) {
		$("#insertModal")[0].reset();
	});
	$('#updateCancel').on('click', function(e) {
		$("input[name=calTitle]").val("");
	});
	$("#cancel2").on('click', function(e) {
		$("input[name=calTitle]").val("");
	});
	//
	$('#insertCalendar').on('hidden.bs.modal', function(e) {
		$(this).find('form')[0].reset()
	});
	$('#insertModal').on('hidden.bs.modal', function(e) {
		$(this).find('form')[0].reset()
	});

	$('#updateCalendar').on('hidden.bs.modal', function(e) {
		$(this).find('form')[0].reset()
	});

	$("#updateBtn").on("click", function() {
		$("#updateModal").submit();
	});

	$("#calendarUpdateBtn").on("click",	function() {
				var date = new Date();
				date.setDate(date.getDate());
				if (end.toISOString().split("T")[0] < date.toISOString().split("T")[0]) {
					swal("지난일정은 수정할 수 없습니다.");
					return;
				}
				$("#calendarView").modal("hide");
				$("#updateCalendar").modal("show");
			})

	$("#calendarDeleteBtn").on("click", function() {
		swal({
			title : "삭제하시겠습니까?",
			icon : "warning",
			buttons : true,
			dangerMode : true,
		}).then(function(willDelete) {
			if (willDelete) {
				$("#deleteCalendar").submit();
			} else {
				return false;
			}
		});
	});

// 	$("#updateBtn").on("click", function() {
// 		$("#updateModal").submit();
// 	});

	let start = "";
	let end = "";
	let content = "";
</script>
<script>
	var header = '${_csrf.headerName}';
	var token = '${_csrf.token}';

	(function() {
		$(function() {
			$.ajax({
				method : "GET",
				dataType : "json",
				success : function(resp) {
					console.log(resp);

					// calendar element 취득     
					var calendarEl = $('#calendar')[0]; // full-calendar 생성하기     
					var calendar = new FullCalendar.Calendar(
							calendarEl,
							{
								height : '700px', // calendar 높이 설정    
								contentHeight : '100px',
								expandRows : true, // 화면에 맞게 높이 재설정        
								slotMinTime : '08:00', // Day 캘린더에서 시작 시간        
								slotMaxTime : '20:00', // Day 캘린더에서 종료 시간  
								fixedWeekCount : false,
								// 해더에 표시할 툴바        
								headerToolbar : {
									left : 'prevYear,prev,next,nextYear today',
									center : 'title',
									right : 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
								},
								initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)    
								//initialDate : , // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)        
								navLinks : true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크        
								editable : true, // 수정 가능?        
								selectable : true, // 달력 일자 드래그 설정가능        
								nowIndicator : true, // 현재 시간 마크       
								dayMaxEvents : 4, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)    
								//                            eventOrder : true, // 이벤트 id 순으로 정렬
								locale : 'ko', // 한국어 설정        
								//eventAdd : function(obj) {
								// // 이벤트가 추가되면 발생하는 이벤트    
								// },
								eventChange : function(obj) {
									// 이벤트가 수정되면 발생하는 이벤트          
									console.log(obj);
								},
								eventRemove : function(obj) {
									// 이벤트가 삭제되면 발생하는 이벤트          
									console.log(obj);
								},
								select : function(arg) {
									// 캘린더에서 드래그로 이벤트를 생성할 수 있다.
									var date = new Date();
									date.setDate(date.getDate() - 1);
									if (arg.start.toISOString().split("T")[0] < date.toISOString().split("T")[0]) {
										swal('당일이후의 일정만 추가 가능합니다.', "");
										return;
									}
									let start = new Date(arg.start.toISOString().split("T")[0]);
									let end = new Date(arg.end.toISOString().split("T")[0]);
									// 당일 이벤트인지 확인하기(당일이면 시간 조정, 드래그일 경우에도 시작일 조정해야함)
									if ((end.getTime() - start.getTime()) / (1000 * 60 * 60 * 24) == 1) {
										start.setDate(start.getDate() + 1);
										$("input[name=calStartDate]").val(start.toISOString().slice(0, -5));
										$("input[name=calEndDate]").val(start.toISOString().split("T")[0] + "T23:59:00");
										$("#insertCalendar").modal("show");
									} else {
										start.setDate(start.getDate() + 1);
										console.log(start.toISOString().slice(0, -5));
										$("input[name=calStartDate]").val(start.toISOString().slice(0, -5));
										$("input[name=calEndDate]").val(end.toISOString().split("T")[0] + "T23:59:00");
										$("#insertCalendar").modal("show");
									}
									//       calendar.addEvent({
									//       start : arg.start,
									//       end : arg.end,
									//       allDay : arg.allDay
									//                                  })
									calendar.unselect()
								},
								eventClick : function(arg) {
									console.log("arg", arg);
									start = arg.event._instance.range.start;
									end = arg.event._instance.range.end;
									content = arg.event._def.extendedProps.content;
									$("#detailTbody").text(content); //일정상세 글 나오게하기
									$("input[name=calNum]").val(arg.event._def.extendedProps.calId);

									$("#deleteCalendar").find("input[name=calNum]").val(arg.event._def.extendedProps.calId);
									$("input[name=calTitle]").val(arg.event._def.title);
									$("input[name=calStartDate]").val(arg.event._instance.range.start.toISOString().slice(0, -5));
									$("input[name=calEndDate]").val(arg.event._instance.range.end.toISOString().slice(0, -5));
									$("input[name=calColor]").val(arg.event._def.ui.backgroundColor)
									$("#textArea").val(content);
									$("#calendarView").modal("show");

								},
								eventDrop : function(arg) {
									console.log(arg);
									let start = arg.event._instance.range.start;
									var date = new Date();
									date.setDate(date.getDate());
									if (start.toISOString().split("T")[0] < date.toISOString().split("T")[0]) {
										swal("당일이후의 일정이전으론 수정할 수 없습니다.");
										arg.revert();
										return;
									}
									$("input[name=calNum]").val(arg.event._def.extendedProps.calId);
									$("#deleteCalendar").find("input[name=calNum]").val(arg.event._def.extendedProps.calId);

									$("input[name=calTitle]").val(arg.event._def.title);
									$("input[name=calStartDate]").val(arg.event._instance.range.start.toISOString().slice(0, -5));
									$("input[name=calEndDate]").val(arg.event._instance.range.end.toISOString().slice(0, -5));
									$("input[name=calColor]").val(arg.event._def.ui.backgroundColor)
									$("#textArea").val(content);
									$("#updateCalendar").modal("show");

								},
								// 이벤트        
								events : resp

							});
					// 캘린더 랜더링      
					calendar.render();
				}

			});
		});
	})();
</script>
