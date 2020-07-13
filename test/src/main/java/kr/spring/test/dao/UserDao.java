package kr.spring.test.dao;

import org.apache.ibatis.annotations.Param;
import kr.spring.test.vo.UserVo;

public interface UserDao {
	UserVo getUser(@Param("id")String id);

}
