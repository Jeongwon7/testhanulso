package com.hanulso.service;

import java.util.List;

import com.hanulso.domain.NoticeVO;
import com.hanulso.domain.PortfolioVO;

public interface MainService {
	public List<PortfolioVO> getPortMain();
	public List<NoticeVO> getNoticeMain();
}
