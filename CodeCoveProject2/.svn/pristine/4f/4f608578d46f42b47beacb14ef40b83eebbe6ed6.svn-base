
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CodeCove</title>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>

<!-- 스크립트 나중에 빼기 -->

<!--Bootstrap icons-->
<link href="/resources/assets/fonts/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">

<!--Google web fonts-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Hanken+Grotesk:wght@100..900&family=IBM+Plex+Mono:ital@0;1&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,400,0,0" />

<!--Simplebar css-->
<link rel="stylesheet" href="/resources/assets/vendor/css/simplebar.min.css">

<!--Choices css-->
<link rel="stylesheet" href="/resources/assets/vendor/css/choices.min.css">

<!--Main style-->
<link rel="stylesheet" href="/resources/assets/css/style.min.css">

<style>

#container {
   width : 700px;
   height : 500px;
/*    background-color : grey; */
}
#messageArea .me {
   color: green;
   text-align : right;
   float: right;
}

.me {
   color: red;
      text-align : right;
}
#div-file {
	display : none;
}



.chat_out .chat_content {
	background-color: #70d9cc;
	color:#000000; 
}


.chat_out .chat_content::before {
     border-left: 5px solid #70d9cc;
}

</style>
</head>
  
<body>
   <!-- 세션 구분용(구채팅) -->
   <input type="hidden" id="sessionId" value=""/>
   <input type="hidden" id="nickName" value=""/>
   <!-- 이거보내기ㅇㅇㅇㅇ -->
   <input type="hidden" id="memId" value="${member.memId}"/>
   <input type="hidden" id="memNick" value="${member.memNick}"/>
   <input type="hidden" id="crNum" value="${crNum}"/>
   
<!--content-right-->
<div class="content-right card align-items-stretch h-100">

    <!--content right Header-->
    <div class="content-right-header card-header px-3">
        <div class="me-auto d-flex align-items-center">
            <div class="avatar-status d-none d-sm-flex status-online me-3 flex-shrink-0 avatar">
                <img src="${member.memProfile } class="rounded-circle img-fluid"
                    alt="">
            </div>
            <div>
                <h5 class="mb-0 lh-1">${sellerNick}</h5>
                <span class="small lh-sm d-none d-sm-block">Active now</span>
            </div>
        </div>
    </div>

    <!--content-right body-->
    <div class="content-right-body card-body">
        <div class="flex-row-fluid " id="messageArea">
				<c:choose>
					<c:when test="${empty chatList }">
					</c:when>
					<c:otherwise>
						<c:forEach items="${chatList }" var="chat" varStatus="stat">
							<c:set value="chat_in mb-4" var="chatHeaderDiv"></c:set>
							<c:if test="${chat.memId eq member.memId }">
								<c:set value="chat_out" var="chatHeaderDiv"></c:set>
							</c:if>
							<div class="${chatHeaderDiv}">
								<div class="chat_content">
									<div class="d-flex">
										<c:set value="${chat.crContent }" var="chatContent"></c:set>
										<div class="chat_content">
											<c:if test="${empty chat.crContent}">
												<c:set value="" var="chatContent"></c:set>
											</c:if>
											${chatContent}
											<c:if test="${not empty chat.crFile}">
												<!-- 이미지파일인경우 -->
												<c:if test="${fn:endsWith(fn:toLowerCase(chat.crFile), '.jpg') || fn:endsWith(fn:toLowerCase(chat.crFile), '.png') || fn:endsWith(fn:toLowerCase(chat.crFile), '.jpeg') || fn:endsWith(fn:toLowerCase(chat.crFile), '.gif')}">
													<img onclick="window.open('/coco/chatting/displayFile?fileName=${chat.crFile }')" src='/coco/chatting/displayFile?fileName=${chat.crFile }' style='cursor: pointer; width:150px;' />
												</c:if>
												<!-- 그냥 파일인 경우 -->
												
												<c:if test="${not (fn:endsWith(fn:toLowerCase(chat.crFile), '.jpg') || fn:endsWith(fn:toLowerCase(chat.crFile), '.png') || fn:endsWith(fn:toLowerCase(chat.crFile), '.jpeg') || fn:endsWith(fn:toLowerCase(chat.crFile), '.gif'))}">
													<i style="width:20px;" class="bi bi-file-earmark-pdf"></i>&nbsp;<a href="/coco/chatting/displayFile?fileName=${chat.crFile}" style="text-decoration-line: underline;">${fn:split(chat.crFile, '_')[1]}</a>
													
												</c:if>
											</c:if>
											
										</div>
										<div class="chat_time">
											<span><fmt:formatDate value="${chat.crDate }" pattern="yy-MM-dd hh:mm a" /></span>
