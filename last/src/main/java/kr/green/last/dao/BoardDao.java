package kr.green.last.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.last.pagination.Criteria;
import kr.green.last.vo.BoardVo;

public interface BoardDao {

	void insertBoard(@Param("board")BoardVo board, @Param("user")String id);

	ArrayList<BoardVo> getBoardList(@Param("cri")Criteria cri);

	int countBoard(@Param("cri")Criteria cri);

	BoardVo getBoard(@Param("num")Integer num);

	void updateViews(@Param("num")Integer num);

}
