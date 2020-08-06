package kr.green.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.green.project.dao.UserDao;
import kr.green.project.vo.UserInformVo;
import kr.green.project.vo.UserVo;

@Service
public class UserSerivceImp implements UserService {

	@Autowired
	UserDao userDao;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public void insertUser(UserVo user) {
		user.setPw(passwordEncoder.encode(user.getPw()));
		userDao.insertUser(user);
		userDao.insertLevel(user.getId());
	}

	@Override
	public boolean isUserId(String id) {
		if(userDao.isUserId(id) == null)
			return false;
		return true;
	}

	@Override
	public UserVo getUser(UserVo user) {
		UserVo user2 = userDao.isUserId(user.getId());
		if(passwordEncoder.matches(user.getPw(), user2.getPw()))
			return user2;
		return null;
	}

	@Override
	public UserInformVo getUserInform(String id) {
		UserInformVo user = new UserInformVo();
		user.setLevel(userDao.getLevelNum(id));
		user.setCouponNum(userDao.getCouponNum(id));
		user.setPurchaseListNum(userDao.getPurchaseListNum(id));
		user.setVaginalNum(userDao.getVaginalNum(id));
		user.setShoppingBasketNum(userDao.getShoppingBasketNum(id));
		user.setReviewNum(userDao.getReviewNum(id));
		return user;
	}

}
