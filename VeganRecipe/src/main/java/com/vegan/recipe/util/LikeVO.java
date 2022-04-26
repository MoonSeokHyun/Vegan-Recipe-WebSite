package com.vegan.recipe.util;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
 	create table vegan_like(
	like_no int(30) AUTO_INCREMENT PRIMARY KEY not null,
    board_no int(30),
    user_no int(30),
    likeNum int(5)
);
 */

@Getter
@Setter
@ToString
public class LikeVO {
	private int like_no;
	private int board_no;
	private String user_no;
	private int freeboard_like;
	private int like_type;
}
