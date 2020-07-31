package kr.green.last.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import kr.green.last.pagination.Criteria;
import kr.green.last.pagination.PageMaker;
import kr.green.last.vo.BoardVo;
import kr.green.last.vo.FileVo;

public interface BoardService {

	void insertBoard(BoardVo board, HttpServletRequest r);

	ArrayList<BoardVo> getBoardList(Criteria cri);

	int countBoard(Criteria cri);

	PageMaker getPageMaker(Criteria cri);

	BoardVo getBoard(Integer num);

	void updateBoard(BoardVo board);

	void deleteBoard(Integer num, HttpServletRequest r);

	boolean updateCommend(int num, HttpServletRequest r, int type);

	void insertFile(int boardNum, String fileName);

	int getBoardNum();

	ArrayList<FileVo> getFileList(Integer num);

	void updateBoardFile(int boardNum);

	void deleteBoardFile(int num);

}
