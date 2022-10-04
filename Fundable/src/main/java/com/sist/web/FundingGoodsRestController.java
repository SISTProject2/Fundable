package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.FundingGoodsDAO;
import com.sist.vo.FundingGoodsVO;
import com.sist.vo.LikeVO;

@RestController
public class FundingGoodsRestController {
	@Autowired
	private FundingGoodsDAO dao;
	
	@GetMapping(value="funding/soon_list.do", produces = "text/plain;charset=utf-8")
	public String funding_soon_list(String page, int ord, HttpSession session) {
		String[] order_by= {"", "fg_no ASC", "open_date DESC", "like_count DESC"};
		
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
			map.put("order_by", order_by[ord]);
			
			List<FundingGoodsVO> list=dao.fundingSoonListData(map);
			int totalpage=dao.fundingSoonTotalPage();
			int count=dao.fundingSoonCount();
			
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
				
				int bellcount=dao.fundingBell(vo.getFg_no());
				obj.put("bellcount", bellcount);
				
				LikeVO lvo=new LikeVO();
				lvo.setFg_no(vo.getFg_no());
				try {
					lvo.setUser_no((int)session.getAttribute("user_no"));
				} catch(Exception ex) {
					lvo.setUser_no(0);
				}
				int bell=dao.fundingBellCount(lvo);
				obj.put("bell", bell);
				
				if(k==0) {
					obj.put("curpage", curpage);
					obj.put("totalpage", totalpage);
					obj.put("count", count);
					obj.put("ord", ord);
				}
				
				arr.add(obj);
				k++;
			}
			
			result=arr.toJSONString();
		} catch(Exception ex) {}
		
		return result;
	}
	
	@GetMapping(value="funding/list.do", produces = "text/plain;charset=utf-8")
	public String funding_list(String page, int ord) {
		String[] order_by= {"", "fg_no ASC", "open_date DESC", "like_count DESC", "CEIL((now_amount/goal_amount)*100) DESC", "close_date ASC"};
		
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
			map.put("order_by", order_by[ord]);
			
			List<FundingGoodsVO> list=dao.fundingListData(map);
			int totalpage=dao.fundingTotalPage();
			int count=dao.fundingCount();
			
			JSONArray arr=new JSONArray();
			int k=0;
			for(FundingGoodsVO vo:list) {
				JSONObject obj=new JSONObject();
				obj.put("fg_no",  vo.getFg_no());
				obj.put("title", vo.getTitle());
				obj.put("img", vo.getImg());
				obj.put("sponsor", vo.getSponsor());
				obj.put("leftday", vo.getLeftday());
				obj.put("now_amount", vo.getNow_amount());
				obj.put("rate", vo.getRate());
				obj.put("fc_no", vo.getFc_no());
				obj.put("user_no", vo.getUser_no());
				String category=dao.fundingCategoryData(vo.getFc_no());
				obj.put("category", category);
				String id=dao.fundingIdData(vo.getUser_no());
				obj.put("id", id);
				if(k==0) {
					obj.put("curpage", curpage);
					obj.put("totalpage", totalpage);
					obj.put("count", count);
					obj.put("ord", ord);
				}
				arr.add(obj);
				k++;
			}
			result=arr.toJSONString();
			System.out.println(result);
		} catch(Exception ex) {}
		
		return result;
		
	}
	
	@GetMapping(value="funding/cate_list.do", produces = "text/plain;charset=utf-8")
	public String funding_cate_list(String page, int ord, int fc_no) {
		String[] order_by= {"", "open_date ASC", "open_date DESC", "like_count DESC", "CEIL((now_amount/goal_amount)*100) DESC", "close_date ASC"};
		System.out.println("fc_no="+fc_no);
		String result="";
		try {
			if(page==null)
				page="1";
			int curpage=Integer.parseInt(page);
			System.out.println("curpage="+curpage);
			System.out.println("ord="+ord);
			
			Map map=new HashMap();
			int rowSize=12;
			int start=(rowSize*curpage)-(rowSize-1);
			int end=rowSize*curpage;
			map.put("start", start);
			map.put("end", end);
			map.put("fc_no", fc_no);
			map.put("order_by", order_by[ord]);
			
			List<FundingGoodsVO> list=dao.fundingCateList(map);
			System.out.println("flist="+list);
			int totalpage=dao.fundingCateTotalPage(fc_no);
			System.out.println("totalpage"+totalpage);
			int count=dao.fundingCateCount(fc_no);
			System.out.println("count="+count);
			
			JSONArray arr=new JSONArray();
			int k=0;
			for(FundingGoodsVO vo:list) {
				JSONObject obj=new JSONObject();
				obj.put("fg_no",  vo.getFg_no());
				obj.put("title", vo.getTitle());
				obj.put("img", vo.getImg());
				obj.put("sponsor", vo.getSponsor());
				obj.put("leftday", vo.getLeftday());
				obj.put("now_amount", vo.getNow_amount());
				obj.put("rate", vo.getRate());
				obj.put("fc_no", vo.getFc_no());
				obj.put("user_no", vo.getUser_no());
				String category=dao.fundingCategoryData(vo.getFc_no());
				obj.put("category", category);
				String id=dao.fundingIdData(vo.getUser_no());
				obj.put("id", id);
				if(k==0) {
					obj.put("curpage", curpage);
					obj.put("totalpage", totalpage);
					obj.put("count", count);
					obj.put("ord", ord);
				}
				arr.add(obj);
				k++;
			}
			result=arr.toJSONString();
			System.out.println(result);
		} catch(Exception ex) {}
		
		return result;
		
	}
	
	@GetMapping(value="funding/bellOn.do", produces = "text/plain;charset=utf-8")
	public String funding_bellOn(LikeVO vo) {
		String result="";
		dao.fundingBellInsert(vo);
		
		return result;
	}

	@GetMapping(value="funding/bellOff.do", produces = "text/plain;charset=utf-8")
	public String funding_bellOff(LikeVO vo) {
		String result="";
		dao.fundingBellDelete(vo);
		
		return result;
	}
	
}
