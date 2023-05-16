<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set value="등록" var="text" />
<c:if test="${status eq 'u' }">
	<c:set value="수정" var="text"/>
</c:if>

<h2>코드 ${text } 폼</h2>
<div id="info"></div>
<div>
	<form id="sFrm" method="post" action="/coco/admin/registerComCode">
		<table border="1">
			<tbody>
				<tr>
					<th>공통코드ID</th>
					<td><input type="text" id="comCode" name="comCode" value="${comCodeVO.comCode }" ></td>
				</tr>
				<tr>
					<th>공통코드그룹</th>
					<td> 
						<c:set value="${grpList }" var="grpList"/>
						<select id=comCodeGrp name="comCodeGrp">
							<option>선택</option>
							<c:forEach items="${grpList }" var="item">
								<option>${item.comCodeGrp }</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th>공통코드내용</th>
					<td colspan="2"><input type="text" id="comCodeNm" name="comCodeNm" value="${comCodeVO.comCodeNm }"></td>
				</tr>
			</tbody>
		</table>
		<input type="button" id="subBtn" value="${text }">
		<input type="button" id="backBtn" value="취소">
	</form>
</div>



<script>
const sFrm = $("#sFrm")


$(document).ready(function(){
	$("#backBtn").on("click", function(){
		location.href = "/coco/admin/codelist";
	});
	
	$("#subBtn").on("click", function() {
		if($(this).val() == "수정") {
			sFrm.attr("action", "/coco/admin/modifyCode")
		}
		sFrm.submit();
	});
	
	
	function f_readInfo() {
		if($("#subBtn").val() == "수정" ) {
			$("#comCode").attr("readonly", true);
			$("#info").html("코드ID는 수정할 수 없습니다.")
		} else {
			$("#comCode").attr("readonly", false);
		}
	};

	f_readInfo();

});



</script>

	


