<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Project</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<style type="text/css">
	#projectRegisterForm {
		text-align: center;
	}
	
	#projectRegisterCont{
		margin-left: 25%;
		margin-right: 25%;
	}
</style>
</head>  
<script type="text/javascript">
// const config = {
// 	dateFormat: 'yy-mm-dd',
// 	showOn : "button",
// 	buttonText:"날짜 선택",
// 	prevText: '이전 달',
//     nextText: '다음 달',
//     monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
//     monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
//     dayNames: ['일','월','화','수','목','금','토'],
//     dayNamesShort: ['일','월','화','수','목','금','토'],
//     dayNamesMin: ['일','월','화','수','목','금','토'],
//     yearSuffix: '년',
//     changeMonth: true,
//     changeYear: true,
//     minDate: 0
// }

// $(function() {
	
//     $( "#DateS" ).datepicker(config);
//     $( "#DateE" ).datepicker(config);
//     var btnList = $("#btnList");
    
//     btnList.on("click", function(){
// 		location.href="/project/list";
// 	});
// });

$(function() {
    $('#DateS').daterangepicker({
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
    $('#DateE').daterangepicker({
locale: {
                  format: 'YYYY-MM-DD'
                },
      singleDatePicker: true,
      showDropdowns: true,
      minYear: 1901,
      maxYear: parseInt(moment().format('YYYY'),10)
    });
  });

</script>
<body>
<div class="toolbar py-3 px-3 px-lg-6" style="text-align:center;">
  <div class="position-relative container-fluid px-0">
    <div class="row align-items-center position-relative">
        <h3 >프로젝트 생성</h3>
    </div>
  </div>
</div>

<div id="projectRegisterForm">
	<div class="content pt-3 px-3 px-lg-6 d-flex flex-column-fluid">
		<div class="container-fluid px-0" id="projectRegisterCont">
	    	<div class="row">
		<form:form action="/coco/project/register" method="post" modelAttribute="project">
		<div class="col-12 col-md-12 mb-3" style="text-align: center">
	        <div class="form-group">
	            <input type="text" class="form-control" name="pjName" placeholder="제목을 입력해주세요" required="required"/>
	        </div>
	    </div>
		<div class="col-12 col-md-12 mb-3" style="text-align: center">
	        <div class="form-group">
	            <textarea class="form-control" name="pjObjTitle" placeholder="프로젝트에 관한 설명" style="height:150px;"></textarea>
	<!--             <input type="text" class="form-control" name="pjObjTitle" placeholder="프로젝트에 관한 설명" /> -->
	        </div>
	    </div>
			  <div class="col-12 col-sm-6 col-lg-6 mb-3" style="text-align: center; float:left;">
	                        <div class="card card-body">
	                            <label for="singleDatePicker" class="form-label">시작일</label>
	                            <input id="DateS" name="pjStartDate" class="form-control" type="text">
	                        </div>
	                    </div>
			  <div class="col-12 col-sm-6 col-lg-6 mb-3" style="text-align: center; float:left;">
	                        <div class="card card-body">
	                            <label for="singleDatePicker" class="form-label">마감일</label>
	                            <input class="form-control" id="DateE" name="pjEndDate" type="text">
	                        </div>
	                    </div>
			<div>
				<button type="submit" id=""
				data-tippy-placement="bottom" data-tippy-content="등록"
				class="btn btn-primary me-3">
				프로젝트 만들기</button>
			</div>
		</form:form>
			</div>
		</div>
	</div>
</div>
</body>
</html>
