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
#cate_area_close {
	display: none;
	position: absolute;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	z-index: 60;
}
</style>
<meta charset="UTF-8">
<title>Post 작성</title>
<!-- jQuery -->
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="resources/script/jquery/jquery.slimscroll.js"></script>
<script type="text/javascript" src="resources/script/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	// 로그인 없이 주소로 들어오는 경우 접근 제어
	if($("#user_no").val() == null || $("#user_no").val() == "") {
		alert("잘못된 접근입니다.");
		history.back();
	}
	$('html, body').css({'overflow': 'hidden', 'height': '100%'});
	$('html, body').on('scroll touchmove mousewheel', function(event) {
	  event.preventDefault();
	  event.stopPropagation();
	  return false;
	});
	// go home
	$("#btnHome").on("click", function() {
		location.href = "blogListMain";
	});
 	// 취소 버튼 클릭
 	$("#btnCancel").on("click", function() {
 		history.back();
 	});
 	// 등록 버튼 클릭
 	$("#btnUpdate").on("click", function() {
 		$("#post_con").val(CKEDITOR.instances['post_con'].getData());
 		
 		if($.trim($("#post_title").val()) == "") {
			alert("제목을 입력하세요.");
			$("#post_title").focus();
		}
		else if($.trim($("#post_con").val()) == "") {
			alert("내용을 입력하세요.");
			$("#post_con").focus();
		}
		else {
			$(".select_cate").removeClass("post_hidden");
			$("#cate_area_close").css("display", "block");
		}
 	});
 	// 카테고리 선택 닫기
 	$("#cate_area_close").on("click", function() {
 		$(".select_cate").addClass("post_hidden");
		$("#cate_area_close").css("display", "none");
 	});
 	// 확인 버튼 클릭
 	$("#btnSave").on("click", function() {
 		var params = $("#saveForm").serialize();
		
		$.ajax({
			type: "post",	
			url: "blogWriteAjax",	
			dataType: "json",	
			data: params,	
			success: function(result) {
					console.log(result.res);
				if(result.res == "SUCCESS") {
					location.href = "blogMain/" + $("#blog_no").val();
				}
				else {
					alert("작성에 실패했습니다.");
				}
			},
			error : function(request, status, error) {
				console.log("status : " + request.status);
				console.log("text : " + request.responseTest);
				console.log("error : " + error);
			}
		});
 	});
 	//CK 에디터 설정
 	CKEDITOR.replace("post_con", {
		resize_enabled: false,
		language: "ko",
		enterMode: "2",
		width: "100%",
		height: "470px"
	});
 	// 왼쪽 content 영역 슬림 스크롤 지정
 	$(".content_left").slimScroll({
 		width: "100%",
		height: "100%"
	});
});
</script>
</head>
<body>
<div class="wrapper">
	<div class="top_area no_drag">
		<div class="top_left">
			<div>Post 작성</div>
		</div>
		<div class="top_right">
			<div style="margin-right: 0 !important;">
				<div class="btn_top">
	                <span id="btnHome">home</span>
	            </div>
				<c:choose>
					<c:when test="${!empty sUserNo}">
	            		<div class="btn_top" style="font-size: 15px; font-weight: 400; color: #ffffff;">
	            			<span class="btn_top_on" style="border: 0 !important;">${sUserId} 님</span> 
	            		</div>
	            		<div class="btn_top">
	                		<img src="resources/images/blog/common/setting_icon.png" width="30px" id="btnSetting"/>
	            		</div>	
					</c:when>
				</c:choose>
			</div>
		</div>
	</div>
	<div id="cate_area_close"></div>
	<div class="content_wrap">
		<div class="content_left no_drag">
			<div class="write_wrap">
<form action="#" method="post" id="saveForm">
<input type="hidden" name="user_no" id="user_no" value="${sUserNo}" />
<input type="hidden" name="blog_no" id="blog_no" value="${param.blog_no}" />
<input type="hidden" name="post_no" id="post_no" />
<input type="hidden" name="menu_no" id="menu_no" value="0" />
<input type="hidden" name="page" id="page" value="1" />
				<div class="write_top">
					<input type="text" name="post_title" id="post_title" placeholder="제목" class="input_uline wfull_size" />
				</div>
				<div class="write_content">
					<textarea name="post_con" id="post_con"></textarea>
				</div>
				<div class="write_bottom">
					<div class="btn_black w60_30_size" id="btnUpdate">등록
					<div class="select_cate post_hidden">
						<div>
							<div class="sce_name">카테고리</div>
							<div class="sce_dropdown">
								<select name="cate_no" id="cate_no" class="select_normal">
									<c:if test="${ !empty menu.MENU1 }">
										<option value="1">${ menu.MENU1 }</option>
									</c:if>
									<c:if test="${ !empty menu.MENU2 }">
										<option value="2">${ menu.MENU2 }</option>
									</c:if>
									<c:if test="${ !empty menu.MENU3 }">
										<option value="3">${ menu.MENU3 }</option>
									</c:if>
									<c:if test="${ !empty menu.MENU4 }">
										<option value="4">${ menu.MENU4 }</option>
									</c:if>
									<c:if test="${ !empty menu.MENU5 }">
										<option value="5">${ menu.MENU5 }</option>
									</c:if>
								</select>
							</div>
							<div class="cate_btn_area">
								<div class="btn_blue w60_30_size" style="margin-left: 0px;" id="btnSave">확인</div>
							</div>
						</div>
					</div></div>
					<div class="btn_red w60_30_size" id="btnCancel">취소</div>
				</div>
</form>
			</div>
		</div>
		<div class="content_right">
			<div class="profile_area">
				<div style="background-image: url(resources/images/blog/common/logo.png); z-index: 80; background-position: center;"></div>
			</div>
			<div class="menu_area no_drag">
				
			</div>
			<div class="menu_footer"></div>
		</div>
	</div>
</div>
</body>
</html>