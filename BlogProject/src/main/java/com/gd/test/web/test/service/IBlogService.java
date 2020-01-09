package com.gd.test.web.test.service;

import java.util.HashMap;
import java.util.List;

public interface IBlogService {

	public int idCheck(HashMap<String, String> params) throws Throwable;

	public void insertUser(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getUser(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getBlogList() throws Throwable;

	public int checkBlog(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getInfo(HashMap<String, String> params) throws Throwable;

	public void updateInfo(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getProp(HashMap<String, String> params) throws Throwable;

	public void insertProp(HashMap<String, String> params) throws Throwable;

	public void updateProp(HashMap<String, String> params) throws Throwable;

	public int getPostCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getPost(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getPostData(HashMap<String, String> params) throws Throwable;

	public void insertPost(HashMap<String, String> params) throws Throwable;

	public void updatePost(HashMap<String, String> params) throws Throwable;

	public void deletePost(HashMap<String, String> params) throws Throwable;

	public void deletePost_Menu(HashMap<String, String> params) throws Throwable;

	public void deleteUser(HashMap<String, String> params) throws Throwable;

	public int getCommCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getCommData(HashMap<String, String> params) throws Throwable;

	public void addComm(HashMap<String, String> params) throws Throwable;

	public void deleteComm(HashMap<String, String> params) throws Throwable;

}
