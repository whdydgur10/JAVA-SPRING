package kr.green.project.service;

import javax.servlet.http.HttpServletRequest;

import kr.green.project.vo.UserVo;

public interface UserService {

	void insertUser(UserVo user);

	boolean isUserId(String id);

	UserVo getUser(UserVo user);

	void updateUserPw(HttpServletRequest h, String pw);

	
}
