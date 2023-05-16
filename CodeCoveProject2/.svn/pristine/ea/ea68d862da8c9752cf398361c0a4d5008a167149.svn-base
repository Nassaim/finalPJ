<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>

<script src="https://www.google.com/recaptcha/api.js"></script>

<style>
	.informationCheckDiv{
		align:left;
	}
</style>
</head>

  <main>
            <!--page-hero-->
            <section class="position-relative">
                <div class="bg-pattern text-primary text-opacity-50 opacity-25 w-100 h-100 start-0 top-0 position-absolute"></div>
                <div class="bg-gradientwhite flip-y w-50 h-100 start-50 top-0 translate-middle-x position-absolute"></div>
                <div class="container pt-11 pt-lg-14 pb-9 pb-lg-11 position-relative z-1">
                    <div class="row align-items-center justify-content-center">
                        <div class=" col-xl-4 col-lg-5 col-md-6 col-sm-8 z-2">

                            <h2 class="mb-1 display-6">
                                CodeCove
                            </h2>
                            <p class="mb-4 text-body-secondary" style="font-weight:bold;">
                        	        회원가입
                            </p>
                            <div class="position-relative">
                                <div>
                                    <form action="/coco/signup" method="post" id="signupForm" class="needs-validation" novalidate>
                                        <!-- 구글회원가입시 프로필 사진 주소 set -->
                                        <c:if test="${status eq 'g' }">
                                            <input type="hidden" id="memProfile" name="memProfile" value="${member.memProfile }"/>
                                        </c:if>
                                        <!--input-with-icon-->
                                        <span id="idCheck" style="color:red;"></span><br/>
                                        <div class="input-icon-group mb-3" style="display: flex;">
                                            <c:set value="required" var="idText"/>
                                            <c:if test="${status eq 'g' }">
                                                <c:set value="readonly" var="idText"/>
                                            </c:if>
                                            <span class="input-icon">
                                              <i class="bx bx-user"></i>
                                            </span>
                                            <input type="text" class="form-control" id="memId" name="memId" value="${member.memId }" autofocus placeholder="아이디를 입력해주세요"  ${idText } style="display: inline-block; width:280px;" >
                                            <div style="width:10px; display: inline-block;"></div>
                                            <button type="button" class="btn btn-info" id="idCheckBtn" style="display: inline-block; font-size:13px; font-weight:bold; ">중복<br>확인</button>
                                       </div>

                                        <!--input-with-icon-->
                                        <span id="passCheck" style="color:red;"></span>
                                        <div class="input-icon-group mb-3">
                                            <span class="input-icon">
                                                <i class="bx bx-lock-open"></i>
                                            </span>
                                            <input type="password" class="form-control" id="memPass" name="memPass" required
                                            placeholder="비밀번호를 입력해주세요">
                                        </div>
                                        <!--input-with-icon-->
                                        <span id="doublePassCheck" style="color:red;"></span>
                                        <div class="input-icon-group mb-3">
                                            <span class="input-icon">
                                                <i class="bx bx-lock-open"></i>
                                            </span>
                                            <input type="password" class="form-control" id="memPass2" 
                                            placeholder="비밀번호를 재입력해주세요" required >
                                        </div>

                                        <!--이름-->
                                        <div class="input-icon-group mb-3">
                                            <span class="input-icon">
                                                <i class="bx bxs-pencil"></i>
                                            </span>
                                            <input type="text" class="form-control" id="memName" name="memName" required
                                            value="${member.memName }" placeholder="이름을 입력해주세요">
                                            <span id="nameCheck" style="color:red;"></span>
                                        </div>

                                        <!--닉네임-->
                                        <div class="input-icon-group mb-3">
                                            <span class="input-icon">
                                                <i class="bx bx-pencil"></i>
                                            </span>
                                            <input type="text" class="form-control" id="memNick" name="memNick" required
                                            value="${member.memNick }" placeholder="별명을 입력해주세요">
                                            <span id="nickCheck" style="color:red;"></span>
                                        </div>

                                        <!--input-with-icon-->
                                        <div class="input-icon-group mb-3">
                                            <span class="input-icon">
                                                <i class="bx bx-envelope"></i>
                                            </span>
                                            <input type="email" class="form-control" id="memMail" name="memMail" required
                                            value="${member.memMail }" placeholder="이메일을 입력해주세요">
                                            <span id="emailCheck" style="color:red;"></span>
                                        </div>

                                        <!--input-with-icon-->
                                        <div class="input-icon-group mb-3">
                                            <span class="input-icon">
                                                <i class="bx bx-phone"></i>
                                            </span>
                                            <input type="text" class="form-control" id="memHP" name="memHP" required
                                            value="${member.memHP }" placeholder="전화번호를 입력해주세요">
                                            <span id="HPCheck" style="color:red;"></span>
                                        </div>

                                        <!--Checkbox-->
                                        <div class="input-icon-group mb-3">
                                            <div class="informationCheckDiv">
                                                <input type="checkbox" id="memAgree" name="memAgree" value="Y">
                                                <label for="memAgree"> 개인정보 사용을 동의해주세요 <a href="#">개인정보방침</a></label>
                                            </div>
                                        </div>
                                        <!-- 캡챠 -->
                                        <div class="g-recaptcha" data-sitekey="6Lc4SyElAAAAACb4BMRGR6zc0k0LaLNDwOXEwNMJ"></div><br>
		
                                        <div class="d-grid">
                                            <button class="btn btn-primary" type="button" id="signupBtn">
                                              			 가입하기
                                            </button>
                                        </div>
                                    </form>

                                    <!---->
                                    <p class="pt-3 small text-body-tertiary">
                                       		 계정이 이미 있으신가요? <a href="/coco/login"
                                            class="ms-2 fw-semibold link-underline">로그인</a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>


<script src="/resources/js/member/register.js"></script>
