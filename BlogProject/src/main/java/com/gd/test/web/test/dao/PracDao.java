package com.gd.test.web.test.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PracDao implements IPracDao {
	@Autowired
	public SqlSession sqlSession;
	
	@Override
	public HashMap<String, String> checkId(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("prac.checkId", params);
	}

	@Override
	public void insertBM(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("prac.insertBM", params);
	}

	@Override
	public HashMap<String, String> getBM(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("prac.getBM", params);
	}

	@Override
	public int getListCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("prac.getListCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("prac.getList", params);
	}

	@Override
	public void updateHit(HashMap<String, String> params) throws Throwable {
		sqlSession.update("prac.updateHit", params);
	}

	@Override
	public HashMap<String, String> getData(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("prac.getData", params);
	}

	@Override
	public void insertData(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("prac.insertData", params);		
	}

	@Override
	public void updateData(HashMap<String, String> params) throws Throwable {
		sqlSession.update("prac.updateData", params);
	}

	@Override
	public void deleteData(HashMap<String, String> params) throws Throwable {
		sqlSession.update("prac.deleteData", params);
	}

	@Override
	public void updateBM(HashMap<String, String> params) throws Throwable {
		sqlSession.update("prac.updateBM", params);
	}

	@Override
	public void deleteBM(HashMap<String, String> params) throws Throwable {
		sqlSession.update("prac.deleteBM", params);
	}
	
}
