package kr.spring.test.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.spring.test.controller.pagination.Criteria;
import kr.spring.test.vo.BoardVo;

public interface BoardDao {

	ArrayList<BoardVo> getBoardList(@Param("cri")Criteria cri);

	BoardVo getBoard(@Param("num")Integer num);

	void updateViews(@Param("num")Integer num);

	int cntBoard(@Param("cri")Criteria cri);

	void insertBoard(@Param("board")BoardVo board);

	void updateBoard(@Param("board")BoardVo board);

	Object getCommend(@Param("boardNum")int num, @Param("userId")String id);

	void insertCommend(@Param("boardNum")int num, @Param("userId")String id, @Param("type")int type);

	void updateCommend(@Param("num")int num, @Param("type")int type);

}
