package com.vegan.recipe.recom;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
 create table Vegan_recom (
recom_no int(10) AUTO_INCREMENT PRIMARY KEY not null,
cno int(10),
recom_id varchar(20),
recom_content varchar(1000),
recom_regDate TIMESTAMP DEFAULT NOW()
);
 */
@Setter
@Getter
@ToString
public class RecomVO {
	
	private int recom_no;
	private int cno;
	private String recom_id;
	private String recom_content;
	private Timestamp recom_regDate;
	
	
}
