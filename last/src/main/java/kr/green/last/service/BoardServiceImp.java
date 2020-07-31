package kr.green.last.service;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.last.dao.BoardDao;
import kr.green.last.pagination.Criteria;
import kr.green.last.pagination.PageMaker;
import kr.green.last.vo.BoardVo;
import kr.green.last.vo.CommendVo;
import kr.green.last.vo.FileVo;
import kr.green.last.vo.UserVo;

@Service
public class BoardServiceImp implements BoardService {

	@Autowired
	BoardDao boardDao;
	
	@Override
	public void insertBoard(BoardVo board, HttpServletRequest r){
		UserVo user = (UserVo)r.getSession().getAttribute("user");
		if(board.getTitle().equalsIgnoreCase(""))
			board.setTitle("제목 없음");
		if(board.getContent().equals(""))
			board.setContent("");
		boardDao.insertBoard(board, user.getId());
	}

	@Override
	public ArrayList<BoardVo> getBoardList(Criteria cri) {
		return boardDao.getBoardList(cri);
	}

	@Override
	public int countBoard(Criteria cri) {
		return boardDao.countBoard(cri);
	}

	@Override
	public PageMaker getPageMaker(Criteria cri) {
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(boardDao.countBoard(cri));
		return pm;
	}

	@Override
	public BoardVo getBoard(Integer num) {
		BoardVo board = boardDao.getBoard(num);
		boardDao.updateViews(num);
		if(board == null || board.getIsDel() != 'N') {
			return null;
		}
		return board;
	}

	@Override
	public void updateBoard(BoardVo board) {
		board.setModifyDate(new Date());
		System.out.println(board.getModifyDate());
		board.setModify('Y');
		boardDao.updateBoard(board);
		
	}

	@Override
	public void deleteBoard(Integer num, HttpServletRequest r) {
		BoardVo board = getBoard(num);
		UserVo user = (UserVo)r.getSession().getAttribute("user");
		if(board.getWriter().equals(user.getId())) {
			board.setIsDel('Y');
			board.setDelDate(new Date());
			boardDao.deleteBoard(board);
		}
	}

	@Override
	public boolean updateCommend(int num, HttpServletRequest r, int type) {
		UserVo user = (UserVo)r.getSession().getAttribute("user");
		BoardVo board = boardDao.getBoard(num);
		CommendVo commend = boardDao.getCommend(board, user);
		if(commend == null) {
			boardDao.insertCommend(board, user, type);
			boardDao.updateBoard(board);
			return true;
		}else if(commend.getType() != type) {
				boardDao.updateCommend(commend, type);
				boardDao.updateBoard(board);
			return true;
		}
		return false;
	}

	@Override
	public void insertFile(int boardNum, String fileName) {
		boardDao.insertFile(boardNum, fileName);
		
	}

	@Override
	public int getBoardNum() {
		return boardDao.getBoardNum();
	}

	@Override
	public ArrayList<FileVo> getFileList(Integer num) {
		return boardDao.getFileList(num);
	}

	@Override
	public void updateBoardFile(int boardNum) {
		boardDao.updateBoardFile(boardNum);
		
	}

	@Override
	public void deleteBoardFile(int num) {
		boardDao.deleteBoardFile(num);
	}

}
