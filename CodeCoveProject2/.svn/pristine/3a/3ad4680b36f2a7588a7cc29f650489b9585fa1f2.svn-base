<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.fc-theme-standard th, .fc-theme-standard td, .fc-scrollgrid, .fc-border-color{
    border: 1px solid #cbc7c7 ;
}
.fc .fc-daygrid-day-frame {
    border: 1px solid #cbc7c7;
}
</style>
<div class="toolbar py-3 px-3 px-lg-6">
    <div class="position-relative container-fluid px-0">
        <div class="row align-items-center position-relative">
            <div class="col-md-7 mb-4 mb-md-0">
                <h3 class="mb-2">모아보기 - 캘린더</h3>

            </div>
        </div>
    </div>
</div>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.9.0/main.min.css">

<div class="content pt-3 px-3 px-lg-6 d-flex flex-column-fluid">
	<div class="container-fluid px-0 mb-3 mb-lg-5">
	
	<div class="modal fade" id="updateMyCalendarModal" tabindex="-1"
    aria-labelledby="updateMyCalendarModal" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="updateMyCalendarModalLabel">업무 수정</h5>
                <button type="button" class="btn-close"
                    data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
            	<input type="hidden" class="form-control" id="workNum" name="workNum"/>
                <div class="col-12 col-md-12 mb-3">
			      <div class="form-group">
			      	  <label>프로젝트명</label>
			          <input type="text" class="form-control" id="myCalUpdatePjName" name="pjName"/>
			      </div>
			  	</div>
                <div class="col-12 col-md-12 mb-3">
			      <div class="form-group">
			      	  <label>업무명</label>
			          <input type="text" class="form-control" id="myCalUpdateWorkTitle" name="workTitle"/>
			      </div>
			  	</div>
			  	<div class="col-4 col-md-4 mb-3">
			      <div class="form-group">
			      	<label>시작일</label>
			      	<input type="text" class="form-control" id="myCalUpdateWorkStartDate" name="workStartDate"/>
			      </div>
			  	</div>
                <div class="col-4 col-md-4 mb-3">
			      <div class="form-group">
			      	<label>마감일</label>
			      	<input type="text" class="form-control" id="myCalUpdateWorkEndDate" name="workEndDate"/>
			      </div>
			  	</div>
			  	<div class="col-12 col-md-12 mb-3">
			      <div class="form-group">
			      	<label>업무내용</label>
			          <textarea class="form-control" id="myCalUpdateWorkContent" name="workContent" style="height:100px;"></textarea>
			      </div>
			  	</div>
			  	<div class="col-12 col-md-12 mb-3">
			      <div class="form-group">
			      	<label>업무색상</label>
			      	<input type="color" class="form-select" id="myCalUpdateWorkColor" name="workColor"/>
			      </div>
			  	</div>
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-secondary"
	                    data-bs-dismiss="modal" id="calWorkUpdateCancel">취소</button>
	                <button type="button" id="myCalWorkUpdateBtn" class="btn btn-primary">수정</button>
	            </div>
	        </div>
	</div>
	</div>
	
	<div class="modal fade active" id="detailMyCalendarModal" tabindex="-1"
    aria-labelledby="detailMyCalendarModal" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="detailMyCalendarModalLabel">업무 상세 보기</h5>
                <button type="button" class="btn-close"
                    data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="col-12 col-md-12 mb-3">
			      <div class="form-group">
			      	<label>프로젝트명</label>
			      	<input type="text" class="form-control" id="myCalDetailPjName" name="pjName" readonly="readonly"/>
			      </div>
			  	</div>
                <div class="col-12 col-md-12 mb-3">
			      <div class="form-group">
			      	<label>업무명</label>
			      	<input type="text" class="form-control" id="myCalDetailWorkTitle" name="workTitle" readonly="readonly"/>
			      </div>
			  	</div>
	            <div class="col-4 col-md-4 mb-3">
			      <div class="form-group">
			      	<label>시작일</label>
			      	<input type="text" class="form-control" id="myCalDetailWorkStartDate" name="workStartDate" readonly="readonly"/>
			      </div>
			  	</div>
                <div class="col-4 col-md-4 mb-3">
			      <div class="form-group">
			      	<label>마감일</label>
			      	<input type="text" class="form-control" id="myCalDetailWorkEndDate" name="workEndDate" readonly="readonly"/>
			      </div>
			  	</div>
			  	<div class="col-12 col-md-12 mb-3">
			      <div class="form-group">
			      	<label>업무내용</label>
			          <textarea class="form-control" id="myCalDetailWorkContent" name="workContent" style="height:100px;"></textarea>
			      </div>
			  	</div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                <button type="button" id="myCalWorkUpdateMoveBtn" class="btn btn-primary">일정 수정</button>
            </div>
        </div>
	</div>
	</div>
		
		<div id="calendar" style="background:white; border-radius: 20px;"></div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.9.0/main.min.js"></script>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.9.0/locales-all.min.js'></script>
