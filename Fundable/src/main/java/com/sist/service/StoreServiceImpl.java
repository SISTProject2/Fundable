package com.sist.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.sist.dao.StoreDAO;
import com.sist.vo.StoreVO;

public class StoreServiceImpl implements StoreService {

	@Autowired
	private StoreDAO dao;

	//=============
	
	
	
	@Override
	public List<StoreVO> storeListData(Map map) {
		// TODO Auto-generated method stub
		return dao.storeListData(map);
	}

	@Override
	public int storeTotalPage(Map map) {
		// TODO Auto-generated method stub
		return dao.storeTotalPage(map);
	}
	
	
	
	
	
}
