package com.hanulso.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hanulso.domain.PortfolioVO;
import com.hanulso.mapper.PortfolioMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class PortfolioServiceImpl implements PortfolioService {
	
	@Setter(onMethod_ = @Autowired)
	private PortfolioMapper mapper;
	
	@Override
	public void insertSelectKey(PortfolioVO pvo) {
		mapper.insertSelectKey(pvo);
	}
	
	@Override
	public List<PortfolioVO> selectAll() {
		return mapper.selectList();
	}
	
	@Override
	public PortfolioVO read(int bno) {
		return mapper.read(bno);
	}

}
