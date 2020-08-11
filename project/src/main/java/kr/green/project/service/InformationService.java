package kr.green.project.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import kr.green.project.subVo.LevelPointVo;
import kr.green.project.subVo.UserInformVo;
import kr.green.project.vo.AddressVo;
import kr.green.project.vo.PointVo;
import kr.green.project.vo.PurchaseVo;
import kr.green.project.vo.UserVo;

public interface InformationService {

	UserInformVo getUserInform(String id);

	boolean isPw(String pw, String id );
	
	AddressVo getMainAddress(HttpServletRequest h);

	ArrayList<AddressVo> getSubAddressList(HttpServletRequest h);
	
	ArrayList<AddressVo> getaddressList(HttpServletRequest h);

	boolean comparePw(String pw, String id);

	void insertAddress(UserVo user, AddressVo address);

	void updateIsMain(UserVo user, int num);

	void deleteAddress(int num);

	LevelPointVo getLevel(HttpServletRequest h);

	String getPurchasePrice(HttpServletRequest h);

	ArrayList<PointVo> getPointList();

	String getUsePoint(HttpServletRequest h);

	String getRemainPrice(HttpServletRequest h);

	ArrayList<PurchaseVo> getPurchase(HttpServletRequest h);

}
