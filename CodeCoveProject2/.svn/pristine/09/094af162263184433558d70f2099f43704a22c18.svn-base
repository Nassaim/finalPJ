<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>프로젝트 채팅방</title>

   <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>

<!-- 스크립트 나중에 빼기 -->
<style>

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


.bi-file-earmark-pdf {
	color:#000000; 
}


</style>

</head>

    
<!--                 <main class="page-content d-flex flex-column flex-row-fluid"> -->

   <!-- 세션 구분용(구채팅) 아래 session은 websocketSessionId-->
   <input type="hidden" id="sessionId" value=""/>
   <input type="hidden" id="nickName" value=""/>
   
   <!-- 이거는 Ajax 보내는용도 -->
   <input type="hidden" id="memId" value="${member.memId}"/>
   <input type="hidden" id="memNick" value="${member.memNick}"/>
   <input type="hidden" id="crNum" value=""/>

                    <!--//Page content//-->
                    <div class="px-3 px-lg-6">
                        <div class="content shadow-lg content-wrapper content-expand-md">
                            <!--Content-wrapper-overlay when sidebar open for 768px down width-->
                            <div class="content-wrapper-overlay"></div>
                            <!--Content-sidebar-->
                            <div class="content-left">
                                <div class="content-sidebar overflow-hidden card align-items-stretch h-100"
                                    id="content-sidebar">
                                    <!--content-sidebar-header-->
                                    <div class="content-sidebar-header p-0 border-bottom position-relative">
                                            <div style="display: flex; align-items: center; justify-content: center;"
                                                class="position-absolute start-0 top-50 translate-middle-y opacity-50 lh-1 ms-3">
												<a class="navbar-brand" style="color: #00c7ae; margin-left:65px;"> &nbsp; &nbsp;CodeCove
												</a>
											</div>
                                    </div>

                                    <!--content-sidebar-body-->
                                    <div class="content-sidebar-body p-0 card-body">
                                        <div class="list-group list-group-flush mb-0">
                                            <!--Chat User-->

												<c:choose>
													<c:when test="${empty chatRoomList }">
															<a>참여중인 프로젝트가 없습니다.</a>
													</c:when>
													<c:otherwise>
														<c:forEach items="${chatRoomList }" var="chat" varStatus="stat">
																<a href="#!"
																	class="list-group-item px-3 align-items-center list-group-item-action border-0 d-flex py-3 chatRoomA">
																	<div class="flex-shrink-0">
																		<div id="chatRoomIcon${stat.count }"
																			class="chatRoomIcons avatar-status status-online me-3 avatar d-flex align-items-center justify-content-center text-white fw-bolder rounded-circle }">
																			${fn:substring(chat.pjName,0,1) }</div>
																	</div>
																	<div class="overflow-hidden flex-grow-1">
																			<div class="d-flex overflow-hidden">
																				<c:if test="${chat.comCodeNm eq '모집중'}">
																					<span class="badge bg-light text-dark" style="margin-bottom:4px;">모집중</span>
																				</c:if>
																				<c:if test="${chat.comCodeNm eq '진행중'}">
																					<span class="badge bg-success-subtle text-success" style="margin-bottom:4px;">진행중</span>
																				</c:if>
																				<c:if test="${chat.comCodeNm eq '완료'}">
																					<span class="badge bg-warning-subtle text-warning" style="margin-bottom:4px;">완료</span>
																				</c:if>
																				<small class="d-block flex-shrink-0 opacity-75 ms-auto">${chat.pjCreateDate }</small>
																			</div>
											<!-- 																		<p class="mb-0 text-reset text-truncate pe-3 flex-grow-1 overflow-hidden"> -->
																			<h6  class="mb-0 text-reset text-truncate pe-3 flex-grow-1 overflow-hidden">${chat.pjName }</h6>
<!-- 																		</p> -->
																	</div>
																	<input type="hidden" value="${chat.pjId }" id="pjIdSelect"/>
																	<input type="hidden" value="${chat.crNum }" id="crNumSelect"/>
																	<input type="hidden" value="${chat.pjName }" id="pjNameSelect"/>
																</a>
														</c:forEach>
													</c:otherwise>
												</c:choose>
						
														<!--Load more button-->
                                            <a href="#!"
                                                class="list-group-item px-3 align-items-center justify-content-center list-group-item-action d-flex py-3">
                                                <span>Load more</span>
                                            </a>
                                        </div>
                                    </div>

                                </div>
                            </div>

                            <!--content-right body-->
                            <div class="content-right card align-items-stretch h-100">

                                <!--content right Header-->
                                <div class="content-right-header card-header px-3">
                                    <div class="me-auto d-flex align-items-center">
                                        <div class="d-none d-sm-flex me-3 flex-shrink-0 avatar">
                                            <img src="/resources/images/codecovelogobasic.png" class="rounded-circle img-fluid"
                                                alt="">
                                        </div>
                                        <div>
                                            <h5 class="mb-0 lh-1" id="chatHeaderNick">${member.memNick }</h5>
                                            <span class="small lh-sm d-none d-sm-block">로그인</span>
                                        </div>
                                    </div>
                                    <!--Buttons group-->
                                </div>

                                <!--content-right body-->
                                <div class="content-right-body card-body">
     								   <div class="flex-row-fluid " id="messageArea">
     								   		<!-- 여기 채워져야함 -->
     								   		
     								   		<div id="oldChatlogDiv"></div>
     								   		
											<!--Chat divider with day/month-->
														<div class="d-flex mb-4 align-items-center justify-content-center todayDiv">
															<span class="d-block border-top flex-grow-1"></span>
															<div class="text-body-secondary mx-3 small">Today</div>
															<span class="d-block border-top flex-grow-1"></span>
														</div>
														
										</div>
										
										<!-- 채팅 for문 돌리기 -->
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
                        </div>
                    </div>
                    <!--//Page content End//-->


