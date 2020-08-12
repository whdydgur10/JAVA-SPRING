package kr.green.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.project.dao.VaginalDao;
import kr.green.project.subVo.UserVaginalVo;
import kr.green.project.vo.VaginalVo;

@Service
public class VaginalServiceImp implements VaginalService {

	@Autowired
	VaginalDao vagiDao;
	
	@Override
	public ArrayList<UserVaginalVo> getVaginalList() {
		return vagiDao.getVaginalList();
	}

	@Override
	public VaginalVo getVaginal(int num) {
		return vagiDao.getVaginal(num);
	}

}
