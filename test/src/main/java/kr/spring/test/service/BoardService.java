package kr.spring.test.service;

import java.util.ArrayList;

import kr.spring.test.vo.BoardVo;

public interface BoardService {

	ArrayList<BoardVo> getBoardList();

	BoardVo getBoard(Integer num);

	void updateViews(Integer num);

}
