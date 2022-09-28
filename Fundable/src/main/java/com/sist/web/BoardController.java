package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.sist.dao.BoardDAO;
import com.sist.vo.BoardVO;

@Controller
public class BoardController {

	@Autowired
	private BoardDAO dao;
	//==
	
	
	// 목록
	@GetMapping("board/list.do")
	public String board_list(String page, Model model)
	{
		model.addAttribute("main_jsp", "../board/list.jsp");
		
		return "main/main";
	}
	
	
	// 작성 폼
	@GetMapping("board/insert.do")
	public String board_insert(Model model)
	{
		model.addAttribute("main_jsp", "../board/insert.jsp");
		
		return "main/main";
	}
	
	
	// 작성 처리
	@PostMapping("board/insert.do")
	public String board_insert_ok(BoardVO vo)
	{
		
		
		return "redirect: ../board/list.do";
	}
	
	
	// 상세보기 폼
	@GetMapping("board/detail.do")
	public String board_detail(int no, Model model)
	{
		model.addAttribute("main_jsp", "../board/detail.jsp");
		
		return "main/main";
	}
}
