
//전체선택
const postCheck=function(){
	$("#CheckAll").click(function(){
		if($("#CheckAll").prop("checked")){
			$("input[name='check']").prop("checked", true);
		}else{
			$("input[name='check']").prop("checked", false);
		}
	});
	$("input[name='check']").click(function() {
    	var total = $("input[name=check]").length;
		var checked = $("input[name=check]:checked").length;
		if(total != checked) $("#CheckAll").prop("checked", false);
		else $("#CheckAll").prop("checked", true); 
    });
} 

function postDeleteClick(){
	 var totalCheck = $("input:checked[Name='check']").is(":checked")
	 if(!totalCheck){
		 swal("삭제 할 게시글을 선택해주세요");
	  	 return false;
	   }else{
		 swal({
			  title: "삭제하시겠습니까?",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then(function (willDelete){
			  if (willDelete) {
				var postBoxArr=[];
				$("input:checkbox[name='check']:checked").each(function() {
					postBoxArr.push($(this).val());
				})
				$.ajax({
					method : 'GET',
				    url: delURL,
				    data: {
				    	postBoxArr : postBoxArr
				    },
				    dataType : "text",
				    success: function(resp){
				    	swal({
			    			  title: "삭제완료!",
			    			  icon: "success",
			    		});
				    	searchForm.submit();
				
				    },
				    error: function(xhr, status, error) {
				    	swal(error);
				    }  
				 });
				
			  } else {
				  return false;
			  }
		});
  }
}