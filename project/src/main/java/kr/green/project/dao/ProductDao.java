package kr.green.project.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.project.dto.EnrollmentThumbnailDto;
import kr.green.project.pagination.ProductCri;
import kr.green.project.vo.ContentimageVo;
import kr.green.project.vo.ContentremarkVo;
import kr.green.project.vo.ContentsizeVo;
import kr.green.project.vo.ContentsizetextVo;
import kr.green.project.vo.ProductenrollmentVo;
import kr.green.project.vo.PurchaseVo;
import kr.green.project.vo.PurchaselistVo;
import kr.green.project.vo.ShoppingbasketVo;
import kr.green.project.vo.ThumbnailVo;

public interface ProductDao {

	ContentremarkVo getContentRemark(@Param("num")int num);

	ArrayList<ContentsizeVo> getContentSize(@Param("num")int num);

	ContentsizetextVo getContentSizeText(@Param("num")int num);

	ArrayList<ThumbnailVo> getThumbnailImage(@Param("num")int num);

	ArrayList<ContentimageVo> getContentImage(@Param("num")int num);

	ArrayList<ProductenrollmentVo> getProductEnrollmentList(@Param("cri")ProductCri cri);

	int countProductEnrollment(@Param("cri")ProductCri cri);

	int getCategoryNum(@Param("cri")ProductCri cri);

	ArrayList<EnrollmentThumbnailDto> getEnrollmentThumbnailList(@Param("enroll")ProductenrollmentVo tmp);

	ArrayList<ShoppingbasketVo> getShoppingBasketList();

	void insertShoppingBasket(@Param("userId")String id, @Param("enrollNum")String enrollmentNum, @Param("optionCode")String optionCode, @Param("purchase")String purchase, @Param("today")String today);

	void updateDecOptionPurchase(@Param("optionCode")String optionCode, @Param("purchase")String purchase);

	void updateIncOptionPurchase(@Param("optionCode")String optionCode, @Param("purchase")int purchase);

	void insertPurchase(@Param("id")String id);

	int getPurchaseNum(@Param("id")String id);

	void insertPurchaseListBasket(@Param("list")PurchaselistVo list);

}
