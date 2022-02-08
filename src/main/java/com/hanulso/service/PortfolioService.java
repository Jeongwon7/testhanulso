package com.hanulso.service;

import java.util.List;

import com.hanulso.domain.PortfolioVO;

public interface PortfolioService {
	public void insertSelectKey(PortfolioVO pvo);
	public List<PortfolioVO> selectAll();
	public PortfolioVO read(int bno);
}
