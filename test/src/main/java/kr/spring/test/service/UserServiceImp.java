package kr.spring.test.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	public UserVo getUser(HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserVo user = (UserVo)session.getAttribute("user");
		return userDao.getUser(user.getId());
	}

	@Override
	public boolean getId(UserVo user) {
		if(user == null)
			return false;
		if(userDao.getUser(user.getId()) != null || user.getId().length() == 0 || user.getPw().length() == 0 || user.getPw() == null || user.getName() != null || user.getName().length() == 0 ||
				user.getEmail().length() == 0 || user.getEmail() == null || user.getGender().length() == 0 || user.getGender() == null || user.getBirthday().length() == 0 || user.getBirthday() == null || 
				user.getPhone().length() == 0 || user.getPhone() == null)
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

	@Override
	public UserVo getUser(String id) {
		return userDao.getUser(id);
	}
}
