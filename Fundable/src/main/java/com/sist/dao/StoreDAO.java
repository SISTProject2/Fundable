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
	
	
	
	// 스토어 목록 페이지
	public List<StoreVO> storeListData(Map map)
	{
		return mapper.storeListData(map);
	}
	
	
	
	// 총 페이지
	public int storeTotalPage(Map map)
	{
		return mapper.storeTotalPage(map);
	}
}
