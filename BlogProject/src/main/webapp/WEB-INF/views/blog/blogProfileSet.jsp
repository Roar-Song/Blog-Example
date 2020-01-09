<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- 웹폰트 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">
<!-- 메인 CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/blog/Main.css" />
<!-- 입력요소 CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/blog/input.css" />
<!-- 버튼 CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/blog/btn.css" />
<!-- 현재 페이지 스타일 -->
<style type="text/css">
/* 요소 추가 삭제 클래스 */
.off_entity {
	display: none !important;
}
.on_entity {
	display: block !important;
}
</style>
<meta charset="UTF-8">
<title>정보수정</title>
<!-- jQuery -->
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="resources/script/jquery/jquery.slimscroll.js"></script>
<script type="text/javascript" src="resources/script/blog/Main.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	menu_set();
	setMenuContent();
	// 로그인 없이 주소로 들어오는 경우 접근 제어
	if($(".btn_top_on").html().substr(0, $(".btn_top_on").html().length - 2) == "") {
		alert("잘못된 접근입니다.");
		location.href = "blogListMain";
	}
 	
 	// 뒤로가기
 	$("#btnBack").on("click", function() {
 		history.back();
 	});
 	
 	// 메뉴 0번 클릭 - 개인정보 수정
 	$("#menu_0").on("click", function() {
 		$("#menu_no").val("0");
 		menu_set();
 		setMenuContent();
 	});
 	// 메뉴 1번 클릭 - 블로그 수정
 	$("#menu_1").on("click", function() {
 		$("#menu_no").val("1");
 		menu_set();
 		setMenuContent();
 	});
 	
 	// 메뉴 온오프 셋팅
 	function menu_set() {
		$(".menu").each(function() {
			$(this).removeClass("menu_on");
		});
		
		var menu = "#menu_"+$("#menu_no").val();
		
		$(menu).addClass("menu_on");
	}
 	
 	// 메뉴에 따른 컨텐츠 변경
 	function setMenuContent() {
 		var html = "";
 		
 		if($("#menu_no").val() == "0") {	// 0 : 개인정보 변경
 			html+="<div class=\"input_area no_drag\">                                                                                                		";
			html+="	<div class=\"subtitle_txt\">아이디</div>                                                                                               	";
			html+="</div>                                                                                                                                 	";
			html+="<div class=\"input_area\">                                                                                                              	";
			html+="	<input type=\"text\" class=\"input_normal wfull_size readonly\" readonly=\"readonly\" id=\"uid\"/>                                     	";
			html+="</div>                                                                                                                                  	";
			html+="<div class=\"input_area no_drag\">                                                                                                      	";
			html+="	<div class=\"subtitle_txt\">비밀번호 변경</div>                                                                                        		";
			html+="</div>                                                                                                                                  	";
			html+="<div class=\"input_area\">                                                                                                              	";
			html+="	<input type=\"password\" class=\"input_normal wfull_size\" name=\"pw_chg\" id=\"pw_chg\" placeholder=\"변경할 비밀번호 입력\"/>        		";
			html+="</div>                                                                                                                                  	";
			html+="<div class=\"input_area\">                                                                                                              	";
			html+="	<div class=\"subtitle_txt no_drag\">                                                                                                   	";
			html+="		선택 사항<br />                                                                                                                    	";
			html+="		<input type=\"checkbox\" class=\"chbox\" id=\"email_on\"/>                                                                         	";
        	html+="	    <label for=\"email_on\" class=\"chbox_lbl\"></label>                                                                               	";
        	html+="	    <label for=\"email_on\" class=\"lbl_txt\" id=\"email_lbl\">이메일</label>		                                                   		";
			html+="		<input type=\"checkbox\" class=\"chbox\" id=\"fb_on\"/>                                                                            	";
        	html+="	    <label for=\"fb_on\" class=\"chbox_lbl\"></label>                                                                                  	";
        	html+="	    <label for=\"fb_on\" class=\"lbl_txt\"id=\"fb_lbl\">페이스북</label>		                                                       		";
			html+="		<input type=\"checkbox\" class=\"chbox\" id=\"insta_on\"/>                                                                         	";
        	html+="	    <label for=\"insta_on\" class=\"chbox_lbl\"></label>                                                                               	";
        	html+="	    <label for=\"insta_on\" class=\"lbl_txt\" id=\"insta_lbl\">인스타그램</label>		                                               		";
			html+="		<input type=\"checkbox\" class=\"chbox\" id=\"git_on\"/>                                                                           	";
        	html+="    	<label for=\"git_on\" class=\"chbox_lbl\"></label>                                                                                 	";
       		html+="     	<label for=\"git_on\" class=\"lbl_txt\" id=\"git_lbl\">깃허브</label>		                                                   		";
			html+="	</div>                                                                                                                                 	";
			html+="</div>                                                                                                                                  	";
			html+="<div class=\"blank_area\"></div>                                                                                                        	";
			html+="<div class=\"select_area\">                                                                                                             	";
			html+="	<div class=\"email\">                                                                                                                  	";
			html+="		<div class=\"input_area email_input off_entity\">                                                                                  	";
			html+="			<input type=\"text\" name=\"user_email\" id=\"user_email\" class=\"input_normal wfull_size\" placeholder=\"이메일 주소\"/>  		";
			html+="		</div>                                                                                                                             	";
			html+="		<div class=\"validator_area vali_email\"></div>                                                                                    	";
			html+="	</div>                                                                                                                                 	";
			html+="	<div class=\"fb\">                                                                                                                     	";
			html+="		<div class=\"input_area fb_input off_entity\">                                                                                     	";
			html+="			<input type=\"text\" name=\"user_fb\" id=\"user_fb\" class=\"input_normal wfull_size\" placeholder=\"페이스북 주소\"/>      		";
			html+="		</div>                                                                                                                             	";
			html+="		<div class=\"validator_area vali_fb\"></div>                                                                                       	";
			html+="	</div>                                                                                                                                 	";
			html+="	<div class=\"insta\">                                                                                                                  	";
			html+="		<div class=\"input_area insta_input off_entity\">                                                                                  	";
			html+="			<input type=\"text\" name=\"user_insta\" id=\"user_insta\" class=\"input_normal wfull_size\" placeholder=\"인스타그램 주소\"/>		";
			html+="		</div>                                                                                                                             	";
			html+="		<div class=\"validator_area vali_insta\"></div>                                                                                    	";
			html+="	</div>                                                                                                                                 	";
			html+="	<div class=\"git\">                                                                                                                    	";
			html+="		<div class=\"input_area git_input off_entity\">                                                                                    	";
			html+="			<input type=\"text\" name=\"user_git\" id=\"user_git\" class=\"input_normal wfull_size\" placeholder=\"깃허브 주소\"/>      		";
			html+="		</div>                                                                                                                             	";
			html+="		<div class=\"validator_area vali_git\"></div>                                                                                      	";
			html+="	</div>                                                                                                                                 	";
			html+="</div>                                                                                                                                  	";
			html+="<div class=\"input_area\">                                                                                                              	";
			html+="	<div class=\"btn_blue full_50_size no_drag\" id=\"btnUpdate\">수정</div>                                                               	";
			html+="</div>                                                                                                                                  	";
			html+="<div class=\"input_area\">                                                                                                              	";
			html+="	<div class=\"btn_red full_50_size no_drag\" id=\"btnDrop\">회원탈퇴</div>                                                              	";
			html+="</div>                                                                                                                                  	";
			html+="<input type=\"hidden\" id=\"user_no\" name=\"user_no\" value=\"${sUserNo}\" />                                                          	";
			
			$("#formData").html(html);
	 		getData();
 		}
 		else if($("#menu_no").val() == "1") {	// 1: 블로그 설정 변경
 			html+=" <div class=\"input_area no_drag\">                                                                                                   ";
			html+=" <div class=\"subtitle_txt\">블로그 이름</div>                                                                                        ";
			html+=" </div>                                                                                                                               ";
			html+=" <div class=\"input_area\">                                                                                                           ";
			html+=" 	<input type=\"text\" class=\"input_normal wfull_size\" id=\"blogName\" name=\"blogName\" placeholder=\"블로그 명 입력\" />        ";                        
			html+=" </div>                                                                                                                               ";
			html+=" <div class=\"input_area no_drag\">                                                                                                   ";
			html+=" 	<div class=\"subtitle_txt\">블로그 설명</div>                                                                                    ";
			html+=" </div>                                                                                                                               ";
			html+=" <div class=\"input_area\">                                                                                                           ";
			html+=" 	<input type=\"text\" class=\"input_normal wfull_size\" name=\"blogComment\" id=\"blogComment\" placeholder=\"블로그 설명 입력\" />      ";    
			html+=" </div>                                                                                                                               ";
			html+="<div class=\"input_area\">                                                                                                              	";
			html+="	<div class=\"subtitle_txt no_drag\">                                                                                                   	";
			html+="		메뉴 설정<br />                                                                                                                    	";
			html+="		<input type=\"checkbox\" class=\"chbox\" id=\"bmenu_1\"/>                                                                         	";
        	html+="	    <label for=\"bmenu_1\" class=\"chbox_lbl\"></label>                                                                               	";
        	html+="	    <label for=\"bmenu_1\" class=\"lbl_txt\" id=\"bmenu_1_lbl\">메뉴1</label>		                                                   		";
			html+="		<input type=\"checkbox\" class=\"chbox\" id=\"bmenu_2\"/>                                                                            	";
        	html+="	    <label for=\"bmenu_2\" class=\"chbox_lbl\"></label>                                                                                  	";
        	html+="	    <label for=\"bmenu_2\" class=\"lbl_txt\"id=\"bmenu_2_lbl\">메뉴2</label>		                                                       		";
			html+="		<input type=\"checkbox\" class=\"chbox\" id=\"bmenu_3\"/>                                                                         	";
        	html+="	    <label for=\"bmenu_3\" class=\"chbox_lbl\"></label>                                                                               	";
        	html+="	    <label for=\"bmenu_3\" class=\"lbl_txt\" id=\"bmenu_3_lbl\">메뉴3</label>		                                               		";
			html+="		<input type=\"checkbox\" class=\"chbox\" id=\"bmenu_4\"/>                                                                           	";
        	html+="    	<label for=\"bmenu_4\" class=\"chbox_lbl\"></label>                                                                                 	";
       		html+="     <label for=\"bmenu_4\" class=\"lbl_txt\" id=\"bmenu_4_lbl\">메뉴4</label>		                                                   		";
			html+="		<input type=\"checkbox\" class=\"chbox\" id=\"bmenu_5\"/>                                                                         	";
        	html+="	    <label for=\"bmenu_5\" class=\"chbox_lbl\"></label>                                                                               	";
        	html+="	    <label for=\"bmenu_5\" class=\"lbl_txt\" id=\"bmenu_5_lbl\">메뉴5</label>		                                               		";
			html+="	</div>                                                                                                                                 	";
			html+="</div>                                                                                                                                  	";
			html+="<div class=\"blank_area\"></div>                                                                                                        	";
			html+="<div class=\"select_area\">                                                                                                             	";
			html+="	<div class=\"menu1\">                                                                                                                  	";
			html+="		<div class=\"input_area bmenu_1_input off_entity\">                                                                                  	";
			html+="			<input type=\"text\" name=\"user_menu1\" id=\"user_menu1\" class=\"input_normal wfull_size\" placeholder=\"메뉴1\"/>  		";
			html+="		</div>                                                                                                                             	";
			html+="	</div>                                                                                                                                 	";
			html+="	<div class=\"menu2\">                                                                                                                     	";
			html+="		<div class=\"input_area bmenu_2_input off_entity\">                                                                                     	";
			html+="			<input type=\"text\" name=\"user_menu2\" id=\"user_menu2\" class=\"input_normal wfull_size\" placeholder=\"메뉴2\"/>      		";
			html+="		</div>                                                                                                                             	";
			html+="	</div>                                                                                                                                 	";
			html+="	<div class=\"menu3\">                                                                                                                  	";
			html+="		<div class=\"input_area bmenu_3_input off_entity\">                                                                                  	";
			html+="			<input type=\"text\" name=\"user_menu3\" id=\"user_menu3\" class=\"input_normal wfull_size\" placeholder=\"메뉴3\"/>		";
			html+="		</div>                                                                                                                             	";
			html+="	</div>                                                                                                                                 	";
			html+="	<div class=\"menu4\">                                                                                                                    	";
			html+="		<div class=\"input_area bmenu_4_input off_entity\">                                                                                    	";
			html+="			<input type=\"text\" name=\"user_menu4\" id=\"user_menu4\" class=\"input_normal wfull_size\" placeholder=\"메뉴4\"/>      		";
			html+="		</div>                                                                                                                             	";
			html+="	</div>                                                                                                                                 	";
			html+="	<div class=\"menu5\">                                                                                                                  	";
			html+="		<div class=\"input_area bmenu_5_input off_entity\">                                                                                  	";
			html+="			<input type=\"text\" name=\"user_menu5\" id=\"user_menu5\" class=\"input_normal wfull_size\" placeholder=\"메뉴5\"/>		";
			html+="		</div>                                                                                                                             	";
			html+="	</div>                                                                                                                                 	";
			html+="</div>                                                                                                                                  	"; 
			html+=" <div class=\"input_area\">                                                                                                           ";   
			html+=" 	<div class=\"btn_blue full_50_size no_drag\" id=\"btnBlogUpdate\">저장</div>                                                         ";    
			html+=" </div>                                                                                                                               ";   
			html+="<input type=\"hidden\" id=\"blog_no\" name=\"blog_no\" value=\"${sUserNo}\" />                                                          	";
			html+="<input type=\"hidden\" id=\"user_no\" name=\"user_no\" value=\"${sUserNo}\" />                                                          	";
			
			$("#formData").html(html);
			getBlogData();
 		}
 		
 	}
	// 현재 사용자의 데이터 가져오기
 	function getData() {
 		var params = $("#formData").serialize();
 		
		$.ajax({
			type: "post",
			url: "blogGetInfoAjax",
			dataType: "json",
			data: params,
			success: function(result) {
				setData(result.data);
			},
			error : function(request, status, error) {
				console.log("status : " + request.status);
				console.log("text : " + request.responseTest);
				console.log("error : " + error);
			}
		});
 	}
	// 사용자 데이터 폼에 입력 및 선택사항 체크
	function setData(data) {
		setInfoEvent();
		
		$("#uid").val(data.USER_ID);
		
		if(data.USER_EMAIL != null && ($("input:checkbox[id=email_on]").is(":checked")) == false) {
			$("#email_lbl").click();
			$("#user_email").val(data.USER_EMAIL);
		}
		if(data.USER_FB_ADD != null && ($("input:checkbox[id=fb_on]").is(":checked")) == false) {
			$("#fb_lbl").click();
			$("#user_fb").val(data.USER_FB_ADD);
		}
		if(data.USER_INSTA_ADD != null && ($("input:checkbox[id=insta_on]").is(":checked")) == false) {
			$("#insta_lbl").click();
			$("#user_insta").val(data.USER_INSTA_ADD);
		}
		if(data.USER_GIT_ADD != null && ($("input:checkbox[id=git_on]").is(":checked")) == false) {
			$("#git_lbl").click();
			$("#user_git").val(data.USER_GIT_ADD);
		}
	}
	// 개인정보 수정 이벤트 할당 함수
	function setInfoEvent() {
		/* 선택항목 클릭시 요소 추가 및 제거 */
		$("label").on("click", function() {
			var chk = $("#"+$(this).attr("for")).is(":checked");
			var loc = ($(this).attr("for")).substr(0, ($(this).attr("for")).length - 3);
			if(!chk) {
				$("."+loc+"_input").removeClass("off_entity");
				$("."+loc+"_input").addClass("on_entity");
			}
			else {
				$("."+loc+"_input").removeClass("on_entity");
				$("."+loc+"_input").addClass("off_entity");
				$("."+loc+"_input>input").val(null);
			}
		});
		// 개인 정보 수정 버튼 클릭 이벤트
		$("#btnUpdate").on("click", function() {	
			if($.trim($("#pw_chg").val()) == "") {
				alert("변경 비밀번호를 입력하세요.");
				$("#pw_chg").focus();
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
			else {
				var params = $("#formData").serialize();
				
				$.ajax({
					type: "post",
					url: "blogEditInfoAjax",
					dataType: "json",
					data: params,
					success: function(result) {
						if(result.res == "SUCCESS") {
							alert("성공적으로 변경했습니다.");
							getData();
						}
						else {
							alert("변경에 실패하였습니다.");
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
		
		// 회원 탈퇴
		$('#btnDrop').on('click', function() {
			if(confirm("탈퇴 진행시 블로그의 모든 내용과 글이 삭제됩니다.\n정말로 탈퇴하시겠습니까?")) {
				var params = $("#formData").serialize();
				console.log(params);
				$.ajax({
					type: "post",
					url: "blogUserDropAjax",
					dataType: "json",
					data: params,
					success: function(result) {
						if(result.res == "SUCCESS") {
							alert("성공적으로 탈퇴했습니다.");
							location.href = "blogListMain";
						}
						else {
							alert("탈퇴에 실패하였습니다.");
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
	}
	
	// 블로그 정보 가져오기
	function getBlogData() {
		var params = $("#formData").serialize();
		
		$.ajax({
			type: "post",
			url: "blogGetPropAjax",
			dataType: "json",
			data: params,
			success: function(result) {
				if(result.data != null) {
					setBlogData(result.data);						
				}
				else {
					setPropEvent();
				}
			},
			error : function(request, status, error) {
				console.log("status : " + request.status);
				console.log("text : " + request.responseTest);
				console.log("error : " + error);
			}
		});
	}
	// 블로그 정보 Setting
	function setBlogData(data) {
		setPropEvent();
		$("#blogName").val(data.BLOG_NAME);
		$("#blogComment").val(data.PROP_COMMENT);
		
		if(data.MENU1 != null) {
			$("#bmenu_1_lbl").click();
			$("#user_menu1").val(data.MENU1);
		}
		if(data.MENU2 != null) {
			$("#bmenu_2_lbl").click();
			$("#user_menu2").val(data.MENU2);
		}
		if(data.MENU3 != null) {
			$("#bmenu_3_lbl").click();
			$("#user_menu3").val(data.MENU3);
		}
		if(data.MENU4 != null) {
			$("#bmenu_4_lbl").click();
			$("#user_menu4").val(data.MENU4);
		}
		if(data.MENU5 != null) {
			$("#bmenu_5_lbl").click();
			$("#user_menu5").val(data.MENU5);
		}
		if(data.MENU6 != null) {
			$("#bmenu_6_lbl").click();
			$("#user_menu6").val(data.MENU6);
		}
	}
	// 블로그 설정 이벤트 할당
	function setPropEvent() {
		// 선택항목 클릭시 요소 추가 및 제거
		$("label").on("click", function() {
			var chk = $("#"+$(this).attr("for")).is(":checked");
			var loc = $(this).attr("for");
			if(!chk) {
				$("."+loc+"_input").removeClass("off_entity");
				$("."+loc+"_input").addClass("on_entity");
			}
			else {
				$("."+loc+"_input").removeClass("on_entity");
				$("."+loc+"_input").addClass("off_entity");
				$("."+loc+"_input>input").val(null);
			}
		});
		
		// 버튼 클릭 설정
		$("#btnBlogUpdate").on("click", function() {	
			if($.trim($("#blogName").val()) == "") {
				alert("블로그 이름을 입력해주세요.");
				$("#blogName").focus();
			}
			else if($.trim($("#blogComment").val()) == "") {
				alert("블로그 설명을 입력하세요.");
				$("#blogComment").focus();
			}
			else if($("#bmenu_1").is(":checked") && $.trim($("#user_menu1").val()) == "") {
				alert("메뉴1 명을 입력하세요");
				$("#user_menu1").focus();
			}
			else if($("#bmenu_2").is(":checked") && $.trim($("#user_menu2").val()) == "") {
				alert("메뉴2 명을 입력하세요");
				$("#user_menu2").focus();
			}
			else if($("#bmenu_3").is(":checked") && $.trim($("#user_menu3").val()) == "") {
				alert("메뉴3 명을 입력하세요");
				$("#user_menu3").focus();
			}
			else if($("#bmenu_4").is(":checked") && $.trim($("#user_menu4").val()) == "") {
				alert("메뉴4 명을 입력하세요");
				$("#user_menu4").focus();
			}
			else if($("#bmenu_5").is(":checked") && $.trim($("#user_menu5").val()) == "") {
				alert("메뉴5 명을 입력하세요");
				$("#user_menu5").focus();
			}
			else if($("#bmenu_6").is(":checked") && $.trim($("#user_menu6").val()) == "") {
				alert("메뉴6 명을 입력하세요");
				$("#user_menu6").focus();
			}
			else {
				if(confirm("메뉴가 변동되면 관련된 글이 전부 삭제됩니다. 진행하시겠습니까?")) {	
					var params = $("#formData").serialize();
				
					$.ajax({
						type: "post",
						url: "blogEditPropAjax",
						dataType: "json",
						data: params,
						success: function(result) {
							if(result.res == "SUCCESS") {
								alert("성공적으로 변경했습니다.");
							}
							else {
								alert("변경에 실패하였습니다.");
							}
						},
						error : function(request, status, error) {
							console.log("status : " + request.status);
							console.log("text : " + request.responseTest);
							console.log("error : " + error);
						}
					});
				}
			}
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
				<img src="resources/images/blog/titleTxt/main_title.png" alt="" height="60px" id="home"/>
			</div>
		</div>
		<div class="top_right">
			<div style="margin-right: 0 !important;">
	            <div class="btn_top">
	                <span id="btnBack">back</span>
	            </div>
	            <div class="btn_top">
	                <span id="btnLogout">logout</span>
	            </div>
	            <div class="btn_top" style="font-size: 15px; font-weight: 400; color: #ffffff;">
	            	<span class="btn_top_on" style="border: 0 !important;">${sUserId} 님</span> 
	            </div>
			</div>
		</div>
	</div>
	<div class="content_wrap">
		<div class="content_left">
			<div class="profileEdit_wrap">
<form action="#" method="post" id="formData">
		
</form>
			</div>
		</div>
		<div class="content_right">
			<div class="profile_area">
				<div style="background-image: url(resources/images/blog/common/logo.png); z-index: 80; background-position: center;"></div>
			</div>
			<div class="menu_area no_drag">
				<div class="menu" id="menu_0"><div>개인정보수정</div></div>
				<div class="menu" id="menu_1"><div>블로그 설정</div></div>
				<input type="hidden" id="menu_no" value="${param.menu_no}" />
			</div>
			<div class="menu_footer"></div>
		</div>
	</div>
</div>
</body>
</html>