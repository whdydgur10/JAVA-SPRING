package kr.green.project.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.green.project.dao.UserDao;
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
		if(userDao.getUserId(id) == null)
			return false;
		return true;
	}

	@Override
	public UserVo getUser(UserVo user) {
		UserVo user2 = userDao.getUserId(user.getId());
		if(user2 != null && passwordEncoder.matches(user.getPw(), user2.getPw()))
			return user2;
		return null;
	}

	@Override
	public void updateUserPw(HttpServletRequest h, String pw) {
		String newPw = passwordEncoder.encode(pw);
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		userDao.updateUserPw(user.getId(), newPw);
		
	}

	

}
