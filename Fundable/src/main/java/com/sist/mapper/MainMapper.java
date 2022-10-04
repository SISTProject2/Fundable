package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.StoreVO;

public interface MainMapper {

	// 문구
	@Select("SELECT * FROM store_goods2_2 WHERE sc_no=1")
	public List<StoreVO> mainStaioneryListData(Map map);
	
	// 음식
	@Select("SELECT * FROM store_goods2_2 "
			+ "WHERE sc_no=2 ORDER BY sponsor DESC")
	public List<StoreVO> mainFoodListData(Map map);
	
	
	// 출판
	@Select("SELECT * FROM store_goods2_2 "
			+ "WHERE sc_no=3 AND sponsor IS NOT NULL ORDER BY rate DESC")
	public List<StoreVO> mainBookListData(Map map);
	
	
	// 반려동물
	@Select("SELECT * FROM store_goods2_2 "
			+ "WHERE sc_no=4 ORDER BY success DESC")
	public List<StoreVO> mainPetListData(Map map);
	
	
}
