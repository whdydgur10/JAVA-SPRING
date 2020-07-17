package kr.green.spring.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.spring.vo.UserVo;

public interface UserDao {

	public UserVo getUser(@Param("id")String id);

	public void insertUser(@Param("user")UserVo user);

	public ArrayList<String> getUserId();

}
