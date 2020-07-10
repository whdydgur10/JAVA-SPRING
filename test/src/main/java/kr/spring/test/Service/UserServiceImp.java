package kr.spring.test.Service;

import org.springframework.beans.factory.annotation.Autowired;

import kr.spring.test.Dao.UserDao;

public class UserServiceImp implements UserService {

	@Autowired
	private UserDao userDao;
	
	@Override
	public String getEmail(String id) {
		return userDao.getEmail(id);
	}

}
