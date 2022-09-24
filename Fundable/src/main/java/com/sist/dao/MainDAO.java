package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.*;
import com.sist.vo.StoreVO;

@Repository
public class MainDAO {

	@Autowired
	private MainMapper mapper;
	//==
	
	
	public List<StoreVO> mainStaioneryListData(Map map)
	{
		return mapper.mainStaioneryListData(map);
	}
	
	
	public List<StoreVO> mainFoodListData(Map map)
	{
		return mapper.mainFoodListData(map);
	}
	
	public List<StoreVO> mainBookListData(Map map)
	{
		return mapper.mainBookListData(map);
	}
	
	public List<StoreVO> mainPetListData(Map map)
	{
		return mapper.mainPetListData(map);
	}
}
