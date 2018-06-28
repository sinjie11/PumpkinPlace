package com.error404.pumpkinplace.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.annotation.Resource;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.util.FileCopyUtils;

import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.multipart.MultipartFile;

import com.error404.pumpkinplace.domain.Member;

import com.error404.pumpkinplace.domain.ShowBoard;
import com.error404.pumpkinplace.pageutil.PageLinkMaker;
import com.error404.pumpkinplace.pageutil.PaginationCriteria;

import com.error404.pumpkinplace.service.ShowBoardService;

@Controller
@RequestMapping(value = "/showboard")
public class ShowBoardController {
	private static final Logger logger = LoggerFactory.getLogger(ShowBoardController.class);

	@Autowired
	ShowBoardService showBoardService;

	@RequestMapping(value = "/showboardmain")
	public void showBoard(Integer page, Integer numsPerPage, Model model) {
		logger.info("showboard() 호출");

		PaginationCriteria criteria = new PaginationCriteria();
		if (page != null) {
			criteria.setPage(page);
		}
		if (numsPerPage != null) {
			criteria.setNumsPerPage(numsPerPage);
		}

		List<ShowBoard> list = showBoardService.read(criteria);
		model.addAttribute("showboardList", list);

		PageLinkMaker maker = new PageLinkMaker();
		maker.setCriteria(criteria);
		maker.setTotalCount(showBoardService.getNumOfShowBoardRecords());
		maker.setPageLinkData();
		model.addAttribute("pageMaker", maker);
	}

	@RequestMapping(value = "/showdetail", method = RequestMethod.GET)
	public void showBoardDetail(@ModelAttribute("criteria") PaginationCriteria criteria, int sb_no, Model model) {
		logger.info("showBoardDetail(sb_no: {}, page: {}, numsPerPage: {}) 호출", sb_no, criteria.getPage(),
				criteria.getNumsPerPage());
		ShowBoard showboard = showBoardService.read(sb_no);
		model.addAttribute("showboard", showboard);
	}

	@RequestMapping(value = "/showinsert")
	public void showInsert() {
		logger.info("showInsert() 호출");

	}

	@Resource(name = "uploadPath")
	private String uploadPath;

	// 업로드
	@RequestMapping(value = "/showinsert", method = RequestMethod.POST)
	public void uploadPost(Member user, MultipartFile uploadFile, Model model) {
		logger.info("uploadPost() called");
		// logger.info("{} | {} | {}",
		// user.getUserid(), user.getPwd(), user.getEmail());

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
			// uploadedFile.transferTo(file);
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
