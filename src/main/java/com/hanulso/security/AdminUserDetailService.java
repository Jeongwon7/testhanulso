package com.hanulso.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.hanulso.domain.Tbl_spring_memberVO;
import com.hanulso.mapper.Tbl_memberMapper;
import com.hanulso.security.domain.AdminUser;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class AdminUserDetailService implements UserDetailsService {
	
	@Setter(onMethod_ = @Autowired)
	private Tbl_memberMapper mapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		Tbl_spring_memberVO vo = mapper.read(username);
		
		log.warn("meppar result: "+vo);
		
		return vo == null ? null : new AdminUser(vo);
	}
	
}
