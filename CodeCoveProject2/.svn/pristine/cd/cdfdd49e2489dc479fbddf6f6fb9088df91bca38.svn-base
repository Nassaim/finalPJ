<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="toolbar py-3 px-3 px-lg-6">
    <div class="position-relative container-fluid px-0">
        <div class="row align-items-center position-relative">
            <div class="col-md-7 mb-4 mb-md-0">
                <h3 class="mb-2">모아보기 - 간트차트</h3>

            </div>
        </div>
    </div>
</div>
<!--//Page Toolbar End//-->
<!-- <body onload="init()"> -->
    <div id="gantt_container" style="width:100%;height:600px;"></div>
<!-- </body> -->
<script>
function init() {
	$.ajax({
		type : "post",
		url : "/coco/myGantt/list",
		dataType : "json",
		success : function(resp){
			var datas = resp
			console.log(datas);
			var ganttConfig = {
		    		data: datas
		    };
			gantt.config.date_format = "%Y-%m-%d %H:%i:%s";
			gantt.init("gantt_container");
			gantt.attachEvent("onTaskClick", function(id, e){
			    console.log("Dialog clicked for task with id:", id);
			});
			gantt.attachEvent("onLightboxSave", function(id, task, is_new){
				 console.log("Save button clicked", id);
				 console.log("Save button clicked", task);
			    return true;
			})
		    gantt.parse(ganttConfig);
			
		}
	})
}
</script>
