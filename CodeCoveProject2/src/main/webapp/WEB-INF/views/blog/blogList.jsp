<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.realMember" var="member" />
</sec:authorize>

<c:choose>
	<c:when test="${check eq 'check'}">
		<div id="sidebar-menu">
			<ul class="metismenu list-unstyled" id="side-menu">
				<li><a href="/blog/${memId}" class="waves-effect">
						<i class="ri-home-gear-line"></i>
						<span class="badge rounded-pill bg-success float-end"></span>
						<span>블로그홈</span>
				</a></li>
			</ul>
		</div>
	</c:when>
	<c:otherwise>

		<!--- Sidemenu -->
		<div id="sidebar-menu">
			<!--  Left Menu Start -->
			<a href="/blog/${memId}"
				style="font-size: 25px; margin-bottom: 40px;">${memId }님의 BLOG</a>
			<ul class="metismenu list-unstyled" id="side-menu">
				<li><a class="collapsed" data-bs-toggle="collapse"
					href="#multiCollapseExample1" aria-expanded="true"
					aria-controls="multiCollapseExample1"> <i class=" ri-menu-line"></i>
						<span>카테고리</span>
				</a>
					<div class="multi-collapse collapse show"
						id="multiCollapseExample1">
						<ul class="mm-collapse mm-show" style="padding-left: 50px;"
							aria-expanded="false" id="category">
							<c:set var="blogCateList" value="${blogCateList}" />
							<c:choose>
								<c:when test="${not empty blogCateList }">
									<c:forEach items="${blogCateList}" var="cate">
										<li><a class="category"	href="/blog/${memId}/cate/${cate.cateNm}">
											<i class="ri-arrow-right-s-line"></i>${cate.cateNm}</a></li>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<li><a href="">카테고리 없음</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div></li>

				<c:set var="memId" value="${memId}" />
				<c:set var="sessionId" value="${member.getMemId()}" />
<%-- 				<c:if test="${memId eq sessionId}"> --%>
					<li><a href="/blog/${memId}/post"
						class="waves-effect"> <i class="ri-edit-2-line"></i><span
							class="badge rounded-pill bg-success float-end"></span> <span>글쓰기</span>
					</a></li>
					<li><a href="/blog/${memId}/calendar"
						class=" waves-effect"> <i class="ri-calendar-2-line"></i> <span>캘린더</span>
					</a></li>
					<li><a href="/blog/${memId}/bookmark"
						class="waves-effect"> <i class="ri-bookmark-2-line"></i> <span>북마크</span>
					</a></li>

					<li><a href="/blog/${memId}/todo"
						class="waves-effect"> <i class="ri-todo-fill"></i> <span>To	DO List</span>
					</a></li>

					<li><a href="/blog/${memId}/manage"
						class="waves-effect"> <i class="ri-settings-5-line"></i><span
							class="badge rounded-pill bg-success float-end"></span> <span>블로그관리홈</span>
					</a></li>
<%-- 				</c:if> --%>
			</ul>
		</div>

	</c:otherwise>
</c:choose>


