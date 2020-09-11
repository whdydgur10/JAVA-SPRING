package kr.green.project.service;

import java.util.Date;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.green.project.dao.UserDao;
import kr.green.project.vo.UserVo;

@Service
public class UserSerivceImp implements UserService {

	@Autowired
	UserDao userDao;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	@Autowired
	private JavaMailSender mailSender;
	
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
	public void updateUserPw(UserVo user, String pw) {
		String newPw = passwordEncoder.encode(pw);
		userDao.updateUserPw(user.getId(), newPw);
		
	}

	@Override
	public void updateUserPhone(UserVo user, String phone) {
		userDao.updateUserPhone(user.getId(), phone);
		
	}

	@Override
	public void deleteUser(String id) {
		userDao.deleteUser(id, new Date());
		
	}

	@Override
	public UserVo getUserTophone(UserVo user) {
		return userDao.getUserTophone(user);
	}

	@Override
	public UserVo getUserToid(String list) {
		return userDao.getUserId(list);
	}

	@Override
	public void newPw(String list, String newPw) {
		userDao.newPw(list, passwordEncoder.encode(newPw));
	}
}
