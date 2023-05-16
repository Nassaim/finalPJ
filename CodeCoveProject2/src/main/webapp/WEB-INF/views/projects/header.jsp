<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--//page-header//-->
<header class="navbar mb-3 px-3 px-lg-6 px-3 px-lg-6 align-items-center page-header navbar-expand navbar-light">

   <!-- 실시간 알림 세션 구분용(구) 아래 session은 websocketSessionId-->
   <input type="hidden" id="sessionIdH" value=""/>
   <!-- 실시간 알림  로그인 세션 아이디 -->
   <input type="hidden" id="loginIdH" value=""/> 
   
   
  <a href="index.html" class="navbar-brand d-block d-lg-none">
    <div class="d-flex align-items-center flex-no-wrap text-truncate">
      <!--Sidebar-icon-->
      <span class="sidebar-icon bg-gradient-primary rounded-3 size-40 fw-bolder text-white">
        C
      </span>
    </div>
  </a>
  <ul class="navbar-nav d-flex align-items-center h-100">
    <li class="nav-item d-none d-lg-flex flex-column h-100 me-2 align-items-center justify-content-center" data-tippy-placement="bottom-start" data-tippy-content="Toggle Sidebar">
      <a href="javascript:void(0)"
        class="sidebar-trigger nav-link size-40 d-flex align-items-center justify-content-center p-0">
        <span class="material-symbols-rounded">
          menu_open
          </span>
      </a>
    </li>
<!--     <li class="nav-item d-flex flex-column me-2 h-100 justify-content-center dropdown" data-tippy-placement="bottom-start" data-tippy-content="Search in the App"> -->
<!--       <a href="javascript:void;" data-bs-target="#modal_search" data-bs-toggle="modal"  -->
<!--         class="d-flex align-items-center justify-content-center nav-link size-40 p-0"> -->
<!--         <span class="material-symbols-rounded"> -->
<!--           search -->
<!--           </span> -->
<!--       </a> -->
<!--     </li> -->
<!--     <li class="nav-item d-none d-md-flex flex-md-column me-2 h-100 justify-content-md-center dropdown"> -->
<!--       <a href="#" data-bs-toggle="dropdown" -->
<!--         class="nav-link size-40 d-flex align-items-center justify-content-center p-0"> -->
<!--         <span class="material-symbols-rounded"> -->
<!--           apps -->
<!--           </span> -->
<!--       </a> -->
<!--       <div class="dropdown-menu overflow-hidden dropdown-menu-sm p-0 mt-0"> -->
<!--         Apps list -->
<!--         <div class="list-group list-group-flush"> -->

<!--           <div class="list-group-item d-flex align-items-center justify-content-between px-3"> -->
<!--             <h6 class="dropdown-header ps-0">Apps Shortcuts</h6> -->
<!--             <a href="#!" class="btn btn-sm btn-primary">View All Apps <span class="ms-1 fs-5 align-middle material-symbols-rounded"> -->
<!--               arrow_forward -->
<!--               </span></a> -->
<!--           </div> -->
<!--           App item -->
<!--           <a href="#!" class="list-group-item px-4 py-3 list-group-item-action d-flex align-items-center"> -->
<!--             App logo -->
<!--             <img src="assets/media/brand-logos/atlassian.svg" class="width-30 w-auto flex-shrink-0 me-4" alt=""> -->
<!--             <div class="flex-grow-1"> -->
<!--               <h6 class="mb-0">Atlassian</h6> -->
<!--               <small>Security and control across Cloud</small> -->
<!--             </div> -->
<!--           </a> -->

<!--           App item -->
<!--           <a href="#!" class="list-group-item px-4 py-3 list-group-item-action d-flex align-items-center"> -->
<!--             App logo -->
<!--             <img src="assets/media/brand-logos/google-webdev.svg" class="width-30 w-auto flex-shrink-0 me-4" alt=""> -->
<!--             <div class="flex-grow-1"> -->
<!--               <h6 class="mb-0">Google webdev</h6> -->
<!--               <small>Work involved in developing a website</small> -->
<!--             </div> -->
<!--           </a> -->