<script type="text/javascript">
$(function(){
	$('#myCalWorkUpdateMoveBtn').on('click', function(e){
		$("#detailMyCalendarModal").modal("hide")
		$("#updateMyCalendarModal").modal("show");
	});
});

$(function() {
    $('#myCalUpdateWorkStartDate').daterangepicker({
		locale: {
			format: 'YYYY-MM-DD'
		},
		singleDatePicker: true,
		showDropdowns: true,
		minYear: 1901,
		maxYear: parseInt(moment().format('YYYY'),10)
    });
  });
  
$(function() {
    $('#myCalUpdateWorkEndDate').daterangepicker({
		locale: {
			format: 'YYYY-MM-DD'
		},
		singleDatePicker: true,
		showDropdowns: true,
		minYear: 1901,
		maxYear: parseInt(moment().format('YYYY'),10)
    });
  });

$(function(){
	var workNum = document.getElementById('workNum');
	var calUpdateWorkTitle = document.getElementById('myCalUpdateWorkTitle');
	var calUpdateWorkStartDate = document.getElementById('myCalUpdateWorkStartDate');
	var calUpdateWorkEndDate = document.getElementById('myCalUpdateWorkEndDate');
	var calUpdateWorkContent = document.getElementById('myCalUpdateWorkContent');
	var calUpdateWorkColor = document.getElementById('myCalUpdateWorkColor');
	$('#myCalWorkUpdateBtn').on('click', function(e){
		console.log(workNum.value);
		console.log(calUpdateWorkTitle.value);
		console.log(calUpdateWorkStartDate.value);
		console.log(calUpdateWorkEndDate.value);
		console.log(calUpdateWorkContent.value);
		console.log(calUpdateWorkColor.value);
		$.ajax({
			type : "post",
			url : "/coco/calendar/modify",
			data : {
				workNum : workNum.value,
				workTitle : calUpdateWorkTitle.value,
				workStartDate : calUpdateWorkStartDate.value,
				workEndDate : calUpdateWorkEndDate.value,
				workContent : calUpdateWorkContent.value,
				workColor :  calUpdateWorkColor.value
			},
			success : function(result){
				$("#updateMyCalendarModal").modal("hide");
				list();
			}
		});
	});
});

