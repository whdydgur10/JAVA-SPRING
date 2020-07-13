package kr.spring.test.service;

import kr.spring.test.vo.UserVo;

public interface UserService {

	public UserVo getUser(String id);

	public UserVo isUser(UserVo inputUser);
}
