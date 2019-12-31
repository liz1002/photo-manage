package com.khrd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khrd.domain.MemberVO;
import com.khrd.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO dao;
	
	@Override
	public void regist(MemberVO vo) {
		dao.regist(vo);
	}

	@Override
	public List<MemberVO> selectList() {
		return dao.selectList();
	}

	@Override
	public MemberVO selectById(String id) {
		return dao.selectById(id);
	}

	@Override
	public MemberVO selectByIdAndPwd(MemberVO vo) {
		return dao.selectByIdAndPwd(vo);
	}

}
