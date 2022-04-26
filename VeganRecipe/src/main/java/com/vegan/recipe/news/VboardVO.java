package com.vegan.recipe.news;
/*
create table Vegan_board (
Vboard_no int(10) AUTO_INCREMENT PRIMARY KEY not null,
Vboard_title varchar(20) not null,
Vboard_writer varchar(20) not null,
Vboard_content varchar(2000) not null,
Vboard_hit int(20),
Vboard_like int(20),
Vboard_type int(30),
Vboard_Regdate TIMESTAMP DEFAULT NOW()
);

 */

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

// 뉴스테이블이랑 레시피 테이블에 쓰일꺼임
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor

public class VboardVO {
	
	private int Vboard_no;
	private String Vboard_title;
	private String Vboard_writer;
	private String Vboard_content;
	private int Vboard_hit;
	private int Vboard_like;
	private int Vboard_type;
	private Timestamp Vboard_Regdate;
	private String filename;
	private String fileloca;
	private String filerealname;
	private String uploadpath;
	private String file;
}
