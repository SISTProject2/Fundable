package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class MainController {

    
    @GetMapping("main/main.do") 
    public String main_main(Model model)
    {

    	model.addAttribute("main_jsp", "../main/home.jsp");
    	return "main/main";
    }
    
    @GetMapping("store/store_main.do") 
    public String store_main(Model model)
    {
    	
    	model.addAttribute("store_main_jsp", "../store/store_home.jsp");
    	return "store/store_main";
    }
    
}
