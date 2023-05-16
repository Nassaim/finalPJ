<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.searchData{
	width: 100%;
	float: left;
}
.pagingArea{
	bottom:0px;
	width: 100%;
	float: left;
}
</style>
<div class="input-group mb-3" id="searchUI" style="width: 80%; margin: auto;">
	<input id="inputData" type="text" class="form-control"
		placeholder="검색어를 입력하세요." aria-label="Recipient's username"
		aria-describedby="basic-addon2"
		onkeyup="if(window.event.keyCode==13){getSearchList()}" autocomplete="off"/>
	<button onclick="getSearchList()"
		class="btn btn-primary btn-rounded waves-effect waves-light"><i class="ri-search-line"></i></button>
</div>
<div class="searchData"></div>
<div class="d-flex justify-content-center pagingArea"></div>

<input id="page" name="page" type="hidden"/>

<script>
const searchUrl = "/blog/searchList";

let pagingArea = document.querySelector(".pagingArea");
pagingArea.addEventListener('click', function(event){
	let clickPage = event.target.innerHTML;
	page.value = clickPage;
	getSearchList();
});

// 검색 목록 가져오기
function getSearchList(){
	let searchData = $('.searchData');	
	
	$.ajax({
		url : searchUrl
		, data : {
			"page":page.value
			, "searchWord":inputData.value
		}
		, method : "get"
		, dataType : "json"
		, success : function(resp, status, jqXHR) {
			let blogList = resp.dataList;
			console.log("blogList", blogList);
			if(blogList&&blogList.length>0){
				let searchArr = [];
			   	for(let i = 0; i < blogList.length; i++) {
			   		searchArr.push(mkList(blogList[i]));
				}
				searchData.html(searchArr);
			   	pagingArea.innerHTML=resp.pagingHTMLBS;
			   	
			}else{
				searchData.html("");
				pagingArea.innerHTML="검색 정보가 없습니다.";
			}
			
		},  
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}

</script>
<script src="/resources/js/blog/blogFunction.js"></script>