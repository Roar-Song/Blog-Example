package com.gd.test.web.test.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gd.test.common.bean.PagingBean;
import com.gd.test.common.service.IPagingService;
import com.gd.test.web.test.service.IPracService;


@Controller
public class PracController {
	@Autowired
	public IPracService iPS;
	
	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping(value = {"/pracLogin"})
	public ModelAndView pracLogin(HttpSession session, ModelAndView mav) throws Throwable {	
		if(session.getAttribute("sBmNo") != null) {
			mav.setViewName("redirect:pracMain");
		}
		else {
			mav.setViewName("prac/pracLogin");			
		}
		
		return mav;
	}
	@RequestMapping(value = {"/pracLogins"})
	public ModelAndView pracLogins(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav) throws Throwable {		
		HashMap<String, String> data = iPS.getBM(params);
		
		if(data != null) {
			session.setAttribute("sBmNo", data.get("BM_NO"));
			session.setAttribute("sBmId", data.get("BM_ID"));
			session.setAttribute("sBmNm", data.get("BM_NM"));
			
			mav.setViewName("redirect:pracMain");
		}
		else {
			mav.setViewName("prac/pracLogins");			
		}
		
		return mav;
	}
	
	@RequestMapping(value = {"/pracJoin"})
	public ModelAndView pracJoin(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {	
		if(params.get("chk_id") == null) {
			params.put("chk_id", "off");
		}
		if(params.get("chk_id").equals("on")) {
			HashMap<String, String> data = iPS.checkId(params);
			params.put("chk_id", "false");
			if(data == null) {
				params.put("chk_id", "true");
			}	
		}
		
		mav.addObject("chk", params);	
		mav.setViewName("prac/pracJoin");
		
		return mav;
	}
	
	@RequestMapping(value = {"/pracJoins"})
	public ModelAndView pracJoins(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {	
		try {
			iPS.insertBM(params);
			mav.setViewName("redirect:pracLogin");
		} catch (Exception e) {
			e.printStackTrace();
			mav.setViewName("prac/pracJoins");
		}
		
		return mav;
	}
	
	@RequestMapping(value= "/pracMain")
	public ModelAndView pracMain(@RequestParam HashMap<String, String> params, HttpSession session,ModelAndView mav) throws Throwable{
		if(params.get("page") == null) {
			params.put("page", "1");
		}
		int cnt = iPS.getListCnt(params);
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt);
		
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iPS.getList(params);
		
		mav.addObject("list", list);
		mav.addObject("pb", pb);
		mav.addObject("page", params.get("page"));
		if(session.getAttribute("sBmNo")!= null) {
			mav.setViewName("prac/pracMain");			
		}
		else {
			mav.setViewName("redirect:pracLogin");
		}
		
		return mav;
	}
	
	@RequestMapping(value= "/pracLogout")
	public ModelAndView pracLogout(HttpSession session, ModelAndView mav) throws Throwable{
		session.invalidate();
		
		mav.setViewName("redirect:pracLogin");			
	
		return mav;
	}
	
	@RequestMapping(value = {"/pracDetail"})
	public ModelAndView pracDetail(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav) throws Throwable {
		iPS.updateHit(params);
		HashMap<String, String> data = iPS.getData(params);
		
		
		if(session.getAttribute("sBmNo")!= null) {
			mav.addObject("data", data);
			mav.setViewName("prac/pracDetail");	
		}
		else {
			mav.setViewName("redirect:pracLogin");
		}
		
		return mav;
	}
	
	@RequestMapping(value = {"/pracWrite"})
	public ModelAndView pracWrite(HttpSession session, ModelAndView mav) {
		if(session.getAttribute("sBmNo")!= null) {
			mav.setViewName("prac/pracWrite");			
		}
		else {
			mav.setViewName("redirect:pracLogin");
		}
		
		return mav;
	}
	
	@RequestMapping(value = {"/pracWrites"})
	public ModelAndView pracWrites(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		try {
			iPS.insertData(params);
			mav.setViewName("redirect:pracMain");
		} catch (Exception e) {		
			mav.setViewName("prac/pracWrites");
		}
		
		return mav;
	}
	
	@RequestMapping(value = {"/pracEdit"})
	public ModelAndView pracEdit(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav) throws Throwable {
		HashMap<String, String> data = iPS.getData(params);
		if(session.getAttribute("sBmNo")!= null) {
			mav.addObject("data", data);
			mav.setViewName("prac/pracEdit");			
		}
		else {
			mav.setViewName("redirect:pracLogin");
		}
		
		return mav;
	}
	
	@RequestMapping(value = {"/pracEdits"})
	public ModelAndView pracEdits(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		String res = "success";
		try {
			iPS.updateData(params);	
		} catch (Exception e) {
//			e.printStackTrace();
			res = "failed";
		}
		
		mav.addObject("res", res);
		mav.setViewName("prac/pracEdits");
		return mav;
	}
	
	@RequestMapping(value = {"/pracDelete"})
	public ModelAndView pracDelete(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		try {
			iPS.deleteData(params);	
			mav.setViewName("redirect:pracMain");
		} catch (Exception e) {
			e.printStackTrace();
			
			mav.setViewName("prac/pracDelete");
		}
		
		return mav;
	}
	
	@RequestMapping(value = {"/pracInfoEdit"})
	public ModelAndView pracInfoEdit(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav) throws Throwable {
		if(session.getAttribute("sBmNo")!= null) {
			mav.setViewName("prac/pracInfoEdit");		
		}
		else {
			mav.setViewName("redirect:pracLogin");
		}
			
		return mav;
	}
	@RequestMapping(value = {"/pracInfoEdits"})
	public ModelAndView pracInfoEdits(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav) throws Throwable {
		String res = "success";
		try {
			iPS.updateBM(params);
			session.setAttribute("sBmNm", params.get("nm_txt"));
		} catch (Exception e) {
			res = "failed";
		}
		
		mav.addObject("res", res);
		mav.setViewName("prac/pracInfoEdits");
		return mav;
	}
	
	@RequestMapping(value = {"/pracDeleteBM"})
	public ModelAndView pracDeleteBM(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav) throws Throwable {
		String res = "success";
		try {
			iPS.deleteBM(params);	
			session.setAttribute("sBmNo", null);
			session.setAttribute("sBmId", null);
			session.setAttribute("sBmNm", null);
		} catch (Exception e) {
			res = "failed";
		}
		
		mav.addObject("res", res);
		mav.setViewName("prac/pracDeleteBM");
		return mav;
	}
}
