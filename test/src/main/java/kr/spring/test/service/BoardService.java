package kr.spring.test.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import kr.spring.test.controller.pagination.Criteria;
import kr.spring.test.controller.pagination.PageMaker;
import kr.spring.test.vo.BoardVo;

public interface BoardService {

	ArrayList<BoardVo> getBoardList(Criteria cri);

	BoardVo getBoard(Integer num);

	void updateViews(Integer num);
	
	int cntBoard(Criteria cri);
	
	void insertBoard(BoardVo board, HttpServletRequest request);

	void updateBoard(BoardVo board, HttpServletRequest request);

	void deleteBoard(Integer num, HttpServletRequest request);

	PageMaker getPageMakerByBoard(Criteria cri);

}
