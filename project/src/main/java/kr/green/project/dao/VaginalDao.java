package kr.green.project.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.project.dto.UserVaginalDto;
import kr.green.project.pagination.Criteria;
import kr.green.project.vo.AnswerVo;
import kr.green.project.vo.AnswerfileVo;
import kr.green.project.vo.VaginalVo;
import kr.green.project.vo.VaginalfileVo;

public interface VaginalDao {

	ArrayList<UserVaginalDto> getVaginalList(@Param("cri")Criteria cri);

	UserVaginalDto getUserVaginal(@Param("num")int num);

	void increaseView(@Param("num")int num);

	AnswerVo getAnswer(int num);

	void insertVaginal(@Param("vaginal")VaginalVo vaginal, @Param("id")String id);

	int countVaginalAuth();

	int countVaginal();

	int countVaginalA();

	void insertVaginalFile(@Param("num")int num, @Param("fileName")String fileName);

	int getLateVaginalNum(@Param("id")String id);

	ArrayList<VaginalfileVo> getVaginalFile(@Param("num")int num);

	void insertAnswer(@Param("answer")AnswerVo answer);

	int getLateAnswerNum();

	ArrayList<AnswerfileVo> getAnswerFile(@Param("num")int answerNum);

	int getAnswerNum(@Param("num")int num);

	void insertAnswerFile(@Param("num")int num, @Param("fileName")String fileName);

}
