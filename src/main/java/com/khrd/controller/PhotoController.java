package com.khrd.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.khrd.domain.Criteria;
import com.khrd.domain.PageMaker;
import com.khrd.domain.PhotoVO;
import com.khrd.service.PhotoService;
import com.khrd.util.UploadFileUtils;

@RequestMapping("/photo/*")
@Controller
public class PhotoController {
	
	private static final Logger logger = LoggerFactory.getLogger(PhotoController.class);
	
	@Resource(name = "uploadPath") //bean id로 주입 받기(= DI : Dependency Injection)
	private String uploadPath; //파일 저장 경로(c:/photomanage/upload)

	@Autowired
	private PhotoService service;
	
	@RequestMapping(value = "view", method = RequestMethod.GET)
	public void viewGet(Model model, Criteria cri) {
		logger.info("* * * * * [ view GET ] * * * * *");
		logger.info("* * * cri * * * " + cri);
	
		try {			
			List<PhotoVO> list = service.selectListPage(cri);
			logger.info("* * * photo list * * * " + list);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.selectListCount());
			
			model.addAttribute("list", list);
			model.addAttribute("pageMaker", pageMaker);
			model.addAttribute("uploadPath", uploadPath);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "upload", method = RequestMethod.GET)
	public void uploadGet() {
		logger.info("* * * * * [ upload GET ] * * * * *");
	}
	
	@RequestMapping(value = "upload", method = RequestMethod.POST)
	public String uploadPost(PhotoVO vo, String auth, List<MultipartFile> files) throws IOException {
		logger.info("* * * * * [ upload POST ] * * * * *");
		logger.info("* * * vo * * * " + vo);
		logger.info("* * * files * * * " + files);
		
		vo.setWriter(auth); //session의 아이디
		
		for(MultipartFile file : files) {
			if(file.isEmpty() == false) { //추가할 파일이 있으면 추가
				logger.info("*원본 파일명 ::: " + file.getOriginalFilename());
				logger.info("*파일 크기 ::: " + file.getSize());
			
				System.out.println("uploadpath" + uploadPath);
				
				String savedName = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
				System.out.println("업로드한 파일 :: " + savedName);				
				
				vo.setTitle(savedName);
				service.upload(vo); //사진 개수만큼 테이블에 추가
			}
		}
		
		return "redirect:/photo/view";
	}
}
