package com.hanulso.mapper;

import com.hanulso.domain.Tbl_spring_memberVO;

public interface MemberMapper {
	
	public int idCheck(String id);
	public void insert(Tbl_spring_memberVO member);
	public void insert_auth(Tbl_spring_memberVO member);
}
