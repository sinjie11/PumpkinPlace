package com.error404.pumpkinplace.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.error404.pumpkinplace.domain.Board;
import com.error404.pumpkinplace.domain.ShowBoard;
import com.error404.pumpkinplace.pageutil.PaginationCriteria;
import com.error404.pumpkinplace.service.BoardService;
import com.error404.pumpkinplace.service.ShowBoardService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	ShowBoardService showBoardService;
	
	@Autowired
	BoardService boardService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		// active 설정을 위해 추가
		model.addAttribute("url", "/");
		
		// 공연 페이지 코드
		List<ShowBoard> list = showBoardService.read();
		model.addAttribute("showboardList", list);
		
		
		
		// 여러 종류의 게시판 
		List<Board> listSectionNo1 = boardService.readBySectionNo1();
		List<Board> listSectionNo11 = boardService.readBySectionNo11();
		List<Board> listSectionNo12 = boardService.readBySectionNo12();
		model.addAttribute("boardList1", listSectionNo1);
		model.addAttribute("boardList11", listSectionNo11);
		model.addAttribute("boardList12", listSectionNo12);
		
		return "home";
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public void detail(@ModelAttribute("criteria") PaginationCriteria criteria, int b_no, Model model) {
		Board board = boardService.readDetail(b_no);
		model.addAttribute("board", board);
	}
	
	
	
	
}
