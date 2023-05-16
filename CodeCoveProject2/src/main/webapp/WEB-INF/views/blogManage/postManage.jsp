<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
#delBtn {
	float: right;
}

#searchType {
	width: 100px;
	background-position: right 0px center;
	padding: 5px;
}

#delBtn {
	font-size: 18px;
}

#searchUI {
	width: 50%;
	margin: auto;
}

#searchBtn {
	padding: 10px;
	padding-right: 24px;
	padding-left: 15px;
}

a {
	color: black;
}
</style>

<h2>글관리</h2>
<hr>

<div id="searchUI" class="d-flex justify-content-center">
	<select id="searchType" name="searchType"
		class="custom-select custom-select-sm form-control form-control-sm form-select form-select-sm">
		<option value="">선택</option>
		<option value="cateNm">카테고리</option>
		<option value="postTitle">제목</option>
	</select> 
	<input type="text" name="searchWord" placeholder="검색어" class="form-control" autocomplete="off" onkeyup="if(window.event.keyCode==13){f_search()}"/>
	<input onclick="f_search()" id="searchBtn" type="button" value="검색" class="btn btn-primary btn-rounded waves-effect waves-light"/>
</div>

<div class="card-body">
	<br>
	<div class="table-responsive">
		<table class="table mb-0" style="color: black;">

			<thead>
				<tr>
					<th><input type="checkbox" class="form-check-input"	id="CheckAll"/></th>
					<th>작성한 게시글</th>
					<th><i id="delBtn" class="ri-delete-bin-line"	onclick="postDeleteClick()"></i>
				</tr>
			</thead>
			<tbody id="postTbody">

			</tbody>
			<tfoot>
				<tr>
					<td colspan="8" style="border-bottom: none;">
						<div class="d-flex justify-content-center" id="postPagingArea">
						</div>

					</td>
				</tr>
			</tfoot>
		</table>
	</div>

</div>

<form id="searchForm" action="/blog/${memId}/getPost">
	<input type="hidden" name="postPage" placeholder="page">
	<input type="hidden" name="searchType" placeholder="searchType"/>
	<input type="hidden" name="searchWord" placeholder="searchWord"/>
</form>


<script>
	let postTbody = $("#postTbody");
	let postPagingArea = $("#postPagingArea");
	let searchUI = $("#searchUI");
	let searchForm = $("#searchForm");
	const selectURL = searchForm.attr("action");
	const delURL = "/blog/${memId}/delPost";
	const loginURL = "/login";
	const checkURL = "/blog/blogManage/check";

	$("[name='searchType']").val("${postpagingVO.searchType}");
	$("[name='searchWord']").val("${postpagingVO.searchWord}");

	postPagingArea.on("click", "a", function(event) {
		let postPage = $(this).data("page");
		searchForm.find("[name=postPage]").val(postPage);
		searchForm.submit();
	});

	function f_search(event) {
		searchForm.get(0).reset();
		let inputs = searchUI.find(":input[name]");
		$(inputs).each(function(idx, input) {
			let name = $(this).attr("name");//search type, searchword가져옴
			let value = $(this).val();
			searchForm.find("[name=" + name + "]").val(value);//value 넣음
		});
		searchForm.submit();
	}

	let makePostTr = function(index, post) {
		let inputTag = $("<input>").attr("type", "checkbox");
		inputTag.addClass("form-check-input");
		inputTag.attr("id", post.postNum);
		inputTag.attr("name", "check");
		inputTag.attr("value", post.postNum);
		let thTag = $("<th>").append(inputTag);
		let aTitleTag = $("<a>").attr("href",
				"/blog/${memId}/post/" + post.postNum).text(
				post.postTitle);
		let aCateTag = $("<a>").attr("href",
				"/blog/${memId}/cate/" + post.cateNm).text(post.cateNm);
		let innerTag = $("<h5>").append(aTitleTag);

		let tdTag = $("<td>").attr("colspan", "2").append(innerTag, aCateTag)
				.append("   " + post.postDate);
		return $("<tr>").append(thTag, tdTag);
	}

	function post_tr() {
		$("#postTbody > tr").mouseover(function() {
			//console.log("this:",this);
			this.style.color = "black";
			this.style.backgroundColor = "#dcdcdc";
		});

		$("#postTbody > tr").mouseout(function() {
			//console.log("this:",this);	
			this.style.color = "";
			this.style.backgroundColor = "white";
		})
	}

	searchForm.on(
			"submit",
			function(event) {
				let data = searchForm.serialize();
				event.preventDefault();

				$.ajax({
					url : selectURL,
					data : data,
					method : 'GET',
					dataType : "json",
					success : function(resp, status, jqXHR) {
						console.log("ck:", resp.postPagingVO);
						let key = Object.keys(resp);
						if (key == "loginurl") {
							location.href = loginURL;

						} else if (key == "checkurl") {
							location.href = checkURL;
						} else {
							let postPagingVO = resp.postPagingVO;
							console.log(postPagingVO);
							let postList = postPagingVO.dataList;
							let pagingHTMLBS = postPagingVO.pagingHTMLBS;
							let postTrTags = [];
							if (postList && postList.length > 0) {
								$.each(postList, function(index, post) {
									postTrTags.push(makePostTr(index, post));
								});
								postPagingArea.html(pagingHTMLBS);
							} else {
								let postTrTag = $("<tr>").html($("<td>").attr("colspan", "4").html("작성한 게시글이 없어요"));
								postPagingArea.html("");
								postTrTags.push(postTrTag);
							}
							postTbody.html(postTrTags);
							$("#CheckAll").prop("checked", false);
							post_tr();
							postCheck();

						}
					},
					error : function(jqXHR, status, error) {
						console.log(jqXHR);
						console.log(status);
						console.log(error);
					}
				});
				return false;
			}).submit();
</script>
<script src="/resources/js/blog/postManage.js"></script>
