package kr.green.project.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import kr.green.project.dto.LevelPointDto;
import kr.green.project.dto.PurchaseDto;
import kr.green.project.dto.ShopEnrollProOptionThumbDto;
import kr.green.project.dto.UserInformDto;
import kr.green.project.vo.AddressVo;
import kr.green.project.vo.CouponVo;
import kr.green.project.vo.PointVo;
import kr.green.project.vo.PurchaseVo;
import kr.green.project.vo.PurchaselistVo;
import kr.green.project.vo.UserVo;
import kr.green.project.vo.VaginalVo;

public interface InformationService {

	UserInformDto getUserInform(String id);

	boolean isPw(String pw, String id );
	
	AddressVo getMainAddress(HttpServletRequest h);

	ArrayList<AddressVo> getSubAddressList(HttpServletRequest h);
	
	ArrayList<AddressVo> getaddressList(HttpServletRequest h);

	boolean comparePw(String pw, String id);

	void insertAddress(UserVo user, AddressVo address);

	void updateIsMain(UserVo user, int num);

	void deleteAddress(int num);

	LevelPointDto getLevel(String id);

	String getPurchasePrice(String id);

	ArrayList<PointVo> getPointList();

	String getUsePoint(String id);

	String getRemainPrice(String id);

	ArrayList<PurchaseVo> getPurchase(String id);

	ArrayList<PurchaseVo> getUsePointPurchase(String id);

	ArrayList<CouponVo> getCouponList(String id);

	int isCouponCode(String code, String id);

	void insertCoupon(String id, String code);

	ArrayList<CouponVo> getUseCouponList(String id);

	ArrayList<PurchaseDto> getPurchaseList(String id);

	ArrayList<VaginalVo> getVaginalList(String id);

	ArrayList<ShopEnrollProOptionThumbDto> getShoppingBasketList(String id);

	ShopEnrollProOptionThumbDto getShopEnrollProOptionThumb(int shoppingNum);

	void deleteShoppingBasket(int shoppingNum);

	void insertPurchaseListBasket(String id, PurchaselistVo purchase);

	int getCouponNum(String id);

	Double getPointPercent(String id);

}
