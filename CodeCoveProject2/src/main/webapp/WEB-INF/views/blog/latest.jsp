<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
#search{
	font-size: 30px;
	color: black;
}

#fullContent{
	border: 1px solid red;
}
</style>

<div style="text-align: right;">
 <i onclick="location.href='/blog/search'" id="search" class="ri-search-line">검색하기</i>
</div>

<div class="fullContent"></div>

<input type="hidden" name="page" id="page" value="1"/>

<script>
const latestUrl = "/blog/latestList?page=";
let fullContent = document.querySelector('.fullContent');
let oneTime = false;

console.log(page.value);
(madeBox= function() {
	const xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function() { 
	  if (xhr.readyState === xhr.DONE) { 
	    if (xhr.status === 200 || xhr.status === 201) {
	      let postList = xhr.response.dataList; // 다음페이지의 정보
	      
	      if(postList.length==0){
	    	  return;
	      }
	      
	   // infinite에 list를 더해주기
	   	  for(let i = 0; i < postList.length; i++) {
	   		fullContent.append(mkList(postList[i]));
	   	  }
	      oneTime = false; // oneTime을 다시 false로 돌려서 madeBox를 불러올 수 있게 해주기
	      page.value = Number(page.value)+1;
	      
	    } else {
	      console.error(xhr.response);
	    }
	  }
	};
	xhr.open('GET', latestUrl+page.value); // 다음페이지의 정보를 get
	xhr.send();
	xhr.responseType = "json";
	history.pushState(null, null, xhr.responseURL);
	
})();

YesScroll();

function YesScroll () {
	const screenHeight = screen.height;
	document.addEventListener('scroll',OnScroll,{passive:true})
	
	function OnScroll () {
	   const fullHeight = fullContent.clientHeight;
	   const scrollPosition = pageYOffset;
	   if (fullHeight-screenHeight/2 <= scrollPosition && !oneTime) {
	     oneTime = true;
	     madeBox();
	   }
	}
}

</script>
<script src="/resources/js/blog/blogFunction.js"></script>