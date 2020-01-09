package com.gd.test.web.test.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gd.test.common.bean.PagingBean;
import com.gd.test.common.service.IPagingService;
import com.gd.test.util.Utils;
import com.gd.test.web.test.service.IBlogService;


@Controller
public class BlogController {
	@Autowired
	public IBlogService iBS;
	
	@Autowired
	public IPagingService iPagingService;
	
	// 회원가입 페이지
	@RequestMapping(value = {"/blogJoin"})
	public ModelAndView blogJoin(HttpSession session, ModelAndView mav) throws Throwable {		
		mav.setViewName("blog/blogJoin");			
		return mav;
	}
	// 아이디 중복 체크
	@RequestMapping(value="/blogIdCheckAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String blogIdCheckAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int cnt = iBS.idCheck(params);
		modelMap.put("cnt", cnt);
	
		return mapper.writeValueAsString(modelMap);
	}
	// 회원가입
	@RequestMapping(value="/blogJoinAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String blogJoinAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			// 비밀번호 암호화
			params.put("user_pw1", Utils.encryptAES128(params.get("user_pw1")));
			iBS.insertUser(params);
			modelMap.put("res", "SUCCESS");
		}
		catch(Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	// 블로그 리스트 페이지
	@RequestMapping(value = {"/blogListMain"})
	public ModelAndView blogListMain(HttpSession session, ModelAndView mav) throws Throwable {		
		mav.setViewName("blog/blogListMain");			
		return mav;
	}
	
	// 로그인
	@RequestMapping(value="/blogLoginAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String blogLoginAjax(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		params.put("login_pw", Utils.encryptAES128(params.get("login_pw")));
		HashMap<String, String> data = iBS.getUser(params);
		
		if(data != null) {
			session.setAttribute("sUserNo", data.get("USER_NO"));
			session.setAttribute("sUserId", data.get("USER_ID"));
			
			modelMap.put("res", "SUCCESS");
		}
		else {
			modelMap.put("res", "FAILED");			
		}
				
		return mapper.writeValueAsString(modelMap);
	}
	
	// 로그아웃
	@RequestMapping(value = {"/blogLogout"})
	public ModelAndView blogLogout(HttpSession session, ModelAndView mav, HttpServletRequest request) throws Throwable {		
		session.invalidate();
		
		String referer = request.getHeader("Referer");
		mav.setViewName("redirect:"+referer);			
		return mav;
	}
	
	// 블로그 개인정보 수정 페이지
	@RequestMapping(value = {"/blogProfileSet"})
	public ModelAndView blogProfileSet(HttpSession session, ModelAndView mav) throws Throwable {		
		mav.setViewName("blog/blogProfileSet");			
		return mav;
	}
	
	// 블로그 리스트 가져오기
	@RequestMapping(value="/blogListAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String blogListAjax(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		List<HashMap<String, String>> data = iBS.getBlogList();
		
		modelMap.put("data", data);			
				
		return mapper.writeValueAsString(modelMap);
	}	
	
	// 블로그 생성여부 판단
	@RequestMapping(value="/blogCheckStatAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String blogCheckStatAjax(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int cnt = iBS.checkBlog(params);	
		
		if(cnt == 1) {
			modelMap.put("res", "TRUE");
		}
		else {
			modelMap.put("res", "FALSE");
		}
		
		return mapper.writeValueAsString(modelMap);
	}	
	
	// 개인 정보 가져오기
	@RequestMapping(value="/blogGetInfoAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String blogGetInfoAjax(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		HashMap<String, String> data = iBS.getInfo(params);
		modelMap.put("data", data);	
		
		return mapper.writeValueAsString(modelMap);
	}
	
	// 개인 정보 수정
	@RequestMapping(value="/blogEditInfoAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String blogEditInfoAjax(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			params.put("pw_chg", Utils.encryptAES128(params.get("pw_chg")));
			if(params.get("user_email").equals("")) {
				params.put("user_email", null);
			}
			if(params.get("user_fb").equals("")) {
				params.put("user_fb", null);
			}
			if(params.get("user_insta").equals("")) {
				params.put("user_insta", null);
			}
			if(params.get("user_git").equals("")) {
				params.put("user_git", null);
			}
			iBS.updateInfo(params);
			modelMap.put("res", "SUCCESS");	
		}
		catch(Exception e) {
			modelMap.put("res", "FAILED");	
		}
		
		return mapper.writeValueAsString(modelMap);
	}	
	
