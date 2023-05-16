<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>

	<br><br><br><br><br><br>
	<h3>로그인 성공</h3>
	<h3>${SessionInfo.memId }님 안녕!! 프젝 파이팅~~!!</h3>
	
	<br>
	<button type="button" onclick="location.href='/coco/profile'">마이페이지 이동</button>
	
	<br><br>
	<button type="button" onclick="location.href='/coco/myChart'">판매CHART 이동</button>
	
	<br><br>
	<button type="button" onclick="location.href='/coco/applyMentor'">멘토신청 이동</button>
	
	<br><br>
	<button type="button" onclick="location.href='/coco/modifyMentor'">멘토 수정~~~</button>
	
	<br><br>
	<button type="button" onclick="location.href='/blog/trend'">블로그 이동</button>
	
	<br><br>
	<button type="button" onclick="location.href='/coco/project/list'">프로젝트 이동</button>
	
	<br><br>
	<button type="button" onclick="location.href='/freeBoard/list'">자유게시판 이동</button>
	
	<br><br>
	<button type="button" onclick="location.href='/coco/admin/codeGroupList'">관리자 이동</button>
	
	<br><br>
	<button type="button" onclick="location.href='/coco/solution/templateDetail?eprodNum=SLPO2304220001'">템플릿디테일 이동</button>
	
	
	
<%-- 	<tiles:insertAttribute name="channelTalk"/> --%>
</body>
<script type="text/javascript">
(function() {
	var w = window;
	if (w.ChannelIO) {
		return (window.console.error || window.console.log || function() {
		})('ChannelIO script included twice.');
	}
	var ch = function() {
		ch.c(arguments);
	};
	ch.q = [];
	ch.c = function(args) {
		ch.q.push(args);
	};
	w.ChannelIO = ch;
	function l() {
		if (w.ChannelIOInitialized) {
			return;
		}
		w.ChannelIOInitialized = true;
		var s = document.createElement('script');
		s.type = 'text/javascript';
		s.async = true;
		s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
		s.charset = 'UTF-8';
		var x = document.getElementsByTagName('script')[0];
		x.parentNode.insertBefore(s, x);
	}
	if (document.readyState === 'complete') {
		l();
	} else if (window.attachEvent) {
		window.attachEvent('onload', l);
	} else {
		window.addEventListener('DOMContentLoaded', l, false);
		window.addEventListener('load', l, false);
	}
})();
ChannelIO('boot', {
	"pluginKey" : "b41baa45-f05f-4cfe-abc4-7eb80bd23bef"
});
</script>
</html>