<!--           App item -->
<!--           <a href="#!" class="list-group-item px-4 py-3 list-group-item-action d-flex align-items-center"> -->
<!--             App logo -->
<!--             <img src="assets/media/brand-logos/slack.svg" class="width-30 w-auto flex-shrink-0 me-4" alt=""> -->
<!--             <div class="flex-grow-1"> -->
<!--               <h6 class="mb-0">Slack</h6> -->
<!--               <small>Email collaboration software</small> -->
<!--             </div> -->
<!--           </a> -->
<!--         </div> -->
<!--       </div> -->
<!--     </li> -->
  </ul>
  <ul class="navbar-nav ms-auto d-flex align-items-center h-100">
  
<!--   	<li class="nav-item d-flex align-items-center justify-content-center flex-column h-100 mx-1 mx-md-3"> -->
<!-- 		<input type="button" id="alarmBtn" value="알림전송버튼" onclick="sendMsgH('a001', '업무내용이 변경되었습니다.', 'target001')"/> -->
<!-- 	</li> -->
	
    <!--:Dark Mode:-->
    <li class="nav-item dropdown">
      <a href="#" class="nav-link dropdown-toggle d-flex align-items-center" id="bs-theme" type="button" aria-expanded="false" data-bs-toggle="dropdown" data-bs-display="static">
        <span class="theme-icon-active d-flex align-items-center">
          <span class="material-symbols-rounded align-middle"></span>
        </span>
      </a>
      <!--:Dark Mode Options:-->
      <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="bs-theme" style="--bs-dropdown-min-width: 9rem;">
        <li class="mb-1">
          <button type="button" class="dropdown-item d-flex align-items-center active" data-bs-theme-value="light">
              <span class="theme-icon d-flex align-items-center">
                <span class="material-symbols-rounded align-middle me-2">
                  lightbulb
                  </span>
                </span>
            Light
          </button>
        </li>
        <li class="mb-1">
          <button type="button" class="dropdown-item d-flex align-items-center" data-bs-theme-value="dark">
              <span class="theme-icon d-flex align-items-center">
                <span class="material-symbols-rounded align-middle me-2">
                  dark_mode
                  </span>
                </span>
            Dark
          </button>
        </li>
        <li>
          <button type="button" class="dropdown-item d-flex align-items-center" data-bs-theme-value="auto">
              <span class="theme-icon d-flex align-items-center">
                <span class="material-symbols-rounded align-middle me-2">
                  invert_colors
                  </span>
                </span>
            Auto
          </button>
        </li>
      </ul>
    </li>
	<!-- 채팅부분 -->
	<li class="nav-item d-flex align-items-center justify-content-center flex-column h-100 mx-1 mx-md-3">
		<a href="/coco/chatting/chatProject"
			class="nav-link d-flex align-items-center text-truncate @@if (context.page === 'chat') {active}">
<!-- 				<span class="sidebar-icon">  -->
				<span class="material-symbols-rounded"> chat </span>
	<!-- 		</span> <span class="sidebar-text">Chat</span> -->
		</a>
	</li>
	<!-- 채팅부분 -->
	
	

	<!-- 실시간 알림 -->
   
    <li class="nav-item dropdown d-flex align-items-center justify-content-center flex-column h-100 mx-1 mx-md-3">
      <a href="#"
        class="nav-link p-0 position-relative size-40 d-flex align-items-center justify-content-center"
        aria-expanded="false" data-bs-toggle="dropdown" data-bs-auto-close="outside">
        <span class="material-symbols-rounded">
          notifications
          </span>
        <span
          class="size-5 rounded-circle d-flex align-items-center justify-content-center position-absolute end-0 top-0 mt-2 me-1 bg-danger small"></span>
      </a>


      <div class="dropdown-menu mt-0 p-0 overflow-hidden dropdown-menu-end dropdown-menu-sm">
        <!--notification header-->
        <div class="py-3 px-4 bg-primary text-white d-flex align-items-center">
          <h5 class="me-3 mb-0 flex-grow-1">알림</h5>
          <div class="flex-shrink-0">
            <a href="#!" class="btn btn-white btn-sm">모두보기</a>
          </div>
        </div>
        <div style="height:290px" data-simplebar>
          <div class="list-group list-group-flush mb-0" id="alarmList">
			<div id="newAlarm"></div>
            <!-- 새알림위치 -->
		 	<!-- ------------------------ -->
			<!-- select for문 위치 -->
			
            <!--//Notification item start//-->
