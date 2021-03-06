package kr.green.project.service;

import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.green.project.dto.ProductOptionDto;
import kr.green.project.pagination.RootCri;
import kr.green.project.pagination.RootPage;
import kr.green.project.vo.CategoryVo;
import kr.green.project.vo.ContentremarkVo;
import kr.green.project.vo.ExpenditureVo;
import kr.green.project.vo.OptionVo;
import kr.green.project.vo.ProductVo;
import kr.green.project.vo.ProductenrollmentVo;
import kr.green.project.vo.PurchaseVo;
import kr.green.project.vo.PurchaselistVo;
import kr.green.project.vo.RefundVo;
import kr.green.project.vo.UserVo;

public interface RootService {

	void insertProduct(ProductVo product, String[] size, String[] color);

	ArrayList<ProductOptionDto> getProductOptionList(String productCode, RootCri rootCri);

	void updateAmount(String[] optionCode, int[] amount);

	boolean isProductCode(ProductVo product);

	ProductVo getProduct(String productCode);

	ArrayList<OptionVo> getOptionSize(String productCode);

	ArrayList<OptionVo> getOptionColor(String productCode);

	RootPage getRootPage(String productCode, RootCri rootCri);

	void deleteSize(String size, String productCode);

	void deleteColor(String color, String productCode);

	void updateProduct(ProductVo product);

	int isEnrollmentProduct(String code);

	void insertCategory(String mainCategory, String middleCategory, String tmp2);

	String[] getMiddleCategoryList(String category);

	String[] getSubCategoryList(CategoryVo category);

	void insertEnrollment(ProductenrollmentVo enrollment);

	int getEnrollmentNum(String productCode);

	ProductenrollmentVo getEnrollment(int num);

	int getcategoryNum(CategoryVo category);

	ProductenrollmentVo getEnrollmentString(String productCode);

	ArrayList<OptionVo> getOptionSizeColor(String productCode, String color);

	OptionVo getOption(String productCode, String size, String color);

	void insertThumnailImage(int enrollmentNum, String fileName);

	void insertContentImage(int enrollmentNum, String fileName);

	void insertContentremark(int enrollmentNum, ContentremarkVo contentremark);

	void insertContentsize(int enrollmentNum, String[] contentShoulder, String[] contentChest, String[] contentSleeve,
			String[] contentSize, String[] contentLength);

	void insertContentSizeText(int enrollmentNum, String contentSizeText);

	void insertTitle(int enrollmentNum, String mainTitle, String subTitle);

	void updateImage(MultipartFile fileData, String img, String code, int imageNum, String table)
			throws IOException, Exception;

	String getImage(int imageNum, String table);

	void deleteImage(String img, int imageNum, String table);

	void updateContentsize(int enrollmentNum, String[] contentShoulder, String[] contentChest, String[] contentSleeve,
			String[] contentSize, String[] contentLength);

	void updateContentSizeText(int enrollmentNum, String contentSizeText);

	void updateContentremark(int enrollmentNum, ContentremarkVo contentremark);

	String searchEnroll(String productCode);

	void deleteEnroll(String enrollNum);

	void updateEnrollment(ProductenrollmentVo enroll);

	boolean isEnrollmentContent(String code);

	ArrayList<UserVo> getUserList(RootCri rri) throws ParseException;

	void updateConsumer(UserVo user);

	ArrayList<PurchaselistVo> getPurchaseListDelivery(RootCri rri);

	RootPage getDeliveryPage(RootCri rri);

	void insertInvoice(PurchaseVo purchase);

	void updateInvoice(PurchaseVo purchase);

	void updateSituation(PurchaseVo purchase);

	ArrayList<RefundVo> getRefund(RootCri rri);

	RootPage getRefundPage(RootCri rri);

	void updateRefund(RefundVo refund);

	ArrayList<Integer> getSalesMonth();

	ArrayList<Integer> getSalesDay(Date newDate) throws ParseException;

	RootPage getProductAccountPage(RootCri rri);

	ArrayList<PurchaseVo> getPurchaseAccount(RootCri rri);

	void updateDeposit(PurchaseVo purchase);

	void insertExpenditure(MultipartHttpServletRequest request);

	ArrayList<ExpenditureVo> getExpenditure(RootCri rri);

}
