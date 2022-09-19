package com.sist.web;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {
	@GetMapping("user/login.do")
	public String user_login(Model model) {
		
		model.addAttribute("main_jsp", "../user/login.jsp");
		
		return "main/main";
	}
	
	@GetMapping("user/logout.do")
	public String user_logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:../main/main.do";
	}
}
