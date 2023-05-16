<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--Main content-->
        <main>
            <!--page-hero-->
            <section class="position-relative">
                <!--:Pattern:-->
                <div class="bg-pattern text-primary text-opacity-50 opacity-25 w-100 h-100 start-0 top-0 position-absolute"></div>
                <div class="container pt-11 pt-lg-14 pb-9 pb-lg-11 position-relative z-1">
                    <div class="row align-items-center justify-content-center" style="display: flex;">
                        <div class="col-xl-4 col-lg-5 col-md-6 col-sm-8 z-2"  style="display: inline-block;">
                            
                            <h2 class="mb-1 display-6">
                             		 아이디 찾기
                               </h2>
                               <p class="mb-4 text-body-secondary">
                               		 아이디 찾기는 이메일, 이름을 입력하여 찾을 수 있습니다.
                               </p>
                            <div class="position-relative">
                                <div>
                                    <form class="needs-validation" novalidate>
                                        <div class="input-icon-group mb-3">
                                            <span class="input-icon">
                                          <i class="bx bx-user"></i>
                                        </span>
                                      <input type="text" id="memName" class="form-control" required autofocus placeholder="이름을 입력해주세요">
                                    </div>
                                      <div class="input-icon-group mb-3">
                                        <span class="input-icon">
                                            <i class="bx bx-envelope"></i>
                                        </span>
                                      <input type="text" id="memEmail"  class="form-control" required placeholder="이메일을 입력해주세요">
                                    </div>
                                        <p id="foundIdValue"></p>
                                        <div class="d-grid">
                                            <button class="btn btn-primary" type="button" id="findIdBtn">
                                            	아이디 찾기
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        
						<!-- 가운데 여백 -->
						<div style="width : 200px">
						</div>
						
						<!-- 비밀번호 찾기 -->
                        <div class="col-xl-4 col-lg-5 col-md-6 col-sm-8 z-2"  style="display: inline-block; margin-top:50px;">
                            
                            <h2 class="mb-1 display-6">
                             		  비밀번호 찾기
                               </h2>
                               <p class="mb-4 text-body-secondary">
                                	등록한 이메일로 임시 비밀번호를 받을 수 있습니다.
                               </p>
                            <div class="position-relative">
                                <div>
                                    <form class="needs-validation" novalidate>
                                        <div class="input-icon-group mb-3">
                                            <span class="input-icon">
                                          <i class="bx bx-user"></i>
                                        </span>
                                      <input type="text" id="memIdPw" class="form-control" required autofocus placeholder="아이디를 입력해주세요">
                                    </div>
                                        <div class="input-icon-group mb-3">
                                            <span class="input-icon">
                                          <i class="bx bx-pencil"></i>
                                        </span>
                                      <input type="email" id="memNamePw" class="form-control" required placeholder="이름을 입력해주세요">
                                    </div>
                                      <div class="input-icon-group mb-3">
                                        <span class="input-icon">
                                            <i class="bx bx-envelope"></i>
                                        </span>
                                      <input type="text" id="memEmailPw" class="form-control" required placeholder="이메일을 입력해주세요">
                                    </div>
                                        
                                        <div class="d-grid">
                                            <button class="btn btn-primary" type="button" id="findPwBtn">
                                              	  비밀번호 찾기
                                            </button>
                                        </div>
                                    </form>

                                </div>
                            </div>
                        </div> <!-- 두번째 끝 -->

                        <!---->
<!--                         <p class="pt-4 small text-body-secondary"> -->
<!--                          		   회원이 아니신가요?  -->
<!--                             <a href="/register" class="ms-2 fw-semibold link-underline">회원가입</a> -->
<!--                         </p> -->
                        <!--Divider-->
                        <div class="d-flex align-items-center py-3">
                            <span class="flex-grow-1 border-bottom pt-1"></span>
		                        <p class="pt-4 small text-body-secondary">
		                         		  회원이신가요?
		                            <a href="/coco/login" class="ms-2 fw-semibold link-underline">로그인</a>
		 								  /     회원이 아니신가요?
		                             <a href="/coco/register" class="ms-2 fw-semibold link-underline">회원가입</a>
		                        </p>
                            <span class="flex-grow-1 border-bottom pt-1"></span>
                        </div>


                    </div>
                </div>
            </section>

        </main>
  
<script>

$(function() {
	var findIdBtn = $("#findIdBtn");
	var findPwBtn = $("#findPwBtn");
	var loginBtn = $("#loginBtn");
	var signupBtn = $("#signupBtn");
	
	// 아이디 찾기
	findIdBtn.on("click", function() {

	var memName = $("#memName").val();
	var memEmail = $("#memEmail").val();
		
		if (((memName == "" || memName == null) || (memEmail == "" || memEmail == null))) {
			Swal.fire({
				  icon: 'warning',
				  title: '이름 또는 이메일을 입력해주세요.',
				  showConfirmButton: false,
				  timer: 1500
				})
			return;
		}
		
		$.ajax({
			type : "post",
			url : "/coco/idForget",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			data : 
				{
					memName : $("#memName").val(),
					memMail : $("#memEmail").val()
				},
				
			success : function(res) {
				
// 				console.log("아이디찾기 결과 >> ", res)

				if (res == null || res == "") {
					// alert("아이디가 존재하지 않습니다.");
					Swal.fire({
						  icon: 'error',
						  title: '아이디가 존재하지 않습니다.',
						  showConfirmButton: false,
						  timer: 1500
						})
					return;
				}
				
				$("#foundIdValue").html("회원님의 아이디는 "+res+" 입니다.").css("color", "green");
			}
		});
	});
	
	
	// 비밀번호 찾기
	findPwBtn.on("click", function() {
		
	var memIdPw = $("#memIdPw").val();
	var memNamePw = $("#memNamePw").val();
	var memEmailPw = $("#memEmailPw").val();
		
		if (((memIdPw == "" || memIdPw == null) || (memNamePw == "" || memNamePw == null) || (memEmailPw == "" || memEmailPw == null))) {
			Swal.fire({
				  icon: 'warning',
				  title: '아이디, 이름 , 이메일 칸을 <br>입력해주세요.',
				  showConfirmButton: false,
				  timer: 1500
				})
			return;
		}
			
		$.ajax({
			type : "post",
			url : "/coco/pwForget",
			data : {
					memId : $("#memIdPw").val(),
					memName : $("#memNamePw").val(),
					memMail : $("#memEmailPw").val()
			},
			success : function(res) {
				if (res == 'ok') {
					//alert("회원님의 임시비밀번호가 등록된 이메일로 발송되었습니다.");
					Swal.fire({
						  icon: 'success',
						  title: '회원님의 임시비밀번호가 등록된 이메일로 발송되었습니다.',
						  showConfirmButton: false,
						  timer: 1500
						})
					
				}	else if (res == 'wrong') {
					//alert("회원님의 이름 또는 이메일주소가 일치하지 않습니다.");
					Swal.fire({
						  icon: 'warning',
						  title: '회원님의 이름 또는 이메일주소가 일치하지 않습니다.',
						  showConfirmButton: false,
						  timer: 1500
						})
						
				} 
				 
// 				console.log("비밀번호 발송 >> " , res);

			} , error : function() {
				
				//alert("아이디가 틀리거나 존재하지 않습니다. 아이디찾기를 해주세요.");
				Swal.fire({
				  icon: 'error',
				  title: '회원정보가 존재하지 않습니다.',
				  showConfirmButton: false,
				  timer: 1500
				})
			}
			
		});
	});
	
	
	
	
}); // end


</script>
