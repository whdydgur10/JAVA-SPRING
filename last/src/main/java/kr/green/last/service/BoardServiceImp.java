package kr.green.last.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.last.dao.BoardDao;
import kr.green.last.pagination.Criteria;
import kr.green.last.pagination.PageMaker;
import kr.green.last.vo.BoardVo;
import kr.green.last.vo.UserVo;

@Service
public class BoardServiceImp implements BoardService {

	@Autowired
	BoardDao boardDao;

	@Override
	public void insertBoard(BoardVo board, HttpServletRequest r) {
		UserVo user = (UserVo)r.getSession().getAttribute("user");
		if(board.getTitle() == null)
			board.setTitle("제목 없음");
		if(board.getContent() == null)
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
		pm.setCriteria(cri);
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

}
