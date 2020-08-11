package kr.green.project.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.mysql.cj.ParseInfo;

import kr.green.project.dao.InformationDao;
import kr.green.project.dao.UserDao;
import kr.green.project.subVo.LevelPointVo;
import kr.green.project.subVo.UserInformVo;
import kr.green.project.vo.AddressVo;
import kr.green.project.vo.PointVo;
import kr.green.project.vo.PurchaseVo;
import kr.green.project.vo.UserVo;

@Service
public class InformationServiceImp implements InformationService {

	@Autowired
	UserDao userDao;
	@Autowired
	InformationDao infoDao;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public UserInformVo getUserInform(String id) {
		UserInformVo user = new UserInformVo();
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
	public LevelPointVo getLevel(HttpServletRequest h) {
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		return infoDao.getLevel(user.getId());
	}

	@Override
	public String getPurchasePrice(HttpServletRequest h) {
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		String sum = infoDao.getPurchasePrice(user.getId());
		if(sum == null)
			return "0";
		return String.format("%,d", Integer.parseInt(sum));
	}

	@Override
	public ArrayList<PointVo> getPointList() {
		return infoDao.getPointList();
	}

	@Override
	public String getUsePoint(HttpServletRequest h) {
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		if(infoDao.getUsePoint(user.getId()) == null)
			return "0";
		return String.format("%,d", Integer.parseInt(infoDao.getUsePoint(user.getId())));
	}

	@Override
	public String getRemainPrice(HttpServletRequest h) {
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		String price = infoDao.getPurchasePrice(user.getId());
		if(price == null)
			price = "0";
		String point = infoDao.getNeedPrice(user.getId());
		int res = Integer.parseInt(point) - Integer.parseInt(price);
		return String.format("%,d", res);
	}

	@Override
	public ArrayList<PurchaseVo> getPurchase(HttpServletRequest h) {
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		return infoDao.getPurchase(user.getId());
	}

	
}
