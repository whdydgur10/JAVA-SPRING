package kr.green.project.service;

import java.util.ArrayList;

import kr.green.project.dto.ProductOptionDto;
import kr.green.project.pagination.RootCri;
import kr.green.project.pagination.RootPage;
import kr.green.project.vo.CategoryVo;
import kr.green.project.vo.ContentremarkVo;
import kr.green.project.vo.ContentsizeVo;
import kr.green.project.vo.OptionVo;
import kr.green.project.vo.ProductVo;
import kr.green.project.vo.ProductenrollmentVo;

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

	void updateTitle(int enrollmentNum, String mainTitle, String subTitle);
	

}
