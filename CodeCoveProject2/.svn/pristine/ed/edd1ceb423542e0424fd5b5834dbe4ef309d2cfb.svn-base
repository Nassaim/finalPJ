<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.btn-change {
  background-color: #00c7ae;
  border-color: #00c7ae;
}

.btn-change:hover {
   background-color: #00c7ae;
    border-color: #00c7ae;
}


.form-check-input:checked {
    background-color: #00c7ae;
    border-color: #00c7ae;
}

.modal-header {
	background-color: 235,239,238 !important;
}

.modal-footer {
	background-color:white !important;
}
</style>	
	
          
	
	            <section class="position-relative">
                <div class="container-fluid position-relative">
                    <div class="overflow-hidden">
                        <!--Profile info header-->
                        <div class="position-relative pt-5 pb-9 pb-lg-11">
                          <h3 class="mb-2" style="margin-left: 125px">내 정보</h3>
                            <div class="row">
                                <div class="col-lg-9 mx-auto">
                                    <div class="pt-5 d-flex flex-column h-100">
	
                                        <div class="card shadow p-3 mb-3">

                                            <form  action="/coco/profileUpdate" method="post" id="proFileUpdateForm" enctype="multipart/form-data" autocomplete="false">
                                            	<div style="margin-left : 40%">
													<img src="${member.memProfile }"   id="profileImg" style="width : 150px; border-radius:100px" alt="User Profile Image"/><br/>
												</div><br>
												<input type="hidden" name="report" value="${member.report }"/> 
                                                <div class="row align-items-center">
                                                    <div class="col-md-12">
                                                        <div class="row">
                                                            <div class="col-md-6 mb-4">
                                                                <input type="file" class="form-control" id="imgFile" name="imgFile" accept="image/png, image/jpeg, image/gif">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 mb-3">
                                                        <label class="form-label" for="memId">아이디</label>
                                                        <input type="text" class="form-control" name="memId" id="memId" value="${member.memId }" readonly/>
                                                    </div>
                                                    <div class="col-md-6 mb-3">
                                                        <label class="form-label" for="memPass">현재 비밀번호</label><a style="color:red; font-size:12px"> (필수)</a>
                                                        <input type="password" class="form-control" name="memPass" id="memPass" value="" required/>
                                                    </div>
                                                    <div class="col-md-6 mb-3">
                                                        <label class="form-label" for="memName">이름</label>
                                                        <input  type="text" class="form-control" name="memName" id="memName" value="${member.memName }"/>

                                                    </div>
                                                    <div class="col-md-6 mb-3">
                                                        <label class="form-label" for="memNick">별명</label>
                                                        <input type="text" name="memNick" id="memNick" value="${member.memNick }"
                                                            class="form-control">
                                                    </div>
                                                    <div class="col-md-6 mb-3">
                                                        <label class="form-label" for="memHP">전화번호</label>
                                                        <input type="text" class="form-control" name="memHP" id="memHP" value="${member.memHP }"/>
                                                    </div>
                                                    <div class="col-md-6 mb-3">
                                                        <label class="form-label" for="memHP">이메일</label>
                                                        <input type="text" class="form-control" name="memMail" id="memMail" value="${member.memMail }"/>
                                                    </div>

<!--                                                     <div class="col-md-4 mb-3"> -->
<!--                                                         <label class="form-label">수신 동의 (선택사항)</label> -->
<!--                                                         <div class="d-flex"> -->
<!--                                                             <div> -->
<!--                                                                 <div class="form-check"> -->
<!--                                                                     <input type="checkbox" id="comm_phone" checked -->
<!--                                                                         class="form-check-input"> -->
<!--                                                                     <label for="comm_phone">SMS</label> -->
<!--                                                                 </div> -->
<!--                                                             </div> -->
<!--                                                             <div class="ms-3"> -->
<!--                                                                 <div class="form-check"> -->
<!--                                                                     <input type="checkbox" id="comm_email" checked -->
<!--                                                                         class="form-check-input"> -->
<!--                                                                     <label for="comm_email">Email</label> -->
<!--                                                                 </div> -->
<!--                                                             </div> -->
<!--                                                         </div> -->
<!--                                                     </div> -->
                                                </div>
                                                <div class="text-end">
                                                    <button type="button" id="submitBtn" class="btn btn-primary btn-change">변경사항 저장</button>
                                                </div>
                                            </form>
                                        </div> <!-- 윗카테고리 -->
                                        
                                        <!--Password card-->
                                        <div class="card shadow p-3">
                                            <h5 class="mb-4">비밀번호 변경</h5>

                                            <form action="/coco/passUpdate" method="post" id="passwordForm">
                                            	<input type="hidden" id="updateMemId" name="updateMemId" value="${member.memId }"/>
                                                <div class="row">
                                                    <div class="col-md-4 mb-3">
                                                        <label for="update_pass_current" class="form-label">현재 비밀번호</label><a style="color:red; font-size:12px"> (필수)</a>
                                                        <input id="update_pass_current" name="updPassCurrent" type="password" class="form-control">
                                                    </div>
                                                    <div class="col-md-4 mb-3">
                                                        <label for="update_pass_new" class="form-label">새 비밀번호</label>
                                                        <input type="password" class="form-control"
                                                            id="update_pass_new" name="updPassNew">
                                                    </div>
                                                    <div class="col-md-4 mb-3">
                                                        <label for="update_pass_new_confirm" class="form-label">비밀번호 확인</label>
                                                        <input type="password" class="form-control"
                                                            id="update_pass_new_confirm" name="updPassNewChk">
                                                    </div>
                                                </div><span id="passCheck" style="color:red; font-size:12px"></span>
