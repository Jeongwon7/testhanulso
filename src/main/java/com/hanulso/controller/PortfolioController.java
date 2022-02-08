package com.hanulso.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hanulso.domain.PortfolioVO;
import com.hanulso.service.PortfolioService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@RequestMapping("/portfolio/*")
@Log4j
public class PortfolioController {
	
	@Setter(onMethod_ = @Autowired)
	private PortfolioService service;
	
	@GetMapping("/portfolio.do")
	public void portList(Model model) {//리턴타입이 void 이면  요청한 url.jsp가 실행된다 /portfolio.jsp를 찾아간다
		model.addAttribute("plist", service.selectAll());
		
	}
	
	@GetMapping("/portfoliowrite.do")
	public void portfolioForm() {
	}
	
	@GetMapping("/portfolioview.do")
	public void portfolioview(@RequestParam("bno") int bno, Model model) {
		model.addAttribute("view", service.read(bno));
	}
	
	@PostMapping("/portfoliowrite.do")
	   public String portfolioWrite(PortfolioVO pvo, @RequestParam("uploadFile") MultipartFile upload) {
	      
			  String uploadFolder = "c:\\upload";
		      log.info("file name : "+upload.getOriginalFilename());
		      log.info("file size : "+upload.getSize());
		      
		      String uploadFileName = upload.getOriginalFilename();
		      
		      //IE
		      uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("//")+1);
		      log.info("IE file name only : "+uploadFileName);
		      
		      //중복방지 처리
		      UUID uuid = UUID.randomUUID(); //무작위 16진수 만들기
		      uploadFileName = uuid.toString()+"_"+uploadFileName;
		      
		      File uploadPath = new File(uploadFolder, getFolder());
		      log.info("upload path : "+uploadPath);
		      
		      if(uploadPath.exists() == false) {
		         uploadPath.mkdirs();//상위 폴더 없으면 상위폴더까지 자동생성
		      }
		      
		      File saveFile = new File(uploadPath, uploadFileName); //전송 전 파일 객체 생성
		      String saveURL = saveFile.toString().substring(10);//10번째부터 끝까지(이거는 vo에 imgurl에 set해서 db저장하는 용도의 변수)
		      
		      try {
		         upload.transferTo(saveFile); //첨부파일 전송
		         pvo.setImgurl(saveURL);
		         service.insertSelectKey(pvo);
		      }catch(Exception e) {
		         e.printStackTrace();
		      }
		      return "redirect:/portfolio/portfolio.do";

	   }
	
	
	
	//연습
	@GetMapping("/uploadForm.do")
	public void uploadForm() {
		
	}
	
	@PostMapping("/uploadFormAction.do")
	public void uploadFormPost(MultipartFile[] uploadFile, Model model) {
		
		String uploadFolder = "c:\\upload";
		
		for(MultipartFile multi : uploadFile) {
			log.info("file name: "+multi.getOriginalFilename());
			log.info("file size: "+multi.getSize());
		
			File saveFile = new File(uploadFolder, multi.getOriginalFilename());
			
			try {
				multi.transferTo(saveFile);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
	}
	
	@GetMapping("/uploadAjax.do")
	public void uploadAjaxForm() {
		
	}
	
	//업로드 폴더에 연월일별 폴더 생성
	private String getFolder() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		
		return str.replace("-", File.separator);//-를 기준으로 분리 된다
	}
	
	private boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			//실제 파일의 내용이 아니라 파일의 확장자를 통하여 mime type을 판단한다
			return contentType.startsWith("image");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@PostMapping("/uploadAjaxAction.do")
	public String uploadAjaxPost(MultipartFile[] uploadFile) {
		String uploadFolder = "c:\\upload";
		
		File uploadPath = new File(uploadFolder, getFolder());// c/upload 밑에 yyyy-MM-dd 형식의 파일 객체가 만들어진다
		log.info("upload path: "+uploadPath);
		
		if(uploadPath.exists() == false) {//폴더가 존재하지 않으면
			uploadPath.mkdirs();//s: 상위 폴더가 없으면 상위폴더부터 만들어 mkdir(): 현재폴더에 만들어진다
		}
		
		for(MultipartFile multi : uploadFile) {
			log.info("file name: "+multi.getOriginalFilename());
			log.info("file size: "+multi.getSize());
			
			//IE 익스 브라우저 처리(첨부파일의 이름만 발췌하기)
			String uploadFileName = multi.getOriginalFilename();
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);//제일 마지막 \ 다음 문자부터 끝까지
			//IE end
			
			//중복 방지 해결 방법
			UUID uuid  = UUID.randomUUID();//16진수 형식의 무작위 문자를 생성한다
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			
			//File saveFile = new File(uploadFolder, multi.getOriginalFilename());
			File saveFile = new File(uploadPath, uploadFileName);
			
			try {
				multi.transferTo(saveFile);//해당 폴더에 첨부파일 저장
				if(checkImageType(saveFile)) {//이미지 타입인지 검사
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
					Thumbnailator.createThumbnail(multi.getInputStream(), thumbnail, 100, 100);
					thumbnail .close();
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}//for end
		return null;
	}
}
