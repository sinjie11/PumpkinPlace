package com.error404.pumpkinplace.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.error404.pumpkinplace.service.BoardService;
import com.fasterxml.jackson.databind.util.JSONPObject;
import com.error404.pumpkinplace.domain.Board;
import com.error404.pumpkinplace.pageutil.PageLinkMaker;
import com.error404.pumpkinplace.pageutil.PaginationCriteria;

@Controller
@RequestMapping(value = "/board")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService boardService;
	
	/* 
	페이지 10/20/40개 동적처리는 한 줄짜리 주석으로 따로 빼놨습니다. 아직 jsp와 연동 전이기 때문에
	 PageLinkMaker와 PaginationCriteria 클래스의 디폴트 생성자가 아닌 매개변수 생성자를 호출하게
	되면 NullPointerException이 발생합니다. 일단 임시로 디폴트 생성자로 두겠습니다.
	 */
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
//	public void list(Integer page, Integer numsOfPageLinks, Integer numsPerPage, Model model) {
	public void list(Integer page, Integer numsPerPage, Model model, int urlNo) {
		logger.info("list(urlNo: {}) 호출", urlNo);
		// numsPerPage에 들어갈 수는 10/20/40 중 하나
//		PaginationCriteria criteria = new PaginationCriteria(page, numsPerPage);
		PaginationCriteria criteria = new PaginationCriteria();
		if (page != null) {//수형아 왜코딩이 멈춤??일해라 핫산!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
			criteria.setPage(page);
		}
		if (numsPerPage != null) {
			criteria.setNumsPerPage(numsPerPage);
		}
		
		List<Board> list = boardService.read(criteria);
		model.addAttribute("boardList", list);
		
//		PageLinkMaker maker = new PageLinkMaker(numsOfPageLinks);
		PageLinkMaker maker = new PageLinkMaker();
		maker.setCriteria(criteria);
		maker.setTotalCount(boardService.getNumOfRecords());
		maker.setPageLinkData();
		model.addAttribute("pageMaker", maker);
		
		model.addAttribute("urlNo", urlNo);
		
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void register(Model model, int urlNo) {
		logger.info("register() GET 호출");

		model.addAttribute("urlNo", urlNo);
		
	} 
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(Board board) {
		logger.info("register({}) POST 호출", board);
		boardService.create(board);
				
		return "redirect:/board/list";
	} 
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public void detail(
			@ModelAttribute("criteria") PaginationCriteria criteria,
			int b_no, Model model) {
		logger.info("detail(bno: {}, page: {}, numsPerPage: {}) 호출", 
				b_no, criteria.getPage(), criteria.getNumsPerPage());
		Board board = boardService.read(b_no);
		model.addAttribute("board", board);
	} 
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public void update(
			@ModelAttribute("criteria") PaginationCriteria criteria,
			int b_no, Model model) {
		logger.info("update(b_no: {})", b_no);
		Board board = boardService.read(b_no);
		model.addAttribute("board", board);
		
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(
			@ModelAttribute("criteria") PaginationCriteria criteria,
			Board board, RedirectAttributes attr) {
		logger.info("update(board: {})", board);
		int result = boardService.update(board);
		if (result == 1) {
			attr.addFlashAttribute("updateResult", "success");
		}
		
		return "redirect:detail?b_no=" + board.getB_no();
	} 
	
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String delete(int b_no, RedirectAttributes attr) {
		logger.info("delete(bno: {})", b_no);
		int result = boardService.delete(b_no);
		if (result == 1) {
			attr.addFlashAttribute("bno", b_no);
			attr.addFlashAttribute("deleteResult", "success");
		}
		
		return "redirect:list";
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public void search(int searchType, String searchKeyword,
			Model model) {
		logger.info("search(type: {}, keyword: {})",
				searchType, searchKeyword);
		List<Board> list = 
				boardService.read(searchType, searchKeyword);
		model.addAttribute("boardList", list);
		model.addAttribute("searchKeyword", searchKeyword);  
	} 	
	@RequestMapping(value = "/insert" , method = RequestMethod.POST)
	public ResponseEntity<Integer> insert(@RequestBody Board board) {
		logger.info("===== {}, {}, {}, {} ",
				board.getB_section(),
				board.getB_title(),
				board.getB_id(),
				board.getB_content());
		int result = boardService.create(board);
		ResponseEntity<Integer> entity =
				new ResponseEntity<Integer>(result, HttpStatus.OK);
		return entity;

	}
	@RequestMapping(value = "/testdetail" ,method = RequestMethod.GET)
	public void testdetail(int bno ,Model model) {
		Board board = boardService.readDetail(bno);
		model.addAttribute("board",board);
	}

	
}
