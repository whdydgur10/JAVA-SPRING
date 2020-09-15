package kr.green.project.service;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.green.project.dao.InformationDao;
import kr.green.project.dao.ProductDao;
import kr.green.project.dao.RootDao;
import kr.green.project.dao.UserDao;
import kr.green.project.dto.LevelPointDto;
import kr.green.project.dto.PurchaseDto;
import kr.green.project.dto.ShopEnrollProOptionThumbDto;
import kr.green.project.dto.UserInformDto;
import kr.green.project.vo.AddressVo;
import kr.green.project.vo.CategoryVo;
import kr.green.project.vo.CouponVo;
import kr.green.project.vo.PointVo;
import kr.green.project.vo.ProductenrollmentVo;
import kr.green.project.vo.PurchaseVo;
import kr.green.project.vo.PurchaselistVo;
import kr.green.project.vo.ShoppingbasketVo;
import kr.green.project.vo.UserVo;
import kr.green.project.vo.VaginalVo;

@Service
public class InformationServiceImp implements InformationService {

	@Autowired
	UserDao userDao;
	@Autowired
	InformationDao infoDao;
	@Autowired
	RootDao rootDao;
	@Autowired
	ProductDao proDao;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public UserInformDto getUserInform(String id) {
		UserInformDto user = new UserInformDto();
		user.setLevel(infoDao.getLevelNum(id));
		user.setCouponNum(infoDao.getCouponNum(id));
		user.setPoint(userDao.getPoint(id));
		user.setPurchaseListNum(infoDao.getPurchaseListNum(id));
		user.setVaginalNum(infoDao.getVaginalNum(id));
		user.setShoppingBasketNum(infoDao.getShoppingBasketNum(id));
		user.setReviewNum(infoDao.getReviewNum(id));
		return user;
	}

	@Override
	public boolean isPw(String pw, String id) {
		UserVo user = userDao.getUserId(id);
		if(passwordEncoder.matches(pw, user.getPw()))
			return true;
		return false;
	}
	
	@Override
	public AddressVo getMainAddress(HttpServletRequest h) {
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		return infoDao.getMainAddress(user.getId());
	}
	
	@Override
	public ArrayList<AddressVo> getSubAddressList(HttpServletRequest h) {
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		return infoDao.getSubAddressList(user.getId());
	}
	
	@Override
	public ArrayList<AddressVo> getaddressList(HttpServletRequest h) {
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		return infoDao.getaddressList(user.getId());
	}

	@Override
	public boolean comparePw(String pw, String id) {
		if(passwordEncoder.matches(pw, userDao.getUserId(id).getPw()))
			return false;
		return true;
	}

	@Override
	public void insertAddress(UserVo user, AddressVo address) {
		infoDao.insertAddress(user, address);
		
	}

	@Override
	public void updateIsMain(UserVo user, int num) {
		infoDao.updateIsSub(user.getId());
		infoDao.updateIsMain(num);
		
	}

	@Override
	public void deleteAddress(int num) {
		infoDao.deleteAddress(num);
	}

	@Override
	public LevelPointDto getLevel(String id) {
		return infoDao.getLevel(id);
	}

	@Override
	public String getPurchasePrice(String id) {
		String sum = infoDao.getPurchasePrice(id);
		if(sum == null)
			return "0";
		return String.format("%,d", Integer.parseInt(sum));
	}

	@Override
	public ArrayList<PointVo> getPointList() {
		return infoDao.getPointList();
	}

	@Override
	public String getUsePoint(String id) {
		if(infoDao.getUsePoint(id) == null)
			return "0";
		return String.format("%,d", Integer.parseInt(infoDao.getUsePoint(id)));
	}

	@Override
	public String getRemainPrice(String id) {
		String price = infoDao.getPurchasePrice(id);
		if(price == null)
			price = "0";
		String point = infoDao.getNeedPrice(id);
		int res = Integer.parseInt(point) - Integer.parseInt(price);
		return String.format("%,d", res);
	}

	@Override
	public ArrayList<PurchaseVo> getPurchase(String id) {
		return infoDao.getPurchase(id);
	}

	@Override
	public ArrayList<PurchaseVo> getUsePointPurchase(String id) {
		return infoDao.getUsePointPurchase(id);
	}

	@Override
	public ArrayList<CouponVo> getCouponList(String id) {
		return infoDao.getCouponList(id);
	}

	@Override
	public int isCouponCode(String code, String id) {
		
		if(infoDao.isCouponCode(code) == null)
			return 0;
		else if(infoDao.isGetCoupon(id, code) != null) 
			return 1;
		else
			return 2;
	}

	@Override
	public void insertCoupon(String id, String code) {
		CouponVo coupon = infoDao.isCouponCode(code);
		infoDao.insertCoupon(id, coupon);
	}

