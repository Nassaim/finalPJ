<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="container pt-10">
	<div class="row">
		<h4 class="h4">공지사항</h4>
	</div>
	<div class="row py-2">
		<div class="d-flex justify-content-end">
			<label for="searchWord" class="col-sm-1 col-form-label py-1">단어검색</label>
			<div class="col-sm-2">
				<form method="post" action="/coco/admin/noticeRetrieve" id="searchForm">
					<input type="hidden" name="page" id="page">
					<input type="text" name="searchWord" id="searchWord" class="form-control">
				</form>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="card">
			<table class="table table-hover" style="table-layout: fixed;">
				<thead>
					<tr>
						<th class="col-1 text-center">순번</th> 
						<th class="col-5 text-center">제목</th> 
						<th class="col-2 text-center">작성자</th> 
						<th class="col-3 text-center">등록일</th> 
						<th class="col-1 text-center">조회수</th> 
					</tr> 
				</thead>
				<tbody>
					<c:set value="${pagingVO.dataList }" var="noticeList"/>
					<c:set value="${start }" var="num"/>
					<c:choose>
						<c:when test="${empty noticeList }">
							<tr>
								<td colspan="5">조회할 게시글이 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${noticeList }" var="notice" varStatus="stat">
								<tr>
									<td class="text-center">${num }</td>
									<td style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden;">
										<a href="/coco/readNotice?notiNum=${notice.notiNum}" >
											${notice.notiTitle }
										</a>
									</td>
									<td class="text-center">${notice.writerId }</td>
									<td class="text-center"><fmt:formatDate value="${notice.notiDate }" pattern="yyyy-MM-dd"/></td>
									<td class="text-center">${notice.viewNum }</td>
								</tr>
								<c:set value="${num - 1 }" var="num"/>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<div class="row">
				<div class="card-footer clearfix mt-2" id="pagingArea">
					${pagingVO.pagingHTML }
				</div>
			</div>
		</div>
		<div class="row py-2 mx-0 px-0">
			<div class="d-flex justify-content-end">
				<input type="button" value="등록" class="btn" id="registerBtn">
			</div>
		</div>
	</div>
</div>

<script>
	const registerBtn = document.querySelector("#registerBtn");
	registerBtn.addEventListener("click", function(){
		location.href = "/coco/registerNoticeForm";
	});
</script>