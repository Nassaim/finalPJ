<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/editor.js/2.25.0/editor.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/attaches@latest"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/header@latest"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/underline@latest"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/image@2.3.0"></script>
<script
	src="https://cdn.jsdelivr.net/npm/editorjs-text-color-plugin@1.12.1/dist/bundle.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/editorjs-drag-drop@1.1.5/dist/bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/checklist@latest"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/code"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/table"></script>
<script src="https://cdn.jsdelivr.net/npm/editorjs-alert"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/marker"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/raw"></script>
<script
	src="https://cdn.jsdelivr.net/npm/editorjs-html@3.4.0/build/edjsHTML.js"></script>
<script src="/resources/js/blog/index.min.js"></script>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.realMember" var="member" />
</sec:authorize>

<style>
#heart-icon {
	font-size: 1cm; /* 크기를 1cm로 지정 */
}

#replyAttr {
	margin-top: 10px;
	float: right;
}

#content {
	margin: 20px;
	pointer-events: none;
	margin-top: 40px;
}

.arr {
	padding: 5px 3px 5px 3px;
	background-color: #F2F2F2;
	border-radius: 10px;
	color: black;
	border: 2px solid #F2F2F2;
	box-shadow: 2px solid gray;
}

#title-box {
	width: 100%;
	float: left;
	font-size: 30px;
	color: black;
	margin-left: 5px;
}

table {
	text-align: center;
}

#pagingArea {
	text-align: center;
}

a {
	color: black;
}

#heartNo {
	pointer-events: none;
	border: none;
	font-size: 18px;
	padding-top: 15px;
}

