package kr.green.project.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.project.vo.AddressVo;

public interface InformationDao {

	int getLevel(@Param("id")String id);

	int getCouponNum(@Param("id")String id);

	int getPurchaseListNum(@Param("id")String id);

	int getVaginalNum(@Param("id")String id);

	int getShoppingBasketNum(@Param("id")String id);

	int getReviewNum(@Param("id")String id);

	ArrayList<AddressVo> getAddressList(@Param("id")String id);
	
}
