package com.khrd.service;

import java.util.List;

import com.khrd.domain.MemberVO;

public interface MemberService {
	public void regist(MemberVO vo);
	public List<MemberVO> selectList();
	public MemberVO selectById(String id);
	public MemberVO selectByIdAndPwd(MemberVO vo);
}