#bookMark {
	font-size: 50px;
}
</style>
<div style="margin-left: 15%; margin-right: 15%; margin-top: 5%;">
	<input type="hidden" name="Heartchk" value="${Heartchk }">
	<div>
		<div class="card-body"
			style="height: 90px; border-bottom: 2px solid black">
			<div id="title-box">
				<div class="d-flex flex-wrap gap-2 justify-content-left"
					style="width: 75%; float: left;">
					<div class="rating-symbol" id="bookMark"
						style="display: inline-block; position: relative;">
						<div class="rating-symbol-background ri-bookmark-line"
							style="font-size: 40px; visibility: visible; margin-top: 1px;"></div>
						<div class="rating-symbol-foreground bookmarkhind"
							style="display: inline-block; position: absolute; overflow: hidden; left: 0px; right: 0px; width: 0px;">
							<span class="ri-bookmark-fill"
								style="margin-top: 1px; color: #D30707; font-size: 40px;"></span>
						</div>
					</div>
					<div style="margin-left: 10px; margin-top: 6px;">
						<c:out value="${post.postTitle }" />
					</div>
				</div>
				<div style="width: 25%; float: right; font-size: 15px;">
					<div style="text-align: right;">
						<a href="/blog/gogo/cate/${post.cateNm }">${post.cateNm }</a> |
						${post.postDate }
						<c:if test="${post.postPublicYn eq 'N' }">
							<i class="ri-rotate-lock-line"></i>
						</c:if>
					</div>
					<div style="text-align: right;">
						<i class="bi bi-eye"
							style="text-align: right; padding-right: 10px;">&nbsp;${post.postView}</i>
						<i class="bi bi-suit-heart"
							style="text-align: right; padding-right: 10px;">&nbsp;${post.postHeart}</i>
					</div>
					<!--/////////////////////////////신고하기 modal시작//////////////////////////////////////////-->
					<a href="#modalForm" data-bs-toggle="modal" aria-expanded="false"
						class="btn btn-outline-danger" style="float: right;">신고하기</a>
					<!--Modal Form-->
                <div class="modal fade" id="modalForm" tabindex="-1" aria-labelledby="modalFormLabel"
                    aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content border-0">
                            <div class="position-relative border-0 pe-4">
                                <button type="button"
                                    class="btn btn-gray-200 p-0 border-2 width-3x height-3x rounded-circle flex-center position-absolute end-0 top-0 mt-3 me-3 z-1"
                                    data-bs-dismiss="modal" aria-label="Close">
                                    <i class="bx bx-x fs-5"></i>
                                </button>
                            </div>
                            <div class="modal-body py-5 border-0">
                                <div class="px-3">

                                    <h2 class="mb-1 display-6">
                                        신고
                                    </h2>
                                    <p class="mb-4 text-body-secondary">
                                        	신고사유를 작성해주세요.
                                    </p>
                                    <div class="position-relative">
                                        <div>
                                            <form>
                                                <div class="input-icon-group mb-3">
                                                    <span class="input-icon">
                                                        <i class="bx bx-envelope"></i>
                                                    </span>
                                                    <input type="memId" class="form-control" autofocus=""
                                                        placeholder="신고자">
                                                </div>
                                                <div class="input-icon-group mb-3">
                                                    <span class="input-icon">
                                                        <i class="bx bx-key"></i>
                                                    </span>
                                                    <input type="targetId" class="form-control" placeholder="피신고자">
                                                </div>
                                                <div class="input-icon-group mb-3">
                                                    <span class="input-icon">
                                                        <i class="bx bx-key"></i>
                                                    </span>
                                                    <input type="targetId" class="form-control" placeholder="신고내용" style="height: 100px;">
                                                </div>
                                                <div class="mb-3 d-flex justify-content-between">
                                                </div>
                                                <div class="d-grid">
                                                    <button class="btn btn-primary" type="submit">
                                          			              신고 접수
                                                    </button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


					<!--/////////////////// 신고하기 modal끝 //////////////////////////////////////////////////// -->
				</div>
			</div>
		</div>
	</div>
	<div id="content">
		<p class="card-title-desc" id="postContent" style="display: none">
			<c:out value="${post.postContent }" />
		</p>
		<div id="editorjs"></div>
	</div>
	<!--////////////////// 찜기능///////////////////////////////// -->
	<div
		style="width: 100%; float: left; border-bottom: 2px solid black; margin-bottom: 20px;">
		<div class="d-flex flex-wrap gap-2 heartBox"
			style="width: 180px; float: right;">
			<div class="rating-star" id="heartBtn">
				<div class="rating-symbol"
					style="display: inline-block; position: relative; float: right;">
					<span id="heart-icon">&#x2661;</span>
					<div class="rating-symbol-foreground hearthide"
						style="display: inline-block; position: absolute; overflow: hidden; left: 0px; right: 0px; width: 0px;">
						<span id="heart-icon" style="color: red; fill: red;">&#x2665;</span>
					</div>
				</div>
			</div>
			<div>
				<span id="heartNo" style="text-align: right">${heartNo } LIKE</span>
			</div>
		</div>
	</div>
	<!--////////////////// 찜기능///////////////////////////////// -->
</div>
<div id="tagArea">
	<c:set value="${TagArr }" var="TagArr" />
	<c:forEach items="${TagArr }" var="arr">
		<span class="arr">${arr }</span>
	</c:forEach>
</div>
<div>
	<c:if test="${not empty post.attatchList }">
		<div>
			<c:forEach items="${post.attatchList }" var="attatches">
				<a href="#" class="download" data-attnum="${attatches.attatchNum }"
					data-attorder="${attatches.attatchOrder }">${attatches.originNm }</a>
				<br>
			</c:forEach>
		</div>
	</c:if>
</div>
<form id="markForm">
	<sec:csrfInput />
	<input type="hidden" name="postNum" value="${post.postNum}">
	<%-- <input type="hidden" name="postNum" value="${post.getMemId}"> --%>
</form>

<form action="/download" id="downForm">
	<input type="hidden" name="attatchNum" id="attatchNum"> <input
		type="hidden" name="attatchOrder" id="attatchOrder">
</form>
<br>

<%-- <jsp:include page="blogReply.jsp" /> --%>
</div>
<script>
const url = "/blog/${post.bloggerId}/post/${post.postNum}";
const bloggerId = "${post.bloggerId}";
</script>
<script src="/resources/js/fileDownload.js"></script>
<script>
 