(function(){
	$(function(){
		$.ajax({
			type : "post",
			url : "/coco/myCalendar/list",
// 			data : {pjId : pjId},
			dataType : "json",
			success : function(resp) {
				console.log(resp);
				
				let modalDetail = document.getElementById('detailMyCalendarModal');
				let detailModal = new bootstrap.Modal(modalDetail);
				let modalUpdate = document.getElementById('updateMyCalendarModal');
				let upModal = new bootstrap.Modal(modalUpdate);
			    // Example events
			    const exampleEvents = resp
			    // Initialize the calendar
			    const calendar = new FullCalendar.Calendar(document.getElementById('calendar'), {
			      events: exampleEvents,
				  expandRows : true, // 화면에 맞게 높이 재설정  
			      headerToolbar: {
			        left: 'prev,next today',
			        center: 'title',
			        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
			      },
			      themeSystem: 'bootstrap',
			      bootstrapFontAwesome: false,
			      buttonText: {
			        today: '오늘',
			        month: '월',
			        week: '주',
			        day: '일',
			        list: '목록',
			        prev: '❮',
			        next: '❯',
			      },
			      dayMaxEvents: true, // allow "more" link when too many events
			      editable : true, // 수정 가능?        
//					  selectable : true, // 달력 일자 드래그 설정가능
			      droppable: true,
			      locale : 'ko', // 한국어 설정
			      eventChange : function(obj) {
				 	  // 이벤트가 수정되면 발생하는 이벤트          
//						  console.log(obj);
				  },
				  eventRemove : function(obj) {
				      // 이벤트가 삭제되면 발생하는 이벤트          
					  console.log(obj);
				  },
				  eventClick : function(arg) {
					  	detailModal.show();
					  	console.log("arg",arg);
						$("#myCalDetailPjName").val(arg.event._def.extendedProps.pjName);
						$("#myCalDetailWorkTitle").val(arg.event._def.title); //일정상세 글 나오게하기
						$("#myCalDetailWorkStartDate").val(arg.event._instance.range.start.toISOString().substr(0, 10));
						$("#myCalDetailWorkEndDate").val(arg.event._instance.range.end.toISOString().substr(0, 10));
						$("#myCalDetailWorkContent").val(arg.event._def.extendedProps.content);
						
						$("#workNum").val(arg.event._def.extendedProps.workNum);
						$("#myCalUpdatePjName").val(arg.event._def.extendedProps.pjName);
						$("#myCalUpdateWorkTitle").val(arg.event._def.title);
						$("#myCalUpdateWorkStartDate").val(arg.event._instance.range.start.toISOString().substr(0, 10));
						$("#myCalUpdateWorkEndDate").val(arg.event._instance.range.end.toISOString().substr(0, 10));
						$("#myCalUpdateWorkContent").val(arg.event._def.extendedProps.content);
						$("#myCalUpdateWorkColor").val(arg.event._def.ui.backgroundColor);
					},
				  eventDrop : function(arg) {
// 						console.log(arg);
// 						console.log(arg.event._def.title);
// 							let start = arg.event._instance.range.start;
// 							var date = new Date();
// 							date.setDate(date.getDate());
// 							if (start.toISOString().split("T")[0] < date.toISOString().split("T")[0]) {
// 								  Swal.fire({
// 								        icon: 'warning',
// 								        title: '당일 이전으론 수정할 수 없습니다.',
// 								        showConfirmButton: true
// 								      })
// 								arg.revert();
// 								return;
// 							}
						upModal.show();
						$("#workNum").val(arg.event._def.extendedProps.workNum);
						$("#myCalUpdatePjName").val(arg.event._def.extendedProps.pjName);
						$("#myCalUpdateWorkTitle").val(arg.event._def.title);
						$("#myCalUpdateWorkStartDate").val(arg.event._instance.range.start.toISOString().substr(0, 10));
						$("#myCalUpdateWorkEndDate").val(arg.event._instance.range.end.toISOString().substr(0, 10));
						$("#myCalUpdateWorkContent").val(arg.event._def.extendedProps.content);
						$("#myCalUpdateWorkColor").val(arg.event._def.ui.backgroundColor);

					},
				  
			    }).render()
			}
		});
	});
})();

