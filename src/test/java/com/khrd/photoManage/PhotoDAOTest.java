package com.khrd.photoManage;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.khrd.domain.Criteria;
import com.khrd.persistence.PhotoDAO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class PhotoDAOTest {
	@Autowired
	private PhotoDAO dao;
	
//	@Test
	public void testSelectList() {
		dao.selectList();
	}
	
	@Test
	public void testSelectListPage() {
		dao.selectListPage(new Criteria(1, 15));
	}
}
