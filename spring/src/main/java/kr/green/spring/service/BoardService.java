package kr.green.spring.service;

import java.util.ArrayList;

import kr.green.spring.pagenation.Criteria;
import kr.green.spring.pagenation.PageMaker;
import kr.green.spring.vo.BoardVo;

public interface BoardService {

	ArrayList<BoardVo> getBoardList(Criteria cri);

	BoardVo getBoard(Integer num);

	void increaseViews(Integer num);

	void registerBoard(BoardVo board);

	int getBoardCnt(Criteria cri);

	void updateBoard(BoardVo board);

	void deleteBoard(Integer num);

	void deupBoard(Integer num);

	PageMaker getPageMaker(Criteria cri);

}
