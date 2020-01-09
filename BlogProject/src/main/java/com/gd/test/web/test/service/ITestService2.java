package com.gd.test.web.test.service;

import java.util.HashMap;
import java.util.List;

public interface ITestService2 {

	public int idCheck(HashMap<String, String> params) throws Throwable;

	public void insertBM(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getBM(HashMap<String, String> params) throws Throwable;

	public int getBCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getB(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getData(HashMap<String, String> params) throws Throwable;

	public void deleteData(HashMap<String, String> params) throws Throwable;

	public void insertData(HashMap<String, String> params) throws Throwable;

	public void updateData(HashMap<String, String> params) throws Throwable;

}
