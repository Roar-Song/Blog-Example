package com.gd.test.web.test.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.test.web.test.dao.IBlogDao;

@Service
public class BlogService implements IBlogService {
	@Autowired
	public IBlogDao iBD;

	@Override
	public int idCheck(HashMap<String, String> params) throws Throwable {
		return iBD.idCheck(params);
	}

	@Override
	public void insertUser(HashMap<String, String> params) throws Throwable {
		iBD.insertUser(params);
	}

	@Override
	public HashMap<String, String> getUser(HashMap<String, String> params) throws Throwable {
		return iBD.getUser(params);
	}

	@Override
	public List<HashMap<String, String>> getBlogList() throws Throwable {
		return iBD.getBlogList();
	}

	@Override
	public int checkBlog(HashMap<String, String> params) throws Throwable {
		return iBD.checkBlog(params);
	}

	@Override
	public HashMap<String, String> getInfo(HashMap<String, String> params) throws Throwable {
		return iBD.getInfo(params);
	}

	@Override
	public void updateInfo(HashMap<String, String> params) throws Throwable {
		iBD.updateInfo(params);
	}

	@Override
	public HashMap<String, String> getProp(HashMap<String, String> params) throws Throwable {
		return iBD.getProp(params);
	}

	@Override
	public void insertProp(HashMap<String, String> params) throws Throwable {
		iBD.insertProp(params);
	}

	@Override
	public void updateProp(HashMap<String, String> params) throws Throwable {
		iBD.updateProp(params);
	}

	@Override
	public int getPostCnt(HashMap<String, String> params) throws Throwable {
		return iBD.getPostCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getPost(HashMap<String, String> params) throws Throwable {
		return iBD.getPost(params);
	}

	@Override
	public HashMap<String, String> getPostData(HashMap<String, String> params) throws Throwable {
		return iBD.getPostData(params);
	}

	@Override
	public void insertPost(HashMap<String, String> params) throws Throwable {
		iBD.insertPost(params);
	}

	@Override
	public void updatePost(HashMap<String, String> params) throws Throwable {
		iBD.updatePost(params);
	}

	@Override
	public void deletePost(HashMap<String, String> params) throws Throwable {
		iBD.deletePost(params);
	}

	@Override
	public void deletePost_Menu(HashMap<String, String> params) throws Throwable {
		iBD.deletePost_Menu(params);
	}

	@Override
	public void deleteUser(HashMap<String, String> params) throws Throwable {
		iBD.deleteUser(params);
	}

	@Override
	public int getCommCnt(HashMap<String, String> params) throws Throwable {
		return iBD.getCommCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getCommData(HashMap<String, String> params) throws Throwable {
		return iBD.getCommData(params);
	}

	@Override
	public void addComm(HashMap<String, String> params) throws Throwable {
		iBD.addComm(params);
	}

	@Override
	public void deleteComm(HashMap<String, String> params) throws Throwable {
		iBD.deleteComm(params);
	}

}
