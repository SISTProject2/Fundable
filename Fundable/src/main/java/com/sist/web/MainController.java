package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sist.dao.*;
import com.sist.vo.*;


@Controller
public class MainController {

	@Autowired
	private MainDAO dao;
	
	@Autowired
	private StoreDAO sdao;
	//==
	
    
	@GetMapping("main/main.do") 
	public String main_main(Model model)
	{
		
		model.addAttribute("main_jsp", "../funding/list.jsp");
		return "main/main";
	}
	
    @GetMapping("main/main2.do") 
    public String main_main2(Model model)
    {

    	model.addAttribute("main_jsp", "../funding/list.jsp");
    	return "main/main2";
    }
    
    @GetMapping("store/store_main.do") 
    public String store_main(Model model, String sc_no)
    {
    	// List<StoreVO> list = dao.storeListData(map);
    	Map map = new HashMap();
    	List<StoreVO> list = dao.mainStaioneryListData(map);
    	List<StoreVO> list2 = dao.mainFoodListData(map);
    	List<StoreVO> list3 = dao.mainBookListData(map);
    	List<StoreVO> list4 = dao.mainPetListData(map);
    	
    	model.addAttribute("list", list);
    	model.addAttribute("list2", list2);
    	model.addAttribute("list3", list3);
    	model.addAttribute("list4", list4);
    	
    	
    	//== 인기상품
    	
    	Map map2 = new HashMap();
		 
		 List<StoreVO> slist = sdao.storeBest(map);
		 
		 
		//== 긴 글자 자르기
		for(StoreVO vo:slist)
		{
			String s = vo.getTitle();
			if(s.length() > 37)
			{
				s = s.substring(0, 37) + "....";
				vo.setTitle(s);
			}
			vo.setTitle(s);
		}
		
		model.addAttribute("slist", slist);
    	
    	
    	model.addAttribute("store_main_jsp", "../store/store_home.jsp");
    	
    	return "store/store_main";
    }
    
}
