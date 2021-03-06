package com.vegan.recipe.recipe;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;
import com.vegan.recipe.freeBoard.Service.IfreeBoardService;
import com.vegan.recipe.news.VboardVO;
import com.vegan.recipe.recipe.service.IRecipeService;
import com.vegan.recipe.util.PageCreate;
import com.vegan.recipe.util.PageVO;

@Controller
@RequestMapping("/recipe")
public class recipeController {

	@Autowired
	private IRecipeService service;
	
	@Autowired
	private IfreeBoardService free;
	
	@GetMapping("/recipeList")
	public void recipeList(Model model, PageVO vo) {
		System.out.println("레시피리스트로 이동");
		
		PageCreate pc = new PageCreate();
		pc.setPaging(vo);
		pc.setArticleTotalCount(service.getTotal(vo));
		System.out.println(pc);
		vo.setPagecnt((vo.getPageNum()-1) * vo.getCountPerPage());
		System.out.println("뉴스페이지로 이동");
		model.addAttribute("recipeList", service.getRecipe(vo));
		model.addAttribute("pc", pc);
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
			
			VboardVO Vvo = new VboardVO(0,vo.getVboard_title(),vo.getVboard_writer(), vo.getVboard_content() , vo.getVboard_type(), 0, vo.getVboard_type(), null, fileName, fileLoca, fileRealName, uploadPath, vo.getFile(),vo.getMaterial(),0,0);
			
				service.insertRecipe(Vvo);

			} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		
		//service.newsInsert(vo);
		return "redirect:/recipe/recipeList";
		

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
	
	@GetMapping("/recipeDetail")
	public void recipeDetail(int Vboard_no , String user_id , Model model) {
		System.out.println("레시피 상세보기");
		service.recipeHit(Vboard_no);
		model.addAttribute("like", free.findLike(Vboard_no, user_id));
		model.addAttribute("getLike", free.getLike(Vboard_no,3));
		model.addAttribute("detail", service.recipeDetail(Vboard_no));
	}
	
	
	
	@ResponseBody
	@RequestMapping(value = "fileupload.do")
    public void communityImageUpload(HttpServletRequest req, HttpServletResponse resp, MultipartHttpServletRequest multiFile) throws Exception{
		JsonObject jsonObject = new JsonObject();
		PrintWriter printWriter = null;
		OutputStream out = null;
		MultipartFile file = multiFile.getFile("upload");
		
		if(file != null) {
			if(file.getSize() >0 && StringUtils.isNotBlank(file.getName())) {
				if(file.getContentType().toLowerCase().startsWith("image/")) {
				    try{
				    	 
			            String fileName = file.getOriginalFilename();
			            byte[] bytes = file.getBytes();
			           
			            String uploadPath = req.getSession().getServletContext().getRealPath("/resources/images/noticeimg"); //저장경로
			            System.out.println("uploadPath:"+uploadPath);

			            File uploadFile = new File(uploadPath);
			            if(!uploadFile.exists()) {
			            	uploadFile.mkdir();
			            }
			            String fileName2 = UUID.randomUUID().toString();
			            uploadPath = uploadPath + "/" + fileName2 +fileName;
			            
			            out = new FileOutputStream(new File(uploadPath));
			            out.write(bytes);
			            
			            printWriter = resp.getWriter();
			            String fileUrl = req.getContextPath() + "/resources/images/noticeimg/" +fileName2 +fileName; //url경로
			            System.out.println("fileUrl :" + fileUrl);
			            JsonObject json = new JsonObject();
			            json.addProperty("uploaded", 1);
			            json.addProperty("fileName", fileName);
			            json.addProperty("url", fileUrl);
			            printWriter.print(json);
			            System.out.println(json);
			 
			        }catch(IOException e){
			            e.printStackTrace();
			        } finally {
			            if (out != null) {
		                    out.close();
		                }
		                if (printWriter != null) {
		                    printWriter.close();
		                }
			        }
				}

			
		}
		
	}
	} // 이미지 업로드 끝
	

}
