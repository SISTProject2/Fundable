package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.sist.dao.*;
import com.sist.vo.StoreVO;
import com.sist.vo.UserVO;
import com.sist.vo.*;

@Controller
public class StoreController {
	
	@Autowired
	private StoreDAO dao;
	
	@Autowired
	private UserDAO udao;
	
	@Autowired
	private CommentDAO cdao;
	
	//===========
	
	
	// 목록 페이지
	@GetMapping("store/list.do") // list.do로 모든 목록 페이지 처리
	public String store_list(String page, String sc_no, String no, Model model)
	{
		if(page == null)
			page = "1";
		
		
		
		//===== sort
		if(no == null)
			no = "1";
		
		String column = "";
		
		if(Integer.parseInt(no) == 1) // 인기 순
			column = "rate DESC NULLS LAST";      
		if(Integer.parseInt(no) == 2) // 서포터 많은 순
			column = "sponsor DESC NULLS LAST";      
	    if(Integer.parseInt(no) == 3) // 최신 순
	        column = "open_date DESC";
	    if(Integer.parseInt(no) == 4) // 가격 높은 순
	        column = "price DESC";
	    if(Integer.parseInt(no) == 5) // 가격 낮은 순
	    	column = "price ASC";

		int curpage = Integer.parseInt(page);
		
		Map map = new HashMap();
		
		int rowSize = 12; // 페이지 당 출력 상품 수
		int start = (rowSize*curpage)-(rowSize-1);
		int end = rowSize*curpage;
		
		map.put("start", start);
		map.put("end", end);
		map.put("no", no);
		map.put("column", column);
		
		List<StoreVO> list = dao.storeListData(map);
		
		
		
		//======= 긴 글자 자르기
		for(StoreVO vo:list)
		{
			String s = vo.getTitle();
			if(s.length() > 18)
			{
				s = s.substring(0, 18) + "....";
				vo.setTitle(s);
			}
			vo.setTitle(s);
		}
		
		
		
		//===== 총 페이지
		int totalpage = dao.storeTotalPage(map);
		
		
		
		//===== 페이지 블럭 나누기
		final int BLOCK = 10;
		int startPage = ((curpage-1)/BLOCK*BLOCK)+1;
		int endPage = ((curpage-1)/BLOCK*BLOCK)+BLOCK;
		
		if(endPage > totalpage)
			endPage = totalpage;
		
		
		model.addAttribute("curpage", curpage);
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("no", no);
		model.addAttribute("column", column);

		model.addAttribute("list", list);
		model.addAttribute("store_main_jsp", "../store/list.jsp");

		
		return "store/store_main";
	}
	
	
	
	
	
	
	// 카테고리 페이지
	@GetMapping("store/list_category.do") // list.do로 모든 목록 페이지 처리
	public String store_list_category(String page, String no, String sc_no, Model model)
	{
		if(page == null)
			page = "1";
		
		if(sc_no == null)
			sc_no = "1";
		
		//===== sort
		if(no == null)
			no = "2";
		
		String column = "";
		
		if(Integer.parseInt(no) == 1) // 인기 순
			column = "rate DESC NULLS LAST";      
		if(Integer.parseInt(no) == 2) // 서포터 많은 순
			column = "sponsor DESC NULLS LAST";      
	    if(Integer.parseInt(no) == 3) // 최신 순
	        column = "open_date DESC";
	    if(Integer.parseInt(no) == 4) // 가격 높은 순
	        column = "price DESC";
	    if(Integer.parseInt(no) == 5) // 가격 낮은 순
	    	column = "price ASC";
		
		
	    //===== 페이지 별 헤더 단어
	    String title = "";
	    
	    if(Integer.parseInt(sc_no) == 1)
	    	title = "문구";
	    if(Integer.parseInt(sc_no) == 2)
	    	title = "푸드";
	    if(Integer.parseInt(sc_no) == 3)
	    	title = "출판";
	    if(Integer.parseInt(sc_no) == 4)
	    	title = "반려 동물";
	    
	    
		int curpage = Integer.parseInt(page);
		
		Map map = new HashMap();
		
		int rowSize = 12; // 페이지 당 출력 상품 수
		int start = (rowSize*curpage)-(rowSize-1);
		int end = rowSize*curpage;
		
		map.put("start", start);
		map.put("end", end);
		map.put("sc_no", sc_no);
		map.put("no", no);
		map.put("column", column);
		
		List<StoreVO> list = dao.storeCategoryListData(map);
		
		
		
		//======= 긴 글자 자르기
		for(StoreVO vo:list)
		{
			String s = vo.getTitle();
			if(s.length() > 18)
			{
				s = s.substring(0, 18) + "....";
				vo.setTitle(s);
			}
			vo.setTitle(s);
		}
		
		
		
		//===== 총 페이지
		int totalpage = dao.storeCategoryTotalPage(map);
		
		
		
		//===== 페이지 블럭 나누기
		final int BLOCK = 10;
		int startPage = ((curpage-1)/BLOCK*BLOCK)+1;
		int endPage = ((curpage-1)/BLOCK*BLOCK)+BLOCK;
		
		if(endPage > totalpage)
			endPage = totalpage;
		
		
		model.addAttribute("curpage", curpage);
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("sc_no", sc_no);
		model.addAttribute("title", title);
		model.addAttribute("no", no);
		model.addAttribute("column", column);
		
		model.addAttribute("list", list);
		model.addAttribute("store_main_jsp", "../store/list_category.jsp");
		
		
		return "store/store_main";
	}
	
	
	
