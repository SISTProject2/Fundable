package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserVO {
	private int user_no;
	private String id, pwd, admin, name, email, tel, bday, card_number, card_date, card_pwd, zipcode, addr, addr_detail, bank_name, msg, tel1, tel2, tel3, nowpwd,
					cn1, cn2, cn3, cn4;
}
