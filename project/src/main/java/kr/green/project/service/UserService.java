package kr.green.project.service;

import kr.green.project.vo.UserVo;

public interface UserService {

	void insertUser(UserVo user);

	boolean isUserId(String id);

	UserVo getUser(UserVo user);

	void updateUserPw(UserVo user, String pw);

	void updateUserPhone(UserVo user, String phone);

	void deleteUser(String id);

	UserVo getUserTophone(UserVo user);

	UserVo getUserToid(String list);

	void newPw(String list, String newPw);

	
}
