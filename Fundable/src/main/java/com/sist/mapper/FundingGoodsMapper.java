package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.FundingGoodsVO;

public interface FundingGoodsMapper {
	@Select("SELECT fg_no, title, img, sponsor, TO_CHAR(open_date, 'YYYY/MM/DD') as dbday, like_count, fc_no, user_no, num "
			+ "FROM (SELECT fg_no, title, img, sponsor, open_date, like_count, fc_no, user_no, rownum as num "
			+ "FROM (SELECT fg_no, title, img, sponsor, open_date, like_count, fc_no, user_no "
			+ "FROM funding_goods2_2 WHERE open_date>SYSDATE ORDER BY ${order_by})) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<FundingGoodsVO> fundingSoonListData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/12.0) FROM funding_goods2_2 WHERE open_date>SYSDATE")
	public int fundingSoonTotalPage();
	
	@Select("SELECT COUNT(*) FROM funding_goods2_2 WHERE open_date>SYSDATE")
	public int fundingSoonCount();
	
	@Select("SELECT name FROM funding_category2_2 "
			+ "WHERE fc_no=#{fc_no}")
	public String fundingCategoryData(int fc_no);

	@Select("SELECT id FROM user2_2 "
			+ "WHERE user_no=#{user_no}")
	public String fundingIdData(int user_no);
	
	@Select("SELECT fg_no, title, img, sponsor, CEIL(close_date-SYSDATE) as leftday, now_amount, CEIL((now_amount/goal_amount)*100) as rate, fc_no, user_no, num "
			+ "FROM (SELECT fg_no, title, img, sponsor, close_date, now_amount, goal_amount, fc_no, user_no, rownum as num "
			+ "FROM (SELECT fg_no, title, img, sponsor, close_date, now_amount, goal_amount, fc_no, user_no "
			+ "FROM funding_goods2_2 WHERE open_date<SYSDATE ORDER BY ${order_by})) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<FundingGoodsVO> fundingListData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/12.0) FROM funding_goods2_2 WHERE open_date<=SYSDATE")
	public int fundingTotalPage();
	
	@Select("SELECT COUNT(*) FROM funding_goods2_2 WHERE open_date<=SYSDATE")
	public int fundingCount();
	
	@Select("SELECT fg_no, title, img, user_no, CEIL((now_amount/goal_amount)*100) as rate, fc_no, rownum "
			+ "FROM (SELECT fg_no, title, img, user_no, now_amount, goal_amount, fc_no "
			+ "FROM funding_goods2_2 WHERE open_date<SYSDATE ORDER BY CEIL(now_amount/goal_amount)*100 DESC) "
			+ "WHERE rownum <=8")
	public List<FundingGoodsVO> fundingMainPop();

	@Select("SELECT fg_no, title, img, user_no, CEIL((now_amount/goal_amount)*100) as rate, fc_no, rownum "
			+ "FROM (SELECT fg_no, title, img, user_no, now_amount, goal_amount, fc_no "
			+ "FROM funding_goods2_2 WHERE open_date<SYSDATE ORDER BY close_date-SYSDATE ASC) "
			+ "WHERE rownum <=8")
	public List<FundingGoodsVO> fundingMainFin();
	
	@Select("SELECT fg_no, title, img, user_no, fc_no, TO_CHAR(open_date, 'YYYY/MM/DD') as dbday, rownum "
			+ "FROM (SELECT fg_no, title, img, user_no, fc_no, open_date "
			+ "FROM funding_goods2_2 WHERE open_date>=SYSDATE ORDER BY open_date ASC) "
			+ "WHERE rownum <=8")
	public List<FundingGoodsVO> fundingMainSoon();
	
	@Select("SELECT fg_no, title, img, user_no, CEIL((now_amount/goal_amount)*100) as rate, TO_CHAR(open_date, 'YYYY/MM/DD') as dbday, fc_no FROM funding_goods2_2 WHERE fg_no=#{fg_no}")
	public FundingGoodsVO fundingDetailData(int fg_no);
}
