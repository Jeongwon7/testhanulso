package com.hanulso.controller;

import java.util.ArrayList;
import java.util.Arrays;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.hanulso.domain.SampleDTO;

import lombok.extern.log4j.Log4j;

@Controller//컨트롤러 역할을 하게된다!
@RequestMapping("/sample/*")// sample/어쩌고저쩌고가 호출 됐을 때!
@Log4j//log 명령어 사용하기 위해
public class SampleController {
	
	@RequestMapping("")
	public void basic() {
		log.info("basic request is...");
		
	}
	
//	@RequestMapping(value="/insert", method= {RequestMethod.GET, RequestMethod.POST})
//	public void insertDo() {
//		log.info("insert request is...");
//	}
	
	@RequestMapping("/insert")
	public void insertDo() {
		log.info("insert request is...");
	}
	
	@GetMapping("/ex00")
	// sample/basicget 겟방식으로 
	public void basicGet() {//void일 경우 메서드 실해하고 @GetMapping한 주소의 jsp를 실행한다
		log.info("basic get only...");
	}
	
	@GetMapping("/ex01")
	public String ex01(SampleDTO dto) {
		log.info("dto: "+dto);
		return "ex01";//ex01.jsp를 실행하란 뜻
	}
	
	@GetMapping("/ex02")
	public String ex02(@RequestParam("name") String irum, @RequestParam("age") int age) {
		//@RequestParam는 request.getparameter와 같은 역할
		//name, age값(받아온 값)을 각각 name, age에 저장
		log.info("name: "+irum);
		log.info("age: "+age);
		return "ex02";
	}
	
	@GetMapping("/ex03")//가변배열로 받기(값이 출력된다
	public String ex03(@RequestParam("ids") ArrayList<String> ids) {
		log.info("ids: "+ids);
		return "ex03";
	}
	
	@GetMapping("/ex04")//배열로 받기(ids 변수를 그냥 쓰면 주소가 출력된다)
	public String ex04(@RequestParam("ids") String[] ids) {
		log.info("ids: "+Arrays.toString(ids));
		return "ex04";
	}
	
	@GetMapping("/ex05")
	public String ex05(SampleDTO dto) {
		log.info("dto: "+dto);
		return "ex05";
	}
	
	@GetMapping("/ex06")
	public String ex06(SampleDTO dto) {
		
		return "sample/ex06";//포워딩이 된다! 대단해!
	}
	
	@GetMapping("/ex07")
	public String ex07(SampleDTO dto, int page) {//객체는 자동으로 포워딩이 되지만 변수는 아니다 -> ex8의 어노테이션 추가
		log.info("dto: "+dto);
		log.info("page: "+page);
		
		return "/sample/ex07";		
	}
	
	@GetMapping("/ex08")
	public String ex08(SampleDTO dto, @ModelAttribute("page") int page) {
		log.info("dto: "+dto);
		log.info("page: "+page);
		
		return "/sample/ex07";		
	}
	
	@GetMapping("/ex09")//브라우저로 실행하기
	public @ResponseBody SampleDTO ex09() {//json 형태로 dto 리턴
		SampleDTO dto = new SampleDTO();
		
		dto.setName("홍길동");
		dto.setAge(200);
		dto.setBirth("2021/12/12");
		
		return dto;
	}
	
	@GetMapping("/ex10")//브라우저로 실행하기
	public ResponseEntity<String> ex10(){//HTTP 프로토콜 헤더 정보나 데이터를 전달할 수 있다
		String msg="{\"name\":\"홍길동\"}";// {"name": "홍길동"} 역슬래시 다음에 " 표기해야 먹힌다
		HttpHeaders header =  new HttpHeaders();
		header.add("content-Type", "application/json;charset=utf-8");
		return new ResponseEntity<>(msg, header, HttpStatus.OK);//상태코드 ok는 200이 전송된다
	}
	
	@GetMapping("/uploadform")
	public void uploadform() {
		
	}
	
	@PostMapping("/upload")
	public void uploadTest(ArrayList<MultipartFile> files) {//MultipartFile타입으로 받기
		files.forEach(file->{
			log.info("file name: "+file.getOriginalFilename());
			log.info("file size: "+file.getSize());
		});
	}
}