<!--                                                 <small class="help-text text-body-secondary" id="passCheck"></small> -->
                                                <div class="text-end">
                                                    <button id="passwordUpdateBtn" type="button" class="btn btn-primary btn-change">변경사항 저장</button>
                                                </div>
                                            </form>
                                        </div>
                                        <!-- password Card End -->
                                        
                                        
                                       </div>
<!--                                             <button href="#modalBasic" data-bs-toggle="modal" aria-expanded="false" class= "btn btn-outline-secondary" style="float:right"> 탈퇴하기</button> -->
                                            <a href="#byeModal" data-bs-toggle="modal" aria-expanded="false" class= "btn btn-outline-secondary" style="float:right">탈퇴</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
            </section>


            <!--Modal basic-->
            <div class="modal fade" id="byeModal" tabindex="-1" aria-labelledby="byeModal" aria-hidden="true">
            <!-- 모달 form -->
               <form action="/coco/userWithdraw" id="byeForm" method="post">
                <div class="modal-dialog modal-dialog-centered" >
                    <div class="modal-content">
                        <div class="modal-header"  style="display: flex; justify-content: center;">
                            <h5 class="modal-title">CodeCove탈퇴하기</h5>
                        </div>
                        <div class="modal-body py-5 border-0" style="background-color:white; border-top:1px solid #00c7a;">
                            <h6>
                               	CodeCove를 탈퇴하기 전에 확인해주세요.
                            </h6></br>
                            <p class="mb-0">
                                                                 탈퇴가 완료되면 <span style="font-weight:bold;">개인정보는 즉시 파기되며,</span><span style="font-weight:bold; color:red;"> 복구가 불가능</span>합니다.
                                <br> 확인을 위해 현재 비밀번호를 입력해주세요.
                            </p><br>
                            <br>
                            <div style="display: flex; align-items: center;">
	                            <div><input type="hidden" id="byeId" name="memId" value="${member.memId }" style="align-items: center;"/>  
	                           		 <span class="input-icon"><i class="bx bx-lock-open" style="font-size:15px;"></i></span><a> 비밀번호&nbsp; </a>
	                            </div>
                                <div><input type="password" class="form-control form-control-sm" id="byePass" name="memPass" style="width:200px" value=""/></div>
                            </div>
                        </div>
                        <div class="modal-footer bg-body-tertiary border-0">
                            <button type="button" class="btn btn-primary btn-sm btn-change"
                                data-bs-dismiss="modal">취소</button>
                            <button type="button" id="byeBtn" class="btn btn-gray-200 btn-sm">탈퇴</button>
                        </div>
                    </div>
                </div>
               </form>
            </div>

<script src="https://unpkg.com/filepond-plugin-image-preview/dist/filepond-plugin-image-preview.js"></script>
<script src="https://unpkg.com/filepond-plugin-file-poster/dist/filepond-plugin-file-poster.js"></script>
<script src="https://unpkg.com/filepond/dist/filepond.js"></script>
<script>

// 이미지 선택시 미리보기
$("#imgFile").on("change", function(event){
	   var file = event.target.files[0];
	   if(isImageFile(file)){
	      var reader = new FileReader();
	      reader.onload = function(e){
	         $("#profileImg").attr("src", e.target.result);
	      }
	      reader.readAsDataURL(file);
	   }else{
	      alert("이미지 파일을 선택해주세요!");
	      $(this).val(""); 
	   }
	});
	
	
const getPwCheck = RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])/);
  	var proFileForm = $("#proFileUpdateForm");
  	var formBtn = $("#submitBtn");
  	var passwordForm = $("#passwordForm");
  	var passwordUpdateBtn = $("#passwordUpdateBtn");
  	
// 새 비밀번호 입력시
$("#update_pass_new").keyup(function() {
	
	// 비밀번호 유효성 검사 
	if (!getPwCheck.test($(event.target).val()) || $(event.target).val().length < 8){
	  $('#passCheck').html('비밀번호는 특수문자 포함 8자 이상입니다.');
	} else {
	   $('#passCheck').html('');
	}
       
});

