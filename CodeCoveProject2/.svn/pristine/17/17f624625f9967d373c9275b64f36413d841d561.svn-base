function makeTodo(index, todo){
	let checkTag = $("<li>").addClass("list-group-item d-flex align-items-center ps-0 pe-3 py-1 rounded-0 border-0 bg-transparent")
							.append(
								$("<div>").addClass("form-check").append(
											$("<input>").addClass("form-check-input me-0 checkbox").attr("type", "checkbox")
														.attr("id", "flexCheckChecked1").attr("onClick", "check($(this))").val(todo.checkNum)
											, $("<input>").addClass("checkYn").attr("type", "hidden").val(todo.checkYn)
								)
							);
	let contentTag=$("<li>").addClass("list-group-item px-3 py-1 d-flex align-items-center flex-grow-1 border-0 bg-transparent contentLi")
							.append(
									$("<p>").addClass("lead fw-normal mb-0 checkContent").text(todo.checkContent)
									, $("<input>").attr("type", "hidden").val(todo.checkNum).addClass("checkNum") 
							);
							
	let ectTag = $("<li>").addClass("list-group-item ps-3 pe-0 py-1 rounded-0 border-0 bg-transparent ectLi")
							.append(
								$("<div>").addClass("d-flex flex-row justify-content-end mb-1")
										  .append($("<a>").addClass("text-info upBtn").attr("data-mdb-toggle", "tooltip")
															.attr("title", "수정").attr("onClick", "upBtn($(this))")
															.append($("<i>").addClass("ri-pencil-fill"))
													, $("<a>").addClass("text-danger delBtn").attr("data-mdb-toggle", "tooltip")
															.attr("title", "삭제").append($("<i>").addClass("ri-delete-bin-line")).attr("onClick", "delBtn($(this))")
													
								)
								, $("<div>").addClass("text-end text-muted")
										  .append(
												  $("<p>").addClass("small mb-0").append($("<i>").addClass("ri-information-line").text(todo.checkDate)))
							);
	
	return $("<ul>").addClass("list-group list-group-horizontal rounded-0 bg-transparent checkUl").append(
			checkTag
			, contentTag
			, ectTag
			);
}


//+1000
(getList = function(){
	
	let todoBody = $("#todoBody");
	
	$.ajax({
		url : url+"/todoList"
		, data : {
			"checkYn":selbox.value
			, "date":date.value
		}
		, method : "get"
		, dataType : "json"
		, success : function(resp, status, jqXHR) {
			let todoList = resp.todoList;
			let todoTags = [];
			if(todoList&&todoList.length>0){
				$.each(todoList, function(index, todo){
					todoTags.push(makeTodo(index, todo));
				});
				
			}
			
			todoBody.html(todoTags);
			
			let checkYn = $(".checkYn");
			
			checkYn.each(function(index,p){
				p = $(this);
				if(p.val()=='Y'){
					p.prev().attr("checked", true)
				}
				
			});
			
			/*
				if(checkYn.val() == "Y"){
					checkYn.prev().attr("checked", true)
				}
			 */
			
			let percent = resp.percent;
			
			progressBar.setAttribute("style", "width: "+percent+"%;")
			progressBar.innerHTML = percent + "%";
			
		}, error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
	
})();

selbox.addEventListener('change', function(event){
	getList();
});
date.addEventListener('change', function(event){
	getList();
});


function check(el){
	let checkNum = el.val();
	let checkYn = el.next().val();
    el.closest(".checkUl").css('display', 'none');
        
    $.ajax({
    	url : url+"/ynTodo"
    	, data : {
    		"checkNum":checkNum
    		, "checkYn":checkYn
    	}
    	, method : "get"
    	, dataType : "text"
    	, success : function(resp, status, jqXHR) {
    		getList();
    	}, error : function(jqXHR, status, error) {
    		console.log(jqXHR);
    		console.log(status);
    		console.log(error);
    	}
    });
    
}

function addTodo(){
	if(addData.value.length>30){
		swal("내용은 30자까지만 가능합니다.");
	}else if(addData.value.length==0){
		swal("내용을 입력해주세요.");
	}else{
		$.ajax({
			url : url+"/addTodo"
			, data : {
				"addTodo":addData.value
				, "blogId":blogId.value
				, "date":date.value
			}
			, method : "get"
			, dataType : "text"
			, success : function(resp, status, jqXHR) {
				addData.value = "";
				getList();
				
			}, error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	}
}

//내용 변경 버튼
function upBtn(el){
	
	el.css('display', 'none');
	var target = el.closest(".ectLi").prev(".contentLi").find(".checkContent");
	var val = target.html();
	var html = '<input type="text" id="upData" class="form-control" onkeyup="if(window.event.keyCode==13){upOkBtn($(this))}" style="width: 100%;" value="'+ val +'"/>';
	target.html(html);
}

//내용 수정 버튼
function upOkBtn(el){
	let checkNum=el.closest(".contentLi").find(".checkNum").val();
	
	if(upData.value.length>30){
		swal("내용 30자까지만 가능합니다.");
	}else if(upData.value.length==0){
		swal("내용을 입력해주세요.");
	}else{
		$.ajax({
		    method : 'get'
		    , url: url+"/upTodo"
		    , data: {
		     	"upData":upData.value
		     	, "checkNum":checkNum
		     }
		    , dataType : "text",
		    success: function(resp){
				getList();
		
		    },
		    error: function(xhr, status, error) {
		    	swal(error);
		    }  
		 });
	}
	
}

//내용 삭제 버튼
function delBtn(el){
	let checkNum=el.closest(".ectLi").prev(".contentLi").find(".checkNum").val();
	
	swal({
		  title: "삭제하시겠습니까?",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		})
		.then(function (willDelete){
		  if (willDelete) {
			  
			$.ajax({
			    method : 'get'
			    , url: url+"/delTodo"
			    , data: {
			     	"checkNum":checkNum
			     }
			    , dataType : "text",
			    success: function(resp){
					getList();
			
			    },
			    error: function(xhr, status, error) {
			    	swal(error);
			    }  
			 });
			
		  } else {
			  return;
		  }
	});
	
}