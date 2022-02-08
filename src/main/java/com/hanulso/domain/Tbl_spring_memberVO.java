package com.hanulso.domain;

import java.util.List;

import lombok.Data;

@Data
public class Tbl_spring_memberVO {
	private String userid;
	private String userpw;
	private String userName;
	private String tel;
	private String email;
	private String enable;
	
	private List<Tbl_member_authVO> authList;
}
