package com.hanulso.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/adm/*")
@AllArgsConstructor
public class AdminController {
	
	@GetMapping("/admin")
	public void adminLoginForm() {
		
	}
	
	@GetMapping("/adminmanager")
	public void adminManager() {
		
	}
	
	@GetMapping("/adminLogout")
	public String admiinLogout() {
		return "sendredirect:/";
	}
	

	@GetMapping("/customlogin")
	public void customLogin(String error, String logout, Model model) {
		
	}
	
	
	@GetMapping("/customlogout")
	public void logoutGet() {
		
	}
}
