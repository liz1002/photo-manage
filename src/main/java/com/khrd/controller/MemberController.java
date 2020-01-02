package com.khrd.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.khrd.domain.MemberVO;
import com.khrd.service.MemberService;

@RequestMapping("/member/*")
@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService service;
	
	@RequestMapping(value = "regist", method = RequestMethod.GET)
	public void registGet() {
		logger.info("* * * * * [ regist GET ] * * * * *");
	}
	
	@RequestMapping(value = "regist", method = RequestMethod.POST)
	public String registPost(MemberVO vo) {
		logger.info("* * * * * [ regist POST ] * * * * *");
		logger.info("* * * vo * * * " + vo);
		
		service.regist(vo);
		
		return "redirect:/auth/login"; //로그인 이동
	}	
	
	@ResponseBody
	@RequestMapping(value = "overlap", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public String overlapCheck(String id) {
		logger.info("* * * * * [ overlap Check GET ] * * * * *");
		
		String msg = null;
		String resmsg = null;
		int res = 1;
		Map<String, Object> map = new HashMap<String, Object>();
		
		MemberVO vo = service.selectById(id);
		logger.info("* * * vo * * * " + vo);
		
		msg = "사용 가능한 아이디입니다.";
		resmsg = "ok";
		
		if(vo != null) {
			msg = "사용할 수 없는 아이디입니다.";
			resmsg = "no";
			res = 0;
		}
		
		map.put("msg", msg);
		map.put("res", res);
		logger.info("* * * map * * * " + map);
		
		return resmsg;
	}
}
