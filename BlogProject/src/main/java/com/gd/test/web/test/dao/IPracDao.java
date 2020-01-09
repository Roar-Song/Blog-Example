package com.gd.test.web.test.dao;

import java.util.HashMap;
import java.util.List;

public interface IPracDao {

	public HashMap<String, String> checkId(HashMap<String, String> params) throws Throwable;

	public void insertBM(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getBM(HashMap<String, String> params) throws Throwable;

	public int getListCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getList(HashMap<String, String> params) throws Throwable;

	public void updateHit(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getData(HashMap<String, String> params) throws Throwable;

	public void insertData(HashMap<String, String> params) throws Throwable;

	public void updateData(HashMap<String, String> params) throws Throwable;

	public void deleteData(HashMap<String, String> params) throws Throwable;

	public void updateBM(HashMap<String, String> params) throws Throwable;

	public void deleteBM(HashMap<String, String> params) throws Throwable;

}