<%-- 											<span>${chat.crDate }</span> --%>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				
				<!--Chat divider with day/month-->
							<div
								class="d-flex mb-4 align-items-center justify-content-center">
								<span class="d-block border-top flex-grow-1"></span>
								<div class="text-body-secondary mx-3 small">Today</div>
								<span class="d-block border-top flex-grow-1"></span>
							</div>
							
			</div>
    </div>

    <!--content right footer-->
    <div class="content-right-footer card-footer" data-dropzone-area="">
        <div class="dz-preview" id="dz-preview-row" data-horizontal-scroll="">
        </div>
        <form class="chat-form rounded-pill" data-emoji-form="">
            <div class="row align-items-center g-1">

                <div class="col">
                    <div class="d-flex align-items-center">
                        <input class="form-control border-0 p-0 shadow-none bg-transparent" id="msg"
                            rows="1" data-emoji-input=""
                            data-autosize="true" autofocus>
                    </div>
                </div>

                <div class="col-auto">
                    <div class="btn-group btn-group-icon btn-group-sm">
                        <button type="button" onclick="onClickUpload()"
                            class="btn p-0 size-35 btn-outline-secondary d-flex align-items-center justify-content-center dz-clickable"
                            id="fileBtn">
                            <span class="material-symbols-rounded align-middle">
                                attach_file
                                </span>
                        </button>
                        <button type="button"
                            class="btn p-0 size-35 btn-outline-secondary d-flex align-items-center justify-content-center">
                            <span class="material-symbols-rounded align-middle">
                                mood
                                </span>
                        </button>
                        <button type="button" id="sendBtn" onclick="sendMsg()"
                            class="btn p-0 btn p-0 size-35 btn-outline-secondary d-flex align-items-center justify-content-center">
                            <span class="material-symbols-rounded align-middle">
                                send
                                </span>
                        </button>
                    </div>
                </div>
                    <div id="div-file">
    				  <input type="file" id="fileUpload" value="파일"/>
                    </div>
            </div>
        </form>
    </div>
</div>
                            
</body>

<script type="text/javascript">

	// 파일 버튼 클릭시 input type 파일이랑 연결
    function onClickUpload() {
    	let fileUpload = $("#fileUpload");
    	fileUpload.click();
    }
   
	
   // websocket 생성
    const websocket = new WebSocket("ws://192.168.34.58/coco/chatting"); // IP or localhost넣기/192.168.34.58