	// 블로그 정보 가져오기
	@RequestMapping(value="/blogGetPropAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String blogGetPropAjax(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		HashMap<String, String> data = iBS.getProp(params);
		modelMap.put("data", data);	
		
		return mapper.writeValueAsString(modelMap);
	}
	// 블로그 정보 수정
	@RequestMapping(value="/blogEditPropAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String blogEditPropAjax(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		String str = "";
		str = iBS.checkBlog(params) == 0 ? "INSERT" : "UPDATE";
		try {
			if(params.get("user_menu1").equals("")) {
				params.put("user_menu1", null);
			}
			if(params.get("user_menu2").equals("")) {
				params.put("user_menu2", null);
			}
			if(params.get("user_menu3").equals("")) {
				params.put("user_menu3", null);
			}
			if(params.get("user_menu4").equals("")) {
				params.put("user_menu4", null);
			}
			if(params.get("user_menu5").equals("")) {
				params.put("user_menu5", null);
			}

			if(str.equals("INSERT")) {
				iBS.insertProp(params);
			}
			else {
				iBS.updateProp(params);
			}
			
			if(params.get("user_menu1") == null || params.get("user_menu2") == null 
			|| params.get("user_menu3") == null || params.get("user_menu4") == null 
			|| params.get("user_menu5") == null) {
				iBS.deletePost_Menu(params);
			}
			
			modelMap.put("res", "SUCCESS");	
		}
		catch(Exception e) {
			modelMap.put("res", "FAILED");	
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	// 개인 블로그 페이지
	@RequestMapping(value={"/blogMain/{no}"})
	public ModelAndView blogMain(@PathVariable("no") int bNo, @RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable{
		
		mav.addObject("blog_no", bNo);
		mav.setViewName("blog/blogMain");			
		
		return mav;
	}
	
	// Post List 가져오기
	@RequestMapping(value="/blogPostListAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String blogPostListAjax(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int cnt = iBS.getPostCnt(params);
		
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 5, 5);
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iBS.getPost(params);
		
		modelMap.put("list", list);
		modelMap.put("pb", pb);	
		
		return mapper.writeValueAsString(modelMap);
	}
	
	// Post Data 가져오기
	@RequestMapping(value="/blogGetPostAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String blogGetPostAjax(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		HashMap<String, String> data = iBS.getPostData(params);
		
		modelMap.put("data", data);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	// Post 작성 페이지
	@RequestMapping(value={"/blogPostWrite"})
	public ModelAndView blogPostWrite(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable{
		
		HashMap<String, String> menu = iBS.getProp(params);
		mav.addObject("menu", menu);
		mav.setViewName("blog/blogPostWrite");			
			
		return mav;
	}
	
	// Post 작성
	@RequestMapping(value="/blogWriteAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String blogWriteAjax(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			iBS.insertPost(params);
			modelMap.put("res", "SUCCESS");
		}
		catch(Exception e) {
			modelMap.put("res", "FAILED");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	// Post 수정 페이지
	@RequestMapping(value={"/blogPostEdit"})
	public ModelAndView blogPostEdit(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable{
		HashMap<String, String> data = iBS.getPostData(params);
		mav.addObject("data", data);
		
		HashMap<String, String> menu = iBS.getProp(params);
		mav.addObject("menu", menu);
		
		mav.setViewName("blog/blogPostEdit");			
			
		return mav;
	}
	
	// Post 수정
	@RequestMapping(value="/blogPostEditAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String blogPostEditAjax(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			iBS.updatePost(params);
			modelMap.put("res", "SUCCESS");
		}
		catch(Exception e) {
			modelMap.put("res", "FAILED");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	// Post 삭제
	@RequestMapping(value="/blogPostDelAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String blogPostDelAjax(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			iBS.deletePost(params);
			modelMap.put("res", "SUCCESS");
		}
		catch(Exception e) {
			modelMap.put("res", "FAILED");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	// 회원 탈퇴
	@RequestMapping(value="/blogUserDropAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String blogUserDropAjax(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		params.put("user_no", String.valueOf(session.getAttribute("sUserNo")));
		
		try {
			iBS.deleteUser(params);
			session.invalidate();
			modelMap.put("res", "SUCCESS");
		}
		catch(Exception e) {
			modelMap.put("res", "FAILED");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	// 댓글관련
	@RequestMapping(value="/blogGetCommAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String blogGetCommAjax(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int cnt = iBS.getCommCnt(params);
		List<HashMap<String, String>> data = iBS.getCommData(params);
		
		modelMap.put("cnt", cnt);
		modelMap.put("data", data);		
		
		return mapper.writeValueAsString(modelMap);
	}
	// 댓글 작성
	@RequestMapping(value="/blogCommAddAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String blogCommAddAjax(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		params.put("user_no", String.valueOf(session.getAttribute("sUserNo")));

		try {
			iBS.addComm(params);
			modelMap.put("res", "SUCCESS");
		}
		catch(Exception e) {
			modelMap.put("res", "FAILED");
		}

		
		return mapper.writeValueAsString(modelMap);
	}
	
	// 댓글 삭제
	@RequestMapping(value="/blogCommDelAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String blogCommDelAjax(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			iBS.deleteComm(params);
			modelMap.put("res", "SUCCESS");
		}
		catch(Exception e) {
			modelMap.put("res", "FAILED");
		}
		
		
		return mapper.writeValueAsString(modelMap);
	}
		
}
