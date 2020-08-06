package kr.green.project.dao;

import org.apache.ibatis.annotations.Param;

import kr.green.project.vo.UserVo;

public interface UserDao {

	void insertUser(@Param("user")UserVo user);

	UserVo isUserId(@Param("id")String id);

	void insertLevel(@Param("id")String id);

	int getLevelNum(@Param("id")String id);

	int getCouponNum(@Param("id")String id);

	int getPurchaseListNum(@Param("id")String id);

	int getVaginalNum(@Param("id")String id);

	int getShoppingBasketNum(@Param("id")String id);

	int getReviewNum(@Param("id")String id);
	
}
