<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<style>
	.row {
		margin : 2px;
		padding : 3px;
	}
</style>

<div class="container pt-7" id="readWrap">
	<div class="card">
		<div class="row">
			<div><strong>문의게시글 정보</strong></div>
			<div class="d-flex">
				<div class="col-sm-3">
					문의식별번호 : ${qnaVO.qnaNum }
				</div>
				<div class="col-sm-9">
					제목 : ${qnaVO.qnaTitle }
				</div>
			</div>
			<div class="d-flex">
				<div class="col-sm-2">
					공개여부 : ${qnaVO.qnaPublicYn }
				</div>
				<div class="col-sm-5">
					문의날짜 : <fmt:formatDate value="${qnaVO.qnaDate }" pattern="yyyy-MM-dd"/> 
				</div>
				<div class="col-sm-5">
					조회수 : ${qnaVO.viewNum }
				</div>
			</div>
		</div>
		<div class="row">
			<div><strong>작성자 정보</strong></div>
			<div class="d-flex">
				<div class="col">
					작성자ID : ${qnaVO.writerId }
				</div>
				<div class="col">
					작성자 이름 : ${qnaVO.memList[0].memName }
				</div>
				<div class="col">
					작성자 별명 : ${qnaVO.memList[0].memNick }
				</div>
				<div class="col">
					작성자 E-mail : ${qnaVO.memList[0].memMail }
				</div>
				<div class="col">
					작성자 연락처 : ${qnaVO.memList[0].memHP }
				</div>
			</div>
		</div>
		<div class="row">
			<div class="dispIMG d-flex">
				<c:forEach items="${qnaVO.attatchList }" var="attList">
					<div class="col-sm-2">
						<img alt="attImage" src="/upload/${attList.saveNm }" style="width: 100%; height: auto;">
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="row">
			${qnaVO.qnaContent }
		</div>
		<div class="row">
			<div>
				첨부파일 목록:  
			</div>
			<div id="dispAtt" style="height: 60px; overflow-x:hidden; overflow-y: scroll;;  ">
				<c:if test="${not empty qnaVO.attatchList}">
					<table>
						<c:forEach items="${qnaVO.attatchList }" var="attList">
							<tr>
								<th>파일명 : </th>
								<td>${attList.saveNm }</td>
								<th> / 파일크기</th>
								<td>${attList.attatchSize }</td>
								<td> / 다운로드</td>
							</tr>
						</c:forEach>
					</table>
				</c:if>
			</div>
		</div>
		<hr/>
		<div class="row">
			<div class="d-flex justify-content-end my-1 mx-1 py-1 px-1">
				<form action="/coco/AnswerRegister" method="POST" id="rFrm">
					<div class="card">
						<div class="row">
							<div class="col-sm-8">
								답변자 : ${qnaVO.answerId }
								<input type="hidden" name="qnaNum" value="${qnaVO.qnaNum }">
							</div>
							<div class="col-sm-4">
								답변등록일 : <fmt:formatDate value="${qnaVO.answerDate }" pattern="yyyy-MM-dd"/> 
							</div>
							<c:choose>
								<c:when test="${not empty qnaVO.answerContent }"> 
									<textarea id="answerContent" name="answerContent" class="form-control" rows="3" cols="55" style="resize: none;">${qnaVO.answerContent }</textarea>
								</c:when>
								<c:otherwise>
									<textarea id="answerContent" name="answerContent" class="form-control" rows="3" cols="55" style="resize: none;"></textarea>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="row mt-0 pt-0">
							<div class="d-flex justify-content-end" >
								<input type="button" id="passBtn" name="passBtn" value="게시글 비밀번호 초기화" class="btn">
								<input type="button" id="aBtn" value="답변" class="btn">
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="d-flex justify-content-end">
			<input type="button" id="listBtn" name="listBtn" value="목록" class="btn">
			<input type="button" id="updateBtn" name="updateBtn" value="수정" class="btn">
			<input type="button" id="delBtn" name="delBtn" value="삭제" class="btn">
		</div>
	</div>
</div>



<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	const aBtn = $("#aBtn");
	aBtn.on("click", function() {
		rFrm.submit();
	});

	const listBtn = $("#listBtn");
	listBtn.on("click", function() {
		location.href = "/coco/QnABoard";
	});
	
	
	
</script>

