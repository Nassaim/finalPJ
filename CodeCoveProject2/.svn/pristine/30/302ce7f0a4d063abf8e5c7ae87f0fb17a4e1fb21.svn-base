<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modify Project</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<style type="text/css">
	#projectModifyForm {
		text-align: center;
	}
	
	#projectModifyCont{
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

$(document).ready(function() {
	  $('#pjProgress').on('input', function() {
	    var progressValue = $(this).val();
	    $('#progress-value').text(progressValue + '%');
	  });

	  $('#pjProgress').on('change', function() {
	    var progressValue = $(this).val();
	    var newProgressValue = Math.round(progressValue / 10) * 10;
	    $(this).val(newProgressValue);
	    $('#progress-value').text(newProgressValue + '%');
	    console.log("퍼센트" + newProgressValue);
	  });
		  
	});
	
var selectBoxChange = function(value){
	if(value == "PJST03"){
		$('#pjProgress').val(100);
		$('#progress-value').text('100%');
	}
}
</script>
<body>
<div class="toolbar py-3 px-3 px-lg-6" style="text-align:center;">
  <div class="position-relative container-fluid px-0">
    <div class="row align-items-center position-relative">
        <h3 >프로젝트 수정</h3>
    </div>
  </div>
</div>

<div id="projectModifyForm">
	<div class="content pt-3 px-3 px-lg-6 d-flex flex-column-fluid">
		<div class="container-fluid px-0" id="projectModifyCont">
	    	<div class="row">
		<form action="/coco/project/modify" method="post">
		<input type="hidden" name="pjId" value="${project.pjId }"/>
		<div class="col-12 col-md-12 mb-3" style="text-align: center">
	        <div class="form-group">
	            <input type="text" class="form-control" name="pjName" value="${project.pjName }" required="required"/>
	        </div>
	    </div>
		<div class="col-12 col-md-12 mb-3" style="text-align: center">
	        <div class="form-group">
	            <textarea class="form-control" name="pjObjTitle" style="height:150px;">${project.pjObjTitle }</textarea>
	        </div>
	    </div>
			  <div class="col-12 col-sm-6 col-lg-6 mb-3" style="text-align: center; float:left;">
                  <div class="card card-body">
                      <label for="singleDatePicker" class="form-label">시작일</label>
                      <input id="DateS" name="pjStartDate" class="form-control" value="${project.pjStartDate }" type="text">
                  </div>
              </div>
			  <div class="col-12 col-sm-6 col-lg-6 mb-3" style="text-align: center; float:left;">
                   <div class="card card-body">
                       <label for="singleDatePicker" class="form-label">마감일</label>
                       <input class="form-control" id="DateE" name="pjEndDate" value="${project.pjEndDate }" type="text">
                   </div>
               </div>
	           <div class="col-12 col-md-12 mb-3 mb-lg-5">
               		<div class="card card-body">
                       <label for="chBasic" class="form-label">상태코드</label>
                       <select id="chBasic" class="form-control" name="pjStatusCode"  onchange="selectBoxChange(this.value);"
                           data-choices='{"searchEnabled":false, "itemSelectText":""}'>
                           <c:forEach items="${code }" var="code">
	                           <option value="${code.comCode }" <c:if test="${project.pjStatusCode eq code.comCode }">selected</c:if>>${code.comCodeNm }</option>
                           </c:forEach>
<%--                            <option value="PS01" <c:if test="${project.pjStatusCode eq 'PS01' }">selected</c:if>>모집중</option> --%>
<%--                            <option value="PS02" <c:if test="${project.pjStatusCode eq 'PS02' }">selected</c:if>>진행중</option> --%>
<%--                            <option value="PS03" <c:if test="${project.pjStatusCode eq 'PS03' }">selected</c:if>>완료</option> --%>
                        </select>
                    </div>
               </div>
               <div class="col-12 mb-3 mb-lg-5">
               <div class="card">
               <div class="card-body">
               <div>
                   <div class="align-items-center mb-2">
                    <span>진척도</span>
                   </div>
<!--                    <div class="progress mb-3" style="height: 20px;"> -->
<!--                      <div class="progress-bar progress-bar-striped progress-bar-animated p-1" role="progressbar" -->
<%--                       aria-valuemin="0" aria-valuemax="100" style="width: ${project.pjProgress }%">${project.pjProgress }%</div> --%>
<!--                    	 </div> -->
                   	 <input type="range" class="form-range" min="0" max="100" step="10"
                     	id="pjProgress" name="pjProgress" value="${project.pjProgress }">
                     <span id="progress-value">${project.pjProgress }%</span>
                	</div>
               </div>
               </div>
               </div>
               
<!--                <label for="progress">진척도:</label> -->
<%--   		<input type="range" id="pjProgress" name="pjProgress" min="0" max="100" value="${project.pjProgress }"> --%>
<%--   		<span id="progress-value">${project.pjProgress }%</span> --%>
               
	           
			<div>
				<button type="submit" id=""
				data-tippy-placement="bottom" data-tippy-content="수정"
				class="btn btn-primary me-3">
				프로젝트 수정</button>
			</div>
		</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>
