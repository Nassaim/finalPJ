<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <!--Header Start-->
    <header class="z-fixed header-fixed-top">
        <nav class="navbar navbar-expand-lg navbar-light bg-body shadow-lg">
            <div class="container-fluid position-relative">
                <a class="navbar-brand" href="/coco/main" style="color: #00c7ae;"> 
                    <img src="/resources/assets/img/logo.png" alt="" class="img-fluid navbar-brand-light" style="width: 90px; height: auto;">
                    CodeCove
                </a>
                <div class="d-flex align-items-center navbar-no-collapse-items order-lg-last">
                    <button class="navbar-toggler order-last" type="button" data-bs-toggle="collapse"
                        data-bs-target="#mainNavbarTheme" aria-controls="mainNavbarTheme" aria-expanded="false"
                        aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon">
                            <i></i>
                        </span>
                    </button>
                </div>
                <div class="collapse navbar-collapse" id="mainNavbarTheme">
                    <!--Navbar items-->
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item dropdown">
                        	<a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">CoCo 소개</a>
                            <div class="dropdown-menu dropdown-menu-end">
                                <a href="/coco/intro" class="dropdown-item">기능소개</a>
                                <a href="/coco/premium" class="dropdown-item">프리미엄 서비스</a>
                                <a href="/coco/noticeRetrieve" class="dropdown-item">공지사항</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">커뮤니티</a>
                            <div class="dropdown-menu dropdown-menu-end">
                                <a href="/freeBoard/list" class="dropdown-item">자유게시판</a>
                                <a href="/coco/blogBoard/list" class="dropdown-item">블로그게시판</a>
                                <a href="/coco/cooBoard/list" class="dropdown-item">협업게시판</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">솔루션</a>
                            <div class="dropdown-menu dropdown-menu-end">
                                <a href="/coco/solution/category" class="dropdown-item">템플릿</a>
                                <a href="/coco/mentoring/category" class="dropdown-item">멘토링서비스</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">고객센터</a>
                            <div class="dropdown-menu dropdown-menu-end">
                                <a href="#" class="dropdown-item">자주 묻는 질문</a>
                                <a href="/coco/QnABoard" class="dropdown-item">문의게시판</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">마이페이지</a>
                            <div class="dropdown-menu dropdown-menu-end">
<!--                                 <a href="/coco/login" class="dropdown-item">로그인</a> -->
                                <a href="/coco/profileConfirm" class="dropdown-item">내 정보</a>
                                <a href="/blog/trend" class="dropdown-item">블로그</a>
                                <a href="/coco/project/list" class="dropdown-item">프로젝트</a>
                                <a href="/coco/admin/main" class="dropdown-item">관리자 화면</a>
<!--                                 <a href="/coco/logout" class="dropdown-item">로그아웃</a> -->
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                           	<c:choose>
                        		<c:when test="${empty SessionInfo }">
		                            <a class="nav-link" href="/coco/login">로그인</a>
                        		</c:when>
                        		<c:otherwise>
		                            <a class="nav-link" href="/coco/logout">로그아웃</a>
                        		</c:otherwise>
                        	</c:choose>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>  
