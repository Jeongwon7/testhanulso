package com.hanulso.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hanulso.domain.QaVO;
import com.hanulso.service.QaService;

import lombok.Setter;

@Controller
@RequestMapping("/qna/*")
public class QaController {
	
	@Setter(onMethod_ = @Autowired)
	private QaService service;
	
	@GetMapping("/qa.do")
	public void selectAll(Model model) { //model이 jsp로 포워딩 해주는 객체
		List<QaVO> list = service.getList();
		model.addAttribute("list",list); //servlet에서의 request.setAttribute("list",list)
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/qawrite.do")
	public void writeForm() {
		
	}
	
	@PostMapping("/qawrite.do")
	public String insert(QaVO vo) {
		service.insert(vo);
		return "redirect:/qna/qa.do";
	}
	
	@GetMapping("/qaview.do")
	public void read(@RequestParam("bno") int bno, Model model) {
		QaVO vo = service.getListOne(bno);
		model.addAttribute("vo", vo);
	}
	
	@PostMapping("/reply.do")
	public String update(QaVO vo) {//bno, ancontent 담겨있음
		service.anInsert(vo);
		service.update(vo.getBno());
		return "redirect:/qna/qa.do";
	}
}
