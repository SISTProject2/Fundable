package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sist.service.StoreService;
import com.sist.vo.StoreVO;

@Controller
public class StoreController {

	@Autowired
	private StoreService service;	
	
	//===========
	
	
	//====== 전체 목록 페이지
	@GetMapping("store/list.do") // list.do로 모든 목록 페이지 처리
	public String store_list(String page,  String no, Model model)
	{
		if(page == null)
			page = "1";
		
		
		
		//===== sort
		if(no == null)
			no = "1";
		
		String column = "";
		
		if(Integer.parseInt(no) == 1) // 인기 순
			column = "rate DESC NULLS LAST";      
		if(Integer.parseInt(no) == 2) // 서포터 많은 순
			column = "sponsor DESC NULLS LAST";      
	    if(Integer.parseInt(no) == 3) // 최신 순
	        column = "open_date DESC";
	    if(Integer.parseInt(no) == 4) // 가격 높은 순
	        column = "price DESC";
	    if(Integer.parseInt(no) == 5) // 가격 낮은 순
	    	column = "price ASC";

		int curpage = Integer.parseInt(page);
		
		Map map = new HashMap();
		
		int rowSize = 12; // 페이지 당 출력 상품 수
		int start = (rowSize*curpage)-(rowSize-1);
		int end = rowSize*curpage;
		
		map.put("start", start);
		map.put("end", end);
		map.put("no", no);
		map.put("column", column);
		
		List<StoreVO> list = service.storeListData(map);
		
		
		
		//======= 긴 글자 자르기
		for(StoreVO vo:list)
		{
			String s = vo.getTitle();
			if(s.length() > 19)
			{
				s = s.substring(0, 19) + "....";
				vo.setTitle(s);
			}
			vo.setTitle(s);
		}
		
		
		
		//===== 총 페이지
		int totalpage = service.storeTotalPage(map);
		
		
		
		//===== 페이지 블럭 나누기
		final int BLOCK = 10;
		int startPage = ((curpage-1)/BLOCK*BLOCK)+1;
		int endPage = ((curpage-1)/BLOCK*BLOCK)+BLOCK;
		
		if(endPage > totalpage)
			endPage = totalpage;
		
		
		model.addAttribute("curpage", curpage);
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);

		model.addAttribute("list", list);
		model.addAttribute("store_main_jsp", "../store/list.jsp");

		
		return "store/store_main";
	}
	
	
	
	
	
	
	//====== 카테고리별 목록 페이지
	@GetMapping("store/list_category.do") // list.do로 모든 목록 페이지 처리
	public String store_list_category(String page, String no, String sc_no, Model model)
	{
		if(page == null)
			page = "1";
		
		if(sc_no == null)
			sc_no = "2";
		
		//===== sort
		if(no == null)
			no = "1";
		
		String column = "";
		
		if(Integer.parseInt(no) == 1) // 인기 순
			column = "rate DESC NULLS LAST";      
		if(Integer.parseInt(no) == 2) // 서포터 많은 순
			column = "sponsor DESC NULLS LAST";      
	    if(Integer.parseInt(no) == 3) // 최신 순
	        column = "open_date DESC";
	    if(Integer.parseInt(no) == 4) // 가격 높은 순
	        column = "price DESC";
	    if(Integer.parseInt(no) == 5) // 가격 낮은 순
	    	column = "price ASC";
		
		
		int curpage = Integer.parseInt(page);
		
		Map map = new HashMap();
		
		int rowSize = 12; // 페이지 당 출력 상품 수
		int start = (rowSize*curpage)-(rowSize-1);
		int end = rowSize*curpage;
		
		map.put("start", start);
		map.put("end", end);
		map.put("sc_no", sc_no);
		map.put("no", no);
		map.put("column", column);
		
		List<StoreVO> list = service.storeCategoryListData(map);
		
		
		
		//======= 긴 글자 자르기
		for(StoreVO vo:list)
		{
			String s = vo.getTitle();
			if(s.length() > 19)
			{
				s = s.substring(0, 19) + "....";
				vo.setTitle(s);
			}
			vo.setTitle(s);
		}
		
		
		
		//===== 총 페이지
		int totalpage = service.storeCategoryTotalPage(map);
		
		
		
		//===== 페이지 블럭 나누기
		final int BLOCK = 10;
		int startPage = ((curpage-1)/BLOCK*BLOCK)+1;
		int endPage = ((curpage-1)/BLOCK*BLOCK)+BLOCK;
		
		if(endPage > totalpage)
			endPage = totalpage;
		
		
		model.addAttribute("curpage", curpage);
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("sc_no", sc_no);
		
		model.addAttribute("list", list);
		model.addAttribute("store_main_jsp", "../store/list_category.jsp");
		
		
		return "store/store_main";
	}
	
}
