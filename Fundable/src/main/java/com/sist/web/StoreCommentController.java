package com.sist.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.CommentDAO;
import com.sist.vo.CommentVO;
import com.sist.vo.StoreVO;

@Controller
public class StoreCommentController {

	
	 @Autowired
	 private CommentDAO cdao;
	 //==
	
	
	 // 작성 처리
	 @PostMapping("store/insert_ok.do")
	 public String comment_insert_ok(CommentVO vo, int sc_no, Model model, HttpSession session)
	 {	
		 int user_no = (int)(session.getAttribute("user_no"));
		 vo.setUser_no(user_no);	 

		 
		 cdao.commentInsert(vo);
		 
		 
		 
		 return "redirect: detail.do?sg_no=" + vo.getSg_no() + "&sc_no=" + sc_no;
	 }
	 
	 
	 
	 // 수정 처리
	 @PostMapping("store/update_ok.do")
	 public String comment_update_ok(CommentVO vo, int sc_no, Model model, HttpSession session)
	 {
		 System.out.println(vo.getContent());
		 System.out.println(vo.getS_no());
		 System.out.println("1111111111111");
		 cdao.commentUpdate(vo); 
		 
		 
		 return "redirect: detail.do?sg_no=" + vo.getSg_no() + "&sc_no=" + sc_no;
		 
	 }
	 
	 
	 
	 
	 // 삭제 처리
	 @RequestMapping("store/delete_ok.do")
	 public String comment_delete_ok(int s_no, int sg_no, int sc_no)
	 { 
		 
		 cdao.commentDelete(s_no); 
		 
		 return "redirect: detail.do?sg_no=" + sg_no + "&sc_no=" + sc_no;
	 }
}
