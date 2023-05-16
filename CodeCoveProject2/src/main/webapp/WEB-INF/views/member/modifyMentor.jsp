<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>

.experience-btn {
  color: #00c7ae;
  border-color: #00c7ae;
}

.btn-check+.btn:hover,
.btn-check+.btn:focus {
  color: #fff;
  background-color: #00c7ae;
  border-color: #00c7ae;
}

.btn-check:checked+.btn {
  background-color: #00c7ae;
}

</style>

       <div class="card shadow" style="margin : 20px; padding-top : 20px; padding-bottom: 20px;">
        <section class="position-relative" >
          <form id="mentorForm" method="post" action="/coco/modifyMentor" enctype="multipart/form-data">
            <div class="container position-re   lative"   style="display: flex;">
                <div class="row" style="display: inline-block;">
                    <div class="col-lg-12">
                        <h3 class="mb-2">멘토 신청</h3>
   						<h6> 개인 정보 노출 및 허위 정보를 기재할 경우, CodeCove 이용이 <br> 제한될 수 있으며 사안에 따라 법적 책임을 물을 수 있습니다.</h6>
                        <!--Create Form-->
                            <div class="row">
                                <div class="col-12 mb-4"> <!-- 파일 올릴 때 참고 -->
                                </div>
                                <div class="col-12 mb-4" style="width : 300px">
                                    <label class="h6" for="create_name">이름 <span class="text-danger">*</span></label>
                                    <!--Input-->
                                    <input type="text" id="formName"
                                        class="form-control form-control-sm" value="${expert.memName }" readonly>
                                    <input type="hidden" name="formId" id="formId"  value="${expert.formId }">
                                    <input type="hidden" name="memId" id="memId"  value="${expert.formId }">
                                </div>
                                
                                <!-- 링크자리 -->
                                <div class="col-12 mb-4">
                                    <div>
                                        <div>
                                            <label class="h6" for="create_description">상세설명 </label><span class="text-danger"> *</span>
                                    		<small class="d-block opacity-50 mb-2">아래에 작성한 부분은 솔루션 페이지에서 회원들이 열람할 수 있습니다.</small>
                                        </div>
                                    </div>
                                        <div>
                                        	<p style="float:right;">
	                                        	<a class="mb-0 small" id="textCount">0</a>
	                                            <a class="mb-0 small" id="textTotal">/1000자</a>
                                            </p>
                                        </div>
                                    
                                    <textarea name="expFormContent" id="expFormContent" rows="8"
                                        class="form-control" placeholder="멘토님에 대한 소개와, 서비스 제공 방법, 준비사항 등을 자세히 적어주세요!">${expert.expFormContent }</textarea>
                                       
                                </div>
                                       
							  <!--Custom width select demo-->
							  <div style="display:flex; margin-bottom : 20px;">
								    <div class="width-20x" style="display: inline-block;">
	<!-- 							    <div class="width-20x d-flex align-items-center"> -->
									  		<label for="numbers">직무</label><span class="text-danger"> *</span>