<!--              <a href="#" class="list-group-item list-group-item-action py-3 px-4 d-flex align-items-center"> -->
<!--                 <div class="d-block me-3"> -->
<!--                   <div class="avatar"> -->
<!--                     <img src="/resources/images/codecovelogobasic.png" class="img-fluid rounded-circle w-auto" alt=""> -->
<!--                   </div> -->
<!--                 </div> -->
<!--                 <div class="flex-grow-1 flex-wrap pe-3"> -->
<!--                   <span class="mb-0 d-block"> -->
<!--                  	 <strong>Adam Danely</strong> assigned a task to you -->
<!--                   </span> -->
<!--                   <small class="text-body-secondary">Just now</small> -->
<!--                 </div> -->
<!--              </a> -->
             
            <!--//Notification item start//-->
<!--             <a href="#" class="list-group-item list-group-item-action py-3 px-4 d-flex align-items-center"> -->
<!--                 <div class="d-block me-3"> -->
<!--                   <div class="avatar avatar-status status-offline"> -->
<!--                     <img src="assets/media/avatars/06.jpg" class="img-fluid rounded-circle w-auto" alt=""> -->
<!--                   </div> -->
<!--                 </div> -->

<!--                 <div class="flex-grow-1 flex-wrap pe-3"> -->
<!--                   <span class="mb-0 d-block"><strong>Vivianna Kiser -->
<!--                     </strong> just posted <span>"Lorem ipsum is placeholder text -->
<!--                       used in the graphic, print, -->
<!--                       and industries. -->
<!--                       "</span></span> -->
<!--                   <small class="text-body-secondary">2h Ago</small> -->
<!--                 </div> -->
<!--               </a> -->
            <!--//Notification item start//-->
<!--              <a href="#" class="list-group-item list-group-item-action py-3 px-4 d-flex align-items-center"> -->
<!--                 <span class="d-block me-3"> -->
<!--                   <span -->
<!--                     class="d-flex align-items-center justify-content-center lh-1 size-50 bg-success-subtle text-success rounded-circle"> -->
<!--                     <span class="material-symbols-rounded"> -->
<!--                       construction -->
<!--                       </span> -->
<!--                   </span> -->
<!--                 </span> -->

<!--                 <div class="flex-grow-1 flex-wrap pe-3"> -->
<!--                   <span class="mb-0 d-block"><strong>Updated</strong> Your account -->
<!--                     password updated -->
<!--                     succuessfully</span> -->
<!--                   <small class="text-body-secondary">2h Ago</small> -->
<!--                 </div> -->
<!--               </a> -->
			
            <!--//Notification item start//-->
<!--             <a href="#" class="list-group-item list-group-item-action py-3 px-4 d-flex align-items-center"> -->
<!--                 <span class="d-block me-3"> -->
<!--                   <span -->
<!--                     class="d-flex align-items-center justify-content-center lh-1 size-50 bg-danger-subtle text-danger rounded-circle"> -->
<!--                     <span class="material-symbols-rounded"> -->
<!--                       percent -->
<!--                       </span> -->
<!--                   </span> -->
<!--                 </span> -->

