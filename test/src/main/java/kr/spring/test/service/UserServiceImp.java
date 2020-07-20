package kr.spring.test.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.spring.test.dao.UserDao;
import kr.spring.test.vo.UserVo;
@Service
public class UserServiceImp implements UserService {

	@Autowired
	private UserDao userDao;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@Override
	public UserVo getUser(String id) {
		return userDao.getUser(id);
	}

	@Override
	public boolean getId(UserVo user) {
		if(user == null)
			return false;
		if(userDao.getUser(user.getId()) != null || user.getId().length() == 0 || user.getPw().length() == 0 || user.getId() == null || user.getEmail().length() == 0 || user.getEmail() == null || user.getGender().length() == 0 || user.getGender() == null)
			return false;
		user.setAuth("user");
		user.setIsDel("N");
		user.setPw(passwordEncoder.encode(user.getPw()));
		userDao.insertUser(user);	
		return true;
	}

	@Override
	public UserVo login(UserVo login) {
		if(login == null)
			return null;
		UserVo userDb = userDao.getUser(login.getId());
		if(passwordEncoder.matches(login.getPw(),userDb.getPw()))
			
			return userDb;
		else
			return null;
	}
}
