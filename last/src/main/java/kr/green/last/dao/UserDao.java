package kr.green.last.dao;

import org.apache.ibatis.annotations.Param;

import kr.green.last.vo.UserVo;

public interface UserDao {

	UserVo getUser(@Param("user")UserVo user);

	void insertUser(@Param("user")UserVo user);

	Object isUser(@Param("id")String id);

	String getId(@Param("email")String email);

	String getEmail(@Param("id")String id);

	void newPw(@Param("id")String id, @Param("pw")String newPw);

}