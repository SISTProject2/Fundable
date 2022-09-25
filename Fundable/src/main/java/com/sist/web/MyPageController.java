package com.sist.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sist.dao.MyPageDAO;
import com.sist.dao.StoreDAO;
import com.sist.vo.StoreVO;

@Controller
public class MyPageController {
	@Autowired
	private MyPageDAO dao;
	
	@Autowired
	private StoreDAO sdao;
	//===
	
	
	
	@GetMapping("mypage/mypage.do")
	public String mypage_mypage(Model model, HttpSession session) {
		
		model.addAttribute("main_jsp", "../mypage/mypage.jsp");
		
		return "main/main2";
	}
	
	
	// 최근 본 페이지
	@GetMapping("mypage/recently_viewed.do")
	public String recently_viewed(Model model, HttpServletRequest request)
	{

		// Cookie
		Cookie[] cookies = request.getCookies();
		List<StoreVO> slist = new ArrayList<StoreVO>();
		
		if(cookies != null)
		{
			for(int i = cookies.length-1; i>=0; i--) // 최신부터 출력
			{
				if(cookies[i].getName().startsWith("store"))
				{
					String sg_no = cookies[i].getValue();
					
					// sg_no에 해당하는 데이터 읽기
					StoreVO vo = sdao.storeDetailData(Integer.parseInt(sg_no));
					slist.add(vo);
				}
			}
		}
		model.addAttribute("size", slist.size());
		model.addAttribute("slist", slist);

		return "mypage/recently_viewed";
	}
}
