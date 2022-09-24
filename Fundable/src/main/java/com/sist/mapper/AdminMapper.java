package com.sist.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.*;
import com.sist.vo.*;

public interface AdminMapper {

	
	//================ 유저
	
	// 유저 찾기
	@Select("SELECT user_no, id, pwd, admin, name, email, tel, bday, card_number, card_date, card_pwd, zipcode, addr, addr_detail, num "
			+ "FROM (SELECT user_no, id, pwd, admin, name, email, tel, bday, card_number, card_date, card_pwd, zipcode, addr, addr_detail, rownum as num "
			+ "FROM (SELECT user_no, id, pwd, admin, name, email, tel, bday, card_number, card_date, card_pwd, zipcode, addr, addr_detail "
			+ "FROM user2_2 WHERE id LIKE '%'||#{id}||'%')) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<UserVO> userFindData(Map map);
	
	
	
	// 유저 찾기 전체 페이지
	@Select("SELECT CEIL(COUNT(*)/12.0) FROM user2_2")
	public int userFindTotalPage(String ss);
	
	
	
	
	// 유저 수정 폼
	@Select("SELECT * FROM user2_2 WHERE user_no=#{user_no}")
	public UserVO userUpdateForm(int user_no);
	
	
	// 유저 수정 처리
	@Update("UPDATE user2_2 SET "
			+ "user_no=#{user_no}, id=#{id}, pwd=#{pwd}, "
			+ "admin=#{admin}, name=#{name}, email=#{email}, "
			+ "tel=#{tel}, bday=#{bday}, card_number=#{card_number}, "
			+ "card_date=#{card_date}, card_pwd=#{card_pwd}, zipcode=#{zipcode}, "
			+ "addr=#{addr}, addr_detail=#{addr_detail} "
			+ "WHERE user_no=#{user_no}")
	public void userUpdate(UserVO vo);
	
	
	
	// 유저 삭제 
	@Delete("DELETE FROM user2_2 WHERE user_no=#{user_no}")
	public void userDelete(int user_no);
	
	
	
	
	//================ 스토어
	
	
	// 스토어 상품 찾기
	@Select("SELECT sg_no, title, price, img, sponsor, rate, user_no, num "
			+ "FROM (SELECT sg_no, title, price, img, sponsor, rate, user_no, rownum as num "
			+ "FROM (SELECT sg_no, title, price, img, sponsor, rate, user_no "
			+ "FROM store_goods2_2 WHERE title LIKE '%'||#{title}||'%')) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<StoreVO> adminStoreFind(Map map);
	
	
	// 스토어 상품 찾기 총 페이지
	@Select("SELECT CEIL(COUNT(*)/12.0) FROM store_goods2_2 WHERE title LIKE '%'||#{title}||'%'")
	public int adminStoreSearchTotalPage(String title);
	
	
	// 스토어 수정 폼
	@Select("SELECT * FROM store_goods2_2 WHERE sg_no=#{sg_no}")
	public StoreVO storeUpdateForm(int sg_no);
	
	// id 가져오기
	@Select("SELECT id FROM user2_2 WHERE user_no=#{user_no}")
	public String IdSelectData(int user_no);
	
	
	// 스토어 수정 처리
	@Update("UPDATE store_goods2_2 SET "
			+ "sg_no=#{sg_no}, title=#{title}, price=#{price}, "
			+ "img=#{img}, sub_img=#{sub_img}, success=#{success}, "
			+ "sponsor=#{sponsor}, open_date=#{open_date}, stock=#{stock}, "
			+ "sc_no=#{sc_no}, user_no=#{user_no}, rate=#{rate}, hit=#{hit} "
			+ "WHERE sg_no=#{sg_no}")
	public void storeUpdate(StoreVO vo);
	
	// 스토어 삭제
	@Delete("DELETE FROM store_goods2_2 WHERE sg_no=#{sg_no}")
	public void storeDelete(int sg_no);

	
	
	//================ 펀딩
	
	
	// 펀딩 목록
	@Select("SELECT fg_no, title, img, sub_img, price, content, goal_amount, now_amount, open_date, close_date, sponsor, like_count, fc_no, user_no, num "
			+ "FROM (SELECT fg_no, title, img, sub_img, price, content, goal_amount, now_amount, open_date, close_date, sponsor, like_count, fc_no, user_no, rownum as num "
			+ "FROM (SELECT fg_no, title, img, sub_img, price, content, goal_amount, now_amount, open_date, close_date, sponsor, like_count, fc_no, user_no "
			+ "FROM funding_goods2_2)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<FundingGoodsVO> adminFundListData(Map map);
	
	
	// 펀딩 상품 찾기
	@Select("SELECT fg_no, title, img, sub_img, price, content, goal_amount, now_amount, open_date, close_date, sponsor, like_count, fc_no, user_no, num "
			+ "FROM (SELECT fg_no, title, img, sub_img, price, content, goal_amount, now_amount, open_date, close_date, sponsor, like_count, fc_no, user_no, rownum as num "
			+ "FROM (SELECT fg_no, title, img, sub_img, price, content, goal_amount, now_amount, open_date, close_date, sponsor, like_count, fc_no, user_no "
			+ "FROM funding_goods2_2 WHERE REGEXP_LIKE(title, #{ss}))) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<FundingGoodsVO> adminFundFindData(Map map);
	
	
	// 펀딩 목록 총 페이지
	@Select("SELECT CEIL(COUNT(*)/12.0) FROM funding_goods2_2")
	public int adminFundListTotalPage();
	
	
	// 펀딩 상품 찾기 총 페이지
	@Select("SELECT CEIL(COUNT(*)/12.0) FROM funding_goods2_2 WHERE REGEXP_LIKE(title, #{ss})")
	public int adminFundFindTotalPage(Map map);
	
	
	
	// 펀딩 수정 폼
	/*@Select("SELECT fg_no, title, img, sub_img, price, content, goal_amount, now_amount, TO_CHAR(open_date, 'YYYY-MM-DD') as oday, TO_CHAR(close_date, 'YYYY-MM-DD') as cday, sponsor, like_count, fc_no, user_no "
			+ "FROM funding_goods2_2 WHERE fg_no=#{fg_no}")
	public FundingGoodsVO fundUpdateForm(int fg_no);*/
	
	@Select("SELECT * FROM funding_goods2_2 WHERE fg_no=#{fg_no}")
	public FundingGoodsVO fundUpdateForm(int fg_no);

	
	
	// 펀딩 수정 처리
	@Update("UPDATE funding_goods2_2 SET "
			+ "fg_no=#{fg_no}, title=#{title}, img=#{img}, sub_img=#{sub_img}, price=#{price}, content=#{content}, "
			+ "goal_amount=#{goal_amount}, now_amount=#{now_amount}, open_date=#{open_date}, close_date=#{close_date}, "
			+ "sponsor=#{sponsor}, like_count=#{like_count}, fc_no=#{fc_no}, user_no=#{user_no} "
			+ "WHERE fg_no=#{fg_no}")
	public void fundingUpdate(FundingGoodsVO vo);
	
	
	
	// 펀딩 삭제
	@Delete("DELETE FROM funding_goods2_2 WHERE fg_no=#{fg_no}")
	public void fundDelete(int fg_no);


	
}