function list(){
(function(){
	$(function(){
		$.ajax({
			type : "post",
			url : "/coco/myCalendar/list",
// 			data : {pjId : pjId},
			dataType : "json",
			success : function(resp) {
				console.log(resp);
				
				let modalDetail = document.getElementById('detailMyCalendarModal');
				let detailModal = new bootstrap.Modal(modalDetail);
				let modalUpdate = document.getElementById('updateMyCalendarModal');
				let upModal = new bootstrap.Modal(modalUpdate);
			    // Example events
			    const exampleEvents = resp
			    // Initialize the calendar
			    const calendar = new FullCalendar.Calendar(document.getElementById('calendar'), {
			      events: exampleEvents,
				  expandRows : true, // 화면에 맞게 높이 재설정  
			      headerToolbar: {
			        left: 'prev,next today',
			        center: 'title',
			        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
			      },
			      themeSystem: 'bootstrap',
			      bootstrapFontAwesome: false,
			      buttonText: {
			        today: '오늘',
			        month: '월',
			        week: '주',
			        day: '일',
			        list: '목록',
			        prev: '❮',
			        next: '❯',
			      },
			      dayMaxEvents: true, // allow "more" link when too many events
			      editable : true, // 수정 가능?        
//					  selectable : true, // 달력 일자 드래그 설정가능
			      droppable: true,
			      locale : 'ko', // 한국어 설정
			      eventChange : function(obj) {
				 	  // 이벤트가 수정되면 발생하는 이벤트          
//						  console.log(obj);
				  },
				  eventRemove : function(obj) {
				      // 이벤트가 삭제되면 발생하는 이벤트          
					  console.log(obj);
				  },
				  eventClick : function(arg) {
					  	detailModal.show();
					  	console.log("arg",arg);
						$("#myCalDetailPjName").val(arg.event._def.extendedProps.pjName);
						$("#myCalDetailWorkTitle").val(arg.event._def.title); //일정상세 글 나오게하기
						$("#myCalDetailWorkStartDate").val(arg.event._instance.range.start.toISOString().substr(0, 10));
						$("#myCalDetailWorkEndDate").val(arg.event._instance.range.end.toISOString().substr(0, 10));
						$("#myCalDetailWorkContent").val(arg.event._def.extendedProps.content);
						
						$("#workNum").val(arg.event._def.extendedProps.workNum);
						$("#myCalUpdatePjName").val(arg.event._def.extendedProps.pjName);
						$("#myCalUpdateWorkTitle").val(arg.event._def.title);
						$("#myCalUpdateWorkStartDate").val(arg.event._instance.range.start.toISOString().substr(0, 10));
						$("#myCalUpdateWorkEndDate").val(arg.event._instance.range.end.toISOString().substr(0, 10));
						$("#myCalUpdateWorkContent").val(arg.event._def.extendedProps.content);
						$("#myCalUpdateWorkColor").val(arg.event._def.ui.backgroundColor);
					},
				  eventDrop : function(arg) {
// 						console.log(arg);
// 						console.log(arg.event._def.title);
// 							let start = arg.event._instance.range.start;
// 							var date = new Date();
// 							date.setDate(date.getDate());
// 							if (start.toISOString().split("T")[0] < date.toISOString().split("T")[0]) {
// 								  Swal.fire({
// 								        icon: 'warning',
// 								        title: '당일 이전으론 수정할 수 없습니다.',
// 								        showConfirmButton: true
// 								      })
// 								arg.revert();
// 								return;
// 							}
						upModal.show();
						$("#workNum").val(arg.event._def.extendedProps.workNum);
						$("#myCalUpdatePjName").val(arg.event._def.extendedProps.pjName);
						$("#myCalUpdateWorkTitle").val(arg.event._def.title);
						$("#myCalUpdateWorkStartDate").val(arg.event._instance.range.start.toISOString().substr(0, 10));
						$("#myCalUpdateWorkEndDate").val(arg.event._instance.range.end.toISOString().substr(0, 10));
						$("#myCalUpdateWorkContent").val(arg.event._def.extendedProps.content);
						$("#myCalUpdateWorkColor").val(arg.event._def.ui.backgroundColor);

					},
				  
			    }).render()
			}
		});
	});
})();
}
</script>