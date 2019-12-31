package com.khrd.persistence;

import java.util.List;

import com.khrd.domain.MemberVO;

public interface MemberDAO {
	public void regist(MemberVO vo);
	public List<MemberVO> selectList();
	public MemberVO selectById(String id);
	public MemberVO selectByIdAndPwd(MemberVO vo);
}
