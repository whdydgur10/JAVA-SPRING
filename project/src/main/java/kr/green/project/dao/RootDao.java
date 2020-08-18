package kr.green.project.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.project.pagination.RootCri;
import kr.green.project.subVo.ProductOptionVo;
import kr.green.project.vo.CategoryVo;
import kr.green.project.vo.OptionVo;
import kr.green.project.vo.ProductVo;
import kr.green.project.vo.ProductenrollmentVo;

public interface RootDao {

	ArrayList<ProductOptionVo> getProductOptionList(@Param("productCode")String productCode, @Param("rootCri")RootCri rootCri);

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

}
