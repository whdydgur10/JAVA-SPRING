package kr.spring.test.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.spring.test.vo.BoardVo;

public interface BoardDao {

	ArrayList<BoardVo> getBoardList();

	BoardVo getBoard(@Param("num")Integer num);

	void updateViews(@Param("num")Integer num);

	int cntBoard();

	void insertBoard(@Param("board")BoardVo board, @Param("cnt")int boardCnt);

	void updateBoard(@Param("board")BoardVo board);

	void deleteBoard(@Param("num")Integer num);
}
