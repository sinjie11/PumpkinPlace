package com.error404.pumpkinplace.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.error404.pumpkinplace.domain.Member;
import com.error404.pumpkinplace.service.ShowBoardService;

@Controller
@RequestMapping(value = "/showboard")
public class ShowBoardController {
	private static final Logger logger = LoggerFactory.getLogger(ShowBoardController.class);
	
	@RequestMapping(value = "/showboardmain")
	public void showBoard(){
		
		
	}
	
	@RequestMapping(value = "/showdetail")
	public void showBoardDetail() {
		
		
	}
	
	@RequestMapping(value = "/showinsert")
	public void showInsert() {
		
		
		
	}
	     		
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	//업로드
	@RequestMapping(value = "/showinsert", method = RequestMethod.POST)
	public void uploadPost(Member user, MultipartFile uploadFile, Model model) {
		logger.info("uploadPost() called");
//		logger.info("{} | {} | {}",
//				user.getUserid(), user.getPwd(), user.getEmail());
		
		logger.info("Name: {}", uploadFile.getName()); // request param name
		logger.info("Original File Name: {}", uploadFile.getOriginalFilename());
		logger.info("Size: {}", uploadFile.getSize());
		
		String savedName = saveUploadedFile(uploadFile);
		model.addAttribute("saved", savedName);
	}
	

	private String saveUploadedFile(MultipartFile uploadedFile) {
		// UUID: Universally Unique Identifier
		// 업로드 파일 이름의 중복 문제를 해결하기 위해서
		UUID uuid = UUID.randomUUID();
		String savedName = uuid + "_" + uploadedFile.getOriginalFilename();
		File file = new File(uploadPath, savedName);
		try {
//			uploadedFile.transferTo(file);
			// org.springframework.util.FileCopyUtils
			FileCopyUtils.copy(uploadedFile.getBytes(), file);
			logger.info("FILE SAVED: " + savedName);
			
			return savedName;
		} catch (IOException e) {
			logger.error("FILE NOT SAVED: " + e.getMessage());
			
			return null;
		}
	}
} // end class ShowBoardController
