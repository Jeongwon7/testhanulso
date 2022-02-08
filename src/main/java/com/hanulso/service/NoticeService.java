package com.hanulso.service;

import java.util.List;

import com.hanulso.domain.Criteria;
import com.hanulso.domain.NoticeVO;

public interface NoticeService {
	
	public void register(NoticeVO notice);
	
	public List<NoticeVO> getList();
	
	public List<NoticeVO> getListWithPaging(Criteria cri);
	
	public int getTotal(Criteria cri);
	
	public NoticeVO read(int bno);
	
	public boolean update(NoticeVO notice);
	
	public boolean delete(int bno);
	
	public NoticeVO nextPage(int bno);//다음글
	public NoticeVO prevPage(int bno);//이전글
	
	
}
