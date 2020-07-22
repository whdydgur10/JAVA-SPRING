package kr.green.spring.service;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.spring.dao.BoardDao;
import kr.green.spring.pagenation.Criteria;
import kr.green.spring.pagenation.PageMaker;
import kr.green.spring.vo.BoardVo;
import kr.green.spring.vo.UserVo;

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
	public void registerBoard(BoardVo board, HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserVo user = (UserVo)session.getAttribute("user");
		if(user == null)
			return ;
		board.setWriter(user.getId());
		boardDao.registerBoard(board);
	}

	@Override
	public int getBoardCnt(Criteria cri) {
		return boardDao.getBoardCnt(cri);
	}

	@Override
	public void updateBoard(BoardVo board, UserVo user) {
		board.setWriter(user.getId());
		board.setIsDel('N');
		board.setModify('Y');
		boardDao.updateBoard(board);
	}

	@Override
	public void deleteBoard(Integer num) {
		boardDao.deleteBoard(num); 
	}

	@Override
	public void deupBoard(Integer num, UserVo userVo) {
	    if(num != null && userVo != null) {
	    	BoardVo board = boardDao.getBoard(num);
	    	if(board != null && board.getWriter().equals(userVo.getId())) {
	    		board.setIsDel('Y');
	    		board.setDelDate(new Date());
	    		boardDao.updateBoard(board);
	    	}
	    }
	}

	@Override
	public PageMaker getPageMaker(Criteria cri) {
		PageMaker pm = new PageMaker();
		pm.setCriteria(cri);
		pm.setTotalCount(boardDao.getBoardCnt(cri));
		return pm;
	}

	@Override
	public int updateCommend(String num, String id, String commend) {
		if(boardDao.isCommend(Integer.parseInt(num),id) == 0) {
			boardDao.insertCommend(Integer.parseInt(num), id);
		}else {
			return -1;
		}
		BoardVo board = boardDao.getBoard(Integer.parseInt(num));
		boardDao.updateBoard(board);
		board = boardDao.getBoard(Integer.parseInt(num));
		return board.getCommend();
		
	}

}
