package com.vegan.recipe.commnet;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
create table Vegan_Comment (
comment_no int(10) AUTO_INCREMENT PRIMARY KEY not null,
bno int(10),
commnet_id varchar(20),
commnet_content varchar(1000),
Comment_regDate TIMESTAMP DEFAULT NOW()
);
 */
@Getter
@Setter
@ToString
public class CommentVO {
	
	private int comment_no;
	private int bno;
	private String commnet_id;
	private String commnet_content;
	private Timestamp Comment_regDate;
	private int comment_type;
	
//	나중애 conmment_type으로 돌려쓸거임 ex) where bno = 1 and commnet_tpye = 1 이런식으로 1-1 0-1 2-1 매칭
}
