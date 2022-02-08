package com.hanulso.mapper;

import java.util.List;

import com.hanulso.domain.QaVO;

public interface QaMapper {
	//질문 insert
	public void insert(QaVO vo);
	//답변 insert
	public void anInsert(QaVO vo);
	//list
	public List<QaVO> getList();
	//get
	public QaVO getListOne(int bno);
	//update status
	public int update(int bno);
	//delete
	public int delete(int bno);
	//search, paging (나중에)
}
