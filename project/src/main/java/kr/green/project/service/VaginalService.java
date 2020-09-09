package kr.green.project.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import kr.green.project.dto.UserVaginalDto;
import kr.green.project.pagination.Criteria;
import kr.green.project.pagination.PageMaker;
import kr.green.project.vo.AnswerVo;
import kr.green.project.vo.AnswerfileVo;
import kr.green.project.vo.VaginalVo;
import kr.green.project.vo.VaginalfileVo;

public interface VaginalService {

	ArrayList<UserVaginalDto> getVaginalList(Criteria cri);

	UserVaginalDto getUserVaginal(int num);

	void increaseView(int num);

	AnswerVo getAnswer(int num);

	void insertVaginal(VaginalVo vaginal, HttpServletRequest h);

	PageMaker getPageMaker(Criteria cri);

	void insertVaginalFile(MultipartFile[] file, String id) throws IOException, Exception;

	ArrayList<VaginalfileVo> getVaginalFile(int num);

	void insertAnswer(AnswerVo answer, MultipartFile[] file) throws IOException, Exception;

	ArrayList<AnswerfileVo> getAnswerFile(int num);

}
