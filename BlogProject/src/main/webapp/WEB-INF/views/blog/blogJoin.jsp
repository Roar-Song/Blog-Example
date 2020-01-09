<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 웹폰트 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">
<!-- 메인 CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/blog/Main.css" />
<!-- 입력요소 CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/blog/input.css" />

<link rel="stylesheet" type="text/css" href="resources/css/blog/btn.css" />
<!-- 현재 페이지 스타일 -->
<style type="text/css">
.btn_half_area {
	display: inline-block;
	width: 50%;
	height: 50px;
}
</style>
<meta charset="UTF-8">
<title>회원가입</title>
<!-- jQuery -->
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="resources/script/jquery/jquery.slimscroll.js"></script>
<script type="text/javascript" src="resources/script/blog/Main.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	// 선택항목 클릭시 요소 추가 및 제거 
	$("label").on("click", function() {
		var chk = $("#"+$(this).attr("for")).is(":checked");
		var loc = ($(this).attr("for")).substr(0, ($(this).attr("for")).length - 3);
		if(!chk) {
			var html = $("." + loc).html();
			switch(loc) {
			case "email":
				html += "<div class=\"input_area email_input\">";
				html += "<input type=\"text\" name=\"user_email\" id=\"user_email\" class=\"input_normal wfull_size\" placeholder=\"이메일 주소\"/>";
				html += "</div>";
				break;
			case "fb":
				html += "<div class=\"input_area fb_input\">";
				html += "<input type=\"text\" name=\"user_fb\" id=\"user_fb\" class=\"input_normal wfull_size\" placeholder=\"페이스북 주소\"/>";
				html += "</div>";
				break;
			case "insta":
				html += "<div class=\"input_area insta_input\">";
				html += "<input type=\"text\" name=\"user_insta\" id=\"user_insta\" class=\"input_normal wfull_size\" placeholder=\"인스타그램 주소\"/>";
				html += "</div>";
				break;
			case "git":
				html += "<div class=\"input_area git_input\">";
				html += "<input type=\"text\" name=\"user_git\" id=\"user_git\" class=\"input_normal wfull_size\" placeholder=\"깃허브 주소\"/>";
				html += "</div>";
				break;
			}
			$("." + loc).html(html);
		}
		else {
			$("."+loc+"_input").remove();
		}
	});
	
	// id 중복 체크
	$("#user_id").on("focusout", function() {
		$("#checkId").val("0");
		var msg = "<div class=\"validator-bubble no_drag\">";
		if($(this).val().length == 0) {
			$(".vali_id").html("");
		}
		else if($(this).val().length < 4) {
			msg += "아이디는 4글자 이상입니다.</div>";
			
			$(".vali_id").html(msg);
			vali_resize();
		}
		else {
			var params = $("#formData").serialize();
			
			$.ajax({
				type: "post",	
				url: "blogIdCheckAjax",
				dataType: "json",
				data: params,
				success: function(result) {
					if(result.cnt > 0) {
						msg += "중복된 아이디입니다.</div>";
						$(".vali_id").html(msg);
						vali_resize();
					}
					else {
						$("#checkId").val("1");
						$(".vali_id").html("");
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
	
	// 비밀번호 확인 확인 체크
	$("#user_pw1, #user_pw2").on("propertychange change keyup paste input", function() { 
		$("#checkPw").val("0");
		var msg = "<div class=\"validator-bubble no_drag\">";
        if($("#user_pw1").val() == $("#user_pw2").val()) {
        	$(".vali_pw").html("");
        	$("#checkPw").val("1");
        }
        else {
			msg += "비밀번호가 일치하지 않습니다.</div>";
			$(".vali_pw").html(msg);
			vali_resize();
        }
        if($("#user_pw1").val() == "") {
        	$(".vali_pw").html("");
            $("#user_pw2").val("");
        }
    });
	
	// 가입 버튼 클릭
	$("#btnSignUp").on("click", function() {
		if($.trim($("#user_id").val()) == "") {
			alert("아이디를 입력하세요.");
			$("#user_id").focus();
		}
		else if($.trim($("#user_pw1").val()) == "") {
			alert("비밀번호를 입력하세요.");
			$("#user_pw1").focus();
		}
		else if($("#email_on").is(":checked") && $.trim($("#user_email").val()) == "") {
			alert("이메일을 입력하세요.");
			$("#user_email").focus();
		}
		else if($("#fb_on").is(":checked") && $.trim($("#user_fb").val()) == "") {
			alert("페이스북 주소를 입력하세요.");
			$("#user_fb").focus();
		}
		else if($("#insta_on").is(":checked") && $.trim($("#user_insta").val()) == "") {
			alert("인스타그램 주소를 입력하세요.");
			$("#user_insta").focus();
		}
		else if($("#git_on").is(":checked") && $.trim($("#user_git").val()) == "") {
			alert("깃허브주소를 입력하세요.");
			$("#user_git").focus();
		}
		else if($.trim($("#checkId").val()) == "0" ) {
			alert("아이디가 유효하지 않습니다.");
			$("#user_id").focus();
		}
		else if($.trim($("#checkPw").val()) == "0" ) {
			alert("비밀번호가 유효하지 않습니다.");
			$("#user_pw1").focus();
		}
		else {
			var params = $("#formData").serialize();
			
			$.ajax({
				type: "post",
				url: "blogJoinAjax",
				dataType: "json",
				data: params,
				success: function(result) {
					if(result.res == "SUCCESS") {
						location.href = "blogListMain";
					}
					else {
						alert("가입에 실패하였습니다.");
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
	
	// 취소 버튼 클릭
	$("#btnCancel").on("click", function() {
		history.back();
	});
	
	$(".full_content").slimScroll({
 		width: "100%",
		height: "100%"
	});
	
	// validator 크기 변동
	function vali_resize() {
		$(".validator-bubble").each(function() {
			var vw = ($(this).html().length * 15) + 20;
			$(this).width(vw+"px");
		});
	}
});
</script>
</head>
<body>
<div class="wrapper">
	<div class="top_area no_drag">
		<div class="top_left">
			<div>
				<img src="resources/images/blog/titleTxt/signup_title.png" alt="" height="60px"/>
			</div>
		</div>
		<div class="top_right"></div>
	</div>
	<div class="content_wrap">
		<div class="full_content">
			<div class="full_content_title no_drag">회원가입</div>
			<div class="full_content_subtitle no_drag">
				블로그를 시작하기 전에 몇가지 정보가 필요합니다.
			</div>
			<div class="blank_area"></div>
<form action="#" method="post" id="formData">
			<div class="input_area">
				<div class="validator_area vali_id"></div>
				<input type="text" name="user_id" id="user_id" class="input_normal wfull_size" placeholder="아이디 *"/>
				<input type="hidden" id="checkId" value="0"/>
			</div>
			<div class="input_area">
				<input type="password" name="user_pw1" id="user_pw1" class="input_normal wfull_size" placeholder="비밀번호 *"/>
			</div>
			<div class="input_area">
				<div class="validator_area vali_pw"></div>
				<input type="password" name="user_pw2" id="user_pw2" class="input_normal wfull_size" placeholder="비밀번호 확인 *"/>
				<input type="hidden" id="checkPw" value="0"/>
			</div>
			<div class="input_area">
				<div class="subtitle_txt no_drag">
					선택 사항<br />
					<input type="checkbox" class="chbox" id="email_on"/>
    	            <label for="email_on" class="chbox_lbl"></label>
    	            <label for="email_on" class="lbl_txt">이메일</label>		
					<input type="checkbox" class="chbox" id="fb_on"/>
    	            <label for="fb_on" class="chbox_lbl"></label>
    	            <label for="fb_on" class="lbl_txt">페이스북</label>		
					<input type="checkbox" class="chbox" id="insta_on"/>
    	            <label for="insta_on" class="chbox_lbl"></label>
    	            <label for="insta_on" class="lbl_txt">인스타그램</label>		
					<input type="checkbox" class="chbox" id="git_on"/>
    	            <label for="git_on" class="chbox_lbl"></label>
    	            <label for="git_on" class="lbl_txt">깃허브</label>		
				</div>
			</div>
			<div class="blank_area"></div>
			<div class="select_area">
				<div class="email">
					<div class="validator_area vali_email"></div>
				</div>
				<div class="fb">
					<div class="validator_area vali_fb"></div>
				</div>
				<div class="insta">
					<div class="validator_area vali_insta"></div>
				</div>
				<div class="git">
					<div class="validator_area vali_git"></div>
				</div>
			</div>
</form>
			<div class="input_area">
				<div class="btn_half_area" style="padding-right: 10px; vertical-align: top;">
					<div class="btn_blue full_50_size" id="btnSignUp">가입</div>
				</div>
				<div class="btn_half_area" style="padding-left: 10px;">
					<div class="btn_black full_50_size" id="btnCancel">취소</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>