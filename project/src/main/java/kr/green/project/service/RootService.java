package kr.green.project.service;

import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import kr.green.project.dto.ProductOptionDto;
import kr.green.project.pagination.RootCri;
import kr.green.project.pagination.RootPage;
import kr.green.project.vo.CategoryVo;
import kr.green.project.vo.ContentremarkVo;
import kr.green.project.vo.OptionVo;
import kr.green.project.vo.ProductVo;
import kr.green.project.vo.ProductenrollmentVo;
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
	

}
