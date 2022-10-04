package com.sist.web;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.*;

import com.sist.dao.StoreDAO;
import com.sist.dao.*;
import com.sist.vo.*;

@RestController
public class StoreRestController {

	@Autowired
	private StoreDAO dao;
	
	//=============
	
	
	
	
	// 검색
	@GetMapping(value = "store/find.do", produces = "text/plain;charset=UTF-8")// JSON
	public String store_find(String ss, String page, String sc_no) {
		String result = "";
		try {
			if(page == null) {
				page = "1";
			}
			if(ss == null) {
				ss = "선물";
			}
			
			int curpage = Integer.parseInt(page);
			int rowSize = 12;
			int start = (rowSize*curpage)-(rowSize-1);
			int end = rowSize*curpage;
			
			Map map = new HashMap();
			map.put("start", start);
			map.put("end", end);
			map.put("title", ss);
			
			List<StoreVO> list = dao.storeFindData(map);
			
			//======= 긴 글자 자르기
			for(StoreVO vo:list)
			{
				String s = vo.getTitle();
				if(s.length() > 20)
				{
					s = s.substring(0, 20) + "....";
					vo.setTitle(s);
				}
				vo.setTitle(s);
			}
			
			int totalpage = dao.storeSearchTotalPage(ss);
			
			JSONArray arr = new JSONArray(); // List => [] => 자바스크립트 객체 표현법
			// FoodVO ==> JSONObject => {}
			// [{}, {}, {}, ...]
			
			int k = 0;
			for(StoreVO vo : list) {
				JSONObject obj = new JSONObject(); // {"no":1, "name":"ddd"}
				obj.put("sg_no", vo.getSg_no());
				obj.put("title", vo.getTitle());
				obj.put("img", vo.getImg());
				obj.put("id", vo.getId());
				obj.put("price", vo.getPrice());
				obj.put("rate", vo.getRate());
				obj.put("sponsor", vo.getSponsor());
				
				if(k == 0) {
					obj.put("curpage", curpage);
					obj.put("totalpage", totalpage);
				}
				arr.add(obj);
				k++;
			}
			result = arr.toJSONString();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return result;
	}
	
	
	
	// 상세보기
	/*@GetMapping(value = "store/detail.do", produces = "text/plain;charset=UTF-8")
	public String store_detail(int sg_no)
	{
		String result = "";
		
		try
		{
			StoreVO vo = dao.storeDetailData(sg_no);
			JSONObject obj = new JSONObject();
			
			obj.put("sg_no", vo.getSg_no());
			obj.put("title", vo.getTitle());
			obj.put("img", vo.getImg());
			
			result = obj.toJSONString();
			
		}catch(Exception ex) {}
		
		
		return result;
	}*/
}
