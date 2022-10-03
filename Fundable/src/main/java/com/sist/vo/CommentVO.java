package com.sist.vo;

/*
SC_NO      NOT NULL NUMBER         
CONTENT    NOT NULL CLOB           
C_DATE     NOT NULL DATE           
IMG                 VARCHAR2(2000) 
USER_NO    NOT NULL NUMBER         
SG_NO      NOT NULL NUMBER         
GROUP_ID            NUMBER         
GROUP_STEP          NUMBER         
GROUP_TAB           NUMBER         
ROOT                NUMBER         
DEPTH               NUMBER
 */

import java.util.*;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CommentVO {

	private int s_no, user_no, sg_no, group_id, group_step, group_tab, root, depth;
	private String img, id, dbday, content;
	private Date c_date;
}
