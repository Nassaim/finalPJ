function makeShareTr(index, mem){
	return $("<tr>").append(
			$("<td>").addClass("receiverId").html(mem.receiverId)
			, $("<td>").html(mem.memNick)
			, $("<td>").append(
					$("<i>").addClass("dripicons-trash").attr("onClick", "shareDel($(this))")
					)
			);
}
// el.closest(".ectLi").prev(".contentLi").find(".checkContent");
function shareDel(el){
	let receiverId = el.parent().siblings(".receiverId").html();
	
	swal({
		  title: "삭제하시겠습니까?",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		})
		.then(function (willDelete){
		  if (willDelete) {
			  
			$.ajax({
			    method : 'get'
			    , url: url+"/delShare"
			    , data: {
			     	"receiverId":receiverId
			     }
			    , success: function(resp){
			    	swal({
		    			  title: "삭제되었습니다!",
		    			  icon: "success",
		    		});
			    	
			    	f_getShareList();
			
			    },
			    error: function(xhr, status, error) {
			    	swal(error);
			    }  
			 });
			
		  } else {
			  return;
		  }
	});
}


let pagingArea = document.querySelector("#pagingArea");
console.log("pagingArea", pagingArea);
pagingArea.addEventListener('click', function(event){
	let page = event.target.innerHTML;
	sharePage.value = page;
	f_getShareList();
});

function f_getShareList(){
	let shareBody = $("#shareBody");
	
 	$.ajax({
 		url : url + "/shareList"
 		, data : {
 			"postNum":"${post.postNum}"
 			, "page":sharePage.value
 		}
 		, method : "get"
 		, dataType : "json"
 		, success : function(resp, status, jqXHR) {
			let shareList = resp.dataList;
			let pagingHTMLBS = resp.pagingHTMLBS;
			let trTags = [];
			if(shareList&&shareList.length>0){
				$.each(shareList, function(index, mem){
					trTags.push(makeShareTr(index, mem));
				});
				
				pagingArea.innerHTML=pagingHTMLBS;
			}else{
				let trTag = $("<tr>").html(
								$("<td>").attr("colspan", "3")
										 .html("게시글을 공유한 회원이 없습니다.")
							);
				trTags.push(trTag);
				pagingArea.innerHTML="";
			}
			
			
			shareBody.html(trTags);
 		},  
 		error : function(jqXHR, status, error) {
 			console.log(jqXHR);
 			console.log(status);
 			console.log(error);
 		}
 	});
}

function f_share() {
	if(receiver.value==bloggerId){
		swal({
			title: "본인은 추가할 수 없습니다.",
		});
		
		return;
	}
	
	$.ajax({
		url : url + "/share"
		, data : {
			"receiverId":receiver.value
		}
		, method : "get"
		, dataType : "text"
		, success : function(resp, status, jqXHR) {
			receiver.value="";
			
			swal({
				title: "추가되었습니다!",
			});
    		
    		f_getShareList();
		},  
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});	
}