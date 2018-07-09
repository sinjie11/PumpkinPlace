package com.error404.pumpkinplace.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.annotation.Resource;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.util.FileCopyUtils;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.error404.pumpkinplace.domain.Board;
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

	@RequestMapping(value = "/showboardmain", method = RequestMethod.GET)
	public void showBoard(Integer page, Integer numsPerPage, Model model) {
		logger.info("showboard() 호출");
		numsPerPage = 12;
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
		
		model.addAttribute("url", "showboard"); // action 설정을 위한 url 값 넘겨주기
	}

	@RequestMapping(value = "/showdetail", method = RequestMethod.GET)
	public void showBoardDetail(@ModelAttribute("criteria") PaginationCriteria criteria, int sb_no, Model model) {
		logger.info("showBoardDetail(sb_no: {}, page: {}, numsPerPage: {}) 호출", sb_no, criteria.getPage(),
				criteria.getNumsPerPage());
		ShowBoard showboard = showBoardService.read(sb_no);
		model.addAttribute("showboard", showboard);
	}

	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@RequestMapping(value = "/showinsert", method = RequestMethod.GET)
	public void showInsert(Model model) {
		logger.info("showInsert() GET 호출");

		model.addAttribute("url", "showboard"); // active 설정을 위한 url 값 넘겨주기

	}

	@RequestMapping(value = "/showinsert", method = RequestMethod.POST)
	@ResponseBody
	public int showInsert(@RequestBody ShowBoard showboard, MultipartFile uploadFile, Model model) {
		logger.info("showInsert({}, {}) POST 호출", showboard, showboard.getSb_nm());
		logger.info("Name: {}", uploadFile.getName()); // request param name
		logger.info("Original File Name: {}", uploadFile.getOriginalFilename());
		logger.info("Size: {}", uploadFile.getSize());
		
		
		int result = showBoardService.create(showboard);
		String savedName = saveUploadedFile(uploadFile);
		model.addAttribute("saved", savedName);
		
		return result;
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
	
	@RequestMapping(value = "/showboardsearch", method = RequestMethod.GET)
	public void searchShowBoard(String searchKeyword, String searchKeyDate, Model model) {
		logger.info("showboardsearch(keyword: {})", searchKeyword);
		logger.info("showboardsearch(keyDate: {})", searchKeyDate);
		if (searchKeyDate != null) {
			List<ShowBoard> datelist = showBoardService.searchByDate(searchKeyDate);
			model.addAttribute("showboardListDate", datelist);
			model.addAttribute("searchKeyDate", searchKeyDate);
		}
		if(searchKeyword != null) {
			List<ShowBoard> keylist = showBoardService.searchByKeyword(searchKeyword);
			model.addAttribute("showboardListKey", keylist);
			model.addAttribute("searchKeyword", searchKeyword);
		}	
	}
	
	@RequestMapping(value = "/showboardupdate", method = RequestMethod.GET)
	public void update(
			@ModelAttribute("criteria") PaginationCriteria criteria, int sb_no, Model model) {
		logger.info("update(bnoooooo: {})", sb_no);
		ShowBoard showboard = showBoardService.read(sb_no);
		model.addAttribute("showboard", showboard);
		model.addAttribute("sb_no", sb_no);
		
	} // end update()
	

	@RequestMapping(value = "/showboardupdate", method = RequestMethod.POST)
	public  ResponseEntity<Integer> update(
			@ModelAttribute("criteria") PaginationCriteria criteria,
		@RequestBody ShowBoard showboard, RedirectAttributes attr) {
		logger.info("update(board: {})", showboard.getSb_no());
		int result = showBoardService.update(showboard);
		if (result == 1) {
			attr.addFlashAttribute("updateResult", "success");
		}
		// Model: forward 방식에서 View(JSP)에게 데이터를 전달할 때 사용하는 객체
		// model.addAttribute(이름, 값);
		// RedirectAttributes: redirect 방식에서 View(JSP)에게 데이터를 전달할 때 사용하는 객체
		// redirectAttributes.addFlashAttribute(이름, 값);
		
		
		ResponseEntity<Integer> entity = new ResponseEntity<Integer>(result, HttpStatus.OK);
		return entity;
	} // end update()
	 
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String delete(int sb_no, RedirectAttributes attr) {
		logger.info("delete(bno: {})", sb_no);
		int result = showBoardService.delete(sb_no);
		if (result == 1) {
			attr.addFlashAttribute("sb_no", sb_no);
			attr.addFlashAttribute("deleteResult", "success");
		}
		
		return "redirect:/showboard/showboardmain";
	} // end delete()
	
	
} // end class ShowBoardController


