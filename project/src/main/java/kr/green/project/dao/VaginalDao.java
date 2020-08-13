package kr.green.project.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.project.pagination.Criteria;
import kr.green.project.subVo.UserVaginalVo;
import kr.green.project.vo.AnswerVo;
import kr.green.project.vo.VaginalVo;

public interface VaginalDao {

	ArrayList<UserVaginalVo> getVaginalList(@Param("cri")Criteria cri);

	UserVaginalVo getUserVaginal(@Param("num")int num);

	void increaseView(@Param("num")int num);

	AnswerVo getAnswer(int num);

	void insertVaginal(@Param("vaginal")VaginalVo vaginal, @Param("id")String id);

	int countVaginalAuth();

	int countVaginal();

	int countVaginalA();

}
