package kr.green.spring.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import kr.green.spring.vo.UserVo;

public interface UserService {

	boolean signup(UserVo user);

	boolean isUserId(UserVo user);

	ArrayList<String> getUserId();

	UserVo isSignin(UserVo user);

	UserVo getUser(HttpServletRequest request);
	
}
