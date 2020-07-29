package kr.green.last.dao;

import org.apache.ibatis.annotations.Param;

import kr.green.last.vo.UserVo;

public interface UserDao {

	UserVo getUser(@Param("user")UserVo user);

	void insertUser(@Param("user")UserVo user);

	Object isUser(@Param("id")String id);



	

}