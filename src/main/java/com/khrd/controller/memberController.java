package com.khrd.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.khrd.domain.MemberVO;
import com.khrd.service.MemberService;

@RequestMapping("/member/*")
@Controller
public class memberController {
	
	private static final Logger logger = LoggerFactory.getLogger(memberController.class);

	@Autowired
	private MemberService service;
	
	@RequestMapping(value = "regist", method = RequestMethod.GET)
	public void registGet() {
		logger.info("* * * * * [ regist GET ] * * * * *");
	}
	
	@RequestMapping(value = "regist", method = RequestMethod.POST)
	public void registPost(MemberVO vo) {
		logger.info("* * * * * [ regist POST ] * * * * *");
		logger.info("* * * vo * * * " + vo);
		
		service.regist(vo);
	}	
}
