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
SG_NO     NOT NULL NUMBER         
TITLE     NOT NULL VARCHAR2(300)  
PRICE     NOT NULL NUMBER         
IMG       NOT NULL VARCHAR2(2000) 
SUB_IMG   NOT NULL VARCHAR2(2000) 
SUCCESS   NOT NULL NUMBER         
SPONSOR            NUMBER         
RATE               NUMBER         
OPEN_DATE NOT NULL DATE           
STOCK              NUMBER         
SC_NO     NOT NULL NUMBER         
USER_NO   NOT NULL NUMBER 
 */

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class StoreVO {

	private int sg_no, success, sponsor, stock, sc_no, user_no, hit;
	private double rate;
	private String title, img, sub_img, id, price, email, tel, name, addr, addr_detail, card_number, card_date;
	private Date open_date;

	public StoreVO(FundingRegisterController.StoreForm form, int user_no) throws ParseException {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		this.title = form.getTitle();
		this.img = form.getImg();
		this.price = form.getPrice();
		this.success = form.getGoal_amount();
		this.open_date = format.parse(form.getOpen_date());
		this.sub_img = form.getSub_img();
		this.sc_no = form.getFc_no();
		this.user_no=user_no;
		this.stock=form.getStock();
	}
}
