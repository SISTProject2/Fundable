package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.FundingGoodsVO;

public interface FundingGoodsMapper {
	@Select("SELECT fg_no, title, img, sponsor, TO_CHAR(open_date, 'YYYY/MM/DD') as dbday, fc_no, user_no, num "
			+ "FROM (SELECT fg_no, title, img, sponsor, open_date, fc_no, user_no, rownum as num "
			+ "FROM (SELECT fg_no, title, img, sponsor, open_date, fc_no, user_no "
			+ "FROM funding_goods2_2 WHERE open_date>SYSDATE ORDER BY open_date ASC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<FundingGoodsVO> fundingSoonListData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/12.0) FROM funding_goods2_2")
	public int fundingSoonTotalPage();
	
	@Select("SELECT name FROM funding_category2_2 "
			+ "WHERE fc_no=#{fc_no}")
	public String fundingCategoryData(int fc_no);

	@Select("SELECT id FROM user2_2 "
			+ "WHERE user_no=#{user_no}")
	public String fundingIdData(int user_no);
}
