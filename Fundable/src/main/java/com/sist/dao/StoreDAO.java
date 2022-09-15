package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.StoreMapper;
import com.sist.vo.StoreVO;

@Repository
public class StoreDAO {

	@Autowired
	private StoreMapper mapper;
	
	//============= 기본
	
	
	
	// 목록 페이지
	public List<StoreVO> storeListData(Map map)
	{
		return mapper.storeListData(map);
	}
	
	
	// 카테고리 페이지
	public List<StoreVO> storeCategoryListData(Map map)
	{
		return mapper.storeCategoryListData(map);
	}
	
	
	
	
	
	// 목록 총 페이지
	public int storeTotalPage(Map map)
	{
		return mapper.storeTotalPage(map);
	}
	
	
	// 카테고리 총 페이지
	public int storeCategoryTotalPage(Map map)
	{
		return mapper.storeCategoryTotalPage(map);
	}
}
