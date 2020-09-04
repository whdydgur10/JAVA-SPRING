package kr.green.project.service;

import java.util.ArrayList;

import kr.green.project.dto.EnrollmentThumbnailDto;
import kr.green.project.dto.ShopEnrollProOptionThumbDto;
import kr.green.project.pagination.ProductCri;
import kr.green.project.pagination.ProductPage;
import kr.green.project.vo.ContentimageVo;
import kr.green.project.vo.ContentremarkVo;
import kr.green.project.vo.ContentsizeVo;
import kr.green.project.vo.ContentsizetextVo;
import kr.green.project.vo.PurchaseVo;
import kr.green.project.vo.PurchaselistVo;
import kr.green.project.vo.ThumbnailVo;

public interface ProductService {

	ContentremarkVo getContentRemark(int num);

	ArrayList<ContentsizeVo> getContentSize(int num);

	ContentsizetextVo getContentSizeText(int num);

	ArrayList<ThumbnailVo> getThumbnailImage(int num);

	ArrayList<ContentimageVo> getContentImage(int num);

	ArrayList<EnrollmentThumbnailDto> getProductEnrollmentList(ProductCri cri);

	ProductPage getProductPage(ProductCri cri);

	void insertShoppingBasket(String id, int enrollNum, String optionCode, int purchase);

	void insertPurchase(String id);

	void insertPurchaseList(String id, PurchaselistVo purchase);

	PurchaseVo getPurchase(String id);

	ArrayList<ShopEnrollProOptionThumbDto> getPurchaseList(int num);

	PurchaseVo getPurchase(int purchaseNum);

	int getPurchasePrice(int purchaseNum);

	int getDeliveryPrice(int purchaseNum);
	
}
