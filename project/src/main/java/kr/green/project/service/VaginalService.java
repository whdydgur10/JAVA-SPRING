package kr.green.project.service;

import java.util.ArrayList;

import kr.green.project.subVo.UserVaginalVo;
import kr.green.project.vo.VaginalVo;

public interface VaginalService {

	ArrayList<UserVaginalVo> getVaginalList();

	VaginalVo getVaginal(int num);

}
