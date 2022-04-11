package com.vegan.recipe.freeBoard;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
create table Vegan_freeBoard (
freeboard_no int(10) AUTO_INCREMENT PRIMARY KEY not null,
freeboard_title varchar(20) not null,
freeboard_writer varchar(20) not null,
freeboard_content varchar(2000) not null,
freeboard_hit int(20),
freeboard_like int(20),
uploadpath VARCHAR(100) ,
fileloca VARCHAR(100) ,
filename VARCHAR(50) ,
ilerealname VARCHAR(50) ,
freeboard_regDate TIMESTAMP DEFAULT NOW()
);
 */

@Getter
@Setter
@ToString
public class freeboardVO {

	private int freeboard_no;
	private String freeboard_title;
	private String freeboard_writer;
	private String freeboard_content;
	private int freeboard_hit;
	private int freeboard_like;
	private String uploadpath;
	private String fileloca;
	private String filename;
	private String ilerealname; // 파일리얼네임
	private Timestamp freeboard_regDate;
}
