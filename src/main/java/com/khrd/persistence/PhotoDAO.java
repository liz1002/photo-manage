package com.khrd.persistence;

import java.util.List;

import com.khrd.domain.Criteria;
import com.khrd.domain.PhotoVO;

public interface PhotoDAO {
	public void upload(PhotoVO vo);
	public List<PhotoVO> selectList();
	public PhotoVO selectByNo(int pno);
	public int selectListCount();
	public List<PhotoVO> selectListPage(Criteria cri);
	public void remove(String title);
}
