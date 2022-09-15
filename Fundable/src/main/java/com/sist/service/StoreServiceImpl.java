package com.sist.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.StoreDAO;
import com.sist.vo.StoreVO;

@Service
public class StoreServiceImpl implements StoreService {

	@Autowired
	private StoreDAO dao;

	//=============
	
	
	//======== 목록
	@Override
	public List<StoreVO> storeListData(Map map) {
		// TODO Auto-generated method stub
		return dao.storeListData(map);
	}

	
	@Override
	public List<StoreVO> storeCategoryListData(Map map) {
		// TODO Auto-generated method stub
		return dao.storeCategoryListData(map);
	}
	
	
	
	//======= 총 페이지
	@Override
	public int storeTotalPage(Map map) {
		// TODO Auto-generated method stub
		return dao.storeTotalPage(map);
	}

	@Override
	public int storeCategoryTotalPage(Map map) {
		// TODO Auto-generated method stub
		return dao.storeCategoryTotalPage(map);
	}
	
	
	
	
	
}
