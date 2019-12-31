package com.khrd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.khrd.domain.Criteria;
import com.khrd.domain.PhotoVO;
import com.khrd.persistence.PhotoDAO;

@Repository
public class PhotoServiceImpl implements PhotoService{
	
	@Autowired
	private PhotoDAO dao;

	@Override
	public void upload(PhotoVO vo) {
		dao.upload(vo);
	}

	@Override
	public List<PhotoVO> selectList() {
		return dao.selectList();
	}

	@Override
	public PhotoVO selectByNo(int pno) {
		return dao.selectByNo(pno);
	}

	@Override
	public int selectListCount() {
		return dao.selectListCount();
	}

	@Override
	public List<PhotoVO> selectListPage(Criteria cri) {
		return dao.selectListPage(cri);
	}

	@Override
	public void remove(String title) {
		dao.remove(title);
	}
}
