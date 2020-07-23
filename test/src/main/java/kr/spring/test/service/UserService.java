package kr.spring.test.service;

import javax.servlet.http.HttpServletRequest;

import kr.spring.test.vo.UserVo;

public interface UserService {

	public UserVo getUser(HttpServletRequest request);

	public boolean getId(UserVo user);
	
	public UserVo login(UserVo login);

	public UserVo getUser(String id);

}
