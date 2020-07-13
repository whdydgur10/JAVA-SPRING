package kr.spring.test.service;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.test.dao.BoardDao;
import kr.spring.test.vo.BoardVo;

@Service
public class BoardServiceImp implements BoardService {
	@Autowired
	private BoardDao boardDao;

	@Override
	public ArrayList<BoardVo> getBoardList() {
		return boardDao.getBoardList();
	}

	@Override
	public BoardVo getBoard(Integer num) {
		try {
			for(int i = 1; i < boardDao.getBoardList().size(); i++) {
				if(boardDao.getBoard(i).getNum() == num) {
				}
				return boardDao.getBoard(num);
			}
			return null;
		}catch(NullPointerException e){
			e.printStackTrace();
			return null;
		}
		
	}

	@Override
	public void updateViews(Integer num) {
	}

	

}
