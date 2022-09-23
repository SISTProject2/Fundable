package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.StoreDAO;
import com.sist.vo.StoreVO;

@Controller
public class StoreController {
	
	@Autowired
	private StoreDAO dao;
	
	//===========
	
	
	// 목록 페이지
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
		
		List<StoreVO> list = dao.storeListData(map);
		
		
		
		//======= 긴 글자 자르기
		for(StoreVO vo:list)
		{
			String s = vo.getTitle();
			if(s.length() > 18)
			{
				s = s.substring(0, 18) + "....";
				vo.setTitle(s);
			}
			vo.setTitle(s);
		}
		
		
		
		//===== 총 페이지
		int totalpage = dao.storeTotalPage(map);
		
		
		
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
		model.addAttribute("no", no);
		model.addAttribute("column", column);

		model.addAttribute("list", list);
		model.addAttribute("store_main_jsp", "../store/list.jsp");

		
		return "store/store_main";
	}
	
	
	
	
	
	
	// 카테고리 페이지
	@GetMapping("store/list_category.do") // list.do로 모든 목록 페이지 처리
	public String store_list_category(String page, String no, String sc_no, Model model)
	{
		if(page == null)
			page = "1";
		
		if(sc_no == null)
			sc_no = "1";
		
		//===== sort
		if(no == null)
			no = "2";
		
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
		
		
	    //===== 페이지 별 헤더 단어
	    String title = "";
	    
	    if(Integer.parseInt(sc_no) == 1)
	    	title = "문구";
	    if(Integer.parseInt(sc_no) == 2)
	    	title = "푸드";
	    if(Integer.parseInt(sc_no) == 3)
	    	title = "출판";
	    if(Integer.parseInt(sc_no) == 4)
	    	title = "반려 동물";
	    
	    
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
		
		List<StoreVO> list = dao.storeCategoryListData(map);
		
		
		
		//======= 긴 글자 자르기
		for(StoreVO vo:list)
		{
			String s = vo.getTitle();
			if(s.length() > 18)
			{
				s = s.substring(0, 18) + "....";
				vo.setTitle(s);
			}
			vo.setTitle(s);
		}
		
		
		
		//===== 총 페이지
		int totalpage = dao.storeCategoryTotalPage(map);
		
		
		
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
		model.addAttribute("title", title);
		model.addAttribute("no", no);
		model.addAttribute("column", column);
		
		model.addAttribute("list", list);
		model.addAttribute("store_main_jsp", "../store/list_category.jsp");
		
		
		return "store/store_main";
	}
	
	
	
	// 상세 페이지
	@GetMapping("store/detail.do")
	public String store_detail(int sg_no, Model model)
	{
		Map map = new HashMap();
		map.put("sg_no", sg_no);
		
		StoreVO vo = dao.storeDetailData(sg_no);
		model.addAttribute("vo", vo);
		
		model.addAttribute("store_main_jsp", "../store/detail.jsp");
		
		return "store/store_main";
	}
	
	
	
	// 베스트 TOP 33
	 @GetMapping("store/best.do") 
     public String store_best(Model model)
     {
		 Map map = new HashMap();
		 
		 List<StoreVO> slist = dao.storeBest(map);
		 
		 
		//======= 긴 글자 자르기
		for(StoreVO vo:slist)
		{
			String s = vo.getTitle();
			if(s.length() > 20)
			{
				s = s.substring(0, 20) + "....";
				vo.setTitle(s);
			}
			vo.setTitle(s);
		}
		 
		 
		 model.addAttribute("slist", slist);
		 model.addAttribute("store_main_jsp", "../store/best.jsp");

    	 return "store/store_main";
     }
	 
	 @GetMapping("store/find.do")
	 public String store_find(Model model)
	 {
		 model.addAttribute("store_main_jsp", "../store/find.jsp");

    	 return "store/store_main";
	 }
	 
	 
	 // 검색
	 /*@RequestMapping("store/find.do")
	 public String store_find(String page, String no, String ss, Model model)
	 {
		 if(ss == null)
			 ss = "";
		 
		 if(page == null)
			 page = "1";
		 
		//===== sort
		if(no == null)
			no = "2";
		
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
		 map.put("title", ss);
		 map.put("no", no);
		 map.put("column", column);
		
		 List<StoreVO> flist = dao.storeFindData(map);
		
		
		
		 //======= 긴 글자 자르기
		 for(StoreVO vo:flist)
		 {
			 String s = vo.getTitle();
			 if(s.length() > 20)
			 {
				 s = s.substring(0, 20) + "....";
				 vo.setTitle(s);
			 }
			 vo.setTitle(s);
		 }
		
		
		
		 //===== 총 페이지
		 int totalpage = dao.storeSearchTotalPage(ss);
		
		
		
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
		 model.addAttribute("ss", ss);
		 model.addAttribute("no", no);
		 model.addAttribute("column", column);

		 model.addAttribute("flist", flist);
		 model.addAttribute("store_main_jsp", "../store/find.jsp");
	 
		 
		 
		 return "store/store_main";
	 }*/
}
