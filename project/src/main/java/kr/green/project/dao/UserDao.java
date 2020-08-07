package kr.green.project.dao;

import org.apache.ibatis.annotations.Param;

import kr.green.project.vo.UserVo;

public interface UserDao {

	void insertUser(@Param("user")UserVo user);

	UserVo getUserId(@Param("id")String id);

	void insertLevel(@Param("id")String id);

	void updateUserPw(@Param("id")String id,@Param("pw")String newPw);

	
}
