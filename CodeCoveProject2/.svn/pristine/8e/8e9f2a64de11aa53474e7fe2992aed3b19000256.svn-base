<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
<style>
#FormBox {
	width: 100%;
	margin: auto;
	padding: 60px;
}

#tagInput {
	font-size: 20px;
	height: 30px;
	padding: 15px;
	/* 	width: 100%; */
}

#save-button {
	background-color: black;
	font-size: 18px;
	color: white;
	border-radius: 5px;
	padding: 3px 10px 3px 10px;
	float: right;
	width: 100px;
	height: 50px;
}

#editorjs {
	border-bottom: 1px solid gray;
	min-height: 700px;
	color: black;
}

#radio-box {
	float: left;
	width: 100%;
	padding: 20px, 0, 20px, 0;
	/* 	margin-top: 20px; */
	/* 	margin-bottom: 20px; */
	/* 	font-size: 15px; */
}

.filebox {
	width: 100%;
	padding: 5px;
	float: left;
}

.ce-block__content {
	width: 90%;
}

.d-flex flex-wrap gap-2 {
	display: flex;
	width: 100%;
}

.tags {
	background-color: #F2F2F2;
	color: black;
	margin-left: 3px;
	margin-top: 3px;
	border: 5px solid #F2F2F2;
	font-weight: 500;
	border-radius: 10px;
	display: inline-block;
}

#category {
	/* 	width: 180px; */
	font-size: 23px;
	margin-bottom: 10px;
}

#tagInput {
	border: 0 solid black;
	float: left;
}

#tagArea {
	float: left;
}

#tagInput:focus {
	outline: 0 solid black;
}

#title {
	border: 0 solid black;
	width: 100%;
	font-size: 30px;
	border-bottom: 1px solid gray;
	margin-bottom: 10px;
	color: black;
}

#title:focus {
	outline: 0 solid black;
}

.category-box {
	margin-bottom: 0;
}
</style>
<c:if test="${not empty message }">
	<script>
	
	swal({
		  title: "${message }",
		  icon: "success",
		});
		
	</script>
	<c:remove var="message" scope="session" />
</c:if>
<div id="FormBox">

	<div class="category-box">
		<c:set value="${category }" var="cate" />
		<select id="category">
			<c:if test="${not empty cate }">
				<option value="" selected disabled hidden>카테고리선택</option>
				<c:forEach items="${cate }" var="ct">
					<option value="${ct.cateNum }">${ct.cateNm }</option>
				</c:forEach>
			</c:if>
			<c:if test="${empty cate }">
				<option value="" selected disabled hidden>카테고리없음</option>
			</c:if>
		</select>
	</div>
	<div class="d-flex flex-wrap gap-2 justify-content-center">
		<input type="text" id="title" placeholder="제목을 입력해주세요" maxlength="40">
	</div>
	<div id="editorjs"></div>
	<div>
		<div class="d-flex">
			<div id="tagArea"></div>
			<input type="text" id="tagInput" placeholder="태그입력 (단어 입력 후 엔터)">
		</div>
	</div>
	<br>
	<div id="radio-box">
		<input type="radio" name="blind" value="Y" checked="checked">공개
		<input type="radio" name="blind" value="N">비공개
	</div>

	<form:form id="postForm" modelAttribute="mypost" method="post"
		enctype="multipart/form-data">
		<form:input path="postTitle" type="hidden" />
		<form:input path="postContent" type="hidden" />
		<form:input path="postTag" type="hidden" />
		<form:input path="bloggerId" value="${mypost.bloggerId}" type="hidden" />
		<form:input path="postPublicYn" type="hidden" />
		<form:input path="postCateNum" type="hidden" />
		<div class="filebox">
			<form:input type="file" path="postFiles" multiple="true"
				id="postfile" />
		</div>
		<form:input class="custom-file-input" path="thumbnail" id="thumId" type="hidden" />
	</form:form>
	<div style="margin-bottom: 60px;">
		<button id="save-button">작성</button>
	</div>

</div>
<script>
	
	function attaDelBtn(el){
		el.css("display", "none");
		el.prev().css("display", "none");
		let attatchNum = el.data("attnum");
		let attatchOrder = el.data("attorder");
		
		let delNum = $("<input>").attr("name", "delAttatchNum").attr("type", "hidden").val(attatchNum);
		let delOrder = $("<input>").attr("name", "delAttatchOrder").attr("type", "hidden").val(attatchOrder);
		
		$("#postForm").append(delNum, delOrder);
	}
   
    let arrTag = new Array();
    $("#tagInput").on("keyup",function(key){      
    	if(key.keyCode==13) {
    		let tagInput = $("input[id='tagInput']").val();
    		if(tagInput==""){
    			swal("태그를 입력해주세요");
    		}else{
        		let tagleng = $("span[class='tags']").length;
            	arrTag.push("#"+tagInput);
            	$("#tagArea").append("<span class='tags' data-value ="+tagInput+" data-idx="+tagleng+">"+"#"+tagInput+"<a id='deltag' onclick='DelTag(event)' style='color:#FA5858; padding: 5px;'>x</a></span>")
            	$("input[id='tagInput']").val('');	
            	console.log("배열="+arrTag);
    		}
    		
    	}
    });
   
    
    function DelTag(event){
    	let myTarget = $(event.target);
		let targetVal = myTarget.closest("span").data('value');
		let targetIdx = myTarget.closest("span").data('idx');
    	console.log(targetVal);
    	console.log(targetIdx);
    	$("span[data-idx="+targetIdx+"]").remove();
    	arrTag.splice(targetIdx,1);
    	console.log("삭제후배열="+arrTag);
    }
    
   </script>



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
    
  let postContent = $("input[name='postContent']").val();
    
    $("#title").attr("value", $("input[name='postTitle']").val());
    $("#tag").attr("value", $("input[name='postTag']").val());
    
    let ChkPublic = $("input[name='postPublicYn']").val();
    console.log(ChkPublic);
        
    const saveButton = document.getElementById('save-button');
    const output = document.getElementById('output');
	
    let ar = [];
    saveButton.addEventListener('click', () => {
     
    	editor.save().then( savedData => {
         var formData = JSON.stringify(savedData, null, 4);
		let datas = savedData.blocks
		console.log("datas :: ",datas[0]);
		let url = "";
		for(let i=0; i<datas.length; i++){
			console.log(datas[i])
			if(datas[i].type=="image"){
				url =datas[i].data.file.url;
				console.log("파일 url 확인>> ", url);
			}
		}

   		let title = $("input[id='title']").val();
//    		let tag = $("input[id='tag']").val();
		let blind = $("input[name='blind']:checked").val();
      	let selectedVal = $("select[id='category'] option:selected").val();
		
      	
		if(title==""){
			swal({
				title : "제목을 입력해주세요.",
				icon : "error",
			});
		}else if (selectedVal==""){
			console.log(selectedVal);
			swal({
				title : "카테고리를 선택해주세요",
				icon : "error",
			});
		}else {
	   		$("input[name='postContent']").attr("value", formData);
	      	$("input[name='postTitle']").attr("value", title);
	      	$("input[name='postTag']").attr("value", arrTag.toString());
	      	$("input[name='postPublicYn").attr("value", blind);
	      	$("input[name='postCateNum").attr("value", selectedVal);
	      	$("input[name='thumbnail']").attr("value", url);
	      	console.log("마지막 들어가기전에 확인하기 파일 썸네일 >> ", $("#thumId").val());
	      	$("#postForm").submit();
		}
      })
    });
    
    </script>

