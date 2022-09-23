package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.AdminMapper;
import com.sist.mapper.UserMapper;
import com.sist.vo.FundingGoodsVO;
import com.sist.vo.StoreVO;
import com.sist.vo.UserVO;

@Repository
public class AdminDAO {

	@Autowired
	private AdminMapper mapper;
	
	
	//============ 유저
	
	
	
	// 유저 찾기
	public List<UserVO> userFindData(Map map)
	{
		return mapper.userFindData(map);
	}
	
	
	// 유저 목록 전체 페이지
	public int userFindTotalPage(String ss)
	{
		return mapper.userFindTotalPage(ss);
	}
	
	
	// 유저 수정 폼
	public UserVO userUpdateForm(int user_no)
	{
		return mapper.userUpdateForm(user_no);
	}
	
	
	// 유저 수정
	public void userUpdate(UserVO vo)
	{
		
		mapper.userUpdate(vo);

	}
	
	
	
	// 유저 삭제
	public void userDelete(int user_no)
	{
		mapper.userDelete(user_no);
	}
	
	
	
	//================ 스토어
	
	
	// 스토어 상품 찾기
	public List<StoreVO> adminStoreFind(Map map)
	{
		return mapper.adminStoreFind(map);
	}
	
	
	// 검색 총 페이지
	public int adminStoreSearchTotalPage(String ss)
	{
		return mapper.adminStoreSearchTotalPage(ss);
	}
	
	
	// 스토어 수정 폼
	public StoreVO storeUpdateForm(int sg_no)
	{
		return mapper.storeUpdateForm(sg_no);
	}
	
	// id 가져오기
	public String IdSelectData(int user_no)
	{
		return mapper.IdSelectData(user_no);
	}
	
	
	// 스토어 수정 처리
	
	
	// 스토어 삭제
	public void storeDelete(int sg_no)
	{
		mapper.storeDelete(sg_no);
	}
	
	
	
	//======================== 펀딩
	
	
	// 펀딩 목록
	public List<FundingGoodsVO> adminFundListData(Map map)
	{
		return mapper.adminFundListData(map);
	}
	
	
	// 펀딩 검색
	public List<FundingGoodsVO> adminFundFindData(Map map)
	{
		return mapper.adminFundFindData(map);
	}
	
	
	// 펀딩 총 페이지
	public int adminFundListTotalPage()
	{
		return mapper.adminFundListTotalPage();
	}
	
	
	// 펀딩 검색 총 페이지
	public int adminFundFindTotalPage(Map map)
	{
		return mapper.adminFundFindTotalPage(map);
	}
	
	
	
	// 펀딩 수정 폼
	public FundingGoodsVO fundUpdateForm(int fg_no)
	{
		return mapper.fundUpdateForm(fg_no);
	}
	
	
	// 펀딩 수정 처리
	
	
	// 펀딩 삭제
	public void fundDelete(int fg_no)
	{
		mapper.fundDelete(fg_no);
	}

}

