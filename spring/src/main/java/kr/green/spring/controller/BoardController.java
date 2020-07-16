package kr.green.spring.controller;

import java.util.ArrayList;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.green.spring.pagenation.Criteria;
import kr.green.spring.pagenation.PageMaker;
import kr.green.spring.service.BoardService;
import kr.green.spring.vo.BoardVo;

@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value = "/board/list", method = RequestMethod.GET)
	public ModelAndView boardListGet(ModelAndView mv, Criteria cri) {
		logger.info("URI : /board/list");
	    mv.setViewName("/board/list");
	    PageMaker pm = boardService.getPageMaker(cri);
	    ArrayList<BoardVo> list;
	    list = boardService.getBoardList(cri);
	    int boardCnt = boardService.getBoardCnt(cri);
	    mv.addObject("boardCnt", boardCnt);
	    mv.addObject("list", list);
	    mv.addObject("pm",pm);
	    return mv;
	}
	@RequestMapping(value = "/board/detail", method = RequestMethod.GET)
	public ModelAndView boardDetailGet(ModelAndView mv, Integer num, Criteria cri) {
		logger.info("URI : /board/detail");
	    mv.setViewName("/board/detail");
	    BoardVo board = null;
	    if(num != null) {
	    	board = boardService.getBoard(num);
	    	mv.addObject("board",board);
	    	if(board != null) {
	    		boardService.increaseViews(num);
	    		board.setViews(board.getViews()+1);
	    	}
	    }
	    mv.addObject("cri",cri);
		return mv;
	}
	@RequestMapping(value = "/board/register", method = RequestMethod.GET)
	public ModelAndView boardRegisterGet(ModelAndView mv) {
		logger.info("URI : /board/register:GET");
	    mv.setViewName("/board/register");
		return mv;
	}
	@RequestMapping(value = "/board/register", method = RequestMethod.POST)
	public ModelAndView boardRegisterPost(ModelAndView mv, BoardVo board) {
		logger.info("URI : /board/register:POST");
	    mv.setViewName("redirect:/board/list");
	    boardService.registerBoard(board);
		return mv;
	}
	@RequestMapping(value = "/board/modify", method = RequestMethod.GET)
	public ModelAndView boardModifyGet(ModelAndView mv, Integer num) {
		logger.info("URI : /board/modify:GET");
	    mv.setViewName("/board/modify");
	    BoardVo board = boardService.getBoard(num);
	    mv.addObject("board",board);
		return mv;
	}
	@RequestMapping(value = "/board/modify", method = RequestMethod.POST)
	public ModelAndView boardModifyPost(ModelAndView mv, BoardVo board) {
		logger.info("URI : /board/modify:POST");
	    mv.setViewName("redirect:/board/list");
	    boardService.updateBoard(board);
		return mv;
	}
	@RequestMapping(value = "/board/delete", method = RequestMethod.GET)
	public ModelAndView boardDeleteGet(ModelAndView mv, Integer num) {
		logger.info("URI : /board/delete:GET");
	    mv.setViewName("redirect:/board/list");
//	    boardService.deleteBoard(num);
	    boardService.deupBoard(num);
		return mv;
	}
}
