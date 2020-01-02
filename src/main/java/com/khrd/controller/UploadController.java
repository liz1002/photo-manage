package com.khrd.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.khrd.service.PhotoService;

@RequestMapping("/upload/*")
@Controller
public class UploadController {
	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);

	@Resource(name = "uploadPath") //bean id로 주입 받기(= DI : Dependency Injection)
	private String uploadPath; //파일 저장 경로(c:/photomanage/upload)
	
	@Autowired
	private PhotoService service;
	
	@RequestMapping(value = "displayThumbFile", method = RequestMethod.GET)
	public ResponseEntity<byte[]> displayThumbFile(String filename){
		ResponseEntity<byte[]> entity = null;
		logger.info("* filename * " + filename);
		
		try {
			String formatName = filename.substring(filename.lastIndexOf(".") + 1);
			MediaType type = null;
			if(formatName.equalsIgnoreCase("jpg")) {
				type = MediaType.IMAGE_JPEG;
			}else if(formatName.equalsIgnoreCase("png")) {
				type = MediaType.IMAGE_PNG;
			}else if(formatName.equalsIgnoreCase("gif")) {
				type = MediaType.IMAGE_GIF;
			}
			
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(type);
			
			InputStream in = new FileInputStream(uploadPath + "/" + filename);
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
			in.close(); //파일 삭제 등 안 먹히면 반드시 close
		} catch (Exception e) {
			e.printStackTrace();
		}
		return entity;
	}
	
	@RequestMapping(value = "displayOriginFile", method = RequestMethod.GET)
	public ResponseEntity<String> displayOriginFile(String filename){
		ResponseEntity<String> entity = null;
		logger.info("* filename * " + filename);
		
		try {
			String formatName = filename.substring(filename.lastIndexOf(".") + 1);
			MediaType type = null;
			if(formatName.equalsIgnoreCase("jpg")) {
				type = MediaType.IMAGE_JPEG;
			}else if(formatName.equalsIgnoreCase("png")) {
				type = MediaType.IMAGE_PNG;
			}else if(formatName.equalsIgnoreCase("gif")) {
				type = MediaType.IMAGE_GIF;
			}
			
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(type);
			
			String datePath = filename.substring(0, 12); // "년/월/일/" 자르기
			String originFilename = filename.substring(14); // "년/월/일/s_" 뒤부터
			
			InputStream in = new FileInputStream(uploadPath + datePath + originFilename);
			entity = new ResponseEntity<String>(datePath + originFilename, HttpStatus.CREATED);
			in.close(); //파일 삭제 등 안 먹히면 반드시 close
		} catch (Exception e) {
			e.printStackTrace();
		}
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value = "deleteFile", method = RequestMethod.GET)
	public ResponseEntity<String> deleteFile(String filename){
		logger.info("********** [deleteFile GET] **********");
		
		ResponseEntity<String> entity = null;
		
		try {
			//DB에서 삭제
			service.remove(filename);
			
			//썸네일 삭제
			File file = new File(uploadPath + "/" + filename);
			file.delete();
			
			//원본 삭제
			String datePath = filename.substring(0, 12); // "년/월/일/" 자르기
			String originFilename = filename.substring(14); // "년/월/일/s_" 뒤부터
			File originFile = new File(uploadPath + datePath + originFilename);

			System.out.println("원본 경로 ::: " + originFile);
			originFile.delete();
			
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}
