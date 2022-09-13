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
	private int[] no = {1, 2, 3, 4, 5};
	
	
	//===========
	
	
	//====== 목록 페이지
	@GetMapping("store/list.do") // list.do로 모든 목록 페이지 처리
	public String store_list(String page, String sc_no, Model model)
	{
		if(page == null)
			page = "1";
		
		if(sc_no == null)
			sc_no = "1";
		
		
		int curpage = Integer.parseInt(page);
		
		Map map = new HashMap();
		
		int rowSize = 12; // 페이지 당 출력 상품 수
		int start = (rowSize*curpage)-(rowSize-1);
		int end = rowSize*curpage;
		
		map.put("start", start);
		map.put("end", end);
		map.put("sc_no", sc_no);
		
		List<StoreVO> list = service.storeListData(map);
		int totalpage = service.storeTotalPage(map);
		
		model.addAttribute("curpage", curpage);
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("sc_no", sc_no);
		
		model.addAttribute("list", list);

		
		return "store/list";
	}
	
}
