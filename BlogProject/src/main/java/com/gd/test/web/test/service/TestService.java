package com.gd.test.web.test.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.test.web.test.dao.ITestDao;

@Service
public class TestService implements ITestService {
	@Autowired
	public ITestDao iTestDao;

	@Override
	public List<HashMap<String, String>> getList(HashMap<String, String> params) throws Throwable {
		return iTestDao.getList(params);
	}

	@Override
	public int getListCnt(HashMap<String, String> params) throws Throwable {
		return iTestDao.getListCnt(params);
	}

	@Override
	public HashMap<String, String> getData(HashMap<String, String> params) throws Throwable {
		return iTestDao.getData(params);
	}

	@Override
	public void updateHit(HashMap<String, String> params) throws Throwable {
		iTestDao.updateHit(params);
	}

	@Override
	public void insertData(HashMap<String, String> params) throws Throwable {
		iTestDao.insertData(params);
	}

	@Override
	public void updateData(HashMap<String, String> params) throws Throwable {
		iTestDao.updateData(params);
	}

	@Override
	public void deleteData(HashMap<String, String> params) throws Throwable {
		iTestDao.deleteData(params);
		
	}

	@Override
	public HashMap<String, String> checkId(HashMap<String, String> params) throws Throwable {
		return iTestDao.checkId(params);
	}

	@Override
	public void insertMem(HashMap<String, String> params) throws Throwable {
		iTestDao.insertMem(params);
	}

	@Override
	public HashMap<String, String> getMem(HashMap<String, String> params) throws Throwable {
		return iTestDao.getMem(params);
	}

}
