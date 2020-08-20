package kr.green.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.project.dao.RootDao;
import kr.green.project.dto.ProductOptionDto;
import kr.green.project.pagination.RootCri;
import kr.green.project.pagination.RootPage;
import kr.green.project.vo.CategoryVo;
import kr.green.project.vo.OptionVo;
import kr.green.project.vo.ProductVo;
import kr.green.project.vo.ProductenrollmentVo;

@Service
public class RootServiceImp implements RootService {
	
	@Autowired
	RootDao rootDao;
	
	@Override
	public void insertProduct(ProductVo product, String[] size, String[] color) {
		if(product.getName() != null && product.getCode() != null && product.getGender() != null && product.getPrice() != 0 && size.length != 0 && color.length != 0) {
			ProductVo product2 = rootDao.getProductCode(product.getCode());
			int cnt = 1;
			int num = product2.getModify();
			String code;
			for(String s : size) {
				for(String c : color) {
					OptionVo option = new OptionVo();
					if(rootDao.getOption(product.getCode(), s, c) == null) {
						if(s.equals("MS") || s.equals("ms"))
							option.setSizeNum(0);
						else if(s.equals("S") || s.equals("s"))
							option.setSizeNum(1);
						else if(s.equals("M") || s.equals("m"))
							option.setSizeNum(2);
						else if(s.equals("L") || s.equals("l"))
							option.setSizeNum(3);
						else if(s.equals("XL") || s.equals("xl"))
							option.setSizeNum(4);
						else if(s.equals("XXL") || s.equals("xxl"))
							option.setSizeNum(5);
						else if(s.equals("XXXL") || s.equals("xxxl"))
							option.setSizeNum(6);
						else if(s.equals("FREE") || s.equals("free"))
							option.setSizeNum(9);
						else
							option.setSizeNum(0);
						option.setSize(s);
						if(cnt > 9 && num == 0)
							code = "0" + Integer.toString(cnt);
						else if(cnt <= 9 && num == 0)
							code = "00" + Integer.toString(cnt);
						else if(cnt > 9 && num != 0)
							code = Integer.toString(1 * num) + Integer.toString(cnt);
						else if(cnt <= 9 && num != 0)
							code = Integer.toString(1 * num) + "0" + Integer.toString(cnt);
						else 
							code = Integer.toString(cnt);
						option.setColor(c);
						option.setProductCode(product.getCode());
						option.setOptionCode(product.getCode() + code);
						rootDao.insertOption(option);
						cnt++;
					}
				}
			}
		}
	}

	@Override
	public ArrayList<ProductOptionDto> getProductOptionList(String productCode, RootCri rootCri) {
		return rootDao.getProductOptionList(productCode, rootCri);
	}

	@Override
	public void updateAmount(String[] optionCode, int[] amount) {
		for(int i = 0; i < optionCode.length; i++ ) {
			if(amount[i] != 0)
				rootDao.updateAmount(optionCode[i], amount[i]);
		}
		
	}
	
	@Override
	public boolean isProductCode(String code) {
		ProductVo product = rootDao.getProductCode(code);
		if(product == null) {
			rootDao.insertProduct(product);
			return true;
		}
		else
			return false;
	}

	@Override
	public ProductVo getProduct(String productCode) {
		return rootDao.getProductCode(productCode);
	}

	@Override
	public ArrayList<OptionVo> getOptionSize(String productCode) {
		ArrayList<OptionVo> list = rootDao.getOptionSize(productCode);
		return list;
	}

	@Override
	public ArrayList<OptionVo> getOptionColor(String productCode) {
		ArrayList<OptionVo> list = rootDao.getOptionColor(productCode);
		return list;
	}

	@Override
	public RootPage getRootPage(String productCode, RootCri rootCri) {
		RootPage rootPage = new RootPage();
		rootPage.setRootCri(rootCri);
		rootPage.setTotalCount(rootDao.countOption(productCode, rootCri));
		return rootPage;
	}

	@Override
	public void deleteSize(String size, String productCode) {
		rootDao.deleteSize(size, productCode);
	}

	@Override
	public void deleteColor(String color, String productCode) {
		rootDao.deleteColor(color, productCode);
	}

	@Override
	public void updateProduct(ProductVo product) {
		rootDao.updateProduct(product);
		
	}

	@Override
	public int isEnrollmentProduct(String code) {
		if(rootDao.getProductCode(code) == null)
			return 1;
		else
			if(rootDao.getEnrollment(code) == null)
				return 2;
		return 0;
	}

	@Override
	public void insertCategory(String mainCategory, String middleCategory, String subCategory) {
		CategoryVo category = new CategoryVo();
		category.setMainCategory(mainCategory);
		category.setMiddleCategory(middleCategory);
		category.setSubCategory(subCategory);
		rootDao.insertCategory(category);
		
	}

	@Override
	public String[] getMiddleCategoryList(String category) {
		return rootDao.getMiddleCategoryList(category);
	}

	@Override
	public String[] getSubCategoryList(CategoryVo category) {
		return rootDao.getSubCategoryList(category);
	}

	@Override
	public void insertEnrollment(ProductenrollmentVo enrollment) {
		ProductVo product = rootDao.getProductCode(enrollment.getProductCode());
		enrollment.setFinalPrice(product.getPrice() - enrollment.getDiscount());
		rootDao.insertEnrollment(enrollment);
		
	}

	@Override
	public int getEnrollmentNum(String productCode) {
		System.out.println(productCode);
		return rootDao.getEnrollmentNum(productCode);
	}

	@Override
	public ProductenrollmentVo getEnrollment(int num) {
		return rootDao.getProductenrollment(num);
	}

	@Override
	public int getcategoryNum(CategoryVo category) {
		return rootDao.getCategoryNum(category);
	}

	@Override
	public ProductenrollmentVo getEnrollmentString(String productCode) {
		return rootDao.getEnrollmentString(productCode);
	}

	@Override
	public ArrayList<OptionVo> getOptionSizeColor(String productCode, String color) {
		return rootDao.getOptionSizeColor(productCode, color);
	}

	@Override
	public OptionVo getOption(String productCode, String size, String color) {
		return rootDao.getOption(productCode, size, color);
	}
	
}
