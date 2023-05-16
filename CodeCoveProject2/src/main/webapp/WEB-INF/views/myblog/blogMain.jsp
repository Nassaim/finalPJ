<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.realMember" var="member" />
</sec:authorize>

<style>

#searchUI{
	width: 350px;
	float: right;
}
p{
	text-align: center;
}

#thumbnail{
	height:180px;
	width:180px;
	margin-top: 0;
}	

#pst{
	color: #2E2E2E;
	font-size: 18px;
}

#first {
    float: left;
    width:20%;
    height:150px;
    margin: 10px;
    box-sizing: border-box;
}

#second{
    float: left;
    width:70%;
    height:150px;
    margin: 10px;
    box-sizing: border-box;
}
#write{
    margin: 5px;
    float: right;
}

.card-title-desc{
    text-align:left;
}

#blogTitle{
	width: 300px;
	float: left;
	font-family: 'Noto Sans KR';
}

.card{
	border: none;
	box-shadow: none;
}

.card-body{
	border-bottom: 1px solid #848484;
	height: 280px;
}

#categoryposition{
	float: left;
}
.cateNm{
	font-size: 25px;
	color: black;
	text-align: center;
	padding-top: 20px;
}


#inputData{
	background-color: white;
	border: 1px solid #A4A4A4;
}
</style>

<div style="width: 100%;  border-bottom: 3px solid black; float: left; padding-top: 15px;">
<div id="categoryposition">
<c:if test="${empty cateNm}">
	<p class="cateNm"><i class="ri-menu-line " style="font-size: 20px; padding-right: 5px;"></i> 전체보기</p>
</c:if>
<c:if test="${not empty cateNm}">
	<p class="cateNm" ><i class="ri-menu-line " style="font-size: 20px; padding-right: 5px;"></i> ${cateNm}</p>
</c:if>
</div>
	<div>
	<div class=" mb-3" id="searchUI">
		<form class="app-search d-none d-lg-block">
			<div class="position-relative">
				<input id="inputData" type="text" class="form-control" placeholder="검색" aria-label="Recipient's username"	autocomplete="off" aria-describedby="basic-addon2"
				onkeyup="if(window.event.keyCode==13){f_search()}" />
				<span onclick="f_search()" class="ri-search-line"></span>
			</div>
		</form>
		</div>
	</div>
</div>



<div style="width: 100%; float: left; padding : 30px;">
<c:set var="postList" value="${pagingVO.dataList }" />
<c:if test="${not empty postList }">
	<c:forEach items="${postList }" var="post" varStatus="status">
	    <div class="card">
	        <div class="card-body" id="parent" style="min-width:1000px;">
	            <div class="row" id="first">
	                <a href="/blog/${post.bloggerId }/post/${post.postNum }"><img id="thumbnail" class="card" alt="200x200" src="${post.thumbnail }" data-holder-rendered="true"></a>
	            </div>
	            <div id="second">
	            	<a href="/blog/${post.bloggerId }/post/${post.postNum }"><h4>${post.postTitle }</h4></a>
	            	<div>
		            	<p class="card-title-desc"><a href="/blog/${post.bloggerId }/cate/${post.cateNm }" >${post.cateNm }</a> | ${post.postDate }
		            	<c:if test="${post.postPublicYn eq 'N' }">
		            		|<i class="ri-rotate-lock-line"></i>비공개
		            	</c:if>
		            	</p>
	            	</div>

	            	<div class="postCnt" data-cnt="${status.count }">
				        <p class="card-title-desc" id="pst">${post.jsonContents[0].data.text }<br>${post.jsonContents[1].data.text }</p>
	            	</div>
	            	<div class="postCnt" data-cnt="${status.count }">
				        <p class="card-title-desc" id="tags">${post.postTag }</p>
	            	</div>
	            </div>
	        </div>
	    </div>
	</c:forEach>
</c:if>
<c:if test="${empty postList }">
 <div style="text-align: center; font-size: 20px;">게시글이 없습니다.</div>
</c:if>
<c:if test="${not empty postList }">
	<div class="d-flex justify-content-center pagingArea">${pagingVO.pagingHTMLBS }</div>
</c:if>
<c:if test="${member['memId'] eq memId}">
<!-- 	<div> -->
<%-- 		<a href="/blog/${member.memId}/post" class="btn btn-outline-primary waves-effect waves-light" id="write">글쓰기</a> --%>
<!-- 	</div> -->
</c:if>
</div>
<form id="searchForm">
	<input type="hidden" name="page" id="page">
	<input type="hidden" name="searchWord" id="searchWord" >
</form>

<script>
let modal = document.querySelector("#modal");

let pagingArea = $(".pagingArea");
pagingArea.on('click', function(event) {
	page.value = event.target.innerText;
	searchWord.value = inputData.value;
	searchForm.submit();
});

function f_search(){
	searchWord.value = inputData.value;
	alert("검색" +$("#inputData").val() );
	searchForm.submit();
}

</script>