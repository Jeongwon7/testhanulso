package com.hanulso.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hanulso.domain.Tbl_spring_memberVO;
import com.hanulso.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member/*")
@AllArgsConstructor
@Log4j
public class MemberController {

	@Setter(onMethod_= @Autowired)
	private MemberService service;
	
	@Setter(onMethod_= @Autowired)
	private PasswordEncoder pwencoder;
	
	@GetMapping("/member.do")
	public void memberView() {
		
	}
	
	@GetMapping("checkUserid.do")
	public @ResponseBody int checkUserid(@RequestParam("userid") String id) {//@ResponseBody json 형식으로 리턴된다
		int result = service.idCheck(id);
		log.info("result: "+result);
		return result;
	}
	
	@PostMapping("/memberinsert.do")
	public String memberInsert(Tbl_spring_memberVO member) {
		member.setUserpw(pwencoder.encode(member.getUserpw()));
		
		service.register(member);
		
		return "redirect:/";
	}
	
	
	@GetMapping("/login.do")
	public void customLogin() {
		
	}
	
}
