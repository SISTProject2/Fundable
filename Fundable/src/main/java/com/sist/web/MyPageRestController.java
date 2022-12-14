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
import com.sist.dao.MyPageDAO;
import com.sist.vo.*;

@RestController
public class MyPageRestController {
	@Autowired
	private MyPageDAO dao;
	
	@Autowired
	private FundingGoodsDAO fdao;
	
	@GetMapping(value = "mypage/profile.do", produces = "text/plain;charset=utf-8")
	public String mypage_profile(HttpSession session) {
		String id=(String) session.getAttribute("id");
		UserVO vo=dao.mypageProfile(id);
		
		String result="";
		try {
			JSONObject obj=new JSONObject();
			obj.put("user_no", vo.getUser_no());
			obj.put("id", vo.getId());
			obj.put("name", vo.getName());
			obj.put("email", vo.getEmail());
			obj.put("tel", vo.getTel());
			if (vo.getCard_number()!=null) {
				obj.put("card_number", "************"+vo.getCard_number().substring(15,19));
			} else {
				obj.put("card_number", vo.getCard_number());
			}
			obj.put("card_date", vo.getCard_date());
			obj.put("bank_name", vo.getBank_name());
			obj.put("zipcode", vo.getZipcode());
			obj.put("addr", vo.getAddr());
			
			result=obj.toJSONString();
		} catch(Exception ex) {}
		
		return result;
		
	}
	
	@GetMapping(value = "mypage/project.do", produces = "text/plain;charset=utf-8")
	public String mypage_project(String page, HttpSession session) {
		
		String result="";
		try {
			int user_no=(int) session.getAttribute("user_no");
			if(page==null)
				page="1";
			int curpage=Integer.parseInt(page);
			Map map=new HashMap();
			int rowSize=5;
			int start=(rowSize*curpage)-(rowSize-1);
			int end=rowSize*curpage;
			
			map.put("start", start);
			map.put("end", end);
			map.put("user_no", user_no);
			
			List<FundingGoodsVO> list=dao.mypageProject(map);
			int totalpage=dao.mypageProjectTotalPage(user_no);
			int count=dao.mypageProjectCount(user_no);
			
			JSONArray arr=new JSONArray();
			
			int k=0;
			for(FundingGoodsVO vo:list) {
				JSONObject obj=new JSONObject();
				obj.put("fg_no", vo.getFg_no());
				obj.put("title", vo.getTitle());
				obj.put("img", vo.getImg());
				obj.put("fc_no", vo.getFc_no());
				obj.put("goal_amount", vo.getGoal_amount());
				obj.put("close_date", vo.getDbday());
				
				if(k==0) {
					obj.put("curpage", curpage);
					obj.put("totalpage", totalpage);
					obj.put("count", count);
					System.out.println("curpage="+curpage);
				}
				
				arr.add(obj);
				k++;
			}
			
			if (list.size()==0) {
				JSONObject obj=new JSONObject();
				obj.put("curpage", 0);
				obj.put("totalpage", 0);
				obj.put("count", 0);
				
				arr.add(obj);
			}
			
			result=arr.toJSONString();
		} catch(Exception ex) {}
		
		return result;
	}
	
	@GetMapping(value = "mypage/paying.do", produces = "text/plain;charset=utf-8")
	public String mypage_paying(HttpSession session) {
		String result="";
		
		try {
			int user_no=(int) session.getAttribute("user_no");
			
			List<PayHistoryVO> list=dao.mypagePaying(user_no);
			int count=dao.mypagePayingCount(user_no);
			
			JSONArray arr=new JSONArray();
			
			int k=0;
			
			for(PayHistoryVO vo:list) {
				JSONObject obj=new JSONObject();
				FundingGoodsVO fvo=dao.fundingData(vo.getFg_no());
				obj.put("ph_no", vo.getPh_no());
				obj.put("rgdate", vo.getRgday());
				obj.put("ph_price", vo.getPh_price());
				obj.put("expect_pay", vo.getEpday());
				obj.put("user_no", vo.getUser_no());
				obj.put("fg_no", vo.getFg_no());
				obj.put("title", fvo.getTitle());
				obj.put("img", fvo.getImg());
				obj.put("fc_no", fvo.getFc_no());
				
				if(k==0) {
					obj.put("count", count);
				}
				
				arr.add(obj);
				k++;
			}
			
			result=arr.toJSONString();
		} catch(Exception ex) {}
		
		return result;
	}

