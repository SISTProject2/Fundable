package com.sist.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sist.dao.UserDAO;
import com.sist.vo.UserVO;

@Controller
public class UserController {
	@Autowired
	private UserDAO dao;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@GetMapping("user/login.do")
	public String user_login(Model model) {
		
		model.addAttribute("main_jsp", "../user/login.jsp");
		
		return "main/main2";
	}
	
	@GetMapping("user/logout.do")
	public String user_logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:../main/main2.do";
	}
	
}
