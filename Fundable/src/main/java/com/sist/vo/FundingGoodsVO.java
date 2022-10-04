package com.sist.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.sist.web.FundingRegisterController;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/*
 * 	FG_NO       NOT NULL NUMBER         
	TITLE       NOT NULL VARCHAR2(500)  
	IMG         NOT NULL VARCHAR2(2000) 
	SUB_IMG     NOT NULL VARCHAR2(2000) 
	PRICE       NOT NULL NUMBER         
	CONTENT     NOT NULL CLOB           
	GOAL_AMOUNT NOT NULL NUMBER         
	NOW_AMOUNT           NUMBER         
	OPEN_DATE   NOT NULL DATE           
	CLOSE_DATE  NOT NULL DATE           
	SPONSOR              NUMBER         
	LIKE_COUNT           NUMBER         
	FC_NO       NOT NULL NUMBER         
	USER_NO     NOT NULL NUMBER   
 */

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class FundingGoodsVO {
	private int fg_no, price, goal_amount, now_amount, sponsor, like_count, fc_no, user_no, leftday, rate;
	private String title, img, sub_img, content, dbday, category, id;
	private Date open_date, close_date;


	public FundingGoodsVO(FundingRegisterController.FundingForm form, int user_no) throws  ParseException {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		this.title = form.getTitle();
		this.img = form.getImg();
		this.price = form.getPrice();
		this.goal_amount = form.getGoal_amount();
		this.close_date =  format.parse(form.getClose_date());
		this.open_date = format.parse(form.getOpen_date());
		this.content = form.getContent();
		this.sub_img = form.getSub_img();
		this.fc_no = form.getFc_no();
		this.user_no=user_no;
	}

	public void setCategory() {
		if (this.fc_no == 1) {
			this.category="문구";
		} else if (this.fc_no == 2) {
			this.category="푸드";
		} else if (this.fc_no == 3) {
			this.category = "출판";
		} else {
			this.category = "반려동물";
		}

	}
}
