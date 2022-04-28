package com.vegan.recipe.recipe;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.vegan.recipe.news.VboardVO;

@Controller
@RequestMapping("/recipe")
public class recipeController {

	@GetMapping("/recipeList")
	public void recipeList() {
		System.out.println("레시피리스트로 이동");
	}
	
	@GetMapping("/recipeWrite")
	public void recipeWrite() {
		System.out.println("요리등록");
	}
	@PostMapping("/recipeinsert")
	public String insertRecipe(@RequestParam("file1") MultipartFile file , VboardVO vo , HttpServletRequest req, HttpServletResponse resp) {
		
		System.out.println(vo);
		
		System.out.println(file);
		try {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Date date = new Date();
		String fileLoca = sdf.format(date);
		
		String uploadPath = req.getSession().getServletContext().getRealPath("/resources/images/thumbnail");
		
		System.out.println();
		File folder = new File(uploadPath);
		if(!folder.exists()) {
			folder.mkdir(); //폴더가 존재하지 않는다면 생성해라.
		}
		
		String fileRealName = file.getOriginalFilename();
		
		UUID uuid = UUID.randomUUID();
		String uuids = uuid.toString().replaceAll("-", "");
		
		String fileExtension = fileRealName.substring(fileRealName.indexOf("."), fileRealName.length());
		
		System.out.println("저장할 폴더 경로: " + uploadPath);
		System.out.println("실제 파일명: " + fileRealName);
		System.out.println("폴더명: " + fileLoca);
		System.out.println("확장자: " + fileExtension);
		System.out.println("고유랜덤문자: " + uuids);
		
		String fileName = uuids + fileExtension;
		System.out.println("변경해서 저장할 파일명: " + fileName);
		
		File saveFile = new File(uploadPath + "\\" + fileName);
	
			file.transferTo(saveFile);
			
			VboardVO Vvo = new VboardVO(0,vo.getVboard_title(),vo.getVboard_writer(), vo.getVboard_content() , 0, 0, vo.getVboard_type(), null, fileName, fileLoca, fileRealName, uploadPath, null,null,0,0);
			

			} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		
		//service.newsInsert(vo);
		return "redirect:/news/newsList";
		

	}
	
	@GetMapping("/display")
	public ResponseEntity<byte[]> getFile(String fileloca, String filename , HttpServletRequest req, HttpServletResponse resp){
		
		File file = new File(req.getSession().getServletContext().getRealPath("/resources/images/thumbnail"+ "\\" + filename));
		
		ResponseEntity<byte[]> result = null;
		
		try {
		HttpHeaders headers = new HttpHeaders();
	
			headers.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		
	 
		
		return result;
	}
	
}
