$(function() {
    // 회원 가입 시 사용자 입력값들 검증 
	var signupForm = $("#signupForm");
	var idCheckBtn = $("#idCheckBtn");
	var signupBtn = $("#signupBtn");
	var idCheckFlag = false; // 중복확인 flag
    
    // 정규표현식 활용 
    //각 입력값들의 유효성 검증을 위한 정규표현식을 변수로 선언.
    const getIdCheck = RegExp(/^[a-zA-Z0-9@.]{4,14}$/);
    // [허용문자], {최소문자길이, 최대 문자길이}
    
    const emailIdCheck = /^(([^<>()\[\]\.,;:\s@\"]+(\.[^<>()\[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i
    
    const getPwCheck = RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])/);
    
    const getNameCheck = RegExp(/^[가-힣]+$/);
    
    const getNickCheck = RegExp(/^[a-zA-Z가-힣]+$/);
    
      
    // 입력값 중 하나라도 만족하지 못한다면 회원 가입 처리를 막기 위한 논리형 변수 선언 
    let chk1 = false, chk2 = false, chk3 = false, chk4 = false;
      
    
    // 1. ID 입력값 검증 
    $('#memId').keyup(function(event) {
        // 키를 입력하고 땔 때 마다 이벤트 발생 
        if($(event.target).val() === ''){
            // 이벤트가 발생된 곳의 값이 비어있으면 발생 
            $('#idCheck').html('아이디는 필수 정보입니다.');
            // 아이디를 입력해주세요 옆에 표시됨
            
            chk1 = false;
            // 입력했다가 다시 잘못입력할 수 있으므로 모든 조건식에 넣어야함
        } 
        // 아이디 입력값 유효성 검증 (영문과 숫자로만 4~14자 허용)
       
       else if(!getIdCheck.test($(event.target).val()) && !emailIdCheck.test($(event.target).val())){
            // test함수를 통해 검증하고 싶은 값을 넣어줌
            // getIdCheck는 정규표현식이므로 검증 값을 정규표현식에 적합한지 테스트 (boolean으로 return)
            
            // 정규표현식에 어긋난다면 
            $('#idCheck').html('영문과 숫자 조합으로 4~14자 조합해주세요.');
            
            chk1 = false;
            // 입력했다가 다시 잘못입력할 수 있으므로 모든 조건식에 넣어야함
        }
        
        
        else {
            $('#idCheck').html('');
        }
        
    });
      // ID 검증 끝
      
      
      //아이디 중복확인
		idCheckBtn.on("click", function() {
			
 			var memId = $("#memId").val();
			
 			if (memId == null || memId == "") {
 			
 			 
//				alert("아이디를 입력해주세요!");

				Swal.fire({
				  icon: 'warning',
				  title: '아이디를 입력해주세요!',
				  showConfirmButton: false,
				  timer: 1500
				})
 				return false;
 			}
			
			$.ajax({
				type : "post",
				url : "/coco/idCheck",
				data : {
					memId : $("#memId").val()
				},
				success : function(res) {
					// 결과로 넘어오는 데이터가 ServiceResult인데,
					// EXIST, NOTEXIST 에 따라서
					// "사용가능한 아이디입니다 또는 이미 사용중인 아이디입니다"를 출력
					// 중복확인 시, idCheckFlag 라는 스위쳐가 발동(true로 변환)
					var text = "사용 가능한 아이디입니다!";
					if (res == "NOTEXIST") { // 아이디 사용 가능
						// alert(text);
						Swal.fire({
						  icon: 'success',
						  title: text,
						  showConfirmButton: false,
						  timer: 1500
						})
						
						$("#id").html(text).css("color", "green");
						idCheckFlag = true; // 중복확인 했다는 flag 설정
					} else { // 아이디 중복
						text = "이미 사용중인 아이디입니다!";
						Swal.fire({
						  icon: 'warning',
						  title: text,
						  showConfirmButton: false,
						  timer: 1500
						})
						// alert(text);
						$("#id").html(text);
					}
				}
			});
		});
		

        // 2. PW 입력값 검증 
      	$('#memPass').keyup(function() {
      		
            // 비밀번호 공백 확인 
            if ($(event.target).val() === ''){
              $('#passCheck').html('비밀번호를 입력해주세요.');
              chk2 = false;
              // 입력했다가 다시 잘못입력할 수 있으므로 모든 조건식에 넣어야함
            }
            // 비밀번호 유효성 검사 
            else if (!getPwCheck.test($(event.target).val()) || $(event.target).val().length < 8){
              $('#passCheck').html('비밀번호는 특수문자 포함 8자 이상입니다.');
              chk2 = false;
              // 입력했다가 다시 잘못입력할 수 있으므로 모든 조건식에 넣어야함
            }
            // 통과 
            else{
              $('#passCheck').html('');
              chk2 = true;
              // 입력값 검증 성공 표시 
            }
        });
        // PW 검증 끝
        
        // 3. PW 확인란 검증 
        $('#memPass2').keyup(function() {
            
            // 비밀번호 확인 공백 검증
            if ($(event.target).val() === ''){
              $('#doublePassCheck').html('비밀번호 확인은 필수 정보 입니다.');
              chk3 = false;
              // 입력했다가 다시 잘못입력할 수 있으므로 모든 조건식에 넣어야함
              
          // 비밀번호 확인란 유효성 검증 (일치하는지)
            } else if($(event.target).val() !== $('#memPass').val()){
                // 값들이 같지 않다면 
              $('#doublePassCheck').html('입력한 비밀번호가 일치하지 않습니다.');
              
              chk3 = false;
              // 입력했다가 다시 잘못입력할 수 있으므로 모든 조건식에 넣어야함
            }else{
              $('#doublePassCheck').html('');
              
              chk3 = true;
            }
        });
        // PW 확인 검증 끝






		// 가입시 중복체크 + 개인정보 동의

        signupBtn.on("click", function() {
			// 아이디, 비밀번호, 이름까지만 일반적인 데이터 검증
			// 개인정보 처리방침 동의를 체크했을때만 가입하기가 가능하도록
			// 중복확인 처리가 true일때 
			var memId = $("#memId").val();
			var memPass = $("#memPass").val();
			var memPass2 = $("#memPass2").val();
			var memName = $("#memName").val();
			var memAgree = $("#memAgree:checked").val();
			var agreeFlag = false; // 개인정보처리방침 동의 여부(false: x, true: o)
			
			
			// 빈칸 확인
			
			if (memPass == null || memPass == "") {

				//alert("비밀번호를 입력해주세요.");
				Swal.fire({
				  icon: 'warning',
				  title: '비밀번호를 입력해주세요!',
				  showConfirmButton: false,
				  timer: 1500
				})
				
				return false;
			}
			
			if (memPass != memPass2) {
				// alert("비밀번호와 비밀번호확인이 "+ <br> + "일치하지 않습니다.");
				Swal.fire({
				  icon: 'warning',
				  title: '비밀번호와 비밀번호확인이 <br> 일치하지 않습니다.',
				  showConfirmButton: false,
				  timer: 1500
				})
				
				return false;
			}
			

			// 개인정보 처리방침을 동의하게되면 Y값이 넘어오므로, 동의 여부는 true로 설정한다.
			if (memAgree == "Y") {
				agreeFlag = true;
			}

			// 개인정보 처리방침을 동의했습니까?
			// 아이디 중복체크를 이행하고 오셨습니까?
			// 오셨다구요? 그럼 가입하기를 진행하겠습니다.
			// 예? 안했다구요? 그럼 가입하기를 할 수 없습니다.
			if (agreeFlag) { // 개인정보 처리 방침 동의
				if (idCheckFlag) { // 아이디 중복 체크 완료
					signupForm.submit();
				} else { // 아이디 중복 체크 미완료
					//alert("아이디 중복체크를 해주세요!");
					Swal.fire({
					  icon: 'warning',
					  title: '아이디 중복체크를 해주세요!',
					  showConfirmButton: false,
					  timer: 1500
					})
				}
			} else { // 동의 X
				// alert("개인정보 동의를 체크해주세요!");
				Swal.fire({
				  icon: 'warning',
				  title: '개인정보 동의를 체크해주세요!',
				  showConfirmButton: false,
				  timer: 1500
				})
				
			}
		});
		
		
		var registerData = {};
		
		// captcha
		signupForm.submit(function() {
			var captcha = 1;
			$.ajax({
	            url: '/coco/verifyRecaptcha.do',
	            type: 'post',
	            data: {
	                recaptcha: $("#g-recaptcha-response").val()
	            },
	            success: function(data) {
	                switch (data) {
	                    case 0:
	                        console.log("자동 가입 방지 봇 통과");
	                        captcha = 0;
	                        // 회원가입 폼 보내기
	                       	registerData = {
		        				memProfile : $("#memProfile").val(),
		            			memId : $("#memId").val(),
		            			memPass : $("#memPass").val(),
		            			memName : $("#memName").val(),
		            			memNick : $("#memNick").val(),
		            			memMail : $("#memMail").val(),
		            			memHP : $("#memHP").val()
	                       	};

	                        console.log("봇통과시 아이디 확인", registerData);
	                       	
	                        $.ajax({
	                        	type : 'post',
	                        	url : '/coco/signup',
	                        	contentType : "application/json",
	                        	data : JSON.stringify(registerData),
	                        	success : function(res) {
	                        		
	                        			if (res == '0') {
		                        			console.log("회원가입 디비등록완료!!!");
	                        				location.href='/coco/login?stat=1'
	                        				// return;
	                        			}
	                        			
	                        			else {
	                        			
	                        				// alert("회원가입에 실패했습니다.다시 시도해주세요.");
            								Swal.fire({
											  icon: 'error',
											  title: '회원가입에 실패했습니다.다시 시도해주세요.',
											  showConfirmButton: false,
											  timer: 1500
											})
	                        				console.log("에러발생 ㅠ");
	                        				return;
	                        			}
	                        			
	                        		}
	                        	});
	                        
	                        break;
	                        
	                    case 1:
	                        // alert("자동 가입 방지 봇을 확인 한뒤 진행 해 주세요.");
								Swal.fire({
								  icon: 'warning',
								  title: '자동 가입 방지 봇을 확인한 뒤 <br> 진행해 주세요.',
								  showConfirmButton: false,
								  timer: 1500
								})
	                        
	                        break;
	                    default:
							Swal.fire({
							  icon: 'error',
							  title: '자동 가입 방지 봇을 실행 하던 중 오류가 발생 했습니다. [Error bot Code : ' + Number(data) + ']',
							  showConfirmButton: false,
							  timer: 1500
							})
	                        //console.log("자동 가입 방지 봇을 실행 하던 중 오류가 발생 했습니다. [Error bot Code : " + Number(data) + "]");
	                   		break;
	                }
	            }
	        });
			if(captcha != 0) {
				return false;
			}
			
		}); // captcha
		
		

// 		$("#imgFile").on("change", function(event) {
// 			var file = event.target.files[0];
// 			if (isImageFile(file)) {
// 				var reader = new FileReader();
// 				reader.onload = function(e) {
// 					$("#profileImg").attr("src", e.target.result);
// 				}
// 				reader.readAsDataURL(file);
// 			} else {
// 				alert("이미지 파일을 선택해주세요!");
// 			}
// 		});
		
		
});// end

	
// 	function isImageFile(file) {
// 		var ext = file.name.split(".").pop().toLowerCase();
// 		return ($.inArray(ext, [ "jpg", "jpeg", "gif", "png" ]) === -1) ? false
// 				: true;
// 	}
