package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sist.dao.FundingGoodsDAO;
import com.sist.vo.FundingGoodsVO;

@Controller
public class FundingGoodsController {
	@Autowired
	private FundingGoodsDAO dao;
	
	@GetMapping("funding/list.do")
	public String funding_list(Model model) {
//		if(page==null)
//			page="1";
//		int curpage=Integer.parseInt(page);
//		
//		Map map=new HashMap();
//		int rowSize=12;
//		int start=(rowSize*curpage)-(rowSize-1);
//		int end=rowSize*curpage;
//		map.put("start", start);
//		map.put("end", end);
//		List<FundingGoodsVO> list=dao.fundingSoonListData(map);
//		
//		int totalpage=dao.fundingSoonTotalPage();
//		
//		model.addAttribute("curpage", curpage);
//		model.addAttribute("totalpage", totalpage);
//		model.addAttribute("list", list);
		model.addAttribute("main_jsp", "../funding/list.jsp");
		
		return "main/main";
	}
}
