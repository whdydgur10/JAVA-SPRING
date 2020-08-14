package kr.green.project.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.project.pagination.RootCri;
import kr.green.project.subVo.ProductOptionVo;
import kr.green.project.vo.OptionVo;
import kr.green.project.vo.ProductVo;

public interface RootDao {

	ArrayList<ProductOptionVo> getProductOptionList(@Param("productCode")String productCode, @Param("rootCri")RootCri rootCri);

	void updateAmount(@Param("optionCode")String optionCode, @Param("amount")int amount);

	ProductVo getProductCode(@Param("code")String code);

	ArrayList<OptionVo> getOptionSize(@Param("productCode")String productCode);

	ArrayList<OptionVo> getOptionColor(@Param("productCode")String productCode);

	int countOption(@Param("productCode")String productCode, @Param("rootCri")RootCri rootCri);

}
