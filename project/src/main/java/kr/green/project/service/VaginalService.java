package kr.green.project.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import kr.green.project.pagination.Criteria;
import kr.green.project.pagination.PageMaker;
import kr.green.project.subVo.UserVaginalVo;
import kr.green.project.vo.AnswerVo;
import kr.green.project.vo.VaginalVo;

public interface VaginalService {

	ArrayList<UserVaginalVo> getVaginalList(Criteria cri);

	UserVaginalVo getUserVaginal(int num);

	void increaseView(int num);

	AnswerVo getAnswer(int num);

	void insertVaginal(VaginalVo vaginal, HttpServletRequest h);

	PageMaker getPageMaker(Criteria cri);

}