<!--                 <div class="flex-grow-1 flex-wrap pe-3"> -->
<!--                   <span class="mb-0 d-block"><strong>Pro discount</strong> Upgrade -->
<!--                     to pro plan with 30% -->
<!--                     discount, Apply coupon <span class="badge bg-primary">PRO30</span></span> -->
<!--                   <small class="text-body-secondary">2h Ago</small> -->
<!--                 </div> -->
<!--               </a> -->
            </div>
        </div>
      </div>
    </li>
	<!-- 실시간 알림 -->
			
    <li class="nav-item dropdown d-flex align-items-center justify-content-center flex-column h-100">
      <a href="#"
        class="nav-link dropdown-toggle height-40 px-2 d-flex align-items-center justify-content-center"
        aria-expanded="false" data-bs-toggle="dropdown" data-bs-auto-close="outside">
        <div class="d-flex align-items-center">

          <!--Avatar with status-->
          <div class="avatar-status status-online me-sm-2 avatar xs">
            <img id="loginProfileH" src="/resources/images/basicProfile.png" class="rounded-circle img-fluid" alt="">
          </div>
          <span class="d-none d-md-inline-block" id="loginNickH"></span>
        </div>
      </a>

      <div class="dropdown-menu mt-0 p-0 dropdown-menu-end overflow-hidden">
        <!--User meta-->
        <div class="position-relative overflow-hidden px-3 pt-4 pb-7 bg-gradient-primary text-white">
          <!--Divider-->
          <svg style="transform: rotate(-180deg)" preserveAspectRatio="none"
            class="position-absolute start-0 bottom-0 w-100 dropdown-wave" fill="currentColor" height="24" viewBox="0 0 1200 120"
            xmlns="http://www.w3.org/2000/svg">
            <path
              d="M0 0v46.29c47.79 22.2 103.59 32.17 158 28 70.36-5.37 136.33-33.31 206.8-37.5 73.84-4.36 147.54 16.88 218.2 35.26 69.27 18 138.3 24.88 209.4 13.08 36.15-6 69.85-17.84 104.45-29.34C989.49 25 1113-14.29 1200 52.47V0z"
              opacity=".25" />
            <path
              d="M0 0v15.81c13 21.11 27.64 41.05 47.69 56.24C99.41 111.27 165 111 224.58 91.58c31.15-10.15 60.09-26.07 89.67-39.8 40.92-19 84.73-46 130.83-49.67 36.26-2.85 70.9 9.42 98.6 31.56 31.77 25.39 62.32 62 103.63 73 40.44 10.79 81.35-6.69 119.13-24.28s75.16-39 116.92-43.05c59.73-5.85 113.28 22.88 168.9 38.84 30.2 8.66 59 6.17 87.09-7.5 22.43-10.89 48-26.93 60.65-49.24V0z"
              opacity=".5" />
            <path
              d="M0 0v5.63C149.93 59 314.09 71.32 475.83 42.57c43-7.64 84.23-20.12 127.61-26.46 59-8.63 112.48 12.24 165.56 35.4C827.93 77.22 886 95.24 951.2 90c86.53-7 172.46-45.71 248.8-84.81V0z" />
          </svg>
          <div class="position-relative">
            <h5 class="mb-1" id="loginNickH2"></h5>
          </div>
        </div>
        <div class="py-2 px-1">
          <a href="/coco/profileConfirm" class="dropdown-item d-flex align-items-center">
            <span class="material-symbols-rounded align-middle me-2 size-30 fs-5 d-flex align-items-center justify-content-center bg-primary text-white rounded-2">
            account_circle
            </span>
          <span class="flex-grow-1">내 정보</span>
          </a>
          <hr class="my-2">
          <a href="/coco/logout" class="dropdown-item d-flex align-items-center">
            <span class="material-symbols-rounded align-middle me-2 size-30 fs-5 d-flex align-items-center justify-content-center bg-warning text-white rounded-2">
            logout
            </span>
          <span class="flex-grow-1">로그아웃</span>
          </a>
        </div>
      </div>
    </li>
    <li
      class="nav-item dropdown ms-3 d-flex d-lg-none align-items-center justify-content-center flex-column h-100">
      <a href="javascript:void(0)"
        class="nav-link sidebar-trigger-lg-down size-40 p-0 d-flex align-items-center justify-content-center">
       <span class="material-symbols-rounded align-middle">menu</span>
      </a>
    </li>
  </ul>
  
  
  
</header>
<!--Main Header End-->

<!-- JS theme.bundle.min.js<- 얘 쓰면 헤더안열림 -->
<!-- <script src="/resources/plugins/jquery/jquery.min.js"></script> -->

<Script>