const editor = new EditorJS({
    autofocus: true,
    onReady: () => {
    new DragDrop(editor);
    },
    tools: {
       alert: Alert,
        attaches: {
            class: AttachesTool,
            config: {
                endpoint: 'upload URL'
            }
        },
        checklist: {
            class: Checklist,
            inlineToolbar: true,
          },
          raw: RawTool,
         table: {
              class: Table,
          },
         Marker: {
              class: Marker,
              shortcut: 'CMD+SHIFT+M',
          },
        code: CodeTool,
        codeBox: {
            class: CodeBox,
            config: {
              themeURL: 'https://cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.18.1/build/styles/dracula.min.css', // Optional
              themeName: 'atom-one-dark', // Optional
              useDefaultTheme: 'light' // Optional. This also determines the background color of the language select drop-down
            }
         },
        header: Header,
        underline: Underline,
        image: {
            class: ImageTool,
            config: {
                endpoints: {
                    byFile: '/blog/uploadFile?${_csrf.parameterName}=${_csrf.token}'
                    
                }
            }
        },
        Color: {
            class: ColorPlugin,
            config: {
                colorCollections: ['#EC7878','#9C27B0','#673AB7','#3F51B5','#0070FF','#03A9F4','#00BCD4','#4CAF50','#8BC34A','#CDDC39', '#FFF'],
                defaultColor: '#FF1300',
                type: 'text', 
            }     
        },
        Marker: {
            class: ColorPlugin,
            config: {
                defaultColor: '#FFBF00',
                type: 'marker', 
            }       
        }
    }
});
let postContent = $("#postContent").text();
let postJs = JSON.parse(postContent).blocks;
console.log(postJs);    
    $("#load").on("click", function(){
       editor.render({
            "time": 1661322242128,
            "blocks": postJs,
            "version": "2.25.0"
        })
    });

    editor.isReady
    .then(() => {
       editor.render({
            "time": 1661322242128,
            "blocks": postJs,
            "version": "2.25.0"
        })
    })
    .catch((reason) => {
      console.log(`Editor.js initialization failed because of ${reason}`)
    });
    
   
   let Heartchk = $("input[name='Heartchk']").val();
   if (Heartchk == "true") {
      $(".hearthide").css("overflow", "visible");
   }
   
    
    $("#heartBtn").on("click", function(){
       let heartMark = $("div.hearthide").css("overflow");
       console.log("heartMark : "+heartMark);
       
       console.log("데이터 ", $('#markForm').serialize());
       
       if(heartMark=="hidden"){
          $.ajax({
             url : "/${memId}/savePostHeart",
             method : "post",
             dataType : "json",
             data : $('#markForm').serialize(),
             success : function(resp, status, jqXHR) {
                console.log(resp)
                console.log(jqXHR)
                $("input[name='Heartchk']").attr("value", "true");
                $(".hearthide").css("overflow", "visible");
                let heartNo = $("#heartNo").text();
                let plustht = parseInt(heartNo)+1
               $("#heartNo").html(plustht+" LIKE" );
             },
             error : function(jqXHR, status, error) {
                console.log(jqXHR);
                console.log(status);
                console.log(error);
                $(".hearthide").css("overflow", "hidden");
             }

          });
       }else if(heartMark=="visible"){
          $.ajax({
             url : "/${memId}/delPostHeart",
             method : "post",
             dataType : "json",
             data : $('#markForm').serialize(),
             success : function(resp, status, jqXHR) {
                console.log(resp)
                $("input[name='Heartchk']").attr("value", "false");
                $(".hearthide").css("overflow", "hidden");
                let heartNo = $("#heartNo").text();
                let minumsht = parseInt(heartNo)-1;
                
                $("#heartNo").html(minumsht+" LIKE" );
             },
             error : function(jqXHR, status, error) {
                console.log(jqXHR);
                console.log(status);
                console.log(error);
                $(".hearthide").css("overflow", "hidden");
             }
          });   
       }
    });
</script>

