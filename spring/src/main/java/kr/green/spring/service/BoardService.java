package kr.green.spring.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import kr.green.spring.pagenation.Criteria;
import kr.green.spring.pagenation.PageMaker;
import kr.green.spring.vo.BoardVo;
import kr.green.spring.vo.UserVo;

public interface BoardService {

	ArrayList<BoardVo> getBoardList(Criteria cri);

	BoardVo getBoard(Integer num);

	void increaseViews(Integer num);

	void registerBoard(BoardVo board, HttpServletRequest request);

	int getBoardCnt(Criteria cri);

	void updateBoard(BoardVo board, UserVo user);

	void deleteBoard(Integer num);

	void deupBoard(Integer num, UserVo userVo);

	PageMaker getPageMaker(Criteria cri);

	int updateCommend(String num, String id, String string);

}