//가장 처음 실행되어야 하는 function
$(function() {
	// 로그인 세션 ID 받아오기
	$.ajax({
		url : "/coco/project/selectSessionId",
		contentType : "application/json;charset=utf-8",
// 		dataType : "text",
		method : "POST",
		success: function(res) { // success
				console.log("세션아이디 select 성공 >> ", res);
				$("#loginIdH").val(res.memId);// 아이디
				$("#loginNickH").text(res.memNick); // 닉네임
				$("#loginProfileH").attr('src', res.memProfile);
				$("#loginNickH2").text(res.memNick); // 닉네임2
				
				var loginId = $("#loginIdH").val();
				console.log("이 시점에서 로긴아이디 등록되어야지 select가넝 확인>> ", loginId);
				
			  	// select 알람 가져오기  
			  	  	$.ajax({
						url : "/coco/project/selectAlarmLogs",
						method : "POST",
						data : {
							'receiverId' : loginId
						},
						success: function(data) { // success
								console.log("알람 select 성공 >> ", res);
								var showAlarmLogs = '';
							 	
						        for (var i = 0; i < data.length; i++) {
						        	// 5/3일 여기 와서 분리시키기!!!! 여기와서 data[i].newsOpenYn = Y 면 어둡게하고, N이면 어둡지않게 스타일 먹인거 따로 빼기
						        	if(data[i].newsOpenYn == 'Y'){
				        			console.log("예스노확인해보기 >> ", data[i].newsOpenYn);
						        	showAlarmLogs += "<a class='projectalm list-group-item list-group-item-action py-3 px-4 d-flex align-items-center' style='cursor:pointer; background-color: #BDBDBD;'>"
					        		} else {
					        			
						        	showAlarmLogs += "<a class='projectalm list-group-item list-group-item-action py-3 px-4 d-flex align-items-center' style='cursor:pointer;'>"
						        	
					        		}
						        	// update ajax용 newsNum / newsOpenYn  넣기
						        	showAlarmLogs += "<div class='d-block me-3'><span class='spanForNewsNum' style='display:none'>"+ data[i].newsNum +"</span>"
						        	showAlarmLogs += "<span class='spanForOpenYN' style='display:none'>" + data[i].newsOpenYn + "</span>"
						        	showAlarmLogs += "<div class='avatar'><img src='/resources/images/codecovelogobasic.png' class='img-fluid rounded-circle w-auto' alt=''></div>";
						        	showAlarmLogs += "</div><div class='flex-grow-1 flex-wrap pe-3'><span class='mb-0 d-block'>" + data[i].newsMsgCode
						        	
						        	// 시간
						    	    var dateString = data[i].newsDate;
						    	    var dateObj = new Date(dateString);
				
						    	    var formattedDate = dateObj.toLocaleString("ko-KR", {
							    	    year: "numeric",
							    	    month: "2-digit",
							    	    day: "2-digit",
							    	    hour: "2-digit",
							    	    minute: "2-digit",
							    	    hour12: true
							    	});
							    	  
						    	    showAlarmLogs += "</span><small class='text-body-secondary'>" + formattedDate + "</small></div></a>"
						        } // fot문 끝
						        
						        
							    $('#newAlarm').html(showAlarmLogs);
				
						},  
						error : function(error) { 
							console.log("알람 select 실패");
						}
				  	}); // select ajax
				
		},  
		error : function(error) { 
			console.log("알람 가져오기 에러", error);
		}
  	}); 
	
  	
});	// 가장 처음 실행되어야 하는 function 끝





var global = {};
// global.serverName = "localhost";
global.serverName = "192.168.34.58";
console.log("시작 전역변수 확인 : ", global);

// websocket 생성
const websocketH = new WebSocket(`ws:\/\/\${global.serverName}/coco/project`); // IP or localhost넣기/192.168.34.58
websocketH.onmessage = onMessageH;   // 소켓이 메세지를 받을 때
websocketH.onopen = onOpenH;      // 소켓이 생성될때(클라이언트 접속)
websocketH.onclose = onCloseH;   // 소켓이 닫힐때(클라이언트 접속해제)

