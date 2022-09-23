package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.AdminDAO;
import com.sist.vo.*;

@RestController
public class AdminRestController {

	@Autowired
	private AdminDAO dao;
	
	
	//============
	
	
	
	// 유저 목록 검색 
	@GetMapping(value = "admin/user_list.do", produces = "text/plain;charset=UTF-8")
	public String user_list(String ss, String page)
	{
		String result = "";
		
		System.out.println(ss);
		
		try
		{
			if(page == null)
				page = "1";
			
			if(ss == null)
				ss = "ki";
			
			int curpage = Integer.parseInt(page);
			int rowSize = 12;
			int start = (rowSize*curpage)-(rowSize-1);
			int end = rowSize*curpage;
			
			Map map = new HashMap();
			map.put("start", start);
			map.put("end", end);
			map.put("id", ss);
			
			
			
			List<UserVO> list = dao.userFindData(map);
			
			//system.out.println(list.size());
			
			int totalpage = dao.userFindTotalPage(ss);
			
			JSONArray arr = new JSONArray();
			
			int k = 0;
			for(UserVO vo : list)
			{
				JSONObject obj = new JSONObject(); // {"user_no": 1, "name": "ddd"}
				obj.put("user_no", vo.getUser_no());
				obj.put("id", vo.getId());
				obj.put("pwd", vo.getPwd());
				obj.put("admin", vo.getAdmin());
				obj.put("name", vo.getName());
				obj.put("email", vo.getEmail());
				obj.put("tel", vo.getTel());
				obj.put("bday", vo.getBday());
				obj.put("card_number", vo.getCard_number());
				obj.put("card_date", vo.getCard_date());
				obj.put("card_pwd", vo.getCard_pwd());
				obj.put("zipcode", vo.getZipcode());
				obj.put("addr", vo.getAddr());
				obj.put("addr_detail", vo.getAddr_detail());
				
				
				if(k == 0)
				{
					obj.put("curpage", curpage);
					obj.put("totalpage", totalpage);
				}
				arr.add(obj);
				k++;
			}
			result = arr.toJSONString();
			
		}catch(Exception ex) {}
		
		return result;
	}
	
	
	
	
	// 스토어 검색 
	@GetMapping(value = "admin/store_list.do", produces = "text/plain;charset=UTF-8")
	public String store_list(String ss, String page)
	{
		String result = "";
		
		//System.out.println(ss);
		
		try
		{
			if(page == null)
				page = "1";
			
			if(ss == null)
				ss = "ki";
			
			int curpage = Integer.parseInt(page);
			int rowSize = 12;
			int start = (rowSize*curpage)-(rowSize-1);
			int end = rowSize*curpage;
			
			Map map = new HashMap();
			map.put("start", start);
			map.put("end", end);
			map.put("title", ss);
			
			
			
			List<StoreVO> list = dao.adminStoreFind(map);
			
			//System.out.println(list.size());
			
			int totalpage = dao.adminStoreSearchTotalPage(ss);
			
			JSONArray arr = new JSONArray();
			
			int k = 0;
			for(StoreVO vo : list)
			{
				JSONObject obj = new JSONObject(); // {"user_no": 1, "name": "ddd"}
				obj.put("sg_no", vo.getSg_no());
				obj.put("title", vo.getTitle());
				obj.put("price", vo.getPrice());
				obj.put("img", vo.getImg());
				obj.put("sub_img", vo.getSub_img());
				obj.put("success", vo.getSuccess());
				obj.put("sponsor", vo.getSponsor());
				obj.put("open_date", vo.getOpen_date());
				obj.put("stock", vo.getStock());	
				
				if(k == 0)
				{
					obj.put("curpage", curpage);
					obj.put("totalpage", totalpage);
				}
				arr.add(obj);
				k++;
			}
			result = arr.toJSONString();
			
		}catch(Exception ex) {}
		
		return result;
		
	}
	
	
	
	// 펀딩 검색 
	/*@GetMapping(value = "admin/funding_list_vue.do", produces = "text/plain;charset=UTF-8")
	public String funding_list(String ss, String page)
	{
		String result = "";
		
		System.out.println(ss);
		
		try
		{
			if(page == null)
				page = "1";
			
			if(ss == null)
				ss = "ki";
			
			int curpage = Integer.parseInt(page);
			int rowSize = 12;
			int start = (rowSize*curpage)-(rowSize-1);
			int end = rowSize*curpage;
			
			Map map = new HashMap();
			map.put("start", start);
			map.put("end", end);
			map.put("title", ss);
			
			
			
			List<FundingGoodsVO> list = dao.adminFundFind(map);
			
			System.out.println(list.size());
			
			int totalpage = dao.adminFundSearchTotalPage(ss);
			
			JSONArray arr = new JSONArray();
			
			int k = 0;
			for(FundingGoodsVO vo : list)
			{
				JSONObject obj = new JSONObject(); // {"user_no": 1, "name": "ddd"}
				obj.put("fg_no", vo.getFg_no());
                obj.put("title", vo.getTitle());
                obj.put("img", vo.getImg());
                obj.put("sub_img", vo.getSub_img());
                obj.put("price", vo.getPrice());
                obj.put("content", vo.getContent());
                obj.put("goal_amount", vo.getGoal_amount());
                obj.put("now_amount", vo.getNow_amount());
                obj.put("open_date", vo.getOpen_date());   
                obj.put("close_date", vo.getClose_date());   
                obj.put("sponsor", vo.getSponsor());   
                obj.put("like_count", vo.getLike_count());   
                obj.put("fc_no", vo.getFc_no());   
                obj.put("user_no", vo.getUser_no());	
				
				if(k == 0)
				{
					obj.put("curpage", curpage);
					obj.put("totalpage", totalpage);
				}
				arr.add(obj);
				k++;
			}
			result = arr.toJSONString();
			
		}catch(Exception ex) {}
		
		return result;
		
	}*/
		
		

	
}
