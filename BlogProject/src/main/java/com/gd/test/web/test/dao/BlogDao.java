package com.gd.test.web.test.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BlogDao implements IBlogDao {
	@Autowired
	public SqlSession sqlSession;

	@Override
	public int idCheck(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("blog.idCheck", params);
	}

	@Override
	public void insertUser(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("blog.insertUser", params);
	}

	@Override
	public HashMap<String, String> getUser(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("blog.getUser", params);
	}

	@Override
	public List<HashMap<String, String>> getBlogList() throws Throwable {
		return sqlSession.selectList("blog.getBlogList");
	}

	@Override
	public int checkBlog(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("blog.checkBlog", params);
	}

	@Override
	public HashMap<String, String> getInfo(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("blog.getInfo", params);
	}

	@Override
	public void updateInfo(HashMap<String, String> params) throws Throwable {
		sqlSession.update("blog.updateInfo", params);
	}

	@Override
	public HashMap<String, String> getProp(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("blog.getProp", params);
	}

	@Override
	public void insertProp(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("blog.insertProp", params);
		sqlSession.update("blog.updateBE", params);
	}

	@Override
	public void updateProp(HashMap<String, String> params) throws Throwable {
		sqlSession.update("blog.updateProp", params);
	}

	@Override
	public int getPostCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("blog.getPostCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getPost(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("blog.getPost", params);
	}

	@Override
	public HashMap<String, String> getPostData(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("blog.getPostData", params);
	}

	@Override
	public void insertPost(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("blog.insertPost", params);
	}

	@Override
	public void updatePost(HashMap<String, String> params) throws Throwable {
		sqlSession.update("blog.updatePost", params);
	}

	@Override
	public void deletePost(HashMap<String, String> params) throws Throwable {
		sqlSession.update("blog.deletePost", params);
	}

	@Override
	public void deletePost_Menu(HashMap<String, String> params) throws Throwable {
		sqlSession.update("blog.deletePost_Menu", params);
	}

	@Override
	public void deleteUser(HashMap<String, String> params) throws Throwable {
		sqlSession.update("blog.deleteUser", params);
	}

	@Override
	public int getCommCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("blog.getCommCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getCommData(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("blog.getCommData", params);
	}

	@Override
	public void addComm(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("blog.addComm", params);
	}

	@Override
	public void deleteComm(HashMap<String, String> params) throws Throwable {
		sqlSession.update("blog.deleteComm", params);
	}

}
