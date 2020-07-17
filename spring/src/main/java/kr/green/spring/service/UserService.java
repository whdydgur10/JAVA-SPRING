package kr.green.spring.service;

import java.util.ArrayList;

import kr.green.spring.vo.UserVo;

public interface UserService {

	boolean signup(UserVo user);

	boolean isUserId(UserVo user);

	ArrayList<String> getUserId();

	
}
