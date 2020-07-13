package kr.spring.test.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.test.dao.UserDao;
import kr.spring.test.vo.UserVo;
@Service
public class UserServiceImp implements UserService {

	@Autowired
	private UserDao userDao;

	@Override
	public UserVo getUser(String id) {
		return userDao.getUser(id);
	}

	@Override
	public UserVo isUser(UserVo inputUser) {
//		로그인은 아이디정보를 주고 DB에 있는 일치하는 아이디의 정보를 가져와 비교한다.
//		DB에 저장된 비밀번호는 암호화가 되어있어 입력한 비밀번호와 다르기 때문에 아이디를 통한 정보 비교를 해야한다.
//		블라인드 SQL 인젝션 : pw에 이상한 작업을 하면 로그인이 된다.
		UserVo user = userDao.getUser(inputUser.getId());
		if(user == null) {
			return null;
		}
		if(user.getPw().equals(inputUser.getPw())) {
			return user;
		}
		return null;
	}

}
