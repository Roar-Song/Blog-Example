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
</style>
<meta charset="UTF-8">
<title>블로그 리스트</title>
<!-- jQuery -->
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="resources/script/jquery/jquery.slimscroll.js"></script>
<script type="text/javascript" src="resources/script/blog/Main.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	menu_set();
 	getList();
 	
 	// 왼쪽 content 영역 슬림 스크롤 지정
 	$(".content_left").slimScroll({
 		width: "100%",
		height: "100%"
	});
	
 	// 화면 크기 변동에 따른 리스트 블록의 크기 변경
	$(window).resize(function() {
		if($("#menu_no").val() == 0) {
			var cnt = 1;
			$(".list_block").each(function() {
				var wnum = Math.floor($('.content_left').width() / 4);
				var diff = $('.content_left').width() - (wnum * 4);
				
				if(cnt % 4 != 0) {
	 				$(this).width(wnum + "px");
	 				$(this).height(wnum + "px");
				}
				else {
					$(this).width((wnum + diff) + "px");
	 				$(this).height(wnum + "px");
				}
	 		});
		}
	});
	// Sign Up Menu Click - 회원 가입 
	$("#menu_1").on("click", function() {
		location.href = "blogJoin";
	});
 	// 메뉴 온오프 셋팅
 	function menu_set() {
		$(".menu").each(function() {
			$(this).removeClass("menu_on");
		});
		
		var menu = "#menu_"+$("#menu_no").val();
		
		$(menu).addClass("menu_on");
	}
 	
 	// My 블로그 클릭 - 블로그 생성 상태 확인 후 결과에 맞게 이동
 	$("#menu_2").on("click", function() {
 		checkBlogEdit();
 	});
 	function checkBlogEdit() {
		var params = $("#loginForm").serialize();
 		
 		$.ajax({
			type: "post",
			url: "blogCheckStatAjax",
			dataType: "json",
			data: params,
			success: function(result) {
				if(result.res == "TRUE") {
					$("#blog_no").val($("#user_no").val());
					$("#loginForm").attr("action", "blogMain/" + $("#blog_no").val());
					$("#loginForm").submit();
				}
				else {
					if(confirm("블로그가 생성되지 않았습니다. 설정페이지로 이동하시겠습니까?")) {
						$("#menu_no").val("1");
						$("#loginForm").attr("action", "blogProfileSet");
						$("#loginForm").submit();
					}
				}
			},
			error : function(request, status, error) {
				console.log("status : " + request.status);
				console.log("text : " + request.responseTest);
				console.log("error : " + error);
			}
		});
 	}
 	
 	
 	// ---------------------------------------------------------------------- 블로그 리스트 관련
 	// 블로그 목록 띄우기
 	$("#menu_0").on("click", function() {
 		$("#menu_no").val("0");
 		menu_set();
 		getList();
 	});
 	// 블로그 리스트 가져오기
 	function getList() {
 		var params = $("#loginForm").serialize();
 		
 		$.ajax({
			type: "post",
			url: "blogListAjax",
			dataType: "json",
			data: params,
			success: function(result) {
				drawList(result.data);
			},
			error : function(request, status, error) {
				console.log("status : " + request.status);
				console.log("text : " + request.responseTest);
				console.log("error : " + error);
			}
		});
 	}
 	// 블로그 리스트 그리기
 	function drawList(data) {
 		var html = "";
 		
 		for(var i in data) {
 			html += "<div class=\"list_block\" id=\"" + data[i].USER_NO + "\">";
 			html += "<div>";
 			html += "<div class=\"list_title\">" + data[i].BLOG_NAME + "</div>";
 			html += "<div class=\"list_comment\">" + data[i].PROP_COMMENT + "</div>";
 			html += "</div>";
 			html += "</div>";
 		}
 		$(".content_left").html(html);
 		list_size_set();
 		list_hover();
 		list_click();
 	}
 	// 블로그 리스트 스타일 설정
 	function list_size_set() {
 		var color = ["#00b5cc", "#013243", "#19b5fe", "#1e8bc3", "#1f3a93", "#22313f", "#22a7f0", 
 					 "#2574a9", "#2c3e50", "#2c82c9", "#336e7b", "#34495e", "#3498db", "#3a539b",
 					 "#4183d7", "#446cb3", "#4b77be", "#4d05e8", "#4d13d1", "#52b3d9", "#5333ed",
 					 "#59abe3", "#5c97bf", "#6bb9f0", "#81cfe0", "#89c4f4", "#c5eff7", "#e4f1fe"];
 		
 		$(".list_block").each(function() {
 			$(this).height($(this).width());
 			$(this).width($(this).height());
 			
 			var colorSet = Math.floor(Math.random() * color.length);
 			
 			$(this).css("background-color", color[colorSet]);
 		});
 		
 		$(".list_block>div").each(function() {
 			$(this).addClass("list_text_area");
 		});
 	}
 	// 블로그 리스트 호버 이벤트 추가
 	function list_hover() {
 		$(".list_block").each(function() {	
 			$(this).hover(function() {
 				$(this).children(".list_text_area").animate({
	 			  	height: "120px",
 				}, 300);
 			},
 			
 			function() {
 				$(this).children(".list_text_area").animate({
	 			  	height: "60px",
 				}, 300, function() {
 					$(this).clearQueue();
 				});
 			});
 		});
 	}
 	// 블로그 클릭 이벤트 추가
 	function list_click() {
 		$(".content_left").on("click", ".list_block", function() {
 			$("#blog_no").val($(this).attr("id"));
			$("#loginForm").attr("action", "blogMain/" + $("#blog_no").val());
			$("#loginForm").submit();
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
<form action="#" method="post" id="loginForm">
				<c:choose>
					<c:when test="${!empty sUserNo}">
	            		<div class="btn_top">
	                		<span id="btnLogout">logout</span>
	            		</div>
	            		<div class="btn_top" style="font-size: 15px; font-weight: 400; color: #ffffff;">
	            			<span class="btn_top_on" style="border: 0 !important;">${sUserId} 님</span> 
	            		</div>
	            		<div class="btn_top">
	                		<img src="resources/images/blog/common/setting_icon.png" width="30px" id="btnSetting"/>
	            		</div>	
					</c:when>
					<c:otherwise>
						<div class="btn_top">
	                		<span id="btnLoginOpen">login</span>
	                		<div id="login_area_close"></div>
	                		<div id="login_area">
	                			<input type="text" id="login_id" name="login_id" class="input_small wfull_size" style="margin-bottom: 10px;" placeholder="아이디" />
	                			<input type="password" id="login_pw" name="login_pw" class="input_small wfull_size" style="margin-bottom: 10px;" placeholder="비밀번호" />
	                			<div class="btn_blue full_30_size" style="font-size: 15px;" id="btnLogin">로그인</div>
	                		</div>
	            		</div>
					</c:otherwise>
				</c:choose>
<input type="hidden" name="user_no" id="user_no" value="${sUserNo}" />
<input type="hidden" name="blog_no" id="blog_no" />
<input type="hidden" name="menu_no" id="menu_no" value="0" />
</form>
			</div>
		</div>
	</div>
	<div class="content_wrap">
		<div class="content_left no_drag">
		</div>
		<div class="content_right">
			<div class="profile_area">
				<div style="background-image: url(resources/images/blog/common/logo.png); z-index: 80; background-position: center;"></div>
			</div>
			<div class="menu_area no_drag">
				<div class="menu" id="menu_0"><div>HOME</div></div>
				<c:if test="${empty sUserNo}">
					<div class="menu" id="menu_1"><div>SIGN UP</div></div>
				</c:if>
				<c:if test="${!empty sUserNo}">
					<div class="menu" id="menu_2"><div>MY BLOG</div></div>
				</c:if>
			</div>
			<div class="menu_footer"></div>
		</div>
	</div>
</div>
</body>
</html>