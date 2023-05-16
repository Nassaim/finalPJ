<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="636511148424-mghktber42ms2j1nu54v79m3r9de7cnk.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>
</head>


<body>


 <!--Main content-->
        <main>
            <!--page-hero-->
            <section class="position-relative">
                <!--:Pattern:-->
                <div class="bg-pattern text-primary text-opacity-50 opacity-25 w-100 h-100 start-0 top-0 position-absolute"></div>
                <div class="container pt-11 pt-lg-14 pb-9 pb-lg-11 position-relative z-1">
                    <div class="row align-items-center justify-content-center">
                        <div class="col-xl-4 col-lg-5 col-md-6 col-sm-8 z-2">
                            
                            <h2 class="mb-1 display-6">
                                <!-- Welcome back! -->
                               </h2>
                               <p class="mb-4 text-body-secondary">
                              		   로그인을 진행해주세요.
                               </p>
                            <div class="position-relative">
                                <div>
                                    <form action="/coco/loginCheck" method="post" class="needs-validation" id="signForm" novalidate>
    	                                <font color="red" >${errors.memId }</font>
    	                                <div style="margin-bottom:10px;"></div>
                                        <div class="input-icon-group mb-3">
                                            <span class="input-icon">
                                          <i class="bx bx-user"></i>
                                        </span>
                                      <input type="text" name="memId" id="memId" value="${member.memId }" class="form-control" required autofocus placeholder="아이디를 입력해주세요.">
                                    </div>
                                 	  <font color="red">${errors.memPass }</font>
    	                                <div style="margin-bottom:10px;"></div>
                                      <div class="input-icon-group mb-3">
                                        <span class="input-icon">
                                            <i class="bx bx-lock-open"></i>
                                        </span>
                                      <input type="password" name="memPass" id="memPass"  class="form-control" required placeholder="비밀번호를 입력해주세요.">
                                    </div>
                                        <div class="mb-3 d-flex justify-content-between">
                                              <div>
                                                <label class="text-end d-block small mb-0"><a href="/coco/forget" class="link-decoration">아이디 / 비밀번호 찾기 </a></label>
                                              </div>
                                        </div>
                                        
                                        <div class="d-grid">
                                            <button class="btn btn-primary" id="signinBtn" type="button">
                                              			 로그인
                                            </button>
                                        </div>
                                    </form>

                                    <!---->
                                    <p class="pt-4 small text-body-secondary">
                                        		계정이 없으신가요? <a href="/coco/register" class="ms-2 fw-semibold link-underline">회원가입</a>
                                    </p>
                                    <!--Divider-->
                                    <div class="d-flex align-items-center py-3">
                                        <span class="flex-grow-1 border-bottom pt-1"></span>
                                        <span class="d-inline-flex flex-center lh-1 mx-2 width-2x height-2x rounded-circle text-mono">or</span>
                                        <span class="flex-grow-1 border-bottom pt-1"></span>
                                    </div>
                                    <div class="d-grid">
                                        <a href="https://accounts.google.com/o/oauth2/auth?client_id=636511148424-mghktber42ms2j1nu54v79m3r9de7cnk.apps.googleusercontent.com&redirect_uri=http://localhost/googleLogin.do&response_type=code&scope=https://www.googleapis.com/auth/userinfo.email&approval_prompt=force&access_type=offline" class="d-flex hover-lift btn-secondary mb-2 btn position-relative flex-center">
                                            <!--Main Icon-->
                                            <div class="position-relative d-flex align-items-center">
                                                <img src="/resources/images/google.svg" alt="" class="width-2x me-2">
                                                <span>구글 로그인</span>
                                            </div>
                                        </a> 
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>



	
	

<script type="text/javascript">

		$(function() {
			var signinBtn = $("#signinBtn");
			var signForm = $("#signForm");

			signinBtn.on("click", function() {
				var memId = $("#memId").val();
				var memPass = $("#memPass").val();

				signForm.submit();
			});
		});
	</script>
</body>
