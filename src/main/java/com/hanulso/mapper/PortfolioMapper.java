package com.hanulso.mapper;

import java.util.List;

import com.hanulso.domain.PortfolioVO;

public interface PortfolioMapper {
	
	public void insertSelectKey(PortfolioVO pvo);
	public List<PortfolioVO> selectList();
	public PortfolioVO read(int bno);
	
}