	// 쿠키 저장
	@GetMapping("store/detail_before.do")
	public String store_detail_before(int sg_no, int sc_no, HttpServletResponse response)
	{
		Cookie cookie = new Cookie("store" + sg_no, String.valueOf(sg_no));
		cookie.setPath("/");
		cookie.setMaxAge(60*60*24); // 24시간 유지
		response.addCookie(cookie);
		
		return "redirect: detail.do?sg_no=" + sg_no + "&sc_no=" + sc_no;
	}
	
	
	// 쿠키 삭제 (상품 하나)
	@GetMapping("store/cookie_delete.do")
	public String store_cookie_delete(int sg_no, HttpServletRequest request, HttpServletResponse response)
	{
		Cookie[] cookies = request.getCookies();
		for(int i=0; i<cookies.length; i++)
		{
			if(cookies[i].getName().equals("store" + sg_no))
			{
				cookies[i].setPath("/");
				cookies[i].setMaxAge(0);
				response.addCookie(cookies[i]);
				
				break;
			}
		}
		return "redirect: ../mypage/recently_viewed.do";
	}
	
	
	// 쿠키 전체 삭제
	@GetMapping("store/cookie_all_delete.do")
	public String store_cookie_all_delete(HttpServletRequest request, HttpServletResponse response)
	{
		Cookie[] cookies = request.getCookies();
		for(int i=0; i<cookies.length; i++)
		{
			if(cookies[i].getName().startsWith("store"))
			{
				cookies[i].setPath("/");
				cookies[i].setMaxAge(0);
				response.addCookie(cookies[i]);
			}
		}
		return "redirect: ../mypage/recently_viewed.do";
	}
	
	
	
	// 상세 페이지
	@GetMapping("store/detail.do")
	public String store_detail(CommentVO vo2, String page, int sg_no, String sc_no, String s_no, Model model)
	{
		if(sc_no == null)
			sc_no = "1";
		
		//=== 댓글 목록
		if(page == null)
			page = "1";
		
		int curpage= Integer.parseInt(page);
		
		Map map = new HashMap();
		//map.put("sc_no", sc_no);
		map.put("start", (curpage*5)-4);
		map.put("end", curpage*5);
		map.put("sg_no", sg_no);
		
		int rowSize = 5;
		int start = (rowSize*curpage)-(rowSize-1);
		int end = rowSize*curpage;
		
		// 댓글 목록
		List<CommentVO> list = cdao.commentListData(map);
		
		// 댓글 총 페이지
		int totalpage = cdao.commentTotalPage(sg_no);
		
		
		// 블록 나누기
		final int BLOCK = 5;
		int startPage = ((curpage-1) / BLOCK*BLOCK)+1;
		int endPage = ((curpage-1)/BLOCK*BLOCK) + BLOCK;
		
		if(endPage > totalpage) endPage = totalpage;
		
		model.addAttribute("curpage", curpage);
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("list", list);
		model.addAttribute("sc_no", sc_no);
		
		
		
		//== id 가져오기 => 댓글 작성자
		/*
		 * String id = cdao.idSelectData(vo2.getUser_no()); model.addAttribute("id",
		 * id);
		 */
		
		
		
		
		
		
		StoreVO vo = dao.storeDetailData(sg_no);
		model.addAttribute("vo", vo);
		
		
		//===== 비슷한 프로젝트
		int ss = vo.getSc_no();
		
		List<StoreVO> rList = dao.storeSimilarProject(Integer.parseInt(sc_no));
		
		
		//====== 긴 글자 자르기
		/*for(StoreVO vo2:rList)
		{
			String s = vo2.getTitle();
			if(s.length() > 18)
			{
				s = s.substring(0, 18) + "....";
				vo2.setTitle(s);
			}
			vo2.setTitle(s);
		}*/
		
		//===== 카테고리 단어
	    String title = "";
	    
	    if(Integer.parseInt(sc_no) == 1)
	    	title = "문구";
	    if(Integer.parseInt(sc_no) == 2)
	    	title = "푸드";
	    if(Integer.parseInt(sc_no) == 3)
	    	title = "출판";
	    if(Integer.parseInt(sc_no) == 4)
	    	title = "반려 동물";
	    
	    
	    int sc_no2 = cdao.storeGetScno(vo.getSg_no());
		model.addAttribute("sc_no2", sc_no2);
	    
		
	    model.addAttribute("title", title);
		model.addAttribute("rList", rList);
		model.addAttribute("store_main_jsp", "../store/detail.jsp");
		
		return "store/store_main";
	}
	
	
	
