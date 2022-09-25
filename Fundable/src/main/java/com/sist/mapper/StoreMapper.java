package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.*;

public interface StoreMapper {

	
	// 목록 페이지
	@Select("SELECT sg_no, rate, title, price, img, sponsor, id, num "
			+ "FROM (SELECT sg_no, rate, title, price, img, sponsor, id, rownum as num "
			+ "FROM (SELECT sg_no, rate, title, price, img, sponsor, id "
			+ "FROM store_goods2_2, user2_2 "
			+ "WHERE store_goods2_2.user_no = user2_2.user_no)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<StoreVO> storeListData(Map map);
	
	
	// 카테고리 페이지
	@Select("SELECT sg_no, sc_no, rate, title, price, img, sponsor, id, num "
			+ "FROM (SELECT sg_no, sc_no, rate, title, price, img, sponsor, id, rownum as num "
			+ "FROM (SELECT sg_no, sc_no, rate, title, price, img, sponsor, id "
			+ "FROM store_goods2_2, user2_2 "
			+ "WHERE store_goods2_2.user_no = user2_2.user_no) "
			+ "WHERE sc_no=#{sc_no} ORDER BY ${column}) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<StoreVO> storeCategoryListData(Map map);
	
	
	
	// 목록 총 페이지
	@Select("SELECT CEIL(COUNT(*)/12.0) FROM store_goods2_2")
	public int storeTotalPage(Map map);
	
	
	// 카테고리 총 페이지
	@Select("SELECT CEIL(COUNT(*)/12.0) FROM store_goods2_2 WHERE sc_no=#{sc_no}")
	public int storeCategoryTotalPage(Map map);
	
	
	
	
	// 상세 페이지
	@Select("SELECT * FROM store_goods2_2 WHERE sg_no=#{sg_no}")
	public StoreVO storeDetailData(int sg_no);	
	
	
	// 비슷한 프로젝트
	@Select("SELECT sg_no, sc_no, rate, title, price, img, sponsor, rownum "
			+ "FROM store_goods2_2 "
			+ "WHERE REGEXP_LIKE(sc_no, #{ss}) "
			+ "AND rownum <= 4")
	public List<StoreVO> storeSimilarProject(int ss);
		
	
	
	// 조회수 증가
	@Update("UPDATE store_goods2_2 SET hit = hit+1 WHERE sg_no=#{sg_no}")
	public void hitIncrement(int sg_no);
	
	
	// 베스트 top15
	@Select("SELECT sg_no, title, price, img, sponsor, rate, user_no "
			+ "FROM (SELECT sg_no, title, price, img, sponsor, rate, user_no "
			+ "FROM store_goods2_2 ORDER BY hit DESC)")
	public List<StoreVO> storeBest(Map map);
	
	
	// 검색
	@Select("SELECT sg_no, title, price, img, sponsor, rate, user_no, num "
			+ "FROM (SELECT sg_no, title, price, img, sponsor, rate, user_no, rownum as num "
			+ "FROM (SELECT sg_no, title, price, img, sponsor, rate, user_no "
			+ "FROM store_goods2_2 WHERE title LIKE '%'||#{title}||'%')) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<StoreVO> storeFindData(Map map);
	
	
	// 검색 총 페이지
	@Select("SELECT CEIL(COUNT(*)/12.0) FROM store_goods2_2 WHERE title LIKE '%'||#{title}||'%'")
	public int storeSearchTotalPage(String title);
	
	
	
	
	
	
}
