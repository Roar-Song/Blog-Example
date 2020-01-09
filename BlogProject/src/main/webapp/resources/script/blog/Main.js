/*
 * 		해당 파일은 공용으로 쓰이는 버튼의 기능과 공용 스타일 변경을 지정합니다.
*/
$(document).ready(function() {
	// ------------------------------------------------------------------ 공용 스타일 지정
 	// 스크롤 방지
 	/*$('html, body').css({'overflow': 'hidden', 'height': '100%'});
	$('html, body').on('scroll touchmove mousewheel', function(event) {
	  event.preventDefault();
	  event.stopPropagation();
	  return false;
	});*/
	
 	// ------------------------------------------------------------------ Login 관련
	// Login Open Button Click - 로그인 열기 버튼 클릭시 로그인 팝업 
	$("#btnLoginOpen").on("click", function() {
		$(this).addClass("btn_top_on");
		$("#login_area").css("display", "block");
		$("#login_area_close").css("display", "block");
	});
 	// close login area - 로그인 팝업 닫기
	$("#login_area_close").on("click", function() {
		if($("#login_area").css("display") == "block") {
			$("#login_area").css("display", "none");
			$("#login_area_close").css("display", "none");
			$("#btnLoginOpen").removeClass("btn_top_on");
		}
	});
	// Login Button Click - 로그인 버튼 클릭
 	$("#btnLogin").on("click", function() {
 		if($.trim($("#login_id").val())==""){
			alert("아이디를 입력하세오.");
			$("#login_id").focus();
		}
		else if($.trim($("#login_pw").val())==""){
			alert("비밀번호를 입력하세요.");
			$("#login_pw").focus();
		}
		else{
			var params = $("#loginForm").serialize();
			
			$.ajax({
				type: "post",
				url: "blogLoginAjax",
				dataType: "json",
				data: params,
				success: function(result) {
					if(result.res == "SUCCESS") {
						location.reload();
					}
					else {
						alert("로그인에 실패하였습니다.");
					}
				},
				error : function(request, status, error) {
					console.log("status : " + request.status);
					console.log("text : " + request.responseTest);
					console.log("error : " + error);
				}
			});
		}
 	});
 	// ------------------------------------------------------------------- 로그아웃
 	// logout Button Click - 로그아웃
 	$("#btnLogout").on("click", function() {
 		location.href = "blogLogout";
 	});
 	// ------------------------------------------------------------------- 개인정보 수정
 	// 정보수정 페이지 이동
 	$("#btnSetting").on("click", function() {
 		$("#menu_no").val("0");
 		$("#loginForm").attr("action", "blogProfileSet");
		$("#loginForm").submit();
 	});
 	
 	
});