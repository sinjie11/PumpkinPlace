package com.error404.pumpkinplace.controller;

import java.util.List;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.error404.pumpkinplace.service.BoardService;
import com.error404.pumpkinplace.domain.Board;
import com.error404.pumpkinplace.pageutil.PageLinkMaker;
import com.error404.pumpkinplace.pageutil.PaginationCriteria;

@Controller
@RequestMapping(value = "/board")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	private BoardService boardService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(Integer page, Integer numsPerPage, Integer urlNo, Model model) {
		logger.info("list(urlNo: {}) 호출", urlNo);
		PaginationCriteria criteria = new PaginationCriteria();
		if (page != null) {
			criteria.setPage(page);
		}
		if (numsPerPage != null) {
			criteria.setNumsPerPage(numsPerPage);
		}
		
		if (urlNo == 1 || urlNo == 2 || urlNo == 3
		 || urlNo == 4 || urlNo == 5 || urlNo == 6
		 || urlNo == 7 || urlNo == 8 || urlNo == 9
		 || urlNo == 10 || urlNo == 20) {
			List<Board> list = boardService.readBySectionNo(urlNo, criteria);
			logger.info("urlNo : {}, page : {}, numsPerPage : {}", urlNo, criteria.getPage(),
					criteria.getNumsPerPage());
			model.addAttribute("boardList", list);
			logger.info("***** board list size {}", list.size());
			PageLinkMaker maker = new PageLinkMaker();
			maker.setCriteria(criteria);
			maker.setTotalCount(boardService.getNumOfRecords(urlNo));
			maker.setPageLinkData();
			model.addAttribute("pageMaker", maker);
			model.addAttribute("urlNo", urlNo);
		}
		else if (urlNo == 11) {
			List<Board> list = boardService.readAllBySectionNo11(criteria);
			model.addAttribute("boardList", list);
			logger.info("***** board list size {}", list.size());
			PageLinkMaker maker = new PageLinkMaker();
			maker.setCriteria(criteria);
			maker.setTotalCount(boardService.getNumOfRecords(urlNo));
			maker.setPageLinkData();
			model.addAttribute("pageMaker", maker);
			model.addAttribute("urlNo", urlNo);
		}
		else if (urlNo ==12) {
			List<Board> list = boardService.readAllBySectionNo12(criteria);
			model.addAttribute("boardList", list);
			logger.info("***** board list size {}", list.size());
			PageLinkMaker maker = new PageLinkMaker();
			maker.setCriteria(criteria);
			maker.setTotalCount(boardService.getNumOfRecords(urlNo));
			maker.setPageLinkData();
			model.addAttribute("pageMaker", maker);
			model.addAttribute("urlNo", urlNo);
		}
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
	public void detail(@ModelAttribute("criteria") PaginationCriteria criteria, int  b_no, Model model) {
		Board board = boardService.readDetail(b_no);
		model.addAttribute("board", board);
	} 
	
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public void update(
			@ModelAttribute("criteria") PaginationCriteria criteria,
			int b_no ,Model model) {
			Board board = boardService.readByBno(b_no);
			model.addAttribute("board",board);
	}
	
	@RequestMapping(value="/update" ,method = RequestMethod.POST)
	public void update(@RequestBody Board board) {
			System.out.println("******" + board.getB_content());
			boardService.update(board);
			
	}
	
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(int b_no,int urlNo) {//TODO 딜리드 애이작스로 다시 안보내줌 왜 안보내주는거냐 씹새끼야 
		System.out.println("/pumpkinplace/board/list?urlNo="+urlNo);
		boardService.delete(b_no);
		return "redirect:list?urlNo="+urlNo ;
	}


	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public void search( Integer searchType,String searchKeyword, 
			Integer urlNo,Integer page, Integer numsPerPage, Model model) {
		logger.info("search(page : {}, numsPerPage : {}) 호출", page, numsPerPage);
		logger.info("search(type: {}, keyword: {}, urlNo : {})", searchType, searchKeyword, urlNo);
		PaginationCriteria criteria = new PaginationCriteria();
		if (page != null) {
			criteria.setPage(page);
		}
		if (numsPerPage != null) {
			criteria.setNumsPerPage(numsPerPage);
		}
		if (urlNo == 1 || urlNo == 2 || urlNo == 3
				 || urlNo == 4 || urlNo == 5 || urlNo == 6
				 || urlNo == 7 || urlNo == 8 || urlNo == 9
				 || urlNo == 10 || urlNo == 20) {
		List<Board> list = boardService.read(searchType, searchKeyword, urlNo, criteria);
		model.addAttribute("boardList", list);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("urlNo", urlNo);
		PageLinkMaker maker = new PageLinkMaker();
		maker.setCriteria(criteria);
		maker.setTotalCount(boardService.getNumOfSearchRecords(searchType, searchKeyword, urlNo));
		maker.setPageLinkData();
		model.addAttribute("pageMaker", maker);
		model.addAttribute("page", page);
		model.addAttribute("numsPerPage", numsPerPage);
		} 
		
		else if (urlNo == 11) {
			List<Board> list = boardService.readSectionNo11(searchType, searchKeyword,  criteria);
			model.addAttribute("boardList", list);
			model.addAttribute("searchType", searchType);
			model.addAttribute("searchKeyword", searchKeyword);
			model.addAttribute("urlNo", urlNo);
			PageLinkMaker maker = new PageLinkMaker();
			maker.setCriteria(criteria);
			maker.setTotalCount(boardService.getNumOfSearchRecords(searchType, searchKeyword, urlNo));
			maker.setPageLinkData();
			model.addAttribute("pageMaker", maker);
		}
		else {
			List<Board> list = boardService.readSectionNo12(searchType, searchKeyword, criteria);
			model.addAttribute("boardList", list);
			model.addAttribute("searchType", searchType);
			model.addAttribute("searchKeyword", searchKeyword);
			model.addAttribute("urlNo", urlNo);
			PageLinkMaker maker = new PageLinkMaker();
			maker.setCriteria(criteria);
			maker.setTotalCount(boardService.getNumOfSearchRecords(searchType, searchKeyword, urlNo));
			maker.setPageLinkData();
			model.addAttribute("pageMaker", maker);
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public ResponseEntity<Integer> insert(@RequestBody Board board) {
		logger.info("===== {}, {}, {}, {} ", board.getB_section(), board.getB_title(), board.getB_id(),
				board.getB_content());
		int result = boardService.create(board);
		ResponseEntity<Integer> entity = new ResponseEntity<Integer>(result, HttpStatus.OK);
		return entity;
	}
	
	@RequestMapping(value="/pulsUp")
	public ResponseEntity<Board> pulsUp(int b_no ) {//좋아요
		Board result = boardService.upPuls1(b_no);
		ResponseEntity<Board> entity = 
				new ResponseEntity<Board>(result,HttpStatus.OK);
		return entity;
	}
	@RequestMapping(value="/pulsDown")
	public ResponseEntity<Board> pulsDowm(int b_no) {//싫어요
		Board result = boardService.downPuls1(b_no);
		ResponseEntity<Board> entity = 
				new ResponseEntity<Board>(result,HttpStatus.OK);
		return entity;
	}
	
	
	//////////////////이전 페이지
	@ResponseBody
	@RequestMapping(value = "/prevBoardNo", method = RequestMethod.POST)
	public ResponseEntity<Integer> PrevBoardNo(@RequestBody Board board) {
		logger.info("----- b_no: {}, b_section: {}", board.getB_no(), board.getB_section());
		int result = boardService.prevboardNo(board); // 이전 게시글 번호 넘겨줌
		ResponseEntity<Integer> entity = new ResponseEntity<Integer>(result, HttpStatus.OK);
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value = "/nextBoardNo", method = RequestMethod.POST)
	public ResponseEntity<Integer> NextBoardNo(@RequestBody Board board) {
		logger.info("----- b_no: {}, b_section: {}", board.getB_no(), board.getB_section());
		int result = boardService.nextboardNo(board); // 다음 게시글 번호 넘겨줌
		ResponseEntity<Integer> entity = new ResponseEntity<Integer>(result, HttpStatus.OK);
		return entity;
	}
}
