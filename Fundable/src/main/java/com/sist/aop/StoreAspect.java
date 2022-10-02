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
import com.sist.manager.StoreNewsManager;
import com.sist.vo.NewsVO;

@Component
@Aspect
public class StoreAspect {
	@Autowired
	private StoreNewsManager mgr;
	
	@Before("execution(* com.sist.web.*Controller.*(..))") // .. 0이상 "execution(* com.sist.web.*Controller.*(..))"
	public void Side() {
		try {
			HttpServletRequest request=((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
			// task
			String json=mgr.newsFind("텀블벅");
			JSONParser jp=new JSONParser();
			JSONObject obj=(JSONObject)jp.parse(json);
			JSONArray arr=(JSONArray)obj.get("items");
			
			List<NewsVO> newsList=new ArrayList<NewsVO>();
			for(int i=0; i<10; i++) {
				NewsVO vo=new NewsVO();
				JSONObject o=(JSONObject)arr.get(i);
				String t=(String)o.get("title");
				String d=(String)o.get("description");
				
				/*if(d.length()>13) {
					d=d.substring(0,13)+"...";
					System.out.println(d);
					vo.setTitle(d);
				}*/
				vo.setTitle(t);
				vo.setDescription(d);
				vo.setLink((String)o.get("link"));
				newsList.add(vo);
			}
			request.setAttribute("newsList", newsList);
			
			SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.dd HH:mm");
			Date time = new Date();
			String now = format.format(time);
			request.setAttribute("now", now);

		} catch(Exception ex) {}
	}
}
