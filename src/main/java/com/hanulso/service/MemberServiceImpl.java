package com.hanulso.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hanulso.domain.Tbl_spring_memberVO;
import com.hanulso.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {

	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	@Override
	public int idCheck(String id) {
		return mapper.idCheck(id);
	}
	
	@Override
	public void register(Tbl_spring_memberVO member) {
		mapper.insert(member);
		mapper.insert_auth(member);
		
	}
}
