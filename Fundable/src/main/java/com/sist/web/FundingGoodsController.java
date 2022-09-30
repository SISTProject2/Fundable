package com.sist.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	
	@GetMapping("funding/soon_list.do")
	public String funding_soon_list(Model model) {
		model.addAttribute("main_jsp", "../funding/soon_list.jsp");
		
		return "main/main2";
	}
	
	@GetMapping("funding/list.do")
	public String funding_list(Model model) {
		model.addAttribute("main_jsp", "../funding/list.jsp");
		
		return "main/main2";
	}
	
	@GetMapping("funding/home.do")
	public String funding_home(Model model, HttpServletRequest request) {
		
		List<FundingGoodsVO> list=dao.fundingMainPop();
		List<FundingGoodsVO> list2=dao.fundingMainFin();
		List<FundingGoodsVO> list3=dao.fundingMainSoon();
		
		for(FundingGoodsVO vo:list) {
			String category=dao.fundingCategoryData(vo.getFc_no());
			String id=dao.fundingIdData(vo.getUser_no());
			vo.setCategory(category);
			vo.setId(id);
		}
		
		for(FundingGoodsVO vo:list2) {
			String category=dao.fundingCategoryData(vo.getFc_no());
			String id=dao.fundingIdData(vo.getUser_no());
			vo.setCategory(category);
			vo.setId(id);
		}
		
		for(FundingGoodsVO vo:list3) {
			String category=dao.fundingCategoryData(vo.getFc_no());
			String id=dao.fundingIdData(vo.getUser_no());
			vo.setCategory(category);
			vo.setId(id);
		}
		
		// cookie
		Cookie[] cookies=request.getCookies();
		List<FundingGoodsVO> cList=new ArrayList<FundingGoodsVO>();
		if(cookies!=null) {
			for (int i=cookies.length-1; i>=0; i--) {
				if (cookies[i].getName().startsWith("funding")) {
					cookies[i].setPath("/");
					String fg_no=cookies[i].getValue();
					FundingGoodsVO vo=dao.fundingDetailData(Integer.parseInt(fg_no));
					cList.add(vo);
				}
			}
		}
		
		for(FundingGoodsVO vo:cList) {
			String category=dao.fundingCategoryData(vo.getFc_no());
			String id=dao.fundingIdData(vo.getUser_no());
			
			String t=vo.getTitle();
			if(t.length()>20) {
				t=t.substring(0, 20)+"...";
				vo.setTitle(t);
			}
			vo.setCategory(category);
			vo.setId(id);
		}
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
		Date now = new Date();
		String today = format.format(now);
		
		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		model.addAttribute("list3", list3);
		model.addAttribute("cList", cList);
		model.addAttribute("today", today);
		model.addAttribute("main_jsp", "../funding/home.jsp");
		
		return "main/main2";
	}
	
	@GetMapping("funding/detail_before.do")
	public String funding_detail_before(int fg_no, HttpServletResponse response) {
		Cookie cookie=new Cookie("funding"+fg_no, String.valueOf(fg_no));
		cookie.setPath("/");
		cookie.setMaxAge(60*60*24);
		response.addCookie(cookie);
		
		return "redirect:home.do";
	}
	
	@GetMapping("funding/cate_list.do")
	public String funding_cate_list(int fc_no, Model model) {
		model.addAttribute("fc_no", fc_no);
		model.addAttribute("main_jsp", "../funding/cate_list.jsp");
		
		return "main/main2";
	}
}
