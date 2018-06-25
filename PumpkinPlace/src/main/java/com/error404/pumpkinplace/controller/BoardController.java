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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.error404.pumpkinplace.service.BoardService;

import com.error404.pumpkinplace.domain.Board;
//import com.error404.pumpkinplace.pageutil.PageLinkMaker;
//import com.error404.pumpkinplace.pageutil.PaginationCriteria;

@Controller
@RequestMapping(value = "/board")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(Integer page, Integer numsPerPage, Model model) {
		logger.info("list() 호출");
		
//		PaginationCriteria criteria = new PaginationCriteria();
//		if (page != null) {
//			criteria.setPage(page);
//		}
//		if (numsPerPage != null) {
//			criteria.setNumsPerPage(numsPerPage);
//		}
//		
//		List<Board> list = boardService.read(criteria);
//		model.addAttribute("boardList", list);
//		
//		PageLinkMaker maker = new PageLinkMaker();
//		maker.setCriteria(criteria);
//		maker.setTotalCount(boardService.getNumOfRecords());
//		maker.setPageLinkData();
//		model.addAttribute("pageMaker", maker);
		
	} // end list()
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void register() {
		logger.info("register() GET 호출");
	} // end register()
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(Board board) {
		logger.info("register({}) POST 호출", board);
		boardService.create(board);
		
		return "redirect:/board/list";
	} // end register()
	
//	@RequestMapping(value = "/detail", method = RequestMethod.GET)
//	public void detail(
//			@ModelAttribute("criteria") PaginationCriteria criteria,
//			int b_no, Model model) {
//		logger.info("detail(bno: {}, page: {}, numsPerPage: {}) 호출", 
//				b_no, criteria.getPage(), criteria.getNumsPerPage());
//		Board board = boardService.read(b_no);
//		model.addAttribute("board", board);
//	} // end detail()
//	
//	@RequestMapping(value = "/update", method = RequestMethod.GET)
//	public void update(
//			@ModelAttribute("criteria") PaginationCriteria criteria,
//			int b_no, Model model) {
//		logger.info("update(bno: {})", b_no);
//		Board board = boardService.read(b_no);
//		model.addAttribute("board", board);
//		
//	} // end update()
//	
//	@RequestMapping(value = "/update", method = RequestMethod.POST)
//	public String update(
//			@ModelAttribute("criteria") PaginationCriteria criteria,
//			Board board, RedirectAttributes attr) {
//		logger.info("update(board: {})", board);
//		int result = boardService.update(board);
//		if (result == 1) {
//			attr.addFlashAttribute("updateResult", "success");
//		}
//		// Model: forward 방식에서 View(JSP)에게 데이터를 전달할 때 사용하는 객체
//		// model.addAttribute(이름, 값);
//		// RedirectAttributes: redirect 방식에서 View(JSP)에게 데이터를 전달할 때 사용하는 객체
//		// redirectAttributes.addFlashAttribute(이름, 값);
//		
//		return "redirect:detail?b_no=" + board.getB_no();
//	} // end update()
//	
//	@RequestMapping(value = "delete", method = RequestMethod.GET)
//	public String delete(int b_no, RedirectAttributes attr) {
//		logger.info("delete(bno: {})", b_no);
//		int result = boardService.delete(b_no);
//		if (result == 1) {
//			attr.addFlashAttribute("bno", b_no);
//			attr.addFlashAttribute("deleteResult", "success");
//		}
//		
//		return "redirect:list";
//	} // end delete()
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public void search(int searchType, String searchKeyword,
			Model model) {
		logger.info("search(type: {}, keyword: {})",
				searchType, searchKeyword);
		List<com.error404.pumpkinplace.domain.Board> list = 
				boardService.read(searchType, searchKeyword);
		model.addAttribute("boardList", list);
		model.addAttribute("searchKeyword", searchKeyword);
	} // end search()
}
