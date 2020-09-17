package kr.green.project.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.project.dao.InformationDao;
import kr.green.project.dao.ProductDao;
import kr.green.project.dao.RootDao;
import kr.green.project.dto.EnrollmentThumbnailDto;
import kr.green.project.dto.ShopEnrollProOptionThumbDto;
import kr.green.project.pagination.ProductCri;
import kr.green.project.pagination.ProductPage;
import kr.green.project.vo.CategoryVo;
import kr.green.project.vo.ContentimageVo;
import kr.green.project.vo.ContentremarkVo;
import kr.green.project.vo.ContentsizeVo;
import kr.green.project.vo.ContentsizetextVo;
import kr.green.project.vo.ProductenrollmentVo;
import kr.green.project.vo.PurchaseVo;
import kr.green.project.vo.PurchaselistVo;
import kr.green.project.vo.RefundVo;
import kr.green.project.vo.ThumbnailVo;

@Service
public class ProductServiceImp implements ProductService {

	@Autowired
	ProductDao proDao;
	@Autowired
	RootDao rootDao;
	@Autowired
	InformationDao infoDao;
	
	
	@Override
	public ContentremarkVo getContentRemark(int num) {
		return proDao.getContentRemark(num);
	}

	@Override
	public ArrayList<ContentsizeVo> getContentSize(int num) {
		return proDao.getContentSize(num);
	}

	@Override
	public ContentsizetextVo getContentSizeText(int num) {
		return proDao.getContentSizeText(num);
	}

	@Override
	public ArrayList<ThumbnailVo> getThumbnailImage(int num) {
		return proDao.getThumbnailImage(num);
	}

	@Override
	public ArrayList<ContentimageVo> getContentImage(int num) {
		return proDao.getContentImage(num);
	}

	@Override
	public ArrayList<EnrollmentThumbnailDto> getProductEnrollmentList(ProductCri pri) {
		ArrayList<ProductenrollmentVo> enrollment = proDao.getProductEnrollmentList(pri);
		ArrayList<EnrollmentThumbnailDto> list = new ArrayList<EnrollmentThumbnailDto>();
		for(ProductenrollmentVo tmp : enrollment) {
			list.addAll(proDao.getEnrollmentThumbnailList(tmp));
		}
		return list;
	}

	@Override
	public ProductPage getProductPage(ProductCri pri) {
		ProductPage pageMaker = new ProductPage();
		pageMaker.setCri(pri);
		pageMaker.setTotalCount(proDao.countProductEnrollment(pri));
		return pageMaker;
	}

	@Override
	public void insertShoppingBasket(String id, int enrollNum, String optionCode, int purchase) {
		SimpleDateFormat  dateForm = new SimpleDateFormat("yyyy-MM-dd");
		String today = dateForm.format(new Date());
		proDao.insertShoppingBasket(id, enrollNum, optionCode, purchase, today);
		proDao.updateDecOptionPurchase(optionCode, purchase);
	}

	@Override
	public void insertPurchase(String id) {
		PurchaseVo pu = new PurchaseVo();
		pu.setUserId(id);
		pu.setOrderDate(new Date());
		proDao.insertPurchase(pu);
	}

	@Override
	public void insertPurchaseList(String id, PurchaselistVo purchase) {
		int purchaseNum = proDao.getPurchaseNum(id);
		proDao.insertPurchaseListOrder(purchaseNum, purchase);
		proDao.updateDecOptionPurchase(purchase.getOptionCode(), purchase.getPurchase());
	}

	@Override
	public PurchaseVo getPurchase(String id) {
		int num = proDao.getPurchaseNum(id);
		return proDao.getPurchaseTonum(num);
	}

	@Override
	public PurchaseVo getPurchase(int purchaseNum) {
		return proDao.getPurchaseTonum(purchaseNum);
	}
	
	@Override
	public ArrayList<ShopEnrollProOptionThumbDto> getPurchaseList(int purchaseNum) {
		ArrayList<PurchaselistVo> list = proDao.getPurchaseList(purchaseNum);
		ArrayList<ShopEnrollProOptionThumbDto> list2 = new ArrayList<ShopEnrollProOptionThumbDto>();
		for(PurchaselistVo tmp : list) {
			ShopEnrollProOptionThumbDto shop = infoDao.getShopEnrollProOptionThumbDto(tmp.getEnrollNum(), tmp.getOptionCode());
			ProductenrollmentVo enroll = rootDao.getProductenrollment(tmp.getEnrollNum());
			CategoryVo category = infoDao.getCategory(enroll.getCategoryNum());
			shop.setShoppingNum(tmp.getShoppingNum());
			shop.setPurchase(tmp.getPurchase());
			shop.setMainCategory(category.getMainCategory());
			shop.setOptionCode(tmp.getOptionCode());
			shop.setEnrollNum(tmp.getEnrollNum());
			shop.setListNum(tmp.getListNum());
			shop.setFinalPrice(shop.getFinalPrice() * shop.getPurchase());
			list2.add(shop);
		}
		return list2;
	}

	@Override
	public int getPurchasePrice(int purchaseNum) {
		ArrayList<PurchaselistVo> list = proDao.getPurchaseList(purchaseNum);
		int res = 0;
		for(PurchaselistVo tmp : list) {
			ProductenrollmentVo enroll = rootDao.getProductenrollment(tmp.getEnrollNum());
			int price = enroll.getFinalPrice() * tmp.getPurchase();
			res = res + price;
		}
		int deli = 0;
		if(res < 50000)
			deli = 2500;
		proDao.updatePurchasePrice(res, purchaseNum, deli);
		return res;
	}

	@Override
	public int getDeliveryPrice(int purchaseNum) {
		return proDao.getDeliveryPrice(purchaseNum);
	}

	@Override
	public void updatePurchase(PurchaseVo purchase) {
		purchase.setDeposit("N");
		if(!purchase.getPayment().equals("account")) {
			purchase.setDeposit("Y");
		}
		purchase.setDepositDate(new Date());
		proDao.updatePurchase(purchase);
	}

	@Override
	public void insertRefund(RefundVo refund) {
		System.out.println(refund);
		infoDao.updatePurchaseCancel(refund.getListNum(), "Y");
		if(!refund.getRefundName().equals(""))
			proDao.insertRefund(refund);
	}

}
