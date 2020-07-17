package kr.spring.test.service;

import java.util.ArrayList;

import kr.spring.test.controller.pagination.Criteria;
import kr.spring.test.controller.pagination.PageMaker;
import kr.spring.test.vo.BoardVo;

public interface BoardService {

	ArrayList<BoardVo> getBoardList(Criteria cri);

	BoardVo getBoard(Integer num);

	void updateViews(Integer num);
	
	int cntBoard(Criteria cri);
	
	void insertBoard(BoardVo board);

	void updateBoard(BoardVo board);

	void deleteBoard(Integer num);

	PageMaker getPageMakerByBoard(Criteria cri);

}
