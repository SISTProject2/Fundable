package com.sist.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.AdminDAO;
import com.sist.vo.FundingGoodsVO;
import com.sist.vo.StoreVO;
import com.sist.vo.UserVO;

@Controller
public class AdminController {

	@Autowired
	AdminDAO dao;
	
	//===========
	
	
	// 유저 목록
	@GetMapping("admin/user_list.do")
	public String admin_user()
	{
		
		return "admin/user";
	}
	
	
	// 유저 수정 폼
	@GetMapping("admin/user_update.do")
	public String user_update(int user_no, Model model)
	{
		UserVO vo = dao.userUpdateForm(user_no);
		
		model.addAttribute("vo", vo);
		
		return "admin/user_update";
	}
	
	// 유저 정보 수정
	@RequestMapping("admin/user_update_ok.do")
	public String user_update_ok(UserVO vo)
	{
		
		dao.userUpdate(vo);
		
		return "redirect: ../admin/user_update.do?user_no=" + vo.getUser_no();
		
	}
	
	
	// 유저 삭제
	@GetMapping("admin/user_delete.do")
	public String user_delete(int user_no, Model model)
	{
		dao.userDelete(user_no);


	    return "redirect: ../admin/user_list.do";
		
		
	}
	
	
	//============= 스토어
	
	// 스토어 // admin/store_list.do
	@GetMapping("admin/store_list.do")
	public String admin_store()
	{
		
		return "admin/store";
	}
	
	// 스토어 수정 폼
	@GetMapping("admin/store_update.do")
	public String store_update_form(int sg_no, Model model)
	{
		StoreVO vo = dao.storeUpdateForm(sg_no);
		
		model.addAttribute("vo", vo);
		
		String id = dao.IdSelectData(vo.getUser_no());
		model.addAttribute("id", id);
		
		return "admin/store_update";
	}
	
	
	
	// 스토어 삭제
	@GetMapping("admin/store_delete.do")
	public String store_delete(int sg_no, Model model)
	{
		dao.storeDelete(sg_no);

	    return "redirect: ../admin/store_list.do";
		
		
	}
	
	
	
	//============= 펀딩
	
	// => 검색(post), 목록(get) 동시 처리
	@RequestMapping("admin/funding_list.do")
	public String admin_funding(String page, String type, Model model)
	{
		List<FundingGoodsVO> list = new ArrayList<FundingGoodsVO>();
		
		if(page == null)
			page = "1";
		
		int curpage = Integer.parseInt(page);
		Map map = new HashMap();
		int rowSize = 12;
		int start = (rowSize*curpage)-(rowSize-1);
		int end = rowSize*curpage;
		
		map.put("start", start);
		map.put("end", end);
		
		int totalpage = 0;
		
		if(type == null || type.equals(""))
		{
			list = dao.adminFundListData(map);
			totalpage = dao.adminFundListTotalPage();
		}
		else
		{
			map.put("ss", type);
			list = dao.adminFundFindData(map);
			totalpage = dao.adminFundFindTotalPage(map);
		}
		
		
		model.addAttribute("curpage", curpage);
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("list", list);
		
		return "admin/funding";
	}
	
	
	
	// 펀딩 수정 폼
	@GetMapping("admin/fund_update.do")
	public String fund_update_form(int fg_no, Model model)
	{
		FundingGoodsVO vo = dao.fundUpdateForm(fg_no);
		
		model.addAttribute("vo", vo);
		
		String id = dao.IdSelectData(vo.getUser_no());
		model.addAttribute("id", id);
		
		return "admin/funding_update";
	}
	
	
	
	
	
	@GetMapping("admin/approve.do")
	public String admin_approve()
	{
		return "admin/approve";
	}
	
	
	
	
	
	
}
