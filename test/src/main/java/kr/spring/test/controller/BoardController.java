package kr.spring.test.controller;

import java.util.ArrayList;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.test.service.BoardService;
import kr.spring.test.vo.BoardVo;

@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value = "/board/list", method = RequestMethod.GET)
	public ModelAndView boardListGet(ModelAndView mv) {
	    mv.setViewName("/board/list");
	    ArrayList<BoardVo> list = boardService.getBoardList();
	    mv.addObject("list",list);
	    int boardCnt = boardService.cntBoard();
	    mv.addObject("boardCnt",boardCnt);
//	    boardService를 통해 받아온 list를 "list"라는 이름을 가지고 /board/list 서버로 보내준다음 서버에서 받은 이름 ${list}으로 값을 나타낸다.
	    return mv;
	}
	
	@RequestMapping(value = "/board/detail", method = RequestMethod.GET)
	public ModelAndView boardDetailGet(ModelAndView mv, Integer num) {
	    mv.setViewName("/board/detail");
	    BoardVo board = boardService.getBoard(num);
	    mv.addObject("board",board);
	    boardService.updateViews(num);
	    board.setViews(board.getViews()+1);
	    return mv;
	}
	
	@RequestMapping(value = "/board/register", method = RequestMethod.GET)
	public ModelAndView boardRegisterGet(ModelAndView mv) {
	    mv.setViewName("/board/register");
	    return mv;
	}
	
	@RequestMapping(value = "/board/register", method = RequestMethod.POST)
	public ModelAndView boardRegisterPOST(ModelAndView mv, BoardVo board) {
	    int boardCnt = boardService.cntBoard()+1;
	    if(!(board.getTitle().equals("")) && !(board.getWriter().equals(""))) {
	    	boardService.insertBoard(board, boardCnt);
	    	mv.setViewName("redirect:/board/list");
	    }
	    return mv;
	}
	
	@RequestMapping(value = "/board/modify", method = RequestMethod.GET)
	public ModelAndView boardModifyGet(ModelAndView mv, Integer num) {
	    mv.setViewName("/board/modify");
	    BoardVo board = boardService.getBoard(num);
	    mv.addObject("board",board);
	    return mv;
	}
	
	@RequestMapping(value = "/board/modify", method = RequestMethod.POST)
	public ModelAndView boardModifyPost(ModelAndView mv,BoardVo board) {
	    boardService.updateBoard(board);
	    mv.setViewName("redirect:/board/list");
	    return mv;
	}
	
	@RequestMapping(value = "/board/delete", method = RequestMethod.GET)
	public ModelAndView boardDeleteGet(ModelAndView mv,Integer num) {
		mv.setViewName("redirect:/board/list");
	    boardService.deleteBoard(num);
	    return mv;
	}
}
