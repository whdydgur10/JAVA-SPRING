package kr.green.project.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.project.subVo.LevelPointVo;
import kr.green.project.vo.AddressVo;
import kr.green.project.vo.PointVo;
import kr.green.project.vo.PurchaseVo;
import kr.green.project.vo.UserVo;

public interface InformationDao {

	int getLevelNum(@Param("id")String id);

	int getCouponNum(@Param("id")String id);

	int getPurchaseListNum(@Param("id")String id);

	int getVaginalNum(@Param("id")String id);

	int getShoppingBasketNum(@Param("id")String id);

	int getReviewNum(@Param("id")String id);
	
	AddressVo getMainAddress(@Param("id")String id);

	ArrayList<AddressVo> getSubAddressList(@Param("id")String id);
	
	ArrayList<AddressVo> getaddressList(String id);

	void insertAddress(@Param("user")UserVo user, @Param("address")AddressVo address);

	void updateIsSub(@Param("id")String id);

	void updateIsMain(@Param("num")int num);

	void deleteAddress(@Param("num")int num);

	LevelPointVo getLevel(@Param("id")String id);

	String getPurchasePrice(@Param("id")String id);

	ArrayList<PointVo> getPointList();

	String getUsePoint(@Param("id")String id);

	String getNeedPrice(@Param("id")String id);

	ArrayList<PurchaseVo> getPurchase(String id);

	

}
