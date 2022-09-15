package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.*;

public interface StoreMapper {

	
	//===== 목록 페이지
	@Select("SELECT sg_no, rate, title, price, img, sponsor, user_no, num "
			+ "FROM (SELECT sg_no, rate, title, price, img, sponsor, user_no, rownum as num "
			+ "FROM (SELECT sg_no, rate, title, price, img, sponsor, user_no "
			+ "FROM store_goods2_2 ORDER BY	${column} )) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<StoreVO> storeListData(Map map);
	
	
	//===== 카테고리 페이지
	@Select("SELECT sg_no, sc_no, rate, title, price, img, sponsor, user_no, num "
			+ "FROM (SELECT sg_no, sc_no, rate, title, price, img, sponsor, user_no, rownum as num "
			+ "FROM (SELECT sg_no, sc_no, rate, title, price, img, sponsor, user_no "
			+ "FROM store_goods2_2 WHERE sc_no=#{sc_no} ORDER BY ${column} )) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<StoreVO> storeCategoryListData(Map map);
	
	
	
	//===== 목록 총 페이지
	@Select("SELECT CEIL(COUNT(*)/12.0) FROM store_goods2_2")
	public int storeTotalPage(Map map);
	
	
	//===== 카테고리 총 페이지
	@Select("SELECT CEIL(COUNT(*)/12.0) FROM store_goods2_2")
	public int storeCategoryTotalPage(Map map);
	
	
}
