package kr.green.last.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.last.pagination.Criteria;
import kr.green.last.vo.BoardVo;
import kr.green.last.vo.CommendVo;
import kr.green.last.vo.FileVo;
import kr.green.last.vo.UserVo;

public interface BoardDao {

	void insertBoard(@Param("board")BoardVo board, @Param("user")String id);

	ArrayList<BoardVo> getBoardList(@Param("cri")Criteria cri);

	int countBoard(@Param("cri")Criteria cri);

	BoardVo getBoard(@Param("num")Integer num);

	void updateViews(@Param("num")Integer num);

	void updateBoard(@Param("board")BoardVo board);

	void deleteBoard(@Param("board")BoardVo board);

	CommendVo getCommend(@Param("board")BoardVo board,@Param("user") UserVo user);

	void insertCommend(@Param("board")BoardVo board,@Param("user") UserVo user,@Param("type") int type);

	void updateCommend(@Param("commend")CommendVo commend,@Param("type") int type);

	void insertFile(@Param("boardNum")int boardNum, @Param("file")String fileName);

	int getBoardNum();

	ArrayList<FileVo> getFileList(@Param("boardNum")Integer num);

}
