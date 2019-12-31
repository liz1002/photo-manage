package com.khrd.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.khrd.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO{
	private final static String namespace="mappers.MemberMapper.";
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void regist(MemberVO vo) {
		sqlSession.insert(namespace + "regist", vo);
	}
	
	@Override
	public List<MemberVO> selectList() {
		return sqlSession.selectList(namespace + "selectList");
	}

	@Override
	public MemberVO selectById(String id) {
		return sqlSession.selectOne(namespace + "selectById", id);
	}

	@Override
	public MemberVO selectByIdAndPwd(MemberVO vo) {
		return sqlSession.selectOne(namespace + "selectByIdAndPwd", vo);
	}

}
