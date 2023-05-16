<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container-fluid card">
	<div class="row py-2">
		<form action="/coco/admin/allMemberList" method="POST" id="searchForm" name="searchForm">
			<div class="d-flex justify-content-end">
				<div class="col-sm-3 d-flex">
					<label for="searchWord" class="col-sm-2 col-form-label">단어검색</label>
					<div class="col-sm-10">
						<input type="hidden" name="page" id="page">
						<input type="text" name="searchWord" id="searchWord" class="form-control" value="${searchWord }">
					</div>
				</div>
			</div>			
		</form>
	</div>
	<div class="row">
		<div class="card">
			<table id="datatable" class="table mt-0 table-striped table-card table-nowrap">
				<thead class="text-uppercase small text-body-secondary">
					<tr>
						<td>순번</td>
						<td>회원아이디</td>
						<td>회원명</td>
						<td>회원닉네임</td>
						<td>회원이메일</td>
						<td>회원연락처</td>
						<td>멘토신청여부</td>
					</tr>
				</thead>
				<tbody id="tbody">
					<c:set value="${pagingVO.dataList }" var="memberList"/>
					<c:set value="${start }" var="num"/>
					<c:choose>
						<c:when test="${empty memberList }">
							<tr>
								<td>조회할 회원이 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${memberList }" var="member">
								<tr id="trs">
									<td>${num }</td>
									<td>${member.memId }</td>
									<td>${member.memName }</td>
									<td>${member.memNick }</td>
									<td>${member.memMail }</td>
									<td>${member.memHP }</td>
									<td>${member.memexpYn }</td>
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
	</div>
</div>


<script>
	$(document).ready(function() {


	});
</script>
