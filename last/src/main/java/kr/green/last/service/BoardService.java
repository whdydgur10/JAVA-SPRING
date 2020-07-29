package kr.green.last.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import kr.green.last.pagination.Criteria;
import kr.green.last.pagination.PageMaker;
import kr.green.last.vo.BoardVo;

public interface BoardService {

	void insertBoard(BoardVo board, HttpServletRequest r);

	ArrayList<BoardVo> getBoardList(Criteria cri);

	int countBoard(Criteria cri);

	PageMaker getPageMaker(Criteria cri);

	BoardVo getBoard(Integer num);

}
