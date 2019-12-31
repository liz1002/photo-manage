package com.khrd.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.khrd.domain.Criteria;
import com.khrd.domain.PhotoVO;

@Repository
public class PhotoDAOImpl implements PhotoDAO{
	private final static String namespace="mappers.PhotoMapper.";
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void upload(PhotoVO vo) {
		sqlSession.insert(namespace + "upload", vo);
	}

	@Override
	public List<PhotoVO> selectList() {
		return sqlSession.selectList(namespace + "selectList");
	}

	@Override
	public PhotoVO selectByNo(int pno) {
		return sqlSession.selectOne(namespace + "selectByNo", pno);
	}

	@Override
	public int selectListCount() {
		return sqlSession.selectOne(namespace + "selectListCount");
	}

	@Override
	public List<PhotoVO> selectListPage(Criteria cri) {
		return sqlSession.selectList(namespace + "selectListPage", cri);
	}

	@Override
	public void remove(String title) {
		sqlSession.delete(namespace + "remove", title);
	}
}
