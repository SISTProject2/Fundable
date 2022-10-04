package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.MyPageMapper;
import com.sist.vo.CommentVO;
import com.sist.vo.FundingGoodsVO;
import com.sist.vo.LikeVO;
import com.sist.vo.PayHistoryVO;
import com.sist.vo.StoreVO;
import com.sist.vo.UserVO;

@Repository
public class MyPageDAO {
	@Autowired
	private MyPageMapper mapper;
	
	public UserVO mypageProfile(String id) {
		return mapper.mypageProfile(id);
	}
	
	public List<FundingGoodsVO> mypageProject(Map map) {
		return mapper.mypageProject(map);
	}
	
	public int mypageProjectTotalPage(int user_no) {
		return mapper.mypageProjectTotalPage(user_no);
	}
	
	public int mypageProjectCount(int user_no) {
		return mapper.mypageProjectCount(user_no);
	}
	
	public List<PayHistoryVO> mypagePaying(int user_no) {
		return mapper.mypagePaying(user_no);
	}
	
	public List<PayHistoryVO> mypagePayingFin(int user_no) {
		return mapper.mypagePayingFin(user_no);
	}
	
	public int mypagePayingCount(int user_no) {
		return mapper.mypagePayingCount(user_no);
	}

	public int mypagePayingFinCount(int user_no) {
		return mapper.mypagePayingFinCount(user_no);
	}
	
	public FundingGoodsVO fundingData(int fg_no) {
		return mapper.fundingData(fg_no);
	}
	
	public UserVO userData(int user_no) {
		return mapper.userData(user_no);
	}
	
	public List<LikeVO> mypageBell(int user_no) {
		return mapper.mypageBell(user_no);
	}
	
	public int mypageBellCount(int user_no) {
		return mapper.mypageBellCount(user_no);
	}
	
	public List<LikeVO> mypageLike(int user_no) {
		return mapper.mypageLike(user_no);
	}
	
	public int mypageLikeCount(int user_no) {
		return mapper.mypageLikeCount(user_no);
	}
	
	
	
	//=== 스토어
	
	public String IdSelectData(int user_no)
	{
		return mapper.IdSelectData(user_no);
	}
	
	public List<StoreVO> myProjectList(Map map)
	{
		return mapper.myProjectList(map);
	}
	
	public int myStoreProjectTotalPage()
	{
		return mapper.myStoreProjectTotalPage();
	}
	
	public int myStoreProjectCount(int user_no)
	{
		return mapper.myStoreProjectCount(user_no);
	}
	
	public StoreVO myStoreProjectUpdateForm(int sg_no)
	{
		return mapper.myStoreProjectUpdateForm(sg_no);
	}
	
	public void myStoreProjectUpdate(StoreVO vo)
	{
		mapper.myStoreProjectUpdate(vo);
	}
	
	public void myStoreProjectDelete(int sg_no)
	{
		mapper.myStoreProjectDelete(sg_no);
	}
	
	public List<CommentVO> myCommentList(Map map)
	{
		return mapper.myCommentList(map);
	}
	
	public int myCommentTotalPage(int user_no)
	{
		return mapper.myCommentTotalPage(user_no);
	}
	
	public void myCommentDelete(int s_no)
	{
		mapper.myCommentDelete(s_no);
	}
	
	public int myCommentCount(int user_no)
	{
		return mapper.myCommentCount(user_no);
	}
	
	public void payInsert(PayHistoryVO vo)
	{
		mapper.payInsert(vo);
	}
}