<!-- 									  		<select id="expJobMajor" name="expJobMajor" class="form-control form-control-sm"  data-choices='{"searchEnabled":true, "allowHTML":true,"itemSelectText":""}'> -->
									  		<select id="expJobMajor" name="expJobMajor" class="form-control form-control-sm">
												<option value="">직무 선택</option>
												<option value="게임 클라이언트 개발자">게임 클라이언트 개발자</option>
											    <option value="게임 서버 개발자">게임 서버 개발자</option>
											    <option value="경영지원">경영지원</option>
											    <option value="데이터 분석가">데이터 분석가</option>
											    <option value="데이터 사이언티스트">데이터 사이언티스트</option>
											    <option value="데이터 엔지니어">데이터 엔지니어</option>
											    <option value="그래픽 디자이너">그래픽 디자이너</option>
											    <option value="머신러닝 엔지니어">머신러닝 엔지니어</option>
											    <option value="비지니스 분석가">비지니스 분석가</option>
											    <option value="보안 엔지니어">보안 엔지니어</option>
											    <option value="백엔드/서버 개발자">백엔드/서버 개발자</option>
											    <option value="안드로이드 개발자">안드로이드 개발자</option>
											    <option value="크로스플랫폼 앱 개발자">크로스플랫폼 앱 개발자</option>
											    <option value="프론트엔드/웹퍼블리셔">프론트엔드/웹퍼블리셔</option>
											    <option value="DevOps">DevOps</option>
											    <option value="개발자">IOS 개발자</option>
											    <option value="PO/PM">PO/PM</option>
											    <option value="테스트엔지니어">QA/테스트엔지니어</option>
											    <option value="SW 엔지니어">SW 엔지니어</option>
										    </select>
									</div>
										<div style="width : 80px;"></div>
										<div style="display: inline-block;">
											<c:set value="${expert.expJobCurrent }" var="expJobCurrent"/>
											<c:if test="${empty expert.expJobCurrent }">
												<c:set value="" var="expJobCurrent"/>
											</c:if>
											<span>현직장(선택사항) </span><input class="form-control form-control-sm" name="expJobCurrent" type="text" value="${expJobCurrent}">
										</div>
								</div>
									<!-- 버튼 -->
									<div>
						  			<label for="numbers">경력</label><span class="text-danger"> *</span><br>
						  			
  			                            <input type="radio" class="btn-check nini-btn" id="joblevel1" name="expJobLevel" checked="checked" readonly="readonly" value="주니어(1~3년)">
			                            	<label class="btn btn-outline-success btn-sm me-2 experience-btn" for="joblevel1">주니어(1~3년)</label>
			                            	
			                            <input type="radio" class="btn-check experience-btn" id="joblevel2" name="expJobLevel" readonly="readonly" value="미들(4~8년)">
			                            	<label class="btn btn-outline-success btn-sm me-2 experience-btn" for="joblevel2">미들(4~8년)</label>
			                            	
			                            <input type="radio" class="btn-check experience-btn" id="joblevel3" name="expJobLevel" readonly="readonly" value="시니어(9년 이상)">
			                            	<label class="btn btn-outline-success btn-sm me-2 experience-btn" for="joblevel3">시니어(9년 이상)</label>
			                            	
		                            	<br><div style="margin-bottom:10px"></div>
		                            	
			                            <input type="radio" class="btn-check experience-btn" id="joblevel4" name="expJobLevel" readonly="readonly" value="Lead레벨">
			                            	<label class="btn btn-outline-success btn-sm me-2 experience-btn" for="joblevel4">Lead레벨</label>
			                            	
			                            <input type="radio" class="btn-check experience-btn" id="joblevel5" name="expJobLevel" readonly="readonly" value="프리랜서">
			                           		<label class="btn btn-outline-success btn-sm me-2 experience-btn" for="joblevel5">프리랜서</label>
									  			
									  	<input type="hidden"  name="expFormNum" id="expFormNum" value="${expert.expFormNum }">
									  	<input type="hidden"  name="delList" id="delList">
									</div>
                                     
                                <div class="errorTxt"></div>
                                <div class="col-12 mt-3">
                                    <button type="button" id="submitBtn" class="btn btn-primary mb-2 me-1" style="background-color : #00c7ae; border-color : #00c7ae;">수정하기</button>
                          			<button type="button" onclick="location.href='/coco/mentorList'" class="btn btn-danger mb-2 me-1">취소하기</button>
                                </div>

                            </div>

                    </div>
                </div>
            <div style="display: inline-block;">
			</div>                
                
            <!--포트폴리오 파일 부분-->
            <div style="display: inline-block;">
                    <!--//Page content//-->
<!--                     <div class="content pt-3 px-3 px-lg-6 d-flex flex-column-fluid" style="width:500px;"> -->
                    <div class="content pt-3 px-3 px-lg-6 d-flex flex-column-fluid" style="width:500px;">
                        <div class="container-fluid px-0">
                        
                        <div class="col-12 mb-4">
                             <label class="h6 mb-0" for="create_external_link">포트폴리오 링크</label>
                             	<small class="d-block opacity-50 mb-2">포트폴리오 링크 또는 파일을 업로드해주세요.<small class="text-danger" style="font-weight:bolder;"> *</small></small>
	                             <input type="text" name="expFormAssume" id="expFormAssume"
	                                 class="form-control form-control-sm" placeholder="포트폴리오 링크주소" value="${expert.expFormAssume }">
                        </div>
                                
                                
                          <label class="h6 mb-0" for="create_external_link">포트폴리오 파일</label>
                          <input  type="file" class="form-control form-control-sm"  name="postFiles" multiple="multiple">
                            <div class="row">
                                <div class="col-12 mb-3 mb-lg-5">
                                  <div class="card">
                                    <div class="card-body" >
                                    		<small class="d-block opacity-50 mb-2">개인/민감 정보를 삭제 후 등록해야 하며, <br> 허위정보에 대한 모든 책임은 본인에게 있습니다.</small>
                                       <div id="fileUploadSection" style="border : 1px Dashed black;" >
                                        <div class="dropzone border-0 bg-body rounded-3 bg-opacity-25 dz-clickable" style="height: 150px;">
                                            <div class="fallback">
                                            <!-- 파일 ㅡㅡㅡㅡㅡㅡㅡㅡ왜 안드가냐고  -->
