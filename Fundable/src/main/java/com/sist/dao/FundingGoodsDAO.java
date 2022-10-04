package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.FundingGoodsMapper;
import com.sist.vo.FundingGoodsVO;
import com.sist.vo.LikeVO;

@Repository
public class FundingGoodsDAO {
	@Autowired
	private FundingGoodsMapper mapper;
	
	public List<FundingGoodsVO> fundingSoonListData(Map map) {
		return mapper.fundingSoonListData(map);
	}
	
	public int fundingSoonTotalPage() {
		return mapper.fundingSoonTotalPage();
	}
	
	public int fundingSoonCount() {
		return mapper.fundingSoonCount();
	}
	
	public String fundingCategoryData(int fc_no) {
		return mapper.fundingCategoryData(fc_no);
	}
	
	public String fundingIdData(int user_no) {
		return mapper.fundingIdData(user_no);
	}
	
	public List<FundingGoodsVO> fundingListData(Map map) {
		return mapper.fundingListData(map);
	}
	
	public int fundingTotalPage() {
		return mapper.fundingTotalPage();
	}
	
	public int fundingCount() {
		return mapper.fundingCount();
	}
	
	public List<FundingGoodsVO> fundingMainPop() {
		return mapper.fundingMainPop();
	}
	
	public List<FundingGoodsVO> fundingMainFin() {
		return mapper.fundingMainFin();
	}
	
	public List<FundingGoodsVO> fundingMainSoon() {
		return mapper.fundingMainSoon();
	}
	
	public FundingGoodsVO fundingDetailData(int fg_no) {
		return mapper.fundingDetailData(fg_no);
	}
	
	public List<FundingGoodsVO> fundingCateList(Map map) {
		return mapper.fundingCateList(map);
	}
	
	public int fundingCateTotalPage(int fc_no) {
		return mapper.fundingCateTotalPage(fc_no);
	}
	
	public int fundingCateCount(int fc_no) {
		return mapper.fundingCateCount(fc_no);
	}
	
	public void fundingBellInsert(LikeVO vo) {
		mapper.fundingBellInsert(vo);
	}
	
	public int fundingBellCount(LikeVO vo) {
		return mapper.fundingBellCount(vo);
	}
	
	public void fundingBellDelete(LikeVO vo) {
		mapper.fundingBellDelete(vo);
	}
	
	public int fundingBell(int fg_no) {
		return mapper.fundingBell(fg_no);
	}
	
}
