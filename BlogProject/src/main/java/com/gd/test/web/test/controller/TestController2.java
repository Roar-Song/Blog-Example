package com.gd.test.web.test.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gd.test.common.bean.PagingBean;
import com.gd.test.common.service.IPagingService;
import com.gd.test.util.Utils;
import com.gd.test.web.test.service.ITestService2;

@Controller
public class TestController2 {
	@Autowired
	public ITestService2 iTestService2;
	
	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping(value="/aLogin")
	public ModelAndView aLogin(ModelAndView mav) {
		mav.setViewName("test2/aLogin");
		
		return mav;
	}
	
	@RequestMapping(value="/aJoin")
	public ModelAndView aJoin(ModelAndView mav) {
		mav.setViewName("test2/aJoin");
		
		return mav;
	}
	
	@RequestMapping(value="/aIdCheckAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody	// Spring은 View를 활용하여 구현하게 되어있어 View인 것으로 인식시켜 넘어가게 하는 어노테이션
	public String aIdCheckAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int cnt = iTestService2.idCheck(params);
		modelMap.put("cnt", cnt);
		
		// writeValueAsString -> Map의 데이터를 문자열(JSON)으로 변환처리
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/aJoinAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody	// Spring은 View를 활용하여 구현하게 되어있어 View인 것으로 인식시켜 넘어가게 하는 어노테이션
	public String aJoinAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			// 비밀번호 암호화
			params.put("bmPw", Utils.encryptAES128(params.get("bmPw")));
			
			iTestService2.insertBM(params);
			modelMap.put("res", "SUCCESS");
		}
		catch(Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}
		
		// writeValueAsString -> Map의 데이터를 문자열(JSON)으로 변환처리
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/aLoginAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody	// Spring은 View를 활용하여 구현하게 되어있어 View인 것으로 인식시켜 넘어가게 하는 어노테이션
	public String aLoginAjax(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		// 비밀번호 암호화
		params.put("bmPw", Utils.encryptAES128(params.get("bmPw")));
		HashMap<String, String> data = iTestService2.getBM(params);
			
		if(data != null) {
			session.setAttribute("sBmNo", data.get("BM_NO"));
			session.setAttribute("sBmNm", data.get("BM_NM"));
			
			modelMap.put("res", "SUCCESS");
		}
		else {
			modelMap.put("res", "FAILED");			
		}

		// writeValueAsString -> Map의 데이터를 문자열(JSON)으로 변환처리
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/aList")
	public ModelAndView aList(ModelAndView mav) {
		mav.setViewName("test2/aList");
		
		return mav;
	}
	
	@RequestMapping(value="/aListAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody	// Spring은 View를 활용하여 구현하게 되어있어 View인 것으로 인식시켜 넘어가게 하는 어노테이션
	public String aListAjax(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int cnt = iTestService2.getBCnt(params);
		
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 10, 5);
		
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		
		
		List<HashMap<String, String>> list = iTestService2.getB(params);
		
		modelMap.put("list", list);
		modelMap.put("pb", pb);		
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/aLogout")
	public ModelAndView aLogout(ModelAndView mav) {
		mav.setViewName("redirect:aLogin");
		
		return mav;
	}
	
	@RequestMapping(value="/aDetail")
	public ModelAndView aDetail(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		HashMap<String, String> data = iTestService2.getData(params);
		
		mav.addObject("data", data);
		
		mav.setViewName("test2/aDetail");
		return mav;
	}
	
	@RequestMapping(value="/aDeleteAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody	// Spring은 View를 활용하여 구현하게 되어있어 View인 것으로 인식시켜 넘어가게 하는 어노테이션
	public String aDeleteAjax(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			iTestService2.deleteData(params);
			modelMap.put("res", "SUCCESS");
		}
		catch(Exception e) {
			modelMap.put("res", "FAILED");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/aWrite")
	public ModelAndView aWrite(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {		
		mav.setViewName("test2/aWrite");
		
		return mav;
	}
	
	@RequestMapping(value="/aWriteAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody	// Spring은 View를 활용하여 구현하게 되어있어 View인 것으로 인식시켜 넘어가게 하는 어노테이션
	public String aWriteAjax(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			iTestService2.insertData(params);
			modelMap.put("res", "SUCCESS");
		}
		catch(Exception e) {
			modelMap.put("res", "FAILED");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/aEdit")
	public ModelAndView aEdit(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {		
		mav.setViewName("test2/aEdit");
		HashMap<String, String> data = iTestService2.getData(params);
		mav.addObject("data", data);
		
		return mav;
	}
	
	@RequestMapping(value="/aEditAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody	// Spring은 View를 활용하여 구현하게 되어있어 View인 것으로 인식시켜 넘어가게 하는 어노테이션
	public String aEditAjax(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			iTestService2.updateData(params);
			modelMap.put("res", "SUCCESS");
		}
		catch(Exception e) {
			modelMap.put("res", "FAILED");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
}