	@GetMapping(value = "mypage/payingfin.do", produces = "text/plain;charset=utf-8")
	public String mypage_payingfin(HttpSession session) {
		String result="";
		
		try {
			int user_no=(int) session.getAttribute("user_no");
			
			List<PayHistoryVO> list=dao.mypagePayingFin(user_no);
			int count=dao.mypagePayingFinCount(user_no);
			
			JSONArray arr=new JSONArray();
			
			int k=0;
			
			for(PayHistoryVO vo:list) {
				JSONObject obj=new JSONObject();
				FundingGoodsVO fvo=dao.fundingData(vo.getFg_no());
				obj.put("ph_no", vo.getPh_no());
				obj.put("rgdate", vo.getRgday());
				obj.put("ph_price", vo.getPh_price());
				obj.put("expect_pay", vo.getEpday());
				obj.put("dbday", vo.getDbday());
				obj.put("user_no", vo.getUser_no());
				obj.put("fg_no", vo.getFg_no());
				obj.put("title", fvo.getTitle());
				obj.put("img", fvo.getImg());
				obj.put("fc_no", fvo.getFc_no());
				
				if(k==0) {
					obj.put("count", count);
				}
				
				arr.add(obj);
				k++;
			}
			
			result=arr.toJSONString();
		} catch(Exception ex) {}
		
		return result;
	}

	@GetMapping(value = "mypage/bell.do", produces = "text/plain;charset=utf-8")
	public String mypage_bell(HttpSession session) {
		String result="";
		
		try {
			int user_no=(int) session.getAttribute("user_no");
			
			List<LikeVO> list=dao.mypageBell(user_no);
			int count=dao.mypageBellCount(user_no);
			
			JSONArray arr=new JSONArray();
			
			int k=0;
			
			for(LikeVO vo:list) {
				JSONObject obj=new JSONObject();
				FundingGoodsVO fvo=dao.fundingData(vo.getFg_no());
				obj.put("like_no", vo.getLike_no());
				obj.put("user_no", vo.getUser_no());
				obj.put("fg_no", vo.getFg_no());
				obj.put("fc_no", fvo.getFc_no());
				obj.put("title", fvo.getTitle());
				obj.put("img", fvo.getImg());
				obj.put("dbday", fvo.getDbday());
				String category=fdao.fundingCategoryData(fvo.getFc_no());
				obj.put("category", category);
				String id=fdao.fundingIdData(fvo.getUser_no());
				obj.put("id", id);
				int bellcount=fdao.fundingBell(fvo.getFg_no());
				obj.put("bellcount", bellcount);
				
				int bell=fdao.fundingBellCount(vo);
				obj.put("bell", bell);
				
				if(k==0) {
					obj.put("count", count);
				}
				
				arr.add(obj);
				k++;
			}
			
			result=arr.toJSONString();
		} catch(Exception ex) {}
		
		return result;
	}

	@GetMapping(value = "mypage/like.do", produces = "text/plain;charset=utf-8")
	public String mypage_like(HttpSession session) {
		String result="";
		
		try {
			int user_no=(int) session.getAttribute("user_no");
			
			List<LikeVO> list=dao.mypageLike(user_no);
			int count=dao.mypageLikeCount(user_no);
			
			JSONArray arr=new JSONArray();
			
			int k=0;
			
			for(LikeVO vo:list) {
				JSONObject obj=new JSONObject();
				FundingGoodsVO fvo=dao.fundingData(vo.getFg_no());
				obj.put("like_no", vo.getLike_no());
				obj.put("user_no", vo.getUser_no());
				obj.put("fg_no", vo.getFg_no());
				obj.put("fc_no", fvo.getFc_no());
				obj.put("title", fvo.getTitle());
				obj.put("img", fvo.getImg());
				obj.put("left_day", fvo.getLeftday());
				obj.put("now_amount", fvo.getNow_amount());
				obj.put("rate", fvo.getRate());
				String category=fdao.fundingCategoryData(fvo.getFc_no());
				obj.put("category", category);
				String id=fdao.fundingIdData(fvo.getUser_no());
				obj.put("id", id);
				
				if(k==0) {
					obj.put("count", count);
				}
				
				arr.add(obj);
				k++;
			}
			
			result=arr.toJSONString();
		} catch(Exception ex) {}
		
		return result;
	}
}
