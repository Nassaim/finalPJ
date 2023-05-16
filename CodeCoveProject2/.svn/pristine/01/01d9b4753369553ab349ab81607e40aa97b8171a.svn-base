//카테고리 생성
let createForm=$("#createForm");

function create(){
	let inputData=document.querySelector('#createInput').value;
	if(inputData.length>11){
		$("#checkOk").html("11자 까지만 가능합니다.");
		return false;
	}else if(inputData.length==0){
		$("#checkOk").html("빈칸일 수 없습니다.");
		document.querySelector("#createInput").focus();
		return false;
	}else{
		createSubmit(inputData);
	}
}

//모달창 닫으면 입력된 내용 지워주기
$("#createClose").on("click",function(){
	    $("#createInput").val('');
	    $("#checkOk").html('');
	   
}); 
//input text에 움직임이 반영됐을때 다시실행
$("#createInput").change(function(){
	$("#checkOk").html('');
   });

//createFrom submit 하기
let createURL=createForm.attr("action");
let createmethod=createForm.method;

function createSubmit(inputData){
	$.ajax({
		url : createURL,
		data : {
			"inputData":inputData
		},
		method : method,
		dataType : "json",
		success : function(resp, status, jqXHR) {
		if(resp.check=="중복"){
			//swal("이미 카테고리이름이 존재합니다.");
			$("#checkOk").html("이미 카테고리이름이 존재합니다.");
			document.querySelector("#createInput").focus();
		}else if(resp.check=="누락"){
			swal("카테고리 이름이 누락되었습니다.");
		}else{
			swal("추가되었습니다.");
			location.reload(true);
		}
	},  
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}

let upbtn = $(".upbtn");

//수정 check버튼
function upOkBtn(el){
   // db처리
   var upName=$("#upName").val();
   var numTarget=el.closest('.blogCateList-cate').find(".upbtn");
   var cateNum=numTarget.data('catenum');
   
   var updateNm=[];
   updateNm.push(upName);
   updateNm.push(cateNum);
   console.log("데이터",updateNm);
   if(upName.length>11){
      swal("제목은 11자까지만 가능합니다.","");
   }else if(upName.length==0){
      swal("제목을 입력해주세요","");
   }else{
	   swal({
			  title: "수정하시겠습니까?",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then(function (willDelete){
			  if (willDelete) {
            $.ajax({
                url: upURL,
                method : 'GET',
                data: {
                   updateNm : updateNm
                },
                dataType : "json",
                success: function(result){
                   var msgCheck=result.msg
                   if(msgCheck=="카테고리가 이미 존재합니다."){
                      swal(msgCheck,"");
                      el.closest('.blogCateList-cate').find('.ri-pencil-fill').css('display', '');
                     var target = el.closest('.blogCateList-cate').find('.blogCateList-cate-name');
                     target.html(target.data('origin-name'));   
                   }else if(msgCheck=="수정되었습니다."){
                      swal(msgCheck,"");
                      el.closest('.blogCateList-cate').find('.ri-pencil-fill').css('display', '');
                     var target = el.closest('.blogCateList-cate').find('.blogCateList-cate-name');
                     target.html(upName);   
                   }else{
                	   swal(msgCheck,"");
                	   el.closest('.blogCateList-cate').find('.ri-pencil-fill').css('display', '');
                       var target = el.closest('.blogCateList-cate').find('.blogCateList-cate-name');
                       target.html(target.data('origin-name'));   
                   } 
                },
                error: function(xhr, status, error) {
                   console.log(error);
                }  
             });
		}else{
				return false;
		}
	 });
   }
}



//수정 전 x 버튼
function upCloseBtn(el){
	//el.closest('.blogCateList-cate').find('.ri-pencil-fill').css('display','block');
	el.closest('.blogCateList-cate').find('.ri-pencil-fill').css('display', '');
	var target = el.closest('.blogCateList-cate').find('.blogCateList-cate-name');
	target.html(target.data('origin-name'));
}
//제목 변경 버튼
function upBtn(el){
	el.css('display', 'none');
	console.log(el);
	var target = el.closest('.blogCateList-cate').find('.blogCateList-cate-name');
	var val = target.html();
	var html = '<input type="text" id="upName" style="width: 60%;" value="'+ val +'"/>';
	html += '<i name="i-update-ok" onclick="upOkBtn($(this))" class="ri-check-fill i-btn"></i>';
	html += '<i name="i-update-cancel" onclick="upCloseBtn($(this))" class="ri-close-fill i-btn"></i>';
	target.html(html);
	
}

//삭제 버튼
function delBtn(el){
	var numTarget=el.closest('.blogCateList-cate').find(".upbtn");
	var delNum=numTarget.data('catenum');
	 swal({
		  title: "삭제하시겠습니까? 하위 게시글까지 삭제됩니다.",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		})
		.then(function (willDelete){
		  if (willDelete) {
		   $.ajax({
			    url: delURL,
			    method : 'GET',
			    data: {
			    	"delNum" : delNum
			    },
			    dataType : "json",
			    success: function(result){
			    	swal({
		    			  title: "삭제되었습니다!",
		    			  icon: "success",
		    			});
			    	searchForm.submit();
			    	//location.reload(true);
			
			    },
			    error: function(xhr, status, error) {
			    	console.log(error);
			    }  
			 });
		  }else{
			  return false;
		  }
      });
}

//페이징처리 & 검색처리
let searchForm=$("#searchForm");
let searchUI=$("#searchUI");

//let data=searchForm.serialize();
let url=searchForm.attr("action");
let method=searchForm.method;

let body=$("#catebody");
let catePagingArea=$("#catePagingArea");


//검색
function f_search(){
	//alert("검색" +$("#inputData").val() );
	searchForm.find("input[name=searchWord]").val($("#inputData").val());
	searchForm.submit();
}


catePagingArea.on("click","a",function(event){
	let catePage=$(this).data("page");
	searchForm.find("[name=catePage]").val(catePage);
	searchForm.find("input[name=searchWord]").val($("#inputData").val());
	searchForm.submit();
});

let makeCateTr=function(index,cate){
	let aTag=$("<a>").attr("href",makeTrURL+"/cate/"+cate.cateNm);
						aTag.attr("class","ri-folder-5-fill");	
						aTag.attr("id","folder");
	let pTag=$("<p>").attr("class","blogCateList-cate-name");
					pTag.attr("data-origin-name",cate.cateNm).text(cate.cateNm);
	let iUpTag=$("<i>").attr("onclick","upBtn($(this))");
						iUpTag.addClass("ri-pencil-fill i-btn upbtn");
						iUpTag.attr("data-catenum",cate.cateNum);
	let iDeTag=$("<i>").attr("onclick","delBtn($(this))");
						iDeTag.addClass("ri-scissors-fill i-btn delbtn");
	let pFamilyTag=	$("<p>").attr("id","btnFamily");
					pFamilyTag.append(iUpTag);
					pFamilyTag.append(iDeTag);
	return $("<div>").attr("class","blogCateList-cate")
			.append(
			aTag
			,pTag
			,$("<p>").text("생성날짜"+" "+cate.cateDate)
			,pFamilyTag
			
			
	);
}


searchForm.on("submit",function(event){
	
	let data=searchForm.serialize();

	event.preventDefault();
	$.ajax({
		url : selectURL,
		data : data,
		method : method,
		dataType : "json",
		success : function(resp, status, jqXHR) {
			console.log("ck:",resp);
			console.log(resp.catePagingVO);
			let key=Object.keys(resp);
			if(key=="loginurl"){
				location.href = loginURL;
				
			}else if(key=="checkurl"){
				location.href = checkURL;
			}else{
				let catePagingVO = resp.catePagingVO;
				console.log(catePagingVO);
				let blogCateList = catePagingVO.dataList;
				let pagingHTMLBS = catePagingVO.pagingHTMLBS;
				let cateTrTags = [];
				if(blogCateList&&blogCateList.length>0){
					$.each(blogCateList, function(index, cate){
						cateTrTags.push(makeCateTr(index, cate));
						body.html(cateTrTags);
					});
					catePagingArea.html(pagingHTMLBS);
				}else{
					let cateTrTag = $("<div>").html("카테고리가 없습니다.");	
					cateTrTags.push(cateTrTag);
					catePagingArea.html("");
					body.html(cateTrTags);
				}
				
			}

		},  
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
	return false;
}).submit();