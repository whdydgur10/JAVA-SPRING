package kr.green.project.service;

import java.util.ArrayList;

import kr.green.project.pagination.RootCri;
import kr.green.project.pagination.RootPage;
import kr.green.project.subVo.ProductOptionVo;
import kr.green.project.vo.OptionVo;
import kr.green.project.vo.ProductVo;

public interface RootService {

	void insertProduct(ProductVo product, String[] size, String[] color);

	ArrayList<ProductOptionVo> getProductOptionList(String productCode, RootCri rootCri);

	void updateAmount(String[] optionCode, int[] amount);

	boolean isProductCode(String code);

	ProductVo getProduct(String productCode);

	ArrayList<OptionVo> getOptionSize(String productCode);

	ArrayList<OptionVo> getOptionColor(String productCode);

	RootPage getRootPage(String productCode, RootCri rootCri);

	void deleteSize(String size, String productCode);

	void deleteColor(String color, String productCode);

	void updateProduct(ProductVo product);

	int isEnrollmentProduct(String code);

	void insertCategory(String mainCategory, String middleCategory, String tmp2);

}