<!--                 </main> -->
<!--///////////Page content wrapper End///////////////-->
        
<!--////////////Theme Core scripts Start/////////////////-->
<!-- <script src="/resources/assets/js/theme.bundle.min.js"></script> -->
<script src="/resources/assets/js/theme.bundle.min.js"></script>	
<!--////////////Theme Core scripts End/////////////////-->

<script>
// 전역변수
// var global = {};
// global.serverName = "localhost";
// console.log("시작 전역변수 확인 : ", global);


$(function() {
  var colorCodes = ['#34282C', '#151B54', '#736AFF', '#46C7C7', '#306754', '#348017', '#FBB917', '#C19A6B', '#CC6600', '#F87217', '#E41B17', '#810541', '#E4287C', '#614051'];
  var chatIconDivs = document.querySelectorAll('.chatRoomIcons');
  for (var i = 0; i < chatIconDivs.length; i++) {
    var randomIndex = Math.floor(Math.random() * colorCodes.length);
    var fixedColor = colorCodes[randomIndex];
    chatIconDivs[i].classList.add('random-color');
    chatIconDivs[i].style.backgroundColor = fixedColor;
  }
});


// 파일 버튼 클릭시 input type 파일이랑 연결
function onClickUpload() {
	let fileUpload = $("#fileUpload");
	fileUpload.click();
}

// $(function() {
	
	//여기에다,,, 웹소켓 어케 넣을지 생각해봐라
	// 선택한 pjId만 아작스 날려서 채팅 가져오기

	// 채팅방 a태그 클릭시 룸 아이디 가져옴 
	// ☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆ 이거 만들어놓은거 전송되는지 확인 insert한 후에 하기
	// 헷갈리지 말것 : crNumSelect = select용 crNum / ajax insert용 crNum 은 = crNu
	$(".chatRoomA").on("click", function() {
		
		// 클릭시 다른 채팅방에서 그렸던 div 초기화하기
		$("#messageArea").find("div.chat_out, div.chat_in").empty();
		
		var crRoomId = $(this).find("#crNumSelect").val();
		console.log("crNum확인 크릭클릭 ㅋ  : ", crRoomId);
		
		// insert할 때 보낼 채팅방 값 채워놓기 -> insert용 ajax는 아래 받을시
		$("#crNum").val(crRoomId);
		var crNum = $("#crNum").val();
		console.log("ajax로 날리기 전 crNum 확인 >> ", crNum);
		
		// 클릭시 회원 닉네임 -> 프로젝트명으로 변경
		var pjNameSelect = $(this).find("#pjNameSelect").val();
		console.log("회원닉네임 화긴영 >> ", pjNameSelect);
		$("#chatHeaderNick").html(pjNameSelect);
		
        // 채팅방내역 가져오는 select ajax 
			$.ajax({
				url : "/coco/chatting/selectChatLogsPj",
				method : "POST",
				data : {
					'crNum' : crRoomId 
				},
				success: function(data) { // roomMap(roomNo / result)
						console.log("채팅방번호 쏘기 성공 로그리스트 확인하긔", data);
						// div 그리기 
						var showChatLogs = '';
						
					      for (var i = 0; i < data.length; i++) {
					    	  
					    	  if(data[i].memId == $("#memId").val()) { // 동일인 일 때만 chat_out
					    	  	showChatLogs += "<div class='chat_out'>";
					    	  } else {
					    		showChatLogs += "<span>" + data[i].memNick + "</span>" // 상대방 닉네임
	   				    	    showChatLogs += "<div class='chat_in mb-4'>";
					    	  }	
					    	  
					    	  showChatLogs += "<div class='chat_content'><div class='d-flex'><div class='chat_content'>"
					    	  
					    	  //여기
					    	  // 일반 채팅
					    	  if(!(data[i].crContent == "" || data[i].crContent == null)) {
					    		  showChatLogs += data[i].crContent;
					    	  }
					    	  
					    	  // 파일인경우
					    	  if(!(data[i].crFile == "" || data[i].crFile == null)) {
					    		  if(data[i].crFile.toLowerCase().endsWith(".jpg") || data[i].crFile.toLowerCase().endsWith(".png") || data[i].crFile.toLowerCase().endsWith(".jpeg") || data[i].crFile.toLowerCase().endsWith(".gif")) {
					    			  showChatLogs += "<img onclick='window.open(\"/coco/chatting/displayFile?fileName=" + data[i].crFile + "\")' src='/coco/chatting/displayFile?fileName=" + data[i].crFile + "' style='cursor: pointer; width:150px;' />";
					    		   } else {
					    			  showChatLogs += "<i style='width:20px;' class='bi bi-file-earmark-pdf'></i>&nbsp;<a href='/coco/chatting/displayFile?fileName=" + data[i].crFile + "' style='text-decoration-line: underline;'>" + data[i].crFile.split("_")[1] + "</a>";
					    		   }
					    	  }// if
					    	  
					    	  var dateString = data[i].crDate;
					    	  var dateObj = new Date(dateString);

					    	  var formattedDate = dateObj.toLocaleString("ko-KR", {
					    	    year: "numeric",
					    	    month: "2-digit",
					    	    day: "2-digit",
					    	    hour: "2-digit",
					    	    minute: "2-digit",
					    	    hour12: true
					    	  });
					    	  
					    	  showChatLogs += "</div><div class='chat_time'><span>" + formattedDate +"</span></div></div></div></div>"
					    	  
					      } // for문 끝
					      
					      $('#oldChatlogDiv').html(showChatLogs);
				
					} // success
	  		}); // ajax
	});
	
	
	// websocket 생성
    const websocket = new WebSocket("ws://192.168.34.58/coco/chatting"); // IP or localhost넣기/192.168.34.58
