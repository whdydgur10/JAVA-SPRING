package kr.green.last.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.green.last.dao.UserDao;
import kr.green.last.vo.UserVo;

@Service
public class UserServiceImp implements UserService  {

	@Autowired
    UserDao userDao;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@Override
	public UserVo getUser(UserVo user) {
		return userDao.getUser(user);
	}

	@Override
	public void insertUser(UserVo user) {
		user.setPw(passwordEncoder.encode(user.getPw()));
		userDao.insertUser(user);
	}

	@Override
	public boolean isUser(String id) {
		if(userDao.isUser(id) != null)
			return false;
		return true;
	}

	@Override
	public UserVo login(UserVo user) {
		UserVo dbUser = userDao.getUser(user);
		if(dbUser == null)
			return null;
		else {
			if(passwordEncoder.matches(user.getPw(),dbUser.getPw()))
				return dbUser;
			else
				return null;
		}
	}

	


}