	@Override
	public ArrayList<CouponVo> getUseCouponList(String id) {
		return infoDao.getUseCouponList(id);
	}

	@Override
	public ArrayList<PurchaseDto> getPurchaseList(String id) {
		ArrayList<PurchaseDto> pudList = new ArrayList<PurchaseDto>();
		ArrayList<PurchaseVo> pu = infoDao.getPurchaseList(id);
		String str = " ";
		if(pu != null) {
			for(PurchaseVo tmp : pu) {
				ArrayList<PurchaselistVo> puList = infoDao.getPurchaseListTonum(tmp.getNum());
				if(puList != null)
					for(PurchaselistVo pv : puList) {
						int enrollNum = pv.getEnrollNum();
						str = str + infoDao.getEnrollmentMainTitle(enrollNum);
					}
				PurchaseDto pud = new PurchaseDto(tmp.getNum(), tmp.getUserId(), tmp.getDeposit(), tmp.getDepositDate(), tmp.getIsPoint(), tmp.getIsCoupon(), tmp.getSituation(), tmp.getIsConfirm(), tmp.getConfirmDate(), tmp.getPrice(), tmp.getGivePoint()
						, tmp.getDeliveryPrice(), tmp.getUsePoint(), tmp.getOrderDate(), tmp.getIsDel(), str, tmp.getInvoice());
				pudList.add(pud);
			}
		}
		return pudList;
	}
	@Override
	public ArrayList<VaginalVo> getVaginalList(String id) {
		return infoDao.getVaginalList(id);
	}

	@Override
	public ArrayList<ShopEnrollProOptionThumbDto> getShoppingBasketList(String id) {
		ArrayList<ShoppingbasketVo> list = infoDao.getShoppingBasketList(id);
		ArrayList<ShopEnrollProOptionThumbDto> list2 = new ArrayList<ShopEnrollProOptionThumbDto>();
		for(ShoppingbasketVo tmp : list) {
			ShopEnrollProOptionThumbDto shop = infoDao.getShopEnrollProOptionThumbDto(tmp.getEnrollNum(), tmp.getOptionCode());
			ProductenrollmentVo enroll = rootDao.getProductenrollment(tmp.getEnrollNum());
			CategoryVo category = infoDao.getCategory(enroll.getCategoryNum());
			shop.setShoppingNum(tmp.getShoppingNum());
			shop.setPurchase(tmp.getPurchase());
			shop.setMainCategory(category.getMainCategory());
			shop.setOptionCode(tmp.getOptionCode());
			shop.setEnrollNum(tmp.getEnrollNum());
			list2.add(shop);
		}
		return list2;
	}

	@Override
	public ShopEnrollProOptionThumbDto getShopEnrollProOptionThumb(int shoppingNum) {
		ShoppingbasketVo shop = infoDao.getShoppingBasket(shoppingNum);
		ShopEnrollProOptionThumbDto shop2 = infoDao.getShopEnrollProOptionThumbDto(shop.getEnrollNum(), shop.getOptionCode());
		shop2.setPurchase(shop.getPurchase());
		return shop2;
	}

	@Override
	public void deleteShoppingBasket(int shoppingNum) {
		ShoppingbasketVo shop = infoDao.getShoppingBasket(shoppingNum);
		infoDao.deleteShoppingBasket(shoppingNum);
		proDao.updateIncOptionPurchase(shop.getOptionCode(), shop.getPurchase());
	}

	@Override
	public void insertPurchaseListBasket(String id, PurchaselistVo purchase) {
		int purchaseNum = proDao.getPurchaseNum(id);
		purchase.setEnrollNum(proDao.getEnrollNum(purchase.getShoppingNum()));
		infoDao.deleteShoppingBasket(purchase.getShoppingNum());
		proDao.insertPurchaseListBasket(purchaseNum, purchase);
	}

	@Override
	public int getCouponNum(String id) {
		return infoDao.getCouponNum(id);
	}

	@Override
	public Double getPointPercent(String id) {
		return infoDao.getPointPercent(id);
	}

	@Override
	public int getAddressNum(String id) {
		return infoDao.getAddressNum(id);
	}

	@Override
	public void updateCoupon(CouponVo coupon) {
		infoDao.updateCoupon(coupon);
	}

	@Override
	public void updateDecUserPoint(UserVo user) {
		infoDao.updateDecUserPoint(user);
		
	}

	@Override
	public int getPoint(String id) {
		return infoDao.getPoint(id);
	}

	@Override
	public void updatePurchaseConfirm(int num) {
		Date date = new Date();
		infoDao.updatePurchaseConfirm(num, date);
	}
}
