package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.FundingGoodsDAO;
import com.sist.vo.FundingGoodsVO;

@RestController
public class FundingGoodsRestController {
	@Autowired
	private FundingGoodsDAO dao;
	
	@GetMapping(value="funding/list.do", produces = "text/plain;charset=utf-8")
	public String funding_list(String page) {
		String result="";
		try {
			if(page==null)
				page="1";
			int curpage=Integer.parseInt(page);
			
			Map map=new HashMap();
			int rowSize=12;
			int start=(rowSize*curpage)-(rowSize-1);
			int end=rowSize*curpage;
			map.put("start", start);
			map.put("end", end);
			
			List<FundingGoodsVO> list=dao.fundingSoonListData(map);
			int totalpage=dao.fundingSoonTotalPage();
			
			JSONArray arr=new JSONArray();
			
			int k=0;
			for(FundingGoodsVO vo:list) {
				JSONObject obj=new JSONObject();
				obj.put("fg_no", vo.getFg_no());
				obj.put("title", vo.getTitle());
				obj.put("img", vo.getImg());
				obj.put("dbday", vo.getDbday());
				obj.put("fc_no", vo.getFc_no());
				obj.put("user_no", vo.getUser_no());
				String category = dao.fundingCategoryData(vo.getFc_no());
				obj.put("category", category);
				String id=dao.fundingIdData(vo.getUser_no());
				obj.put("id", id);
				if(k==0) {
					obj.put("curpage", curpage);
					obj.put("totalpage", totalpage);
				}
				arr.add(obj);
				k++;
			}
			
			result=arr.toJSONString();
		} catch(Exception ex) {}
		
		return result;
	}
}
