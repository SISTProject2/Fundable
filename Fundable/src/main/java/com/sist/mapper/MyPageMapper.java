package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.*;

public interface MyPageMapper {
	
	@Select("SELECT user_no, id, name, email, tel, card_number, card_date, bank_name, zipcode, addr "
			+ "FROM user2_2 "
			+ "WHERE id=#{id}")
	public UserVO mypageProfile(String id);
	
	@Select("SELECT fg_no, fc_no, title, img, goal_amount, TO_CHAR(close_date, 'YYYY.MM.DD') as dbday, num "
			+ "FROM (SELECT fg_no, fc_no, title, img, goal_amount, close_date, rownum as num "
			+ "FROM (SELECT fg_no, fc_no, title, img, goal_amount, close_date "
			+ "FROM funding_goods2_2 WHERE user_no=#{user_no} ORDER BY open_date ASC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<FundingGoodsVO> mypageProject(Map map);
	
	@Select("SELECT CEIL(COUNT (*)/5.0) FROM funding_goods2_2 "
			+ "WHERE user_no=#{user_no}")
	public int mypageProjectTotalPage(int user_no);
	
	@Select("SELECT COUNT(*) FROM funding_goods2_2 "
			+ "WHERE user_no=#{user_no}")
	public int mypageProjectCount(int user_no);
	
	@Select("SELECT ph_no, TO_CHAR(rgdate, 'YYYY.MM.DD') as rgday, ph_price, TO_CHAR(expect_pay, 'YYYY.MM.DD') as epday, user_no, fg_no "
			+ "FROM pay_history2_2 WHERE user_no=#{user_no} AND expect_pay<SYSDATE")
	public List<PayHistoryVO> mypagePaying(int user_no);

	@Select("SELECT ph_no, TO_CHAR(rgdate, 'YYYY.MM.DD') as rgday, ph_price, TO_CHAR(expect_pay, 'YYYY.MM.DD') as epday, TO_CHAR(expect_pay+10, 'YYYY.MM.DD') as dbday, user_no, fg_no "
			+ "FROM pay_history2_2 WHERE user_no=#{user_no} AND expect_pay>=SYSDATE")
	public List<PayHistoryVO> mypagePayingFin(int user_no);
	
	@Select("SELECT COUNT(*) FROM pay_history2_2 "
			+ "WHERE user_no=#{user_no} AND expect_pay<SYSDATE")
	public int mypagePayingCount(int user_no);

	@Select("SELECT COUNT(*) FROM pay_history2_2 "
			+ "WHERE user_no=#{user_no} AND expect_pay>=SYSDATE")
	public int mypagePayingFinCount(int user_no);
	
	@Select("SELECT fg_no, title, img, sponsor, CEIL(close_date-SYSDATE) as leftday, now_amount, CEIL((now_amount/goal_amount)*100) as rate, fc_no, user_no FROM funding_goods2_2 WHERE fg_no=#{fg_no}")
	public FundingGoodsVO fundingData(int fg_no);
	
	@Select("SELECT * FROM user2_2 WHERE user_no=#{user_no}")
	public UserVO userData(int user_no);
	
	@Select("SELECT * FROM like2_2 WHERE user_no=#{user_no} AND (SELECT open_date FROM funding_goods2_2 WHERE fg_no=like2_2.fg_no)>SYSDATE")
	public List<LikeVO> mypageBell(int user_no);
	
	@Select("SELECT COUNT(*) FROM like2_2 WHERE user_no=#{user_no} AND (SELECT open_date FROM funding_goods2_2 WHERE fg_no=like2_2.fg_no)>SYSDATE")
	public int mypageBellCount(int user_no);

	@Select("SELECT * FROM like2_2 WHERE user_no=#{user_no} AND (SELECT open_date FROM funding_goods2_2 WHERE fg_no=like2_2.fg_no)<=SYSDATE")
	public List<LikeVO> mypageLike(int user_no);
	
	@Select("SELECT COUNT(*) FROM like2_2 WHERE user_no=#{user_no} AND (SELECT open_date FROM funding_goods2_2 WHERE fg_no=like2_2.fg_no)<=SYSDATE")
	public int mypageLikeCount(int user_no);
	
	
	
	//=== ?????????
	
	// id ????????????
	@Select("SELECT id FROM user2_2 WHERE user_no=#{user_no}")
	public String IdSelectData(int user_no);
	
	//================= ?????? ????????????
	
	// ?????? ????????????
	@Select("SELECT sg_no, sc_no, title, price, img, sponsor, rate, num "
			+ "FROM (SELECT sg_no, sc_no, title, price, img, sponsor, rate, rownum as num "
			+ "FROM (SELECT sg_no, sc_no, title, price, img, sponsor, rate "
			+ "FROM store_goods2_2 WHERE user_no=#{user_no} ORDER BY open_date ASC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<StoreVO> myProjectList(Map map);
	
	
	// ?????? ???????????? ??? ????????? 
	@Select("SELECT CEIL(COUNT(*)/12.0) FROM store_goods2_2")
	public int myStoreProjectTotalPage();
	
	
	// ?????? ???????????? ??????
	@Select("SELECT COUNT(*) FROM funding_goods2_2 WHERE user_no=#{user_no}")
	public int myStoreProjectCount(int user_no);
	
	
	
	// ?????? ???????????? ?????? ???
	@Select("SELECT sg_no, title, price, img, sub_img, sc_no FROM store_goods2_2 WHERE sg_no=#{sg_no}")
	public StoreVO myStoreProjectUpdateForm(int sg_no);
	
	
	// ?????? ???????????? ??????
	@Update("UPDATE store_goods2_2 SET " // ????????? ????????? ???????????? 
			+ "title=#{title}, price=#{price}, img=#{img}, sub_img=#{sub_img}, sc_no=#{sc_no} "
			+ "WHERE sg_no=#{sg_no}")
	public void myStoreProjectUpdate(StoreVO vo);
	
	
	// ?????? ???????????? ??????
	@Delete("DELETE FROM store_goods2_2 WHERE sg_no=#{sg_no}")
	public void myStoreProjectDelete(int sg_no);
	
	
	
	//================= ?????? ??????
	
	// ?????? ?????? ??????
	@Select("SELECT s_no, sg_no, sc_no, title, content, TO_CHAR(c_date, 'YYYY-MM-DD') as dbday, num " // ?????????
			+ "FROM (SELECT s_no, sg_no, sc_no, title, content, c_date, rownum as num " // ????????? ????????? ?????? ??????
			+ "FROM (SELECT s_no, store_comment2_2.sg_no, sc_no, title, content, c_date " // ????????? ?????? sql??????????????? ???????????? ???
			+ "FROM store_comment2_2, store_goods2_2 "
			+ "WHERE store_comment2_2.sg_no = store_goods2_2.sg_no  "
			+ "AND store_comment2_2.user_no=#{user_no} ORDER BY c_date DESC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<CommentVO> myCommentList(Map map);
	
	
	// ?????? ?????? ??? ????????? 
	@Select("SELECT CEIL(COUNT(*)/5.0) FROM store_comment2_2 WHERE user_no=#{user_no}")
	public int myCommentTotalPage(int user_no);
	
	
	// ?????? ?????? ??????
	@Delete("DELETE FROM store_comment2_2 WHERE s_no=#{s_no}")
	public void myCommentDelete(int s_no);
	
	
	// ?????? ?????? ??????
	@Select("SELECT COUNT(*) FROM store_comment2_2 WHERE user_no=#{user_no}")
	public int myCommentCount(int user_no);

	
	
	//================= ??????
	
	@SelectKey(keyProperty = "ph_no", resultType = int.class, before = true, 
				statement = "SELECT NVL(MAX(ph_no)+1, 1) as ph_no FROM pay_history2_2")
	
	@Insert("INSERT INTO pay_history2_2(ph_no, rgdate, ph_price, name, user_no, sg_no) "
			+ "VALUES(#{ph_no}, SYSDATE, #{ph_price}, #{name}, #{user_no}, #{sg_no})")
	public void payInsert(PayHistoryVO vo);
	
	
	
}
