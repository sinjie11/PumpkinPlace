package com.error404.pumpkinplace.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.error404.pumpkinplace.domain.ShowBoard;
import com.error404.pumpkinplace.pageutil.PageLinkMaker;
import com.error404.pumpkinplace.pageutil.PaginationCriteria;
import com.error404.pumpkinplace.service.ShowBoardService;

@Controller
@RequestMapping(value = "/showboard")
public class ShowBoardController {
	private static final Logger logger = LoggerFactory.getLogger(ShowBoardController.class);
	
	@Autowired ShowBoardService showBoardService;
	
	@RequestMapping(value = "/showboardmain")
	public void showBoard(Integer page, Integer numsPerPage, Model model){
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
		logger.info("showBoardDetail(sb_no: {}, page: {}, numsPerPage: {}) 호출", sb_no, criteria.getPage(), criteria.getNumsPerPage());
		ShowBoard showboard = showBoardService.read(sb_no);
		model.addAttribute("showboard", showboard);
	}
	
	@RequestMapping(value = "/showinsert")
	public void showInsert() {
		logger.info("showInsert() 호출");
		
	}
	
	
} // end class ShowBoardController
