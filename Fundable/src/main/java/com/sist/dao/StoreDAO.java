package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.StoreMapper;
import com.sist.vo.StoreVO;
import com.sist.vo.UserVO;

@Repository
public class StoreDAO {

	@Autowired
	private StoreMapper mapper;
	
	//============= 기본
	
	
	
	// 목록 페이지
	public List<StoreVO> storeListData(Map map)
	{
		return mapper.storeListData(map);
	}
	
	
	// 카테고리 페이지
	public List<StoreVO> storeCategoryListData(Map map)
	{
		return mapper.storeCategoryListData(map);
	}
	
	
	// 상세 페이지
	public StoreVO storeDetailData(int sg_no)
	{
		mapper.hitIncrement(sg_no);
		
		return mapper.storeDetailData(sg_no);
	}
	
	
	// 창작자 정보
	public List<UserVO> CreatorInfoData(int user_no)
	{
		return mapper.CreatorInfoData(user_no);
	}
	
	
	// 비슷한 프로젝트
	public List<StoreVO> storeSimilarProject(int sc_no)
	{
		return mapper.storeSimilarProject(sc_no);
	}
	
	
	// 목록 총 페이지
	public int storeTotalPage(Map map)
	{
		return mapper.storeTotalPage(map);
	}
	
	
	// 카테고리 총 페이지
	public int storeCategoryTotalPage(Map map)
	{
		return mapper.storeCategoryTotalPage(map);
	}
	
	
	// id 찾기
	/*
	 * public String IdSelectData(int user_no) { return
	 * mapper.IdSelectData(user_no); }
	 */
	
	
	
	// 베스트 페이지
	public List<StoreVO> storeBest(Map map)
	{
		return mapper.storeBest(map);
	}
	
	
	
	// 검색
	public List<StoreVO> storeFindData(Map map)
	{
		return mapper.storeFindData(map);
	}
	
	
	// 검색 총 페이지
	public int storeSearchTotalPage(String title)
	{
		return mapper.storeSearchTotalPage(title);
	}
	
	
	// 결제
	public StoreVO payInfo(int sg_no)
	{
		return mapper.payInfo(sg_no);
	}
	
}
