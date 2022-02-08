package com.hanulso.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hanulso.domain.QaVO;
import com.hanulso.mapper.QaMapper;

import lombok.Setter;

@Service
public class QaServiceImpl implements QaService {
	
	@Setter(onMethod_ = @Autowired)
	private QaMapper mapper;
	
	@Override
	public void insert(QaVO vo) {
		mapper.insert(vo);
	}
	
	@Override
	public void anInsert(QaVO vo) {
		mapper.anInsert(vo);
	}
	
	@Override
	public List<QaVO> getList() {
		return mapper.getList();
	}
	
	@Override
	public QaVO getListOne(int bno) {
		return mapper.getListOne(bno);
	}
	
	@Override
	public int update(int bno) {
		return mapper.update(bno);
	}
	
	@Override
	public int delete(int bno) {
		return mapper.delete(bno);
	}
}
