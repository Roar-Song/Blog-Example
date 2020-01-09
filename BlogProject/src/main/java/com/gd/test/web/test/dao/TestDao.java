package com.gd.test.web.test.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TestDao implements ITestDao {
	@Autowired
	public SqlSession sqlSession;

	@Override
	public List<HashMap<String, String>> getList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("test.getList", params);
	}

	@Override
	public int getListCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("test.getListCnt", params);
	}

	@Override
	public HashMap<String, String> getData(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("test.getData", params);
	}

	@Override
	public void updateHit(HashMap<String, String> params) throws Throwable {
		sqlSession.update("test.updateHit", params);
	}

	@Override
	public void insertData(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("test.insertData", params);
	}

	@Override
	public void updateData(HashMap<String, String> params) throws Throwable {
		sqlSession.update("test.updateData", params);
	}

	@Override
	public void deleteData(HashMap<String, String> params) throws Throwable {
		sqlSession.delete("test.deleteData", params);
		
	}

	@Override
	public HashMap<String, String> checkId(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("test.checkId", params);
	}

	@Override
	public void insertMem(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("test.insertMem", params);
	}

	@Override
	public HashMap<String, String> getMem(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("test.getMem", params);
	}
}
