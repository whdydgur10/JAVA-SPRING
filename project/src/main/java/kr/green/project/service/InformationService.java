package kr.green.project.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import kr.green.project.subVo.LevelPointVo;
import kr.green.project.subVo.UserInformVo;
import kr.green.project.vo.AddressVo;
import kr.green.project.vo.CouponVo;
import kr.green.project.vo.PointVo;
import kr.green.project.vo.PurchaseVo;
import kr.green.project.vo.UserVo;
import kr.green.project.vo.VaginalVo;

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

	LevelPointVo getLevel(String id);

	String getPurchasePrice(String id);

	ArrayList<PointVo> getPointList();

	String getUsePoint(String id);

	String getRemainPrice(String id);

	ArrayList<PurchaseVo> getPurchase(String id);

	ArrayList<PurchaseVo> getUsePointPurchase(String id);

	ArrayList<CouponVo> getCouponList(String id);

	int isCouponName(String code, String id);

	void insertCoupon(String id, String code);

	ArrayList<CouponVo> getUseCouponList(String id);

	ArrayList<PurchaseVo> getPurchaseList(String id);

	ArrayList<VaginalVo> getVaginalList(String id);

}
