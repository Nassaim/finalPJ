<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div>
	<table border="1">
		<tr>
			<th>관리코드ID</th>
			<td>${ComCodeVO.comCode }</td>
		</tr>
		<tr>
			<th>관리코드내용</th>
			<td>${ComCodeVO.comCodeGrp }</td>
		</tr>
		<tr>
			<th>관리코드그룹</th>
			<td>${ComCodeVO.comCodeNm }</td>
		</tr>
		<tr>
			<th>관리코드그룹이름</th>
			<td>${ComCodeVO.comCodeGrpNm }</td>
		</tr>
	</table>
	<div>
		<input type="button" id="listBtn" name="listBtn" value="목록">
		<input type="button" id="upBtn" name="upBtn" value="수정">
		<input type="button" id="delBtn" name="delBtn" value="삭제">
		
		<form method="get" action="/coco/admin/codeModifyForm" id="dFrm">
			<input type="hidden" name="comCode" value="${ComCodeVO.comCode }">
		</form>
	</div>
</div>

<script type="text/javascript">
	const listBtn = document.getElementById('listBtn');
	const upBtn = document.getElementById('upBtn');
	const dFrm = document.getElementById('dFrm');

	window.onload = function(){	
		listBtn.addEventListener("click", function(){
			location.href = "/coco/admin/codelist";
		});
		
		upBtn.addEventListener("click", function(){
			dFrm.submit();
		});
		
	}

	$("#delBtn").on("click", function(){
		if(confirm("정말로 삭제하시겠습니까?")) {
			$("#dFrm").attr("method", "post");
			$("#dFrm").attr("action", "/coco/admin/removeComCode");
			$("#dFrm").submit();
		} else {
			$("#dFrm").reset();
		}

	});


</script>