package com.sist.aop;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.sist.manager.NewsManager;
import com.sist.vo.NewsVO;

@Component
@Aspect
public class FundingAspect {
	@Autowired
	private NewsManager mgr;
	
	@Before("execution(* com.sist.web.*Controller.*(..))") // .. 0이상 "execution(* com.sist.web.*Controller.*(..))"
	public void Side() {
		try {
			HttpServletRequest request=((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
			// task
			String json=mgr.newsFind("크라우드 펀딩");
			JSONParser jp=new JSONParser();
			JSONObject obj=(JSONObject)jp.parse(json);
			JSONArray arr=(JSONArray)obj.get("items");
			
			List<NewsVO> newsList=new ArrayList<NewsVO>();
			for(int i=0; i<10; i++) {
				NewsVO vo=new NewsVO();
				JSONObject o=(JSONObject)arr.get(i);
				String t=(String)o.get("title");
//				if(t.length()>13) {
//					t=t.substring(0,13)+"...";
//					System.out.println(t);
//					vo.setTitle(t);
//				}
				vo.setTitle(t);
				vo.setLink((String)o.get("link"));
				newsList.add(vo);
			}
			request.setAttribute("newsList", newsList);
			
			SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.dd HH:mm");
			Date time = new Date();
			String now = format.format(time);
			request.setAttribute("now", now);
			
//			List<GoodsVO> gList=dao.goodsFooterData();
//			for(GoodsVO vo:gList) {
//				String name=vo.getGoods_name();
//				if(name.length()>13) {
//					name=name.substring(0, 13)+"...";
//					vo.setGoods_name(name);
//				}
//				vo.setGoods_name(name);
//			}
//			
//			request.setAttribute("gList", gList);
//			
//			List<BoardVO> boardList=bdao.boardFooterData();
//			for(BoardVO vo:boardList) {
//				String subject=vo.getSubject();
//				if(subject.length()>13) {
//					subject=subject.substring(0, 13)+"...";
//					vo.setSubject(subject);
//				}
//				vo.setSubject(subject);
//			}
//			
//			request.setAttribute("boardList", boardList);
		} catch(Exception ex) {}
	}
}
