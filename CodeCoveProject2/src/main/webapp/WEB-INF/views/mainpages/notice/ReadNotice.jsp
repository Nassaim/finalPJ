<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<style>
	.row {
		margin : 2px;
		padding : 3px;
	}
</style>

<div class="container pt-7">
	<div class="row">
		<h4 class="h4 text-center">공지사항</h4>
	</div>
	
	<hr/>
	
	<div class="card">
		<div class="row">
			<div class="row">
				<div class="d-flex">
					<div class="col-sm-4">
						공지코드 : ${noticeVO.notiNum }
					</div>
					<div class="col-sm-4">
						등록일 : <fmt:formatDate value="${noticeVO.notiDate }" pattern="yyyy-MM-dd"/> 
					</div>
					<div class="col-sm-4">
						조회수 : ${noticeVO.viewNum }
					</div>
				</div>
			</div>
			<div class="row">
				<div>
					제목 : ${noticeVO.notiTitle }
				</div>
			</div>
		</div>
		<div class="row">
			<div class="d-flex" id="disp">
				<c:forEach items="${noticeVO.attatchList }" var="att">
					<div class="row">
						<img alt="" src="/upload/${att.saveNm }">
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="row">
			<div>
				${noticeVO.notiContent }
			</div>
		</div>
		<div class="row">
			<div>첨부파일 목록 : </div>
			<div id="attList">
				<c:if test="${not empty noticeVO.attatchList}">
					<table>
						<c:forEach items="${noticeVO.attatchList }" var="attList">
							<tr>
								<th>파일명 : </th>
								<td>${attList.originNm }</td>
								<th> / 파일크기</th>
								<td>${attList.attatchSize }</td>
								<td> / 
									<a href="/upload/${attList.saveNm }" download="/upload/${attList.originNm}"> 
										다운로드
									</a>
								</td>
							</tr>
						</c:forEach>
					</table>
				</c:if>
			</div>
		</div>
		<div class="row">
			<div class="d-flex justify-content-end">
				<input class="btn" id="listBtn" type="button" value="목록">
				<input class="btn" id="" type="button" value="수정">
				<input class="btn" id="" type="button" value="삭제">
			</div>
		</div>
	</div>
</div>

<script>
	const listBtn = document.querySelector("#listBtn");
	listBtn.addEventListener("click", function(){
		location.href = "/coco/noticeRetrieve"
	});
</script>