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
import org.springframework.web.bind.annotation.PostMapping;

import com.sist.dao.MyPageDAO;
import com.sist.dao.StoreDAO;
import com.sist.vo.CartVO;
import com.sist.vo.CommentVO;
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
					String sg_no2 = cookies[i].getValue();
					
					// sg_no에 해당하는 데이터 읽기
					StoreVO vo = sdao.storeDetailData(Integer.parseInt(sg_no2));
					slist.add(vo);
				}
			}
		}
		
		model.addAttribute("size", slist.size());
		model.addAttribute("slist", slist);

		return "mypage/recently_viewed";
	}
	
	
	
	// 장바구니
	// session
	@GetMapping("mypage/cart_list.do")
	public String cart_list(String sg_no, HttpSession session, Model model)
	{
		List<CartVO> list = (List<CartVO>)session.getAttribute("cart");
		
		// 데이터 없을 경우 에러 방지
		int size = 0;
		if(list == null)
			size = 0;
		else
			size = list.size();
		
		model.addAttribute("size", size);
		model.addAttribute("list", list);
		model.addAttribute("sg_no", sg_no);
		
		return "mypage/cart";
	}
	
	
	
	// 장바구니에 상품 넣기
	@PostMapping("mypage/session_insert.do")
	public String goods_session_insert(int sg_no, int account, HttpSession session, Model model)
	{
		List<CartVO> list = (List<CartVO>)session.getAttribute("cart");
		
		System.out.println("1111111");
		
		
		// session이  null 값이면
		if(list == null)
		{
			list = new ArrayList<CartVO>(); // 새롭게 생성한다
		}
		System.out.println(list.size());
		
		// session에 저장된 데이터
		StoreVO vo = sdao.storeDetailData(sg_no);
		CartVO cvo = new CartVO();
		cvo.setSg_no(sg_no);
		cvo.setTitle(vo.getTitle());
		cvo.setImg(vo.getImg());
		cvo.setPrice(vo.getPrice());
		cvo.setAccount(account);
		
		
		// 장바구니 중복으로 담기 방지
		boolean bCheck = false;
		for(CartVO avo: list)
		{
			if(avo.getSg_no() == cvo.getSg_no())
			{
				int acc = avo.getAccount() + cvo.getAccount();
				avo.setAccount(acc); // 같은 게 있으면 수량만 증가 시킴
				
				bCheck = true;
				break;
			}
		}
		
		if(bCheck == false) // 같은 게 없으면 그대로 담음
		{
			list.add(cvo);
			session.setAttribute("cart", list);
		}
		
		return "redirect: cart_list.do?sg_no=" + sg_no;
	}
	
	
	
	// 장바구니 삭제 (하나만)
	@GetMapping("mypage/cart_cancel.do")
	public String goods_cart_cancel(int sg_no, HttpSession session)
	{
		List<CartVO> list = (List<CartVO>)session.getAttribute("cart");
		
		for(int i=0; i<list.size(); i++)
		{
			CartVO vo = list.get(i);
			
			if(vo.getSg_no() == sg_no)
			{
				list.remove(i);
				break;
			}
		}
		
		return "redirect: cart_list.do?sg_no=" + sg_no;
	}
	
	
	
	
	// 장바구니 삭제 (전체)
	@GetMapping("mypage/cart_total_delete.do")
	public String cart_total_delete(int sg_no, HttpSession session)
	{
		session.removeAttribute("cart");
		
		return "redirect: cart_list.do?sg_no=" + sg_no;
	}
	
	
	
	// 올린 프로젝트 목록
	@GetMapping("mypage/myproject.do")
	public String mypage_myproject(StoreVO vo, String page, Model model, HttpSession session)
	{
		String id = dao.IdSelectData(vo.getUser_no());
		model.addAttribute("id", id);
		
		int user_no = (int)(session.getAttribute("user_no"));
		
		if(page == null)
			page = "1";
		
		int curpage = Integer.parseInt(page);
		int totalpage = dao.myStoreProjectTotalPage();
		int count = dao.myStoreProjectCount(user_no);
		
		Map map = new HashMap();
		int rowSize = 5;
		int start = (rowSize*curpage)-(rowSize-1);
		int end = rowSize*curpage;
		
		map.put("start", start);
		map.put("end", end);
		map.put("user_no", user_no);
		
		List<StoreVO> list = dao.myProjectList(map);
		
		model.addAttribute("curpage", curpage);
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("list", list);
		model.addAttribute("user_no", user_no);
		model.addAttribute("count", count);
		
		
		return "mypage/myproject";
	}
	
	
	
	// 올린 프로젝트 수정 폼
	@GetMapping("mypage/myproject_update.do")
	public String myproject_update_form(int sg_no, Model model)
	{
		StoreVO vo = dao.myStoreProjectUpdateForm(sg_no);
		
		model.addAttribute("vo", vo);
		
		return "mypage/myproject_update";
	}
	
	
	// 올린 프로젝트 수정 처리
	@PostMapping("mypage/myproject_update_ok.do")
	public String myproject_update_ok(StoreVO vo, Model model)
	{
		dao.myStoreProjectUpdate(vo);
		
		return "redirect: ../mypage/myproject.do";
	}
	
	
	
	// 스토어 삭제
	@GetMapping("mypage/myproject_delete_ok.do")
	public String myproject_delete_ok(int sg_no, Model model)
	{
		dao.myStoreProjectDelete(sg_no);
		
		return "redirect: myproject.do";
	}
	
	
	
	// 올린 댓글
	@GetMapping("mypage/mycomment.do")
	public String mypage_mycomment(CommentVO vo, String page, Model model)
	{
		return "mypage/comment_history";
	}
	
	
	
}