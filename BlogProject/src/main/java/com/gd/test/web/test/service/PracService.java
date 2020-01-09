package com.gd.test.web.test.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.test.web.test.dao.IPracDao;

@Service
public class PracService implements IPracService {
	@Autowired
	public IPracDao iPD;

	@Override
	public HashMap<String, String> checkId(HashMap<String, String> params) throws Throwable {
		return iPD.checkId(params);
	}

	@Override
	public void insertBM(HashMap<String, String> params) throws Throwable {
		iPD.insertBM(params);
	}

	@Override
	public HashMap<String, String> getBM(HashMap<String, String> params) throws Throwable {
		return iPD.getBM(params);
	}

	@Override
	public int getListCnt(HashMap<String, String> params) throws Throwable {
		return iPD.getListCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getList(HashMap<String, String> params) throws Throwable {
		return iPD.getList(params);
	}

	@Override
	public void updateHit(HashMap<String, String> params) throws Throwable {
		iPD.updateHit(params);
	}

	@Override
	public HashMap<String, String> getData(HashMap<String, String> params) throws Throwable {
		return iPD.getData(params);
	}

	@Override
	public void insertData(HashMap<String, String> params) throws Throwable {
		iPD.insertData(params);
	}

	@Override
	public void updateData(HashMap<String, String> params) throws Throwable {
		iPD.updateData(params);
	}

	@Override
	public void deleteData(HashMap<String, String> params) throws Throwable {
		iPD.deleteData(params);
	}

	@Override
	public void updateBM(HashMap<String, String> params) throws Throwable {
		iPD.updateBM(params);
	}

	@Override
	public void deleteBM(HashMap<String, String> params) throws Throwable {
		iPD.deleteBM(params);
	}
}
