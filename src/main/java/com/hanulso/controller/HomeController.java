package com.hanulso.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hanulso.domain.Criteria;
import com.hanulso.service.MainService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@Log4j
public class HomeController {
	
	@Setter(onMethod_ = @Autowired)
	private MainService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		log.info("index call...");
		model.addAttribute("mainPort", service.getPortMain());// request.setAttribute와 같은 역할
		model.addAttribute("mainNotice", service.getNoticeMain());
		
		return "index";//index.jsp 실행, 포워딩 안해도 셋한 값이 넘어간다
	}
	
}
