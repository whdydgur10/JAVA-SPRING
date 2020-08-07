package kr.green.project.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.green.project.dao.InformationDao;
import kr.green.project.dao.UserDao;
import kr.green.project.vo.AddressVo;
import kr.green.project.vo.UserInformVo;
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
		user.setLevel(infoDao.getLevel(id));
		user.setCouponNum(infoDao.getCouponNum(id));
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
	public ArrayList<AddressVo> getAddressList(HttpServletRequest h) {
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		return infoDao.getAddressList(user.getId());
	}

	@Override
	public boolean comparePw(String pw, String id) {
		if(passwordEncoder.matches(pw, userDao.getUserId(id).getPw()))
			return false;
		return true;
	}

}