<!--                                                 <input  type="file" name="postFiles" multiple="multiple"> -->
                                                
                                            </div>
                                            <div class="dz-message needsclick">
                                                <div class="mb-3"  style="text-align: center">
                                                    <span class="material-symbols-rounded align-middle" style="margin-top:50px; margin-bottom: 10px">
                                                        upload </span>
                                                <h6 class="mb-0">파일을  끌어오거나  클릭 후 업로드 해주세요.</h6>
                                                </div>
                                            </div>
                                          </div>
										</div>
                                        <ul class="list-unstyled mb-0" id="dropzone-preview">
                                            <li class="mt-2" id="dropzone-preview-list">
                                                <!-- This is used as the file preview template -->
                                                <div class="border rounded-3">
                                                	<!-- 사진뜨는부분 -->
                                                    <div class="d-flex align-itemsf-center">
<!--                                                     <div class="d-flex align-itemsf-center" style="overflow-y: scroll; overflow-x: hidden;"> -->
                                                        <div class="flex-shrink-0">
                                                            <div class="col-sm-12 h-auto rounded-3" id="showImgDiv">
<!--                                                                 <img data-dz-thumbnail class="w-full h-auto rounded-3 block" src="#" alt="Dropzone-Image" /> -->
															  <c:forEach items="${attach }" var="attachVO">
															  	  <!-- 파일 저장용 배열 돌리기 -->
	 															  <c:choose>
				  								                    	<c:when test="${fn:substring(attachVO.attatchType,0,5) == 'image'}">
																		  	<div class="row py-2">
																			  	<div class="d-flex">
																				  	<div class="col-sm-4 me-3 pe-2">
																			           	<img src="/upload/${attachVO.saveNm}" width=100px; height=100px; alt="image" class="mx-2" style="margin-bottom:10px;"/>
																				  	</div>
																				  	<div class="col-sm-6 mx-2 px-2">
																			              	${attachVO.originNm }<br>
																			              	<span style="font-size:12px;">
																			              		<fmt:formatNumber value="${attachVO.attatchSize / 1024}" pattern="0.00" />KB
																			              	</span>
																				  	</div>
																				  	<div class="col-sm-1 mx-1 px-1 x-btn" id="delDiv${attachVO.attatchOrder }" data-seq="${attachVO.attatchOrder }">
																			             &nbsp;&nbsp;X
																				  	</div>
																                </div>
																		  	</div>
																		 </c:when>
		                                                        	  	 <c:otherwise>
																				  	<div class="row py-2">
																					  	<div class="d-flex">
																						  	<div class="col-sm-4 me-3 pe-2" style="display: flex;">
							  								                                  <img src="/resources/assets/media/icons/files/css.svg" class="height-40 me-3 flex-shrink-0 w-auto" alt="" style="float:right;">
																						  	
<!-- 																						  		<i class="bi bi-file-earmark-text"></i>  -->
																							</div>
																						  	<div class="col-sm-6 mx-3 px-2">
																					              	${attachVO.originNm }<br>
																			              			<span style="font-size:12px;">
																			              				<fmt:formatNumber value="${attachVO.attatchSize / 1024}" pattern="0.00" />KB
																			              			</span>
																						  	</div>
<%-- 																						  		<a href="#!" class="text-body" href="/upload/${attachVO.saveNm}" download="/upload/${attachVO.originNm}"> --%>
<!-- 																						  		 	<span class="material-symbols-rounded align-middle">download</span> -->
<!-- 														                                         </a> -->
																						  	<div class="col-sm-2 mx-2 px-2 x-btn" id="delDiv${attachVO.attatchOrder }" data-seq="${attachVO.attatchOrder }">
																					             &nbsp;&nbsp;X
																						  	</div>
																		                </div>
																				  	</div>
		                                                        	  	 </c:otherwise>
                                                        	  	  </c:choose>
															  </c:forEach>
                                                            </div>
                                                        </div>
