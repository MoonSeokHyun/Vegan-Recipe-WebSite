package com.vegan.recipe.freeBoard;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;
import com.vegan.recipe.freeBoard.Service.IfreeBoardService;
import com.vegan.recipe.util.PageCreate;
import com.vegan.recipe.util.PageVO;


@Controller
@RequestMapping("/FreeBoard")
public class freeBoardController {
	
	@Autowired
	private IfreeBoardService service;
	
//	자유게시판 이동 메소드
	@GetMapping("/freeList")
	public String getFree(Model model, PageVO vo) {
		System.out.println("자유 게시판으로 이동");
		System.out.println("검색어" + vo.getKeyword());
		System.out.println("검색조건" + vo.getCondition());
		
		PageCreate pc = new PageCreate();
		pc.setPaging(vo);
		pc.setArticleTotalCount(service.getTotal(vo));
		
		System.out.println(pc);
		vo.setPagecnt((vo.getPageNum()-1) * vo.getCountPerPage());
		model.addAttribute("freeList", service.getFreeBoard(vo));
		model.addAttribute("pc", pc);
		
		return "FreeBoard/freeList";
	}
//	글쓰기페이지로 이동 메소드
	@GetMapping("/freeWrite")
	public void freeWrite() {
		System.out.println("글쓰기 페이지로 이동");
	}
	
//	글 등록 
	@PostMapping("/insertFreeboard")
	public String insertFreeboard(freeboardVO vo) {
		

			service.insertFreeboard(vo);
		System.out.println("인서트 성공요");
		
		return "redirect:/FreeBoard/freeList";
	}
	
//	상세보기
	@GetMapping("/freeDetail")
	public void freeDetail(int freeboard_no, Model model) {
		
		System.out.println("상세보기 페이지");
		model.addAttribute("Detail", service.freeDetail(freeboard_no));
		
	}
	
//	이미지 업로드
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
	}
}




	

