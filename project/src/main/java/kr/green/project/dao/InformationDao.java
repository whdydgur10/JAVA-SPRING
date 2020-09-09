package kr.green.project.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.project.dto.LevelPointDto;
import kr.green.project.dto.ShopEnrollProOptionThumbDto;
import kr.green.project.vo.AddressVo;
import kr.green.project.vo.CategoryVo;
import kr.green.project.vo.CouponVo;
import kr.green.project.vo.PointVo;
import kr.green.project.vo.PurchaseVo;
import kr.green.project.vo.PurchaselistVo;
import kr.green.project.vo.ShoppingbasketVo;
import kr.green.project.vo.UserVo;
import kr.green.project.vo.VaginalVo;

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

	LevelPointDto getLevel(@Param("id")String id);

	String getPurchasePrice(@Param("id")String id);

	ArrayList<PointVo> getPointList();

	String getUsePoint(@Param("id")String id);

	String getNeedPrice(@Param("id")String id);

	ArrayList<PurchaseVo> getPurchase(@Param("id")String id);

	ArrayList<PurchaseVo> getUsePointPurchase(@Param("id")String id);

	ArrayList<CouponVo> getCouponList(@Param("id")String id);

	CouponVo isCouponCode(@Param("code")String code);

	void insertCoupon(@Param("id")String id, @Param("coupon")CouponVo coupon);

	ArrayList<CouponVo> getUseCouponList(@Param("id")String id);

	CouponVo isGetCoupon(@Param("id")String id, @Param("code")String code);

	ArrayList<PurchaseVo> getPurchaseList(@Param("id")String id);

	ArrayList<VaginalVo> getVaginalList(@Param("id")String id);

	ArrayList<ShoppingbasketVo> getShoppingBasketList(String id);

	ShopEnrollProOptionThumbDto getShopEnrollProOptionThumbDto(@Param("enrollNum")int enrollNum, @Param("optionCode")String optionCode);

	CategoryVo getCategory(@Param("categoryNum")int categoryNum);

	ShoppingbasketVo getShoppingBasket(@Param("shoppingNum")int shoppingNum);

	void deleteShoppingBasket(@Param("shoppingNum")int shoppingNum);

	ArrayList<PurchaselistVo> getPurchaseListTonum(@Param("purchaseNum")int num);

	String getEnrollmentMainTitle(@Param("enrollNum")int enrollNum);

	Double getPointPercent(@Param("id")String id);

	int getAddressNum(@Param("id")String id);

	void updateCoupon(@Param("coupon")CouponVo coupon);

	void updateDecUserPoint(@Param("user")UserVo user);

}
