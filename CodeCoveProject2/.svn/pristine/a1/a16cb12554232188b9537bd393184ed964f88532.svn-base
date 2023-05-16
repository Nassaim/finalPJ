<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.realMember" var="member" />
</sec:authorize>
<style>
#catebody {
	margin-left: 100px;
}

#folder {
	font-size: 180px;
}

.blogCateList-cate {
	float: left;
	margin-left: 60px;
	width: 242px;
	height: 399px;
}

.blogCateList-cate-name {
	text-align: center;
	width: 166px;
	font-weight: bold;
}

#searchUI {
	width: 50%;
	margin: auto;
}

#createBtn {
	float: right;
}

#catePagingArea {
	bottom: 0px;
	width: 100%;
	float: left;
}

#btnFamily {
	margin-left: 130px;
}

.i-btn {
	padding: 7px;
}

#modelfolder {
	font-size: 120px;
	text-align: center;
}

#checkOk {
	color: red;
}

#searchBtn {
	padding: 10px;
	padding-right: 24px;
	padding-left: 4px;
}

#searchType {
	width: 100px;
	background-position: right 0px center;
	padding: 5px;
}

#searchUI {
	width: 50%;
	margin: auto;
}
</style>

<div>
	<table style="width: 100%">
		<tr>
			<td><h2 style="width: 300px; float:">카테고리관리</h2></td>
			<td><div>
					<button class="btn btn-primary" id="createBtn"
						data-bs-toggle="modal" data-bs-target="#createModal">카테고리 생성</button>
				</div></td>
		</tr>
	</table>

	<hr>
	<br>
	<div>
		<div class="input-group mb-3" id="searchUI">
			<input id="inputData" type="text" class="form-control" placeholder="카테고리검색" aria-label="Recipient's username"	autocomplete="off" aria-describedby="basic-addon2"
				onkeyup="if(window.event.keyCode==13){f_search()}" />
			<button onclick="f_search()" class="btn btn-primary btn-rounded waves-effect waves-light">검색</button>
		</div>
	</div>


	<div id="catebody" style="min-width: 500px;"></div>
</div>

<div id="catePagingArea" class="d-flex justify-content-center"></div>

<form id="searchForm">
	<input type="hidden" name="searchWord" placeholder="카테고리명" /> <input
		type="hidden" name="catePage" placeholder="page" />
</form>

<!-- 카테고리생성모달 -->
<div class="modal fade" id="createModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">카테고리 생성</h5>
			</div>
			<form action="/blog/${memId}/create" method="get" id="createForm">
				<div class="modal-body">
					<p>*카테고리명은 11자 까지 가능합니다</p>
					<p>*기존 카테고리명과 중복될 수 없습니다.</p>
					<p class="ri-folder-5-fill" id="modelfolder">
						<input hidden="hidden" /> 
						<input type="text" class="form-control"	id="createInput" name="createNm" />
					</p>
					<span id="checkOk"></span>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" onclick="create()">생성하기</button>
					<button type="button" class="btn btn-secondary" id="createClose" data-bs-dismiss="modal">닫기</button>
				</div>
			</form>
		</div>
	</div>
</div>


<script>
	let upURL = "/blog/${memId}/upName";
	let delURL = "/blog/${memId}/delNum";
	let selectURL = location.href.substring(0, location.href.lastIndexOf("/"));
	selectURL += "/blogManage";
	let checkURL = "/blog/blogManage/check";
	let loginURL = "/login";
	let makeTrURL = "/blog/${memId}";
</script>
<script src="/resources/js/blog/blogManage.js"></script>