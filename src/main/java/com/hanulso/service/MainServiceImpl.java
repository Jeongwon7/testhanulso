package com.hanulso.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hanulso.domain.NoticeVO;
import com.hanulso.domain.PortfolioVO;
import com.hanulso.mapper.MainMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class MainServiceImpl implements MainService {
	
	@Setter(onMethod_ = @Autowired)
	private MainMapper mapper;
	
	@Override
	public List<PortfolioVO> getPortMain() {
		List<PortfolioVO> list = mapper.portList();
		return list; 
	}

	@Override
	public List<NoticeVO> getNoticeMain() {
		return mapper.noticeList();
	}
}