	// 베스트 TOP 15
	 @GetMapping("store/best.do") 
     public String store_best(Model model, String sc_no)
     {
		 Map map = new HashMap();
		 
		 List<StoreVO> slist = dao.storeBest(map);
		 
		 
		//======= 긴 글자 자르기
		for(StoreVO vo:slist)
		{
			String s = vo.getTitle();
			if(s.length() > 20)
			{
				s = s.substring(0, 20) + "....";
				vo.setTitle(s);
			}
			vo.setTitle(s);
		}
		
		/*
		 * List<StoreVO> vo = dao.storeBest(map);
		 * 
		 * String id = dao.IdSelectData(((StoreVO) vo).getUser_no());
		 * model.addAttribute("id", id);
		 */
		
		model.addAttribute("slist", slist);
		model.addAttribute("store_main_jsp", "../store/best.jsp");

    	return "store/store_main";
     }
	 
	 @GetMapping("store/find.do")
	 public String store_find(Model model)
	 {
		 model.addAttribute("store_main_jsp", "../store/find.jsp");

    	 return "store/store_main";
	 }
	 
	 
	 
	 
	 // 결제
	 @GetMapping("store/pay.do")
	 public String store_pay(int sg_no, Model model, HttpSession session, HttpServletRequest request)
	 {
		// 미로그인시 로그인 창으로 redirect
		if(request.getSession().getAttribute("user_no") == null) {
			return "user/login";
		}
		
		 
		 // id 세션 가져와서
		String id = (String)session.getAttribute("id");
		UserVO uvo = udao.userData(id); // 해당 id의 모든 유저 데이터 불러오고 uvo 변수에 담는다
		
		StoreVO vo = dao.payInfo(sg_no); // 상품 정보 불러와서 vo 변수에 담는다
		model.addAttribute("vo", vo);
		 
		model.addAttribute("uvo", uvo);
		model.addAttribute("store_main_jsp", "../store/pay.jsp");
		 
		return "store/store_main";
	 }
	 
	 
	 
	 
	 
	 
	 
	 
	 // 검색
	 /*@RequestMapping("store/find.do")
	 public String store_find(String page, String no, String ss, Model model)
	 {
		 if(ss == null)
			 ss = "";
		 
		 if(page == null)
			 page = "1";
		 
		//===== sort
		if(no == null)
			no = "2";
		
		String column = "";
		
		if(Integer.parseInt(no) == 1) // 인기 순
			column = "rate DESC NULLS LAST";      
		if(Integer.parseInt(no) == 2) // 서포터 많은 순
			column = "sponsor DESC NULLS LAST";      
	    if(Integer.parseInt(no) == 3) // 최신 순
	        column = "open_date DESC";
	    if(Integer.parseInt(no) == 4) // 가격 높은 순
	        column = "price DESC";
	    if(Integer.parseInt(no) == 5) // 가격 낮은 순
	    	column = "price ASC";
		 
		 int curpage = Integer.parseInt(page);
			
		 Map map = new HashMap();
		
		 int rowSize = 12; // 페이지 당 출력 상품 수
		 int start = (rowSize*curpage)-(rowSize-1);
		 int end = rowSize*curpage;
		
		 map.put("start", start);
		 map.put("end", end);
		 map.put("title", ss);
		 map.put("no", no);
		 map.put("column", column);
		
		 List<StoreVO> flist = dao.storeFindData(map);
		
		
		
		 //======= 긴 글자 자르기
		 for(StoreVO vo:flist)
		 {
			 String s = vo.getTitle();
			 if(s.length() > 20)
			 {
				 s = s.substring(0, 20) + "....";
				 vo.setTitle(s);
			 }
			 vo.setTitle(s);
		 }
		
		
		
		 //===== 총 페이지
		 int totalpage = dao.storeSearchTotalPage(ss);
		
		
		
		 //===== 페이지 블럭 나누기
		 final int BLOCK = 10;
		 int startPage = ((curpage-1)/BLOCK*BLOCK)+1;
		 int endPage = ((curpage-1)/BLOCK*BLOCK)+BLOCK;
		
		 if(endPage > totalpage)
			 endPage = totalpage;
		
		
		 model.addAttribute("curpage", curpage);
		 model.addAttribute("totalpage", totalpage);
		 model.addAttribute("startPage", startPage);
		 model.addAttribute("endPage", endPage);
		 model.addAttribute("ss", ss);
		 model.addAttribute("no", no);
		 model.addAttribute("column", column);

		 model.addAttribute("flist", flist);
		 model.addAttribute("store_main_jsp", "../store/find.jsp");
	 
		 
		 
		 return "store/store_main";
	 }*/
}