//     const websocket = new WebSocket("ws://localhost/coco/chatting"); // IP or localhost넣기/192.168.34.58
    websocket.onmessage = onMessage;   // 소켓이 메세지를 받을 때
    websocket.onopen = onOpen;      // 소켓이 생성될때(클라이언트 접속)
    websocket.onclose = onClose;   // 소켓이 닫힐때(클라이언트 접속해제)
    
    // 확인용
   console.log(location.host);

    //on entering chat room
    function onOpen(evt) {
       console.log("채팅용 소켓열림 : " + evt);
    }

    //on exit chat room
    function onClose(evt) {
       $("#messageArea").append("연결 끊김. 인터넷을 확인해주세요.");
       console.log("소켓닫김 : " + evt);
    }
      
    // 대화명
   var name = "";

    // 메세지 받았을 때
    function onMessage(msg) {
       
       var data = JSON.parse(msg.data); // msg를 받으면 data 필드 안에 Json String으로 정보가 있음
       console.log("데이터 : ", data)
       
       // 필요한 정보를 Json data에서 추출
        var sessionId = data.sessionId;
        var senderId = data.receiverId;
        var message = data.message;
        var time = data.time;
        var fileFlag = data.fileFlag;  // 파일 구분용
        var str ="";

              
              // 사람 처음 접속시 작동 (컨트롤러에서 접속시 getId를 발송 -> hidden에 기입후 나 /상대방 구별시 사용)
              if(data.type == "getId") { 
                 var inputSessionId = data.sessionId != null ? data.sessionId : "";
                    if(inputSessionId != '') {
                       $("#sessionId").val(inputSessionId); // 세션 아이디 기입
                    }
                    
              // 일반 메세지  && 파일인 경우 작동
//               } else if(data.type = "plainMessage" && data.fileFlag == true) { // 일반 메시지 + 파일인 경우 
              } else if(data.fileFlag == true) { // 일반 메시지 + 파일인 경우 
                    // 내가 보낼 시 
                    if(data.sessionId == $("#sessionId").val()) {
                       
                       // 이미지 파일인 경우 
                     if(checkImageType(message)) {  // 이미지 -> 이미지태그를 이용한 출력형태
                              
                        str += "<img onclick=\"window.open('/coco/chatting/displayFile?fileName=" + message + "')\" src='/coco/chatting/displayFile?fileName=" + getThumbnailName(message) + "' style='cursor: pointer;' />";                      
//                          $("#messageArea").append("</br><a class='me'>나" + " : " + str + "  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[" + time + "]" + "</a><br/><br/><br/><br/><br/>");
                         $("#messageArea").append("<div class='chat_out'> <div class='chat_content'> <div class='d-flex'> <div class='chat_text'>" + str + 
                      		   "</div> <div class='chat_time'><span>" + time + "</span> </div></div></div></div> ");

                         // 일반 파일인 경우
                         
                        } else {               // 파일이면 파일명에 대한 링크로만 출력
                              str += "<a href='/coco/chatting/displayFile?fileName=" + message + "'>" + getOriginalName(message) + "</a>";
//                          $("#messageArea").append("<span class='me'>나 " + " : " + str + "  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[" + time + "]" + "</span><br/>");
                         $("#messageArea").append("<div class='chat_out'> <div class='chat_content'> <div class='d-flex'> <div class='chat_text' style='color:white;'><i style='width:20px;' class='bi bi-file-earmark-pdf'></i>&nbsp;" + str + 
                      		   "</div> <div class='chat_time'><span>" + time + "</span> </div></div></div></div> ");
                        }
                       
                       
                       // 파일 ajax 날리기
                    	  $.ajax({
                    		// 파일이 message에 담겨서 날아옴.
							url : "/coco/chatting/chatFileInsert",
							contentType : "application/json;charset=utf-8",
							method : "POST",
							data : JSON.stringify({ 
								'crNum' : $("#crNum").val(),
								'crFile' : message, 
								'memId' : $("#memId").val()
							}),
							success: function(res) { // success
									console.log("당신은 채팅인서트를 성공햇습니다", res);
							} ,  
							error : function(error) { // AJAX 요청이 실패했을 때 실행될 콜백 함수
								console.log("채팅인서트실패햇네요힘내새요");
							}
					  	}); // inset ajax
                       
             
                       
                     
                  // 상대방이 보낼 시
                    } else {
                       
                          // 이미지 파일인 경우
                        if(checkImageType(message)) {  // 이미지 -> 이미지태그를 이용한 출력형태
                                 
                           str += "<img onclick=\"window.open('/coco/chatting/displayFile?fileName=" + message + "')\" src='/coco/chatting/displayFile?fileName=" + getThumbnailName(message) + "' style='cursor: pointer;' />";
//                             $("#messageArea").append("</br>" + senderId + " : " + str + "  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[" + time + "]" + "</a><br/>");
                            $("#messageArea").append("<div class='chat_in mb-4'><div class='chat_content'><div class='d-flex'><div class='chat_text'>"+ str +
     							   "</div><div class='chat_time'><span>" + time + "</span></div></div></div></div>");

                        // 일반 파일인 경우
                        } else {               // 파일이면 파일명에 대한 링크로만 출력
                              str += "<a href='/coco/chatting/displayFile?fileName=" + message + "'>" + getOriginalName(message) + "</a>";
//                               $("#messageArea").append(senderId + " : " + str + "  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[" + time + "]" + "<br/>");                     
                              $("#messageArea").append("<div class='chat_in mb-4'><div class='chat_content'><div class='d-flex'><div class='chat_text'><i style='width:20px;' class='bi bi-file-earmark-pdf'></i>&nbsp;"+ str +
       							   "</div><div class='chat_time'><span>" + time + "</span></div></div></div></div>");                    
                        }

                    }
               
              // 그냥 일반 메세지 처리 
              } else if(data.type = "plainMessage")  {    // 일반 메세지인 경우
            	  	// 내가 보낼 때 
                    if(data.sessionId == $("#sessionId").val()) {
                       $("#messageArea").append(
                    		   "<div class='chat_out'> <div class='chat_content'> <div class='d-flex'> <div class='chat_text'>" + message + 
                    		   "</div> <div class='chat_time'><span>" + time + "</span> </div></div></div></div> ");

                   	   console.log("아작스 전 확인 >> ", message);
                       // 일반 메세지 인서트
	   					$.ajax({
	   						//CR_CONTENT_NUM, CR_NUM, CR_CONTENT, CR_DATE, ATTATCH_NUM, MEM_ID
							url : "/coco/chatting/chatMsgInsert",
							contentType : "application/json;charset=utf-8",
							method : "POST",
							data : JSON.stringify({
								'crNum' : $("#crNum").val(),
								'crContent' : message, 
// 								'crDate' : time,
								'memId' : $("#memId").val()
							}),
							success: function(res) { // success
									console.log("당신은 채팅인서트를 성공햇습니다", res);
							} ,  
							error : function(error) { // AJAX 요청이 실패했을 때 실행될 콜백 함수
								console.log("채팅인서트실패햇네요힘내새요");
							}
					  	}); // inset ajax
				  	
                       
                    } else { // 일반 메시지 상대방
                       $("#messageArea").append(
                    		   "<div class='chat_in mb-4'><div class='chat_content'><div class='d-flex'><div class='chat_text'>"+ message +
							   "</div><div class='chat_time'><span>" + time + "</span></div></div></div></div>");
                    }
              }
         //   }        
    }
    
   
    var nickName = "";
    
   // 메세지 전송
    function sendMsg() {
	   
       nickName = document.getElementById("memNick").value;
       var message = document.getElementById("msg").value;
       
       var originalTime = new Date().toTimeString().split(' ')[0].substring(0,5);
       var ampm = "";
       if (parseInt(originalTime.split(':')[0]) < 12) {
    	   ampm = "AM";
       } else {
    	   ampm = "PM";
       }
       
       var formattedTime = originalTime + ' ' + ampm;
       
       // 채팅 입력 칸이 비어있지 않을 경우만 정보를 Json형태로 전송
       if(message != "") {         
         let msg = {
            'sessionId' : $("#sessionId").val(),
            'receiverId' : nickName,
             'message' : message,
             'time' : formattedTime,
//              'time' : new Date().toTimeString().split(' ')[0].substring(0,5) + &nbsp;ampm,
            'type' : "plainMessage"
               }
   
             if(message != null) {
                websocket.send(JSON.stringify(msg));
             }
         
          document.getElementById("msg").value = ''; // 채팅 보내고 빈칸처리
        }        
       
    }
    
   // 엔터 전송
   document.addEventListener("keypress", function(e){
      if(e.keyCode == 13){ 
         sendMsg();
      }
   });
   
   
 
   
   
