package kr.green.spring.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.spring.pagenation.Criteria;
import kr.green.spring.vo.BoardVo;

public interface BoardDao {

	ArrayList<BoardVo> getBoardList(@Param("cri")Criteria cri);

	BoardVo getBoard(@Param("num")Integer num);

	void increaseViews(@Param("num")Integer num);

	void registerBoard(@Param("board")BoardVo board);

	int getBoardCnt(@Param("cri")Criteria cri);

	void updateBoard(@Param("board")BoardVo board);

	void deleteBoard(@Param("num")Integer num);

	void deupBoard(@Param("num")Integer num);

	void insertCommend(@Param("boardNum")int boardNum, @Param("id") String id);

	int isCommend(@Param("boardNum")int boardNum, @Param("id") String id);

}
