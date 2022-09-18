package com.sist.service;

import java.util.List;
import java.util.Map;

import com.sist.vo.StoreVO;

public interface StoreService {

	public List<StoreVO> storeListData(Map map);
	public int storeTotalPage(Map map);
	public List<StoreVO> storeCategoryListData(Map map);
	public int storeCategoryTotalPage(Map map);
	public StoreVO storeDetailData(int sg_no);
	public List<StoreVO> storeBest(Map map);
	public List<StoreVO> storeFindData(Map map);
	public int storeSearchTotalPage(String title);
	
}