// 파일-------------------------------------------------------------------------------
   
   
   
//    $("#fileUpload").change(function() {
//       $("#fileForm").submit();
      
//    });
   
   var fileUpload = $("#fileUpload");
   var fileFlag = false;
   

   fileUpload.on("change", function(event) {
      console.log("첨부파일 사진 들어갑니다");
      
      var files = event.target.files;
      var file = files[0];
      fileFlag = true;
      
      // 시간
      var originalTime = new Date().toTimeString().split(' ')[0].substring(0,5);
      var ampm = "";
      if (parseInt(originalTime.split(':')[0]) < 12) {
   	   ampm = "AM";
      } else {
   	   ampm = "PM";
      }
      var formattedTime = originalTime + ' ' + ampm;
      // 닉네임
      nickName = document.getElementById("memNick").value; 
      
      console.log("올린 파일 확인 >> ", file);
      console.log("파일 올릴 때 닉네임 확인 >>" , nickName)
      // ★★★비동기 + 파일 데이터 보내기 ==> form데이터를 만들어서, 거기 안에 <key, value>형식으로 데이터 구성해서 보낸다★★★
      // cf) 동기처리 : form태그사용 
      // content type: x19213-sdas어쩌구하는거 
								
      var formData = new FormData();
      formData.append("file", file);
      
      $.ajax({
         type : "post",
         url : "/coco/chatting/uploadAjax",
         data : formData,
         dataType : "text",       // 서버에서 넘겨받음(응답데이터)
         processData : false,   // 쿼리스트링화 방지
         contentType : false,    // x19213-sdas어쩌구 방식 고정 방지
         success : function(data) {
            console.log("파일전송 결과 >> ", data);
            let msg = {
                  'fileFlag' : fileFlag,
                  'sessionId' : $("#sessionId").val(),
                  'receiverId' : nickName,
                  'message' : data,
                  'time' : formattedTime,
//                   'type' : "plainMessage"
                     }
              websocket.send(JSON.stringify(msg));   // websocket handler로 전송(서버로 전송)
            
         } // success
      });
      
   });
   
   
   function getOriginalName(fileName) {
      if(checkImageType(fileName)){
         return;
      }
      
      var idx = fileName.indexOf("_") + 1; // 언더바를 기준으로 원본파일명 등 나뉨
      return fileName.substr(idx);
      
   } // getOriginalName

    
   function checkImageType(fileName) {
      var pattern = /jpg|gif|png|jpeg/i;
      return fileName.match(pattern); // 패턴과 일치하면 true(이미지파일이란 얘기)
   }
   
   function getThumbnailName(fileName) {
      var front = fileName.substr(0, 12);
      var end = fileName.substr(12);
      
      console.log("front : " + front);
      console.log("end : " + end);
      
      return front + "s_" + end; // 썸넬 : s_파일명 
   }
    

</script>
</html>