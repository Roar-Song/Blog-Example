<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- 웹폰트 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">
<!-- 메인 CSS -->
<link rel="stylesheet" type="text/css" href="../resources/css/blog/Main.css" />
<!-- 입력요소 CSS -->
<link rel="stylesheet" type="text/css" href="../resources/css/blog/input.css" />
<!-- 버튼 CSS -->
<link rel="stylesheet" type="text/css" href="../resources/css/blog/btn.css" />
<!-- 현재 페이지 스타일 -->
<style type="text/css">
/* 댓글 작성 textarea */
#comment_txt {
	width: 100%;
	height: 100%;
	border: 1px solid #AAAAAA;
	resize: none;	
}
#comment_txt:focus {
	border: 1px solid #4A86FF;
    box-shadow: none;
    outline: none;
}

</style>
<meta charset="UTF-8">
<title>블로그</title>
<!-- jQuery -->
<script type="text/javascript" src="../resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="../resources/script/jquery/jquery.slimscroll.js"></script>
<script type="text/javascript" src="../resources/script/blog/Main.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	menu_set();
	reloadPostList();
	
	// 왼쪽 content 영역 슬림 스크롤 지정
 	$(".content_left").slimScroll({
 		width: "100%",
		height: "100%"
	});
	// blogListMain 페이지로 이동
	$("#btnHome").on("click", function() {
		location.href = "../blogListMain";
	});
	
	// blogJoin 페이지로 이동
 	$("#btnSignUp").on("click", function() {
 		location.href = "../blogJoin";
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
				url: "../blogLoginAjax",
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
 		location.href = "../blogLogout";
 	});
 	// ------------------------------------------------------------------- 개인정보 수정
 	// 정보수정 페이지 이동
 	$("#btnSetting").on("click", function() {
 		$("#menu_no").val("0");
 		$("#loginForm").attr("action", "../blogProfileSet");
		$("#loginForm").submit();
 	});
 	
 	// ------------------------------------------------------------------------ Menu 관련
 	// 메뉴 정보 가져오기
 	function menu_set() {
 		var params = $("#loginForm").serialize();

		$.ajax({
			type: "post",
			url: "../blogGetPropAjax",
			dataType: "json",
			data: params,
			success: function(result) {
				setMenu(result.data);
			},
			error : function(request, status, error) {
				console.log("status : " + request.status);
				console.log("text : " + request.responseTest);
				console.log("error : " + error);
			}
		});
	}
 	// 메뉴 화면에 Setting
 	var menu_cnt = 0;
 	function setMenu(data) {
 		var html = "";
 		
 		html += "<div class=\"menu\" id=\"menu_0\"><div>ALL POST</div></div>";

 		if(data.MENU1 != null) {
 			html += "<div class=\"menu\" id=\"menu_1\"><div>" + data.MENU1 + "</div></div>";
 			menu_cnt++;
 		}
 		if(data.MENU2 != null) {
 			html += "<div class=\"menu\" id=\"menu_2\"><div>" + data.MENU2 + "</div></div>";
 			menu_cnt++;
 		}
 		if(data.MENU3 != null) {
 			html += "<div class=\"menu\" id=\"menu_3\"><div>" + data.MENU3 + "</div></div>";
 			menu_cnt++;
 		}
 		if(data.MENU4 != null) {
 			html += "<div class=\"menu\" id=\"menu_4\"><div>" + data.MENU4 + "</div></div>";
 			menu_cnt++;
 		}
 		if(data.MENU5 != null) {
 			html += "<div class=\"menu\" id=\"menu_5\"><div>" + data.MENU5 + "</div></div>";
 			menu_cnt++;
 		}
 		
 		$(".menu_area").html(html);
 		
 		$(".top_left>div").html(data.BLOG_NAME)
 		
 		menu_click();
 		menuClickEvent();
 	}
 	// 메뉴 on off 전환
 	function menu_click() {
 		$(".menu").each(function() {
			$(this).removeClass("menu_on");
		});
		
		var menu = "#menu_"+$("#menu_no").val();
		
		$(menu).addClass("menu_on");
		$("#now_menu").html($(".menu_on>div").html());
 	}
 	
 	var first_check = false; // 메뉴가 변경될때나 첫 로드일떄 해당 게시판에서 가장 최근 POST를 View에 보여줌
 	// 메뉴 클릭에 따른 히든값 변경
 	function menuClickEvent() {
 		$(".menu").on("click", function() {		
 			$("#menu_no").val($(this).attr("id").substr($(this).attr("id").length-1, $(this).attr("id").length));
 			$("#page").val("1");
 			menu_click();
 			first_check = false;
 			$("#post_no").val("");
 			reloadPostList();
 		});
 	}
 	
 	
 	// ----------------------------------------------------------------------------------------------- Post 관련
 	// Post 목록 가져오기
 	function reloadPostList() {
		var params = $("#loginForm").serialize();
		
		$.ajax({
			type: "post",	
			url: "../blogPostListAjax",	
			dataType: "json",	
			data: params,	
			success: function(result) {
				redrawPostList(result.list);
				redrawPostPaging(result.pb);
				getPostData();
			},
			error : function(request, status, error) {
				console.log("status : " + request.status);
				console.log("text : " + request.responseTest);
				console.log("error : " + error);
			}
		});
 	}
 	// Post 목록 Setting
 	function redrawPostList(list) {
		var html = "";
		
		if(list.length == 0) {
			html += "<tr class=\"list_tr\">";
			html += "<td colspan=\"2\" style=\"text-align: center\">조회된 데이터가 없습니다.</td>";
			html += "</tr>";
		}
		else {
			for(var i in list) {
				if(!first_check) {
					first_check = true;
					$("#post_no").val(list[i].POST_NO);
				}
				html += "<tr class=\"list_tr\" name=\"" + list[i].POST_NO + "\">";
				html += "<td>";
				html += list[i].POST_TITLE;
				html += "<span class=\"comment_cnt\"></span>";
				html += "</td>";
				html += "<td class=\"b_date\">"+ list[i].POST_DT + "</td>";
				html += "</tr>";
			}
		}
		
		$("tbody").html(html);
 	}
 	// Post list Paging
 	function redrawPostPaging(pb) {
		var html = "";
		// 처음
		html += "<div class=\"pre_next_btn\" name=\"1\"><img src=\"../resources/images/blog/common/first.png\" /></div>";
		// 이전
		if($("#page").val() == "1") {
			html += "<div class=\"pre_next_btn\" name=\"1\"><img src=\"../resources/images/blog/common/previus.png\" /></div>";
		}
		else {
			html += "<div class=\"pre_next_btn\" name=\"" + ($("#page").val() * 1 - 1) + "\"><img src=\"../resources/images/blog/common/previus.png\" /></div>";
		}

		var cnt = 0; // 페이지가 5보다 작으면 작은 만큼 빈공간 할당을 위함
		// 숫자
		for(var i = pb.startPcount; i <= pb.endPcount; i++) {
			if($("#page").val() == i) {
				cnt++;
				html += "<div class=\"paging_btn_select\">" + i + "</div>"
			}
			else {
				cnt++;
				html += "<div class=\"paging_btn\" name=\"" + i + "\">" + i + "</div>";
			}
		}
		for(var i = cnt; i < 5; i++) {
			html += "<div class=\"paging_btn\"></div>";
		}
		
		// 다음
		if($("#page").val() == (pb.maxPcount)) {
			html += "<div class=\"pre_next_btn\"name=\"" + pb.maxPcount + "\"><img src=\"../resources/images/blog/common/next.png\" /></div>";
		}
		else {
			html += "<div class=\"pre_next_btn\"name=\"" + ($("#page").val() * 1 + 1) + "\"><img src=\"../resources/images/blog/common/next.png\" /></div>";
		}
		// 마지막
		html += "<div class=\"pre_next_btn\" name=\"" + pb.maxPcount + "\"><img src=\"../resources/images/blog/common/last.png\" /></div>";
		
		$(".post_list_paging").html(html);
		
		// 메뉴가 눌릴때마다 바뀌면서 이벤트가 끊김 따라서 이벤트를 페이징이 바뀔때마다 새로 지정
		$(".post_list_paging").off("click"); // 이벤트가 계속 쌓여서 느려지는 현상 방지를 위함
		$(".post_list_paging").on("click", "div", function() {
			if(!isNaN($(this).attr("name") * 1)) {
				$("#page").val($(this).attr("name"));
				reloadPostList();
			}
		});
		// 항목이 눌리면 해당 Post 내용 Get & Set
		$("tbody").off("click");
		$("tbody").on("click", "tr", function() {
	 		$("#post_no").val($(this).attr("name"));
	 		getPostData();
	 	});
	}
 	// Post Data Get
 	function getPostData() {
		var params = $("#loginForm").serialize();
		
		$.ajax({
			type: "post",	
			url: "../blogGetPostAjax",	
			dataType: "json",	
			data: params,	
			success: function(result) {
				setPostData(result.data);
			},
			error : function(request, status, error) {
				console.log("status : " + request.status);
				console.log("text : " + request.responseTest);
				console.log("error : " + error);
			}
		});
 	}
 	// Post 글 정보 설정
 	function setPostData(data) {
 		if(data != null) {
 			$(".post_cate").html($("#menu_"+data.POST_CATE+">div").html());
 			$(".post_title").html(data.POST_TITLE);
 			$(".post_writer").html(data.USER_ID);
 			$(".post_datetime").html(data.POST_DT);
 			$(".post_content").html(data.POST_CON);
 			
 			$(".post_top").removeClass("post_hidden");
 			$(".comment_wrap").removeClass("post_hidden");
 		}
 		else {
 			$(".post_top").addClass("post_hidden");
 			$(".post_content").html("등록된 POST가 없습니다.");
 			$(".comment_wrap").addClass("post_hidden");
 		}
 		
 		getComm();
 	}
 	// Post 작성, 편집, 수정 호버 이벤트
 	$('.btn_img>img').hover(function() {
 		var filename = "";
 		switch($(this).attr("id")) {
 		case "postAdd":
 			filename = "post_add.svg";
 			break;
 		case "postEdit":
 			filename = "post_edit.svg";
 			break;
 		case "postDel":
 			filename = "post_del.svg";
 			break;
 		}
 		$(this).attr("src", "../resources/images/blog/common/"+filename);
 	}, function(){
 		var filename = "";
 		switch($(this).attr("id")) {
 		case "postAdd":
 			filename = "post_add_off.svg";
 			break;
 		case "postEdit":
 			filename = "post_edit_off.svg";
 			break;
 		case "postDel":
 			filename = "post_del_off.svg";
 			break;
 		}
 		$(this).attr("src", "../resources/images/blog/common/"+filename);
 	});
 	// Post 작성하기
 	$("#postAdd, #btnWrite").on("click", function() {
 		if(menu_cnt == 0) {
 			if(confirm("글을 작성하기 위해 메뉴가 필요합니다. 설정페이지로 이동하시겠습니까?")) {
				$("#menu_no").val("1");
				$("#loginForm").attr("action", "../blogProfileSet");
				$("#loginForm").submit();
			}
 		}
 		else {
 			$("#loginForm").attr("action", "../blogPostWrite");
 			$("#loginForm").submit();
 		}
 	});
 	// post 수정
 	$("#postEdit").on("click", function() {
 		$("#loginForm").attr("action", "../blogPostEdit");
 		$("#loginForm").submit();
 	});
 	// post 삭제
 	$("#postDel").on("click", function() {
 		if(confirm("삭제하실겁니까?")) {
			var params = $("#loginForm").serialize();
			
			$.ajax({
				type: "post",	
				url: "../blogPostDelAjax",	
				dataType: "json",	
				data: params,	
				success: function(result) {
					if(result.res == "SUCCESS") {
						location.reload();
					}
					else {
						alert("삭제에 실패했습니다.");
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
 	
 	
 	// ------------------------------------------------------------------------------- 댓글 관련
 	// Comment Get
 	function getComm() {
 		// 해당 Post의 댓글 가져오기
		var params = $("#loginForm").serialize();
		
		$.ajax({
			type: "post",	
			url: "../blogGetCommAjax",	
			dataType: "json",	
			data: params,	
			success: function(result) {
				// 댓글 개수
				$('.this_comment_cnt').html(result.cnt);
				// 댓글 세팅
				setComm(result.data);
			},
			error : function(request, status, error) {
				console.log("status : " + request.status);
				console.log("text : " + request.responseTest);
				console.log("error : " + error);
			}
		});
 	}
 	// Comment Set
 	function setComm(data) {
 		var html = "";
 		for(var i in data) {
 			html += "<div>";
			html += "<div class=\"comment_div\">";
			html += "<div>";
			html += "<span class=\"comment_writer\">" + data[i].USER_ID + "</span>&nbsp;&nbsp;&nbsp;";
			html += "<span class=\"comment_date\">" + data[i].COMM_DT + "</span>";
			html += "</div>";
			html += "<div class=\"comment_btn_area\">";
			// 해당 댓글이 자신의 댓글일 경우에만 수정과 삭제가 보여짐
			var sessionUNo = "<%=session.getAttribute("sUserNo") %>";

			if(sessionUNo == data[i].USER_NO) {
				//html += "<span class=\"txt_btn\" id=\"btnCommEdit\">수정</span>";
				html += "<span class=\"txt_btn btnCommDel\" id=\"" + data[i].COMM_NO +"\">삭제</span>";
			}
			html += "</div>";
			html += "</div>";
			html += "<div class=\"comment_con\"><pre>";
			html += data[i].COMM_CON;
			html += "</pre></div>";
			html += "</div>";
 		}                                                                                           
 		$(".comments").html(html);
 		$("#comment_txt").val("");
 		
 		// 삭제 버튼
 		$('.btnCommDel').on("click", function() {
 			if(confirm("정말로 삭제하시겠습니까?")) {
 	 			$("#del_comm_no").val($(this).attr("id"));
 	 		
 	 			var params = $("#loginForm").serialize();
 			
 				$.ajax({
 					type: "post",	
 					url: "../blogCommDelAjax",	
 					dataType: "json",	
 					data: params,	
 					success: function(result) {
 						console.log($("#del_comm_no"));
 						if(result.res == "SUCCESS") {
 							getComm();
 						}
 						else {
 							alert("댓글 삭제에 실패했습니다.");
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
 	// 댓글 추가 버튼 이벤트
 	$('#btnCommAdd').on("click", function() {
 		if($.trim($("#comment_txt").val()) == "") {
			alert("댓글 내용을 입력하세요.");
			$("#comment_txt").focus();
		}
		else {
			var params = $("#loginForm").serialize();
			
			$.ajax({
				type: "post",	
				url: "../blogCommAddAjax",	
				dataType: "json",	
				data: params,	
				success: function(result) {
					if(result.res == "SUCCESS") {
						getComm();
					}
					else {
						alert("댓글 등록에 실패했습니다.");
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
});
</script>
</head>
<body>
<form action="#" method="post" id="loginForm" style="height: 100%;">
<div class="wrapper">
	<div class="top_area no_drag">
		<div class="top_left">
			<div></div>
		</div>
		<div class="top_right">
			<div style="margin-right: 0 !important;">
				<div class="btn_top">
	                <span id="btnHome">home</span>
	            </div>
				<c:choose>
					<c:when test="${!empty sUserNo}">
						<c:if test="${sUserNo eq blog_no}">
	            		<div class="btn_top">
	                		<span id="btnWrite">Add Post</span>
	            		</div>
	            		</c:if>
	            		<div class="btn_top">
	                		<span id="btnLogout">logout</span>
	            		</div>
	            		<div class="btn_top" style="font-size: 15px; font-weight: 400; color: #ffffff;">
	            			<span class="btn_top_on" style="border: 0 !important;">${sUserId} 님</span> 
	            		</div>
	            		<div class="btn_top">
	                		<img src="../resources/images/blog/common/setting_icon.png" width="30px" id="btnSetting"/>
	            		</div>	
					</c:when>
					<c:otherwise>
						<div class="btn_top">
	                		<span id="btnSignUp">Sign Up</span>
	            		</div>
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
<input type="hidden" name="blog_no" id="blog_no" value="${blog_no}" />
<input type="hidden" name="post_no" id="post_no" />
<input type="hidden" name="menu_no" id="menu_no" value="0" />
<input type="hidden" name="page" id="page" value="1" />
<input type="hidden" name="del_comm_no" id="del_comm_no" />
			</div>
		</div>
	</div>
	<div class="content_wrap">
		<div class="content_left no_drag">
			<div class="post_wrap">
				<div class="post_top">
					<div class="post_cate"></div><br>
					<div class="post_title"></div>
					<div class="post_btn_area">
						<c:if test="${sUserNo eq blog_no}">
							<div class="btn_img"><img id="postAdd" src="../resources/images/blog/common/post_add_off.svg" alt="작성"/></div>
							<div class="btn_img"><img id="postEdit" src="../resources/images/blog/common/post_edit_off.svg" alt="수정"/></div>
							<div class="btn_img"><img id="postDel" src="../resources/images/blog/common/post_del_off.svg" alt="삭제"/></div>
						</c:if>
					</div>
					<div class="post_date">
						<div class="post_writer"></div>
						<span class="bar">|</span>
						<div class="post_datetime"></div>
					</div>
				</div>
				<div class="post_content"></div>
				<div class="blank_area"></div>
				<div class="post_list">
					<div class="post_list_title">
						' <span id="now_menu"></span> ' &nbsp;카테고리의 다른 글
					</div>
					<table class="post_table">
						<colgroup>
							<col width="90%" />
							<col width="10%" />
						</colgroup>
						<tbody>
							<tr class="list_tr">
								<td colspan="2" style="text-align: center">
									조회된 데이터가 없습니다.
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="post_list_paging">
					<div class="pre_next_btn"></div>
					<div class="pre_next_btn"></div>
					<div class="paging_btn"></div>
					<div class="paging_btn"></div>
					<div class="paging_btn"></div>
					<div class="paging_btn"></div>
					<div class="paging_btn"></div>
					<div class="pre_next_btn"></div>
					<div class="pre_next_btn"></div>
				</div>
				<div class="blank_area"></div>
				<div class="comment_wrap">
					<div class="comment_title">
						<span class="this_comment_cnt"></span> Comments
					</div>
					<div class="comments">
						
					</div>
					<c:if test="${!empty sUserNo}">
					<div class="comment_write">
						<div class="com_wt_left">
							<textarea id="comment_txt" name="comment_txt"></textarea>
						</div>
						<div class="com_wt_right">
							<div class="btn_black" style="width: 100%; height: 120px; line-height: 120px; font-size: 15px;" id="btnCommAdd">작성</div>
						</div>
					</div>
					</c:if>
				</div>
			</div>
		</div>
		<div class="content_right">
			<div class="profile_area">
				<div style="background-image: url(../resources/images/blog/common/logo.png); z-index: 80; background-position: center;"></div>
			</div>
			<div class="menu_area no_drag"></div>
			<div class="menu_footer"></div>
		</div>
	</div>
</div>
</form>
</body>
</html>