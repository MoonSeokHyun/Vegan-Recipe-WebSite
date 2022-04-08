package com.vegan.recipe.user.common;
/*
create table Vegan_user (
user_id varchar(20),
user_name varchar(20),
user_pw varchar(100),
user_email varchar(20),
user_addr1 varchar(20),
user_addr2 varchar(20),
user_pass int(10),
primary key(user_id)
);
*/

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserVO {
	
	private String user_id;
	private String user_name;
	private String user_pw;
	private String user_email;
	private String user_addr1;
	private String user_addr2;
	private int user_pass;
}
