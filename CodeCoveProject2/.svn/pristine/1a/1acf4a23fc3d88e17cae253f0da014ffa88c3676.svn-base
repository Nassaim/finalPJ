<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<sec:authorize access="isAuthenticated()">
   <sec:authentication property="principal.realMember" var="member" />
</sec:authorize>
<style>
	#addData{
		width: 80%;
	}
	.contentLi{
		color: black;
	}
	#list1 .form-control {
	border-color: transparent;
	}
	#list1 .form-control:focus {
	border-color: transparent;
	box-shadow: none;
	}
	#list1 .select-input.form-control[readonly]:not([disabled]) {
	background-color: #fbfbfb;
	}
	#selbox{
		width:auto;
	}
	#date{
		width:200px;
	}

	.progress{
		margin-top: 50px;
/* 		padding: 0 30px 0 30px; */
	}
	.addBtn{
		color: white;
		font-size: 32px;
		background-color: #8851ff;
		border: none;
		width: 50px;
	}
	.card{
		background-color: transparent;
		border: none;
	}
	
	.checkUl{
		width: 86%;
		margin: auto;
	}
	.checkbox{
		font-size: 24px;
	}
</style>
<div style="width: 96%; margin: auto;">
<div class="progress">
    <div id="progressBar" class="progress-bar" role="progressbar" style="width: 100%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
</div>
</div>
  <div class="container py-5 h-100">
    <div class="col">
      <div class="card" id="list1" style="border-radius: .75rem; background-color: #eff1f2; min-width:700px;">
        <div class="card-body py-4 px-4 px-md-5">
          <h2 style="text-align: center;">TODOLIST</h2>
          
          <div class="pb-2">
            <div class="card">
              <div class="card-body">
                <div class="d-flex flex-wrap justify-content-center">
                  <input type="text" class="form-control" id="addData"
                    placeholder="해야할 일을 추가하세요." onkeyup="if(window.event.keyCode==13){addTodo()}" 
                    style="border: 1px solid gray; border-right: none;" autocomplete="off">
                  <div>
                    <button onClick="addTodo()" class="addBtn"  style="border: 1px solid gray; border-left: none;">+</button>
                  </div>
                </div>
                  
              </div>
            </div>
          </div>
          <hr class="my-4">

          <div class="d-flex justify-content-end align-items-center mb-4 pt-2 pb-3">
            <p class="small mb-0 me-2 text-muted">Filter</p>
            <input type="date" class="form-control" id="date">
            <select class="form-select yn" id="selbox">
              <option value="All">전체</option>
              <option value="N">해야할 일</option>
              <option value="Y">완료</option>
            </select>
          </div>
		<div id="todoBody">
			
		</div>
        </div>
      </div>
    </div>
  </div>

<input type="hidden" value="${blogId}" id="blogId">
<script>
const url = "/blog/${memId}";

</script> 
<script src="/resources/js/blog/todoList.js"></script>