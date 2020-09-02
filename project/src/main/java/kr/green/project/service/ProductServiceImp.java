package kr.green.project.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.project.dao.ProductDao;
import kr.green.project.dto.EnrollmentThumbnailDto;
import kr.green.project.pagination.ProductCri;
import kr.green.project.pagination.ProductPage;
import kr.green.project.vo.ContentimageVo;
import kr.green.project.vo.ContentremarkVo;
import kr.green.project.vo.ContentsizeVo;
import kr.green.project.vo.ContentsizetextVo;
import kr.green.project.vo.ProductenrollmentVo;
import kr.green.project.vo.PurchaseVo;
import kr.green.project.vo.PurchaselistVo;
import kr.green.project.vo.ThumbnailVo;

@Service
public class ProductServiceImp implements ProductService {

	@Autowired
	ProductDao proDao;
	
	
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
	public ArrayList<EnrollmentThumbnailDto> getProductEnrollmentList(ProductCri cri) {
		ArrayList<ProductenrollmentVo> enrollment = proDao.getProductEnrollmentList(cri);
		ArrayList<EnrollmentThumbnailDto> list = new ArrayList<EnrollmentThumbnailDto>();
		for(ProductenrollmentVo tmp : enrollment) {
			list.addAll(proDao.getEnrollmentThumbnailList(tmp));
		}
		return list;
	}

	@Override
	public ProductPage getProductPage(ProductCri cri) {
		ProductPage pageMaker = new ProductPage();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(proDao.countProductEnrollment(cri));
		return pageMaker;
	}

	@Override
	public void insertShoppingBasket(String id, String enrollmentNum, String[] optionCode, String[] purchase) {
		SimpleDateFormat  dateForm = new SimpleDateFormat("yyyy-MM-dd");
		String today = dateForm.format(new Date());
		for(int i = 0; i < optionCode.length; i++) {
			proDao.insertShoppingBasket(id, enrollmentNum, optionCode[i], purchase[i], today);
			proDao.updateDecOptionPurchase(optionCode[i], purchase[i]);
		}
	}

	@Override
	public void insertPurchase(String id) {
		proDao.insertPurchase(id);
	}

	@Override
	public void insertPurchaseListBasket(String id, int[] shoppingNum, int[] purchase) {
		PurchaselistVo list = new PurchaselistVo();
		int purchaseNum = proDao.getPurchaseNum(id);
		for(int i = 0; i < shoppingNum.length; i++) {
			list.setPurchaseNum(purchaseNum);
			list.setShoppingNum(shoppingNum[i]);
			list.setPurchase(purchase[i]);
			proDao.insertPurchaseListBasket(list);
		}
	}

	
}