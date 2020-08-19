package kr.green.project.service;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.project.dao.VaginalDao;
import kr.green.project.dto.UserVaginalDto;
import kr.green.project.pagination.Criteria;
import kr.green.project.pagination.PageMaker;
import kr.green.project.vo.AnswerVo;
import kr.green.project.vo.UserVo;
import kr.green.project.vo.VaginalVo;

@Service
public class VaginalServiceImp implements VaginalService {

	@Autowired
	VaginalDao vagiDao;
	
	@Override
	public ArrayList<UserVaginalDto> getVaginalList(Criteria cri) {
		return vagiDao.getVaginalList(cri);
	}

	@Override
	public UserVaginalDto getUserVaginal(int num) {
		return vagiDao.getUserVaginal(num);
	}

	@Override
	public void increaseView(int num) {
		vagiDao.increaseView(num);
	}

	@Override
	public AnswerVo getAnswer(int num) {
		return vagiDao.getAnswer(num);
	}

	@Override
	public void insertVaginal(VaginalVo vaginal, HttpServletRequest h) {
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		if(vaginal.getTitle().equals(""))
			vaginal.setTitle("제목없음");
		if(vaginal.getContent().equals(""))
			vaginal.setContent(vaginal.getTitle());
		vaginal.setRegisterDate(new Date());
		if(user.getAuth() == 0) {
			vaginal.setNum(vagiDao.countVaginalAuth()+1);
			vaginal.setRegisterNum(vagiDao.countVaginalAuth()+1);
		}
		else 
			vaginal.setNum(vagiDao.countVaginalA()+999999000);
		vagiDao.insertVaginal(vaginal, user.getId());
	}

	@Override
	public PageMaker getPageMaker(Criteria cri) {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(cri);
		pageMaker.setTotalCount(vagiDao.countVaginal());
		return pageMaker;
	}

}
