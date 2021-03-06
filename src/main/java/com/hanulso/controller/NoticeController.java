package com.hanulso.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hanulso.domain.Criteria;
import com.hanulso.domain.NoticeVO;
import com.hanulso.domain.PageVO;
import com.hanulso.service.NoticeService;

import lombok.Setter;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {
	
	@Setter(onMethod_ = @Autowired)
	private NoticeService service;
	
	/*
	@GetMapping("/notice.do")
	public void list(Model model) {
		model.addAttribute("list", service.getList());
	}
	*/ 
	
	@GetMapping("/notice.do")
	public void list(Model model, Criteria cri) {
		model.addAttribute("list", service.getListWithPaging(cri));
		int total = service.getTotal(cri);
		model.addAttribute("pageMaker", new PageVO(cri, total));
		
	}
	
	
	@GetMapping("/noticewrite.do")
	@PreAuthorize("isAuthenticated()")//로그인이 성공한 사용자만이 글쓰기 할 수 있다
	public void noticeWrite() {
		
	}
	
	@PostMapping("/noticewritepro.do")
	public String noticeList(NoticeVO notice, RedirectAttributes rttr) {//RedirectAttributes일회성 객체를 포워딩해준다
		service.register(notice);
		rttr.addFlashAttribute("result", notice.getBno());
		return "redirect:/notice/notice.do";//result가 포워딩되는데 한 번만 사용할 수 있다
	}
	

	@GetMapping({"/noticeview.do", "/noticemodify.do"})
	   public void read(@RequestParam("bno") int bno, @ModelAttribute("cri") Criteria cri, Model model) {
	      model.addAttribute("nvo",service.read(bno));
	      model.addAttribute("nextVO", service.nextPage(bno));
	      model.addAttribute("prevVO", service.prevPage(bno));
	   }//요청이 들어오면 넘어온 값을 cri에 담고 cri를 jsp에 포워딩까지 같이 실행됨
	
	@PostMapping("/noticemodifypro.do")
	public String modify(NoticeVO notice, @ModelAttribute("cri") Criteria cri , RedirectAttributes rttr) {
		if(service.update(notice)) {
			rttr.addFlashAttribute("result", "success");
			
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		return "redirect:/notice/notice.do";//자동으로 포워딩 되지 않으니까 일회성 속성에 pageNum과 amount를 담아서 넘겨야 한다
	}
	
	@GetMapping("/noticedelete.do")
	public String delete(@RequestParam("bno") int bno, RedirectAttributes rttr) {
		
		if(service.delete(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/notice/notice.do";
	}
}
