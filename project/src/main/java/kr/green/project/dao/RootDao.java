package kr.green.project.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.project.dto.ProductOptionDto;
import kr.green.project.pagination.RootCri;
import kr.green.project.vo.CategoryVo;
import kr.green.project.vo.ContentremarkVo;
import kr.green.project.vo.ContentsizeVo;
import kr.green.project.vo.ExpenditureVo;
import kr.green.project.vo.OptionVo;
import kr.green.project.vo.ProductVo;
import kr.green.project.vo.ProductenrollmentVo;
import kr.green.project.vo.PurchaseVo;
import kr.green.project.vo.PurchaselistVo;
import kr.green.project.vo.RefundVo;
import kr.green.project.vo.UserVo;

public interface RootDao {

	ArrayList<ProductOptionDto> getProductOptionList(@Param("productCode")String productCode, @Param("rootCri")RootCri rootCri);

	void updateAmount(@Param("optionCode")String optionCode, @Param("amount")int amount);

	ProductVo getProductCode(@Param("code")String code);

	ArrayList<OptionVo> getOptionSize(@Param("productCode")String productCode);

	ArrayList<OptionVo> getOptionColor(@Param("productCode")String productCode);

	int countOption(@Param("productCode")String productCode, @Param("rootCri")RootCri rootCri);

	void insertProduct(@Param("product")ProductVo product);

	void insertOption(@Param("option")OptionVo option);

	void deleteSize(@Param("size")String size, @Param("productCode")String productCode);

	void deleteColor(@Param("color")String color, @Param("productCode")String productCode);
	
	void updateProduct(@Param("product")ProductVo product);

	OptionVo getOption(@Param("productCode")String code, @Param("size")String s, @Param("color")String c);

	ProductenrollmentVo getEnrollment(@Param("code")String code);

	void insertCategory(@Param("category")CategoryVo category);

	String[] getMiddleCategoryList(@Param("category")String category);

	String[] getSubCategoryList(@Param("category")CategoryVo category);

	void insertEnrollment(@Param("enrollment")ProductenrollmentVo enrollment);

	int getCategoryNum(@Param("category")CategoryVo category);

	int getEnrollmentNum(@Param("productCode")String productCode);

	ProductenrollmentVo getProductenrollment(@Param("num")int num);

	ArrayList<OptionVo> getOptionSizeColor(@Param("productCode")String productCode, @Param("color")String color);

	void insertTitle(@Param("enrollment")ProductenrollmentVo enrollment, @Param("enrollmentNum")int enrollmentNum);

	void insertThumnailImage(@Param("enrollmentNum")int enrollmentNum, @Param("fileName")String fileName);

	void insertContentImage(@Param("enrollmentNum")int enrollmentNum, @Param("fileName")String fileName);

	void insertContentremark(@Param("enrollmentNum")int enrollmentNum, @Param("remark")ContentremarkVo contentremark);

	void insertContentsize(@Param("enrollmentNum")int enrollmentNum, @Param("size")ContentsizeVo contentsize);

	void insertContentSizeText(@Param("enrollmentNum")int enrollmentNum, @Param("contentSizeText")String contentSizeText);

	void updateImage(@Param("imageNum")int imageNum, @Param("fileName")String fileName, @Param("table")String table);

	String getImage(@Param("imageNum")int imageNum, @Param("table")String table);

	void deleteImage(@Param("imageNum")int imageNum, @Param("table")String table);

	void updateContentsize(@Param("enrollmentNum")int enrollmentNum, @Param("contentChest")String contentChest, @Param("contentLength")String contentLength, 
			@Param("contentShoulder")String contentShoulder, @Param("contentSize")String contentSize, @Param("contentSleeve")String contentSleeve);

	void updateContentSizeText(@Param("enrollmentNum")int enrollmentNum, @Param("contentSizeText")String contentSizeText);

	void updateContentremark(@Param("enrollmentNum")int enrollmentNum, @Param("contentremark")ContentremarkVo contentremark);

	ProductenrollmentVo getIsEnrollment(@Param("productCode")String productCode);

	void deleteEnroll(@Param("enrollNum")String enrollNum);

	void updateEnrollment(@Param("enroll")ProductenrollmentVo enroll);

	String isEnrollmentContent(@Param("productCode")String code);

	ArrayList<UserVo> getUserList(@Param("rri")RootCri rri);

	void updateConsumer(@Param("user")UserVo user);

	ArrayList<PurchaselistVo> getPurchaseListDelivery(@Param("rri")RootCri rri);

	int getCountPurchaseDelivery(@Param("rri")RootCri rri);

	void insertInvoice(@Param("purchase")PurchaseVo purchase);

	void updateInvoice(@Param("purchase")PurchaseVo purchase);

	void updateSituation(@Param("purchase")PurchaseVo purchase);

	ArrayList<RefundVo> getRefund(@Param("rri")RootCri rri);

	int getCountRefund(@Param("rri")RootCri rri);

	void updateRefund(@Param("refund")RefundVo refund);

	Integer getSalesMonth(@Param("month")String month);

	Integer getSalesDay(@Param("date")String date);

	int getCountPurchaseAccount(@Param("rri")RootCri rri);

	ArrayList<PurchaseVo> getPurchaseAccount(@Param("rri")RootCri rri);

	void updateDeposit(@Param("purchase")PurchaseVo purchase);

	void insertExpenditure(@Param("expend")ExpenditureVo expend);

	ExpenditureVo getExpenditure(@Param("date")String date);

	void updateExpenditure(@Param("expend")ExpenditureVo expend);

	Integer getExpenditureMonth(@Param("month")String month);

	ArrayList<ExpenditureVo> getExpenditureList(@Param("rri")RootCri rri);

}
