package com.vegan.recipe.util;

import org.springframework.web.multipart.MultipartFile;

/*
 create table vegan_Upload(
	img_no int(30) AUTO_INCREMENT PRIMARY KEY not null,
    board_no int(30),
    imgPath varchar(100)
);

 */
public class uploadVO {
	
	private String name;
	private MultipartFile file;

	
}
