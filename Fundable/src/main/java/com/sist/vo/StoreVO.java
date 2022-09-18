package com.sist.vo;

import java.sql.Date;

import lombok.Getter;
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
public class StoreVO {

	private int sg_no, price, success, sponsor, stock, sc_no, user_no, hit;
	private double rate;
	private String title, img, sub_img, id;
	private Date open_date;
}
