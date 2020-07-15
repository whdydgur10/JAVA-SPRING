package kr.green.spring.service;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.spring.dao.BoardDao;
import kr.green.spring.pagenation.Criteria;
import kr.green.spring.pagenation.PageMaker;
import kr.green.spring.vo.BoardVo;

@Service
public class BoardServiceImp implements BoardService {
	@Autowired
	private BoardDao boardDao;

	@Override
	public ArrayList<BoardVo> getBoardList(Criteria cri) {
		return boardDao.getBoardList(cri);
	}

	@Override
	public BoardVo getBoard(Integer num) {
		return boardDao.getBoard(num);
	}

	@Override
	public void increaseViews(Integer num) {
		boardDao.increaseViews(num);
	}

	@Override
	public void registerBoard(BoardVo board) {
		boardDao.registerBoard(board);
	}

	@Override
	public int getBoardCnt() {
		return boardDao.getBoardCnt();
	}

	@Override
	public void updateBoard(BoardVo board) {
		board.setIsDel('N');
		boardDao.updateBoard(board);
	}

	@Override
	public void deleteBoard(Integer num) {
		boardDao.deleteBoard(num);
	}

	@Override
	public void deupBoard(Integer num) {
	    if(num != null) {
	    	BoardVo board = boardDao.getBoard(num);
	    	if(board != null) {
	    		board.setIsDel('Y');
	    		board.setDelDate(new Date());
	    		boardDao.updateBoard(board);
	    	}
	    }
	}

	@Override
	public PageMaker getPageMaker(Criteria cri) {
		PageMaker pm = new PageMaker();
		int totalCount = boardDao.getBoardCnt();
		pm.setCriteria(cri);
		pm.setTotalCount(totalCount);
		return pm;
	}

}