// 확인용
console.log(location.host);

 //on entering chat room
 function onOpenH(evt) {
    console.log("알림 소켓열림 : " + evt);
 }

 //on exit chat room
 function onCloseH(evt) {
//     $("#messageArea").append("연결 끊김");
    console.log("알림 소켓닫김 : " + evt);
 }
 
 function onMessageH(msg) {
     var data = JSON.parse(msg.data); // msg를 받으면 data 필드 안에 Json String으로 정보가 있음
     console.log("메세지 받았을 때 데이터 : ", data)
			
     var sessionId = data.sessionId; 	// websocket session Id
     var receiverId = data.receiverId;  // 받는사람 아이디
     var message = data.message;		// 알림 내용
     var time = data.time;				// 시간
	 var str = "";
	 
	// 사람 접속시 작동 (컨트롤러에서 접속시 getId를 발송 -> hidden에 기입후 나 /상대방 구별시 사용)
     if(data.type == "getId") {
    	console.log("웹소켓아이디등록하는거 작동확인 ");
        var inputSessionId = data.sessionId != null ? data.sessionId : "";
           if(inputSessionId != '') {
              $("#sessionIdH").val(inputSessionId); // 세션 아이디 기입
           }
     } 
     
     // 내가 receiver 일 때 
     if(data.receiverId == $("#loginIdH").val()) {
    	 console.log("로그인세션 같을 때만 div 추가하는 녀석")
    	 $("#newAlarm").prepend("<a href='#' class='list-group-item list-group-item-action py-3 px-4 d-flex align-items-center'><div class='d-block me-3'>"
        			+"<div class='avatar'><img src='/resources/images/codecovelogobasic.png' class='img-fluid rounded-circle w-auto' alt=''></div>"
                 +"</div><div class='flex-grow-1 flex-wrap pe-3'><span class='mb-0 d-block'>"+ message + "</span><small class='text-body-secondary'>" + time + "</small></div></a>");
     } // if문 끝 
	 
 }
 
 // 알림 보낼 때 들어가야 하는 것 
 // 그냥 웹소켓 - 아이디(닉네임컨트롤러에서찾기), 내용, 시간  / insert ajax - 수신자 아이디, 내용, 타겟아이디
 function sendMsgH(id, content, target) {
	
	var receiverId = id;
	var message = content;
	var targetId = target;
	var originalTime = new Date().toTimeString().split(' ')[0].substring(0,5);
    var ampm = "";
    if (parseInt(originalTime.split(':')[0]) < 12) {
 	   ampm = "AM";
    } else {
 	   ampm = "PM";
    }
    var formattedTime = originalTime + ' ' + ampm;
	
    if(receiverId != "" && message != "" && targetId != "") {
    	
    	console.log("sendmsg 작동 시작 ");
    	
    	let msg = {
    		'sessionId' : $("#sessionIdH").val(), // handler에서 자동으로 받아서 채움(websocket sessionId)
			'receiverId' : 	receiverId,	// 받는사람 아이디
			'message' : message,	// 알림 내용
			'time' : formattedTime,	// 시간
    	}
    	
    	console.log("아작스 메세지 확인 >> ", msg);
    	
    	// 웹소켓 발송
    	websocketH.send(JSON.stringify(msg));
    
   		// 알림 내용 insert ajax		
		$.ajax({
			url : "/coco/project/alarmInsert",
			contentType : "application/json;charset=utf-8",
			method : "POST",
			data : JSON.stringify({
				'receiverId' : receiverId,	// 수신자 아이디
				'newsMsgCode' : message, 	// 알림내용
				'newsTargetId' : targetId	// 업무번호 등
			}),
			success: function(res) { // success
					console.log("알림 insert 성공", res);
			} ,  
			error : function(error) { 
				console.log("알림 인서트실패햇네요힘내새요");
			}
	  	}); // insert ajax
		  	
    } // if
 }

 
 
 // 해야할 일
 // 선택하는 순간 newsOpenYn -> Y로 바꿔주기 -> 배경색 회색 진하게 주기(style변경)
 // 필요한것, 선택하는 알람 넘버가 뜨게 해야함.

$(document).on("click", ".projectalm", function() {
  var newsNum = $(this).find(".spanForNewsNum").text();
  var newsOpenYn = $(this).find(".spanForOpenYN").text();
  
  $(this).css('background-color', '#BDBDBD'); // 클릭한놈 스타일 변경
  
  console.log("알람newsNum 확인 >> ", newsNum, " 알림newsOpenYn 상태 확인 >> ", newsOpenYn);
  
  	if (newsOpenYn == 'N') {
  		// 선택한 알림 열람상태 Y로 Update ajax		
  		$.ajax({
  			url : "/coco/project/alarmChkModify",
  			method : "POST",
  			data : {
  				'newsNum' : newsNum	// 알람번호
  			},
  			success: function(res) { // success
  					console.log("알람 확인 Update 성공햇습니다", res);
  			} ,  
  			error : function(error) { 
  				console.log("알람 확인 Update 실패햇네요힘내새요");
  			}
  		}); // Update ajax
  	}
	
});

 
</Script>
