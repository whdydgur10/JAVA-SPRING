package kr.green.project.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.project.subVo.UserVaginalVo;
import kr.green.project.vo.VaginalVo;

public interface VaginalDao {

	ArrayList<UserVaginalVo> getVaginalList();

	VaginalVo getVaginal(@Param("num")int num);

}
