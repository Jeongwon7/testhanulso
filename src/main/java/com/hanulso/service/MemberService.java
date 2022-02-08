package com.hanulso.service;

import com.hanulso.domain.Tbl_spring_memberVO;

public interface MemberService {
	
	public int idCheck(String id);
	public void register(Tbl_spring_memberVO member);
}
