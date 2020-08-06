package kr.green.project.service;

import kr.green.project.vo.UserInformVo;
import kr.green.project.vo.UserVo;

public interface UserService {

	void insertUser(UserVo user);

	boolean isUserId(String id);

	UserVo getUser(UserVo user);

	UserInformVo getUserInform(String id);

}
