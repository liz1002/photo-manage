package com.khrd.photoManage;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.khrd.domain.MemberVO;
import com.khrd.persistence.MemberDAO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class MemberDAOTest {
	@Autowired
	private MemberDAO dao;
	
	@Test
	public void testInsert() {
		dao.regist(new MemberVO("test", "테스트", "1234", "test@eamil.com", "010-1234-5678"));
	}
	
	@Test
	public void testSelectList() {
		dao.selectList();
	}
}
