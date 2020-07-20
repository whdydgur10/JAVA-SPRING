package kr.spring.test.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import kr.spring.test.vo.UserVo;

public interface UserDao {
	UserVo getUser(@Param("id")String id);

	ArrayList<String> getId();

	void insertUser(@Param("user")UserVo user);

}