// 비번 변경폼 제출시 - 새번호 && 새번호 매치x시 머라하기
passwordUpdateBtn.on("click", function() {
	var passval = $("#update_pass_current").val();
	var newPassVal = $("#update_pass_new").val();
	var newPassValChk = $("#update_pass_new_confirm").val();
	
	// 비밀번호 미입력시
	if (passval == null || passval == "") {

		Swal.fire({
		  icon: 'warning',
		  title: '현재 비밀번호 <br>입력은 필수입니다!',
		  showConfirmButton: false,
		  timer: 1500
		})
		
		return false;
	} 
	
	
	// 새 비밀번호 + 비밀번호 확인 틀릴 시 체크
	if (( newPassVal != null || newPassVal != "") && (newPassVal != newPassValChk)) {
		Swal.fire({
		  icon: 'warning',
		  title: '새 비밀번호가 <br> 일치하지 않습니다.',
		  showConfirmButton: false,
		  timer: 1500
		})
		return false;
	} else if (newPassVal == null || newPassVal == "" || newPassValChk == null || newPassValChk == ""){
		Swal.fire({
			  icon: 'warning',
			  title: '변경될 비밀번호가 <br> 입력되지 않았습니다.',
			  showConfirmButton: false,
			  timer: 1500
			})
			return false;
	} else if (!getPwCheck.test(newPassVal) || newPassVal.length < 8){
		Swal.fire({
			  icon: 'warning',
			  title: '비밀번호는 특수문자 포함 <br>8자 이상입니다.',
			  showConfirmButton: false,
			  timer: 1500
			})
			return false;
		}
	
	console.log("패스워드 확인 아작스 쏘기 전 확인 >> " , $("#memId").val(), " 그리고 ", $("#update_pass_current").val());
	
	$.ajax({

		type : "post",
		url : "/coco/passCheck",
		data : {
			memId : $("#memId").val(),
			memPass : $("#update_pass_current").val()
		},
		success : function(res) {
			console.log("패스워드 확인 아작스 결과  >> ", res); 
			
			if (res == "ok") { // 아이디 사용 가능
				console.log("비밀번호 일치!");
			
				passwordForm.submit();
				
					
			} else { // 비밀번호 불일치
				Swal.fire({
				  icon: 'error',
				  title: '비밀번호가 일치하지 않습니다.',
				  showConfirmButton: false,
				  timer: 1500
				})
			}
		}
	});
	
	
});

	    	// 폼 제출시 - 걍 비번 빈칸 일 때만 머라하기 
	    	formBtn.on("click", function() {
	    		
	        	var passval = $("#memPass").val();
	        	
	    		console.log("폼클릭 제출 ");
	    		
	    		console.log("비번확인>> ", passval);
	    		
	    		// 비밀번호 미입력시
	    		if (passval == null || passval == "") {

					Swal.fire({
					  icon: 'warning',
					  title: '비밀번호 입력은 필수입니다!',
					  showConfirmButton: false,
					  timer: 1500
					})
					
					return false;
				} 
	    		
				
				console.log("아작스 작동전");
				
				$.ajax({
					type : "post",
					url : "/coco/passCheck",
					data : {
						memId : $("#memId").val(),
						memPass : $("#memPass").val()
					},
					success : function(res) {
						console.log("아작스 결과  >> ", res); 
						
						if (res == "ok") { // 아이디 사용 가능
							console.log("비밀번호 일치!");
						
							proFileForm.submit();
							
// 							Swal.fire({
// 								  icon: 'success',
// 								  title: '변경사항을 저장하였습니다.',
// 								  showConfirmButton: false,
// 								  timer: 1500
// 								});
								
						} else { // 비밀번호 불일치
							Swal.fire({
							  icon: 'error',
							  title: '비밀번호가 일치하지 않습니다.',
							  showConfirmButton: false,
							  timer: 1500
							})
						}
					}
				});
				
	    	}); // formBtn 클릭시
	    	

// 비밀번호 변경시 확인

	    	
//이미지 파일 확인용
function isImageFile(file){
   var ext = file.name.split(".").pop().toLowerCase();
   return ($.inArray(ext,["jpg", "jpeg", "gif", "png"]) === -1 ) ? false : true;
}
    
	    	
// 모달용
var byeBtn = $("#byeBtn");
var byeForm = $("#byeForm");

byeBtn.on("click", function() {
	$.ajax({
		type : "post",
		url : "/coco/passCheck",
		data : {
			memId : $("#byeId").val(),
			memPass : $("#byePass").val()
		},
		success : function(res) {
			console.log("탈퇴 아작스 결과  >> ", res); 
			
			if (res == "ok") { // 아이디 사용 가능
				console.log("비밀번호 일치!");
			
				byeForm.submit();
				
			} else { // 비밀번호 불일치
				Swal.fire({
				  icon: 'error',
				  title: '비밀번호가 일치하지 않습니다.',
				  showConfirmButton: false,
				  timer: 1500
				})
				
				$("#byePass").val("");				
				
				return;
			}
			
			return;
		}
	});
	
	
});

        	
</script>
