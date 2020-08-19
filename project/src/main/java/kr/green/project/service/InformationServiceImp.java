package kr.green.project.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.green.project.dao.InformationDao;
import kr.green.project.dao.UserDao;
import kr.green.project.dto.LevelPointDto;
import kr.green.project.dto.UserInformDto;
import kr.green.project.vo.AddressVo;
import kr.green.project.vo.CouponVo;
import kr.green.project.vo.PointVo;
import kr.green.project.vo.PurchaseVo;
import kr.green.project.vo.UserVo;
import kr.green.project.vo.VaginalVo;

@Service
public class InformationServiceImp implements InformationService {

	@Autowired
	UserDao userDao;
	@Autowired
	InformationDao infoDao;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public UserInformDto getUserInform(String id) {
		UserInformDto user = new UserInformDto();
		user.setLevel(infoDao.getLevelNum(id));
		user.setCouponNum(infoDao.getCouponNum(id));
		user.setPoint(userDao.getPoint(id));
		user.setPurchaseListNum(infoDao.getPurchaseListNum(id));
		user.setVaginalNum(infoDao.getVaginalNum(id));
		user.setShoppingBasketNum(infoDao.getShoppingBasketNum(id));
		user.setReviewNum(infoDao.getReviewNum(id));
		return user;
	}

	@Override
	public boolean isPw(String pw, String id) {
		UserVo user = userDao.getUserId(id);
		if(passwordEncoder.matches(pw, user.getPw()))
			return true;
		return false;
	}
	
	@Override
	public AddressVo getMainAddress(HttpServletRequest h) {
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		return infoDao.getMainAddress(user.getId());
	}
	
	@Override
	public ArrayList<AddressVo> getSubAddressList(HttpServletRequest h) {
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		return infoDao.getSubAddressList(user.getId());
	}
	
	@Override
	public ArrayList<AddressVo> getaddressList(HttpServletRequest h) {
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		return infoDao.getaddressList(user.getId());
	}

	@Override
	public boolean comparePw(String pw, String id) {
		if(passwordEncoder.matches(pw, userDao.getUserId(id).getPw()))
			return false;
		return true;
	}

	@Override
	public void insertAddress(UserVo user, AddressVo address) {
		infoDao.insertAddress(user, address);
		
	}

	@Override
	public void updateIsMain(UserVo user, int num) {
		infoDao.updateIsSub(user.getId());
		infoDao.updateIsMain(num);
		
	}

	@Override
	public void deleteAddress(int num) {
		infoDao.deleteAddress(num);
	}

	@Override
	public LevelPointDto getLevel(String id) {
		return infoDao.getLevel(id);
	}

	@Override
	public String getPurchasePrice(String id) {
		String sum = infoDao.getPurchasePrice(id);
		if(sum == null)
			return "0";
		return String.format("%,d", Integer.parseInt(sum));
	}

	@Override
	public ArrayList<PointVo> getPointList() {
		return infoDao.getPointList();
	}

	@Override
	public String getUsePoint(String id) {
		if(infoDao.getUsePoint(id) == null)
			return "0";
		return String.format("%,d", Integer.parseInt(infoDao.getUsePoint(id)));
	}

	@Override
	public String getRemainPrice(String id) {
		String price = infoDao.getPurchasePrice(id);
		if(price == null)
			price = "0";
		String point = infoDao.getNeedPrice(id);
		int res = Integer.parseInt(point) - Integer.parseInt(price);
		return String.format("%,d", res);
	}

	@Override
	public ArrayList<PurchaseVo> getPurchase(String id) {
		return infoDao.getPurchase(id);
	}

	@Override
	public ArrayList<PurchaseVo> getUsePointPurchase(String id) {
		return infoDao.getUsePointPurchase(id);
	}

	@Override
	public ArrayList<CouponVo> getCouponList(String id) {
		return infoDao.getCouponList(id);
	}

	@Override
	public int isCouponCode(String code, String id) {
		
		if(infoDao.isCouponCode(code) == null)
			return 0;
		else if(infoDao.isGetCoupon(id, code) != null) 
			return 1;
		else
			return 2;
	}

	@Override
	public void insertCoupon(String id, String code) {
		CouponVo coupon = infoDao.isCouponCode(code);
		infoDao.insertCoupon(id, coupon);
	}

	@Override
	public ArrayList<CouponVo> getUseCouponList(String id) {
		return infoDao.getUseCouponList(id);
	}

	@Override
	public ArrayList<PurchaseVo> getPurchaseList(String id) {
		return infoDao.getPurchaseList(id);
	}

	@Override
	public ArrayList<VaginalVo> getVaginalList(String id) {
		return infoDao.getVaginalList(id);
	}

	
}
