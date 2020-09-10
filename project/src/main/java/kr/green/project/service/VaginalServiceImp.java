package kr.green.project.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.green.project.dao.VaginalDao;
import kr.green.project.dto.UserVaginalDto;
import kr.green.project.pagination.Criteria;
import kr.green.project.pagination.PageMaker;
import kr.green.project.utils.UploadFile;
import kr.green.project.vo.AnswerVo;
import kr.green.project.vo.AnswerfileVo;
import kr.green.project.vo.UserVo;
import kr.green.project.vo.VaginalVo;
import kr.green.project.vo.VaginalfileVo;

@Service
public class VaginalServiceImp implements VaginalService {

	private String uploadPathVaginal = "D:\\조용혁\\JAVA-SPRING\\project\\src\\main\\webapp\\resources\\img\\vaginal\\";
	private String uploadPathAnswer = "D:\\조용혁\\JAVA-SPRING\\project\\src\\main\\webapp\\resources\\img\\answer\\";
	
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
		pageMaker.setTotalCount(vagiDao.countVaginal(cri));
		return pageMaker;
	}

	@Override
	public void insertVaginalFile(MultipartFile[] file, String id) throws IOException, Exception {
		int num = vagiDao.getLateVaginalNum(id);
		for(MultipartFile tmp : file) {
			if(!tmp.getOriginalFilename().equals("")) {
				String fileName = UploadFile.uploadFile(uploadPathVaginal, tmp.getOriginalFilename(),tmp.getBytes(), Integer.toString(num));
				vagiDao.insertVaginalFile(num, fileName);
			}
		}
	}

	@Override
	public ArrayList<VaginalfileVo> getVaginalFile(int num) {
		return vagiDao.getVaginalFile(num);
	}

	@Override
	public void insertAnswer(AnswerVo answer, MultipartFile[] file) throws IOException, Exception {
		answer.setAnswerDate(new Date());
		vagiDao.insertAnswer(answer);
		vagiDao.updateVaginalAnswer(answer.getVaginalNum());
		int num = vagiDao.getLateAnswerNum();
		for(MultipartFile tmp : file) {
			if(!tmp.getOriginalFilename().equals("")) {
				String fileName = UploadFile.uploadFile(uploadPathAnswer, tmp.getOriginalFilename(),tmp.getBytes(), Integer.toString(num));
				vagiDao.insertAnswerFile(num, fileName);
			}
		}
	}

	@Override
	public ArrayList<AnswerfileVo> getAnswerFile(int num) {
		AnswerVo answer = vagiDao.getAnswer(num);
		if(answer != null)
			return vagiDao.getAnswerFile(answer.getNum());
		else
			return null;
	}

}
