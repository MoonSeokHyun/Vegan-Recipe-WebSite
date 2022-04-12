package com.vegan.recipe.freeBoard;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.annotation.RequestScope;
import org.springframework.web.multipart.MultipartFile;

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
	@PostMapping("/imageUpload")
	public String uploadImg(HttpServletRequest request, HttpServletResponse resopnse, @RequestParam MultipartFile upload) {
		System.out.println("파일 업로드 실행");
		System.out.println(upload);
	
		UUID uid = UUID.randomUUID();

		OutputStream out = null;
		PrintWriter printWriter = null;
		
		//인코딩
		resopnse.setCharacterEncoding("utf-8");
		resopnse.setContentType("text/html;charset=utf-8");
		

		try {
			// 파일 이름 가져오기
			String fileName = upload.getOriginalFilename();
			byte[] bytes = upload.getBytes();
			
			//이미지 경로 생성
			String path = "C:\\test\\upload";
			String ckUploadPath = path + uid + "_" + fileName;
			File folder = new File(path);
			
			//해당 디렉토리 확인
			if(!folder.exists()) {
				folder.mkdir(); //폴더 생성
			}
			
			out = new FileOutputStream(new File(ckUploadPath));
			out.write(bytes);
			out.flush();
			
			String callback = request.getParameter("CKEditorFuncNum");
			printWriter = resopnse.getWriter();
			String fileUrl = ckUploadPath; // 작성화면
			
			//업로드시 메시지 출력
			printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
			printWriter.flush();
			
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			try {
				if(out != null) { out.close(); } 
				if(printWriter != null) { printWriter.close(); }
			} catch (Exception e) {e.printStackTrace();}
		}

		
		 return null;
		
	}
	

	
}
