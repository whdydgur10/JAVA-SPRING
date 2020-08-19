package kr.green.project.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import kr.green.project.dto.UserVaginalDto;
import kr.green.project.pagination.Criteria;
import kr.green.project.pagination.PageMaker;
import kr.green.project.vo.AnswerVo;
import kr.green.project.vo.VaginalVo;

public interface VaginalService {

	ArrayList<UserVaginalDto> getVaginalList(Criteria cri);

	UserVaginalDto getUserVaginal(int num);

	void increaseView(int num);

	AnswerVo getAnswer(int num);

	void insertVaginal(VaginalVo vaginal, HttpServletRequest h);

	PageMaker getPageMaker(Criteria cri);

}