//     const websocket = new WebSocket(`ws:\/\/\${global.serverName}/coco/project`); // IP or localhost넣기/192.168.34.58
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
    
    
    
    // 메세지 받았을 때
    function onMessage(msg) {
       
       var data = JSON.parse(msg.data); // msg를 받으면 data 필드 안에 Json String으로 정보가 있음
       console.log("데이터 : ", data)
       
       // 필요한 정보를 Json data에서 추출
        var sessionId = data.sessionId;
        var senderId = data.receiverId; // 닉네임
        var message = data.message; // 일반 메세지 또는 파일
        var time = data.time;
        var fileFlag = data.fileFlag;  // 파일 구분용
        var str ="";
		var nickStr = "";
              
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
//                          $("#messageArea").append("<span class='me'>나 " + " : " + str + "  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[" + time + "]" + "</span><br/>"); 밑줄변경
                         $("#messageArea").append("<div class='chat_out'> <div class='chat_content'> <div class='d-flex'> <div class='chat_text' style='text-decoration-line: underline;'><i style='width:20px;' class='bi bi-file-earmark-pdf'></i>&nbsp;" + str + 
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
							$("#messageArea").append("<span>" + senderId + "</span>");
                            $("#messageArea").append("<div class='chat_in mb-4'><div class='chat_content'><div class='d-flex'><div class='chat_text'>"+ str +
     							   "</div><div class='chat_time'><span>" + time + "</span></div></div></div></div>");

                        // 일반 파일인 경우
                        } else {               // 파일이면 파일명에 대한 링크로만 출력
                              str += "<a href='/coco/chatting/displayFile?fileName=" + message + "'>" + getOriginalName(message) + "</a>";
//                               $("#messageArea").append(senderId + " : " + str + "  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[" + time + "]" + "<br/>");     밑줄변경
							  $("#messageArea").append("<span>" + senderId + "</span>");
							  $("#messageArea").append("<div class='chat_in mb-4'><div class='chat_content'><div class='d-flex'><div class='chat_text' style='text-decoration-line: underline;'><i style='width:20px;' class='bi bi-file-earmark-pdf'></i>&nbsp;"+ str +
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
                       $("#messageArea").append("<span>" + senderId + "</span>");
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
//               'time' : new Date().toTimeString().split(' ')[0].substring(0,5) + &nbsp;ampm,
             'type' : "plainMessage"
                }
    
              if(message != null) {
                 websocket.send(JSON.stringify(msg));
              }
          
           document.getElementById("msg").value = ''; // 채팅 보내고 빈칸처리
         }        
        
     }
     

//     }); // 하나로 묶는 스크립트 
    
	
	
  

// 엔터 전송
document.addEventListener("keypress", function(e){
   if(e.keyCode == 13){ 
      sendMsg();
  }
});
    
 // 파일-------------------------------------------------------------------------------
    
    
    
//     $("#fileUpload").change(function() {
//        $("#fileForm").submit();
       
//     });
    
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
//                    'type' : "plainMessage"
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
    
	
// }); // end of Script
</script>

        <!--Chat sidebar toggler-->
        <script>
            $('.content_sidebar_toggler,.content-wrapper-overlay').on("click", function (e) {
                $('.content-expand-md').toggleClass("content_sidebar_show");
            });

        </script>
    </body>

</html>
