package kr.spring.test.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.test.controller.pagination.Criteria;
import kr.spring.test.controller.pagination.PageMaker;
import kr.spring.test.service.BoardService;
import kr.spring.test.service.UserService;
import kr.spring.test.vo.BoardVo;
import kr.spring.test.vo.UserVo;

@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	@Autowired
	private BoardService boardService;
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/board/list", method = RequestMethod.GET)
	public ModelAndView boardListGet(ModelAndView mv, Criteria cri) {
	    mv.setViewName("/board/list");
	    PageMaker pm = boardService.getPageMakerByBoard(cri);
	    ArrayList<BoardVo> list = boardService.getBoardList(cri);
	    mv.addObject("list",list);
//	    boardService를 통해 받아온 list를 "list"라는 이름을 가지고 /board/list 서버로 보내준다음 서버에서 받은 이름 ${list}으로 값을 나타낸다.
	    mv.addObject("boardCnt",pm.getTotalContent());
	    mv.addObject("pm",pm);
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
	public ModelAndView boardRegisterPOST(ModelAndView mv, BoardVo board, HttpServletRequest request) {
	    if(!(board.getTitle().equals(""))) {
	    	boardService.insertBoard(board, request);
	    	mv.setViewName("redirect:/board/list");
	    }
	    return mv;
	}
	
	@RequestMapping(value = "/board/modify", method = RequestMethod.GET)
	public ModelAndView boardModifyGet(ModelAndView mv, Integer num, HttpServletRequest request) {
	    mv.setViewName("/board/modify");
	    BoardVo board = boardService.getBoard(num);
	    UserVo user = userService.getUser(request);
	    if(board == null || !user.getId().equals(board.getWriter()))
	    	mv.setViewName("redirect:/board/list");
	    mv.addObject("board",board);
	    return mv;
	}
	
	@RequestMapping(value = "/board/modify", method = RequestMethod.POST)
	public ModelAndView boardModifyPost(ModelAndView mv,BoardVo board, HttpServletRequest request) {
	    boardService.updateBoard(board, request);
	    mv.setViewName("redirect:/board/list");
	    return mv;
	}
	
	@RequestMapping(value = "/board/delete", method = RequestMethod.GET)
	public ModelAndView boardDeleteGet(ModelAndView mv,Integer num, HttpServletRequest request) {
		mv.setViewName("redirect:/board/list");
	    boardService.deleteBoard(num, request);
	    return mv;
	}
	
	@RequestMapping(value ="/commend")
	@ResponseBody
	public Map<Object, Object> commend(@RequestBody int num, HttpServletRequest request){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    if(boardService.insertCommend(num, request, 1)==false) {
	    	map.put("success",false);
		}
	    else {
	    	BoardVo board = boardService.getBoard(num);
	    	map.put("success",true);
	    	map.put("commend",board.getCommend());
	    	map.put("deprecated",board.getDeprecated());
	    }
	    return map;
	}
	
	@RequestMapping(value ="/deprecated")
	@ResponseBody
	public Map<Object, Object> deprecated(@RequestBody int num, HttpServletRequest request){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    if(boardService.insertCommend(num, request, 0)==false) {
	    	map.put("success",false);
		}
	    else {
	    	BoardVo board = boardService.getBoard(num);
	    	map.put("success",true);
	    	map.put("commend",board.getCommend());
	    	map.put("deprecated",board.getDeprecated());
	    }
	    return map;
	}
}
