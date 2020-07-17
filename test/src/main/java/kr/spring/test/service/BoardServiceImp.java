package kr.spring.test.service;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.test.controller.pagination.Criteria;
import kr.spring.test.controller.pagination.PageMaker;
import kr.spring.test.dao.BoardDao;
import kr.spring.test.vo.BoardVo;

@Service
public class BoardServiceImp implements BoardService {
	@Autowired
	private BoardDao boardDao;

	@Override
	public ArrayList<BoardVo> getBoardList(Criteria cri) {
		return boardDao.getBoardList(cri);
	}
//	DB안에 board테이블에 저장되어 있는 모든 값 중 cri변수로 type별 값 가져오기 

	@Override
	public BoardVo getBoard(Integer num) {
		if(num == null) {
			return null;
		}
		return boardDao.getBoard(num);
	}
//	board테이블의 특정 행의 모든 값 가져오기
	
	@Override
	public void updateViews(Integer num) {
		boardDao.updateViews(num);
//		실행문 작성
	}
//	board테이블의 특정 행의 views열 값을 바꾼다.
	
	@Override
	public int cntBoard(Criteria cri) {
		return boardDao.cntBoard(cri);
	}
//	board테이블에 cri변수로 type별 행이 몇개인지 센다.

	@Override
	public void insertBoard(BoardVo board) {
			boardDao.insertBoard(board);
	}
//	BoarVo의 형식에 맞는 board와 현재 게시글 갯수 boardCnt+1값을 넣어 게시글을 만든다.
	
	@Override
	public void updateBoard(BoardVo board) {
		board.setIsDel('N');
		board.setModify('Y');
		boardDao.updateBoard(board);
	}
//	board값을 수정하게되면 삭제여부는 'N'으로 유지 제목은 (수정)을 추가하도록 한다.

	@Override
	public void deleteBoard(Integer num) {
		BoardVo board = boardDao.getBoard(num);
		if(board == null)
			return;
		board.setIsDel('Y');
		board.setDelDate(new Date());
		boardDao.updateBoard(board);
	}
//	특정 튜플을 isDel에 'Y'를 delDate에 새로운 시간을 부여한다.
	
	@Override
	public PageMaker getPageMakerByBoard(Criteria cri) {
		PageMaker pm = new PageMaker();
		pm.setCriteria(cri);
		pm.setTotalContent(boardDao.cntBoard(cri));
		return pm;
	}
}