<!--                                                         <div class="flex-grow-1"> -->
<!--                                                             <div class="pt-1"> -->
<!--                                                                 <h5 class="font-semibold mb-1" data-dz-name>&nbsp;</h5> -->
<!--                                                                 <p class="text-sm text-body-secondary fw-normal" data-dz-size></p> -->
<!--                                                                 <strong class="error text-danger" -->
<!--                                                                     data-dz-errormessage></strong> -->
<!--                                                             </div> -->
<!--                                                         </div> -->
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--//Page content End//-->
                </div>
<%--                 <span>파일 이름 확인 >> </span> <span>${attach.originNm }</span> --%>
                
            </div>
          </form>
        </section>
  </div>


<script>


$(function() {
	
	
// 	var delList = []; // 배열타입 날려보낼수가없음
	var delList = "";
	
	$(".x-btn").on("click", function() {
	    $(this).parent("div").remove(); // 선택한 div제거 -> 바로 디비 제거하면 안됨. 저장시 제거 -> submit전에 삭제할 인덱스 번호 알아와서 삽입하기.
		
	    // 갓다와서 할거 -> 시퀀스 번호 리스트에 넣어서 날리기 -> 삭제 하고 인서트하기 .뀨 
// 	    alert($(this).data("seq"));
	    delList += ($(this).data("seq") + ",");
// 		delList.push($(this).data("seq"));
	    $("#delList").val(delList);
	    console.log("delete input 컨트롤러로 쏘기 전에 확인>>> " ,	$("#delList").val());

	});
	
	
	// 선택한 직무 & 경력 채우기
	var expValue = "${expert.expJobMajor}";
	console.log("expValue >> ", expValue);
	
	document.querySelector("#expJobMajor").value = expValue;
	
	$("input[name='expJobLevel'][value='${expert.expJobLevel}']").prop("checked", true);

	
	// ajax랑 function() 둘 중에 뭘 해야지 null 체크 될 지 확인하기 ㅠㅠ 
	
	$("#submitBtn").on("click", function(e) {
		 e.preventDefault();
		  
		const mentorForm = $("#mentorForm");
		const expFormContent = $("#expFormContent").val();
		const expJobMajor = $("#expJobMajor").val();
		
		if (expFormContent == null || expFormContent =="") {
			Swal.fire({
				  icon: 'warning',
				  title: '상세설명란 작성은 필수입니다.',
				  showConfirmButton: false,
				  timer: 1500
				})
			return;
		}
	    
		if (expJobMajor == "" || expJobMajor == null) {
			Swal.fire({
				  icon: 'warning',
				  title: '직무 또는 경력<br> 선택은 필수입니다.',
				  showConfirmButton: false,
				  timer: 1500
				})
			return;
		}
		
		mentorForm.submit();
		
	});
	
	
///////////////드래그앤드랍 start//////////////////////////
const fileUploadSection = document.querySelector("#fileUploadSection");

//드래그한 파일 객체가 해당 영역에 놓였을 때

var files = [];

fileUploadSection.ondrop = (e) => {
	  e.preventDefault();

	  // 드롭된 파일 리스트 가져오기
	  files = e.dataTransfer.files;
	  console.log("파일이 들어 왔나요?", files[0]);


	  // 파일 갯수만큼 돌리기
	  for (let i = 0; i < files.length; i++) {
      console.log("count:", i)
	    // ajax 업로드시 미리보기
	    if (checkImageType(files[i])) {
	      // 이미지면 이미지태그를 이용한 출력형태
	      const reader = new FileReader();

	      reader.onload = (e) => {
          console.log("check: ",i)

	          let div = document.createElement("div");
	          let img = document.createElement("img");
	          img.width=100; img.height=100;
	          img.src = e.target.result;
	          let span1 = document.createElement("span");
	          span1.innerHTML = files[i].name
	          let span2 = document.createElement("span");
	          span2.innerHTML = "&nbsp;&nbsp;X";
	          span2.style.fontWeight = "bold";
	
	          div.appendChild(img);
	          div.appendChild(span1);
	          div.appendChild(span2);
		     
	        $("#showImgDiv").append(div);
	        
	        // console.log("사진돌리는 중중중 ", str);

	      };
		    reader.readAsDataURL(files[i]);
	      
	    } else { // 파일인경우
	        
	        let div = document.createElement("div");
	        let icon = document.createElement("i");
	        icon.className = "bi bi-file-earmark-text";
	        let span1 = document.createElement("span");
	        span1.innerHTML = files[i].name;
	        let span2 = document.createElement("span");
	        span2.innerHTML = "&nbsp;&nbsp;X";
	        span2.style.fontWeight = "bold";
	
	        div.appendChild(icon);
	        div.appendChild(span1);
	        div.appendChild(span2);
	
	        $("#showImgDiv").append(div);
	    }
	  } // for문 끝

    // 선택한 파일 배열에서 삭제 및 미리보기 삭제
    $("#showImgDiv").on("click","span", function () {
        const selectedFileName = $(this).siblings("span").text(); // 선택한 span의 text만 선택
        console.log("선택된 파일 span 명 >> ", selectedFileName);
        const index = Array.from(files).findIndex(file => file.name === selectedFileName); // 파일명 동일하면
        if (index > -1) { 
          files = Array.from(files).filter((_, i) => i !== index); // splices(지울 index, 지울갯수)
        } 
		    $(this).parent("div").remove(); // 선택한 div제거
        
        console.log("지우고나서 파일갯수 확인>> ", files.length);
        console.log("지우고남은 파일 ㅋ >> ", files);
      });
      
      

	  submitBtn.onclick = (e) => {
		
		  
		  
		  
	    e.preventDefault();

	    const formData = new FormData();
	    const expJobLevel = document.querySelector('input[name="expJobLevel"]:checked').value;
	    
	    for (let i = 0; i < files.length; i++) {
	      formData.append("postFiles", files[i]);
	    }
	    formData.append("formId", $("#formId").val());
	    formData.append("memId", $("#memId").val());
	    formData.append("expFormAssume", $("#expFormAssume").val());
	    formData.append("expFormContent", $("#expFormContent").val());
	    formData.append("expJobMajor", $("#expJobMajor").val());
	    formData.append("expJobLevel", expJobLevel);
	    formData.append("expJobCurrent", $("#expJobCurrent").val());
	    formData.append("delList", delList);
	    
	    console.log("폼데이터화긴 : ", "formData");

	    $.ajax({
	      type: "post",
	      url: "/coco/modifyMentorAjax",
	      data: formData,
	      dataType: "text", // 컨트롤러에서 돌아올 때 응답 데이터타입
	      processData: false,
	      contentType: false,
	      success: function (data) {
	        console.log("아작스 성공 >> ", data);

	        if (data == "ok") {
	          Swal.fire({
	            icon: "success",
	            title: "멘토신청이 완료되었습니다!",
	            showConfirmButton: false,
	            timer: 1500,
	          });

	          setTimeout(function () {
	            location.href = "/coco/mentorList";
	          }, 1500);
	        } else {
	          Swal.fire({
	            icon: "error",
	            title: "멘토신청이 실패되었습니다.",
	            showConfirmButton: false,
	            timer: 1500,
	          });
	        }
	      }, // success
	    });
	  }; // ajax 끝
	}; // 드래그앤드롭



// ondragover 이벤트가 없으면 onDrop 이벤트가 실핻되지 않습니다.
fileUploadSection.ondragover = (e) => {
e.preventDefault();
}



	//이미지 파일 체크
	function checkImageType(file) {
	  var pattern = /jpg|gif|png|jpeg/i;
	  return pattern.test(file.type); //패턴과 일치하면 true(너 이미지구나?)
	}


	// textarea 글자수 체크
	
	$("#expFormContent").keyup(function (e) {
		let content = $(this).val();
		var textCount = $("#textCount");
		// 글자수 세기
		if (content.length == 0 || content == '') {
			textCount.text('0');
		} else {
			textCount.text(content.length);
		}
		
		if (content.length > 1000) {
		   $(this).val($(this).val().substring(0, 1000));
		   textCount.text(content.length-1); // 자른 글자수 
	          Swal.fire({
		            icon: "error",
		            title: "1000글자까지만 입력가능합니다.",
		            showConfirmButton: false,
		            timer: 1500,
		          });
		}
	});
	

	
	// 검색 select
	
// 	  const searchable = new Choices('#Searchable', {
// 	    searchEnabled: true,
// 	    searchFields: ['value'], // 값(value) 기반으로 검색하도록 설정
// 	    itemSelectText: '',
// 	  });
	

}); // script 끝 







</script>

