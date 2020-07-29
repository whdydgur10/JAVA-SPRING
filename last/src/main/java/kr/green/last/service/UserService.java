package kr.green.last.service;

import kr.green.last.vo.UserVo;

public interface UserService {

	UserVo getUser(UserVo user);

	void insertUser(UserVo user);

	boolean isUser(String id);

	UserVo login(UserVo user);



	

}