package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.*;

public interface StoreMapper {

	
	//===== 스토어 목록 페이지
	@Select("SELECT sg_no, sc_no, title, price, img, sponsor, id, num "
			+ "FROM (SELECT sg_no, sc_no, title, price, img, sponsor, id, rownum as num "
			+ "FROM (SELECT sg_no, sc_no, title, price, img, sponsor, id "
			+ "FROM store_goods2_2 WHERE sc_no=#{sc_no} ORDER BY sg_no ASC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<StoreVO> storeListData(Map map);
	
	
	
	//===== 총 페이지
	@Select("SELECT CEIL(COUNT(*)/12.0) FROM ${table_name}")
	public int storeTotalPage(Map map);
	
	
}
