package kr.green.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.project.dao.RootDao;
import kr.green.project.pagination.RootCri;
import kr.green.project.pagination.RootPage;
import kr.green.project.subVo.ProductOptionVo;
import kr.green.project.vo.OptionVo;
import kr.green.project.vo.ProductVo;

@Service
public class RootServiceImp implements RootService {
	
	@Autowired
	RootDao rootDao;
	
	@Override
	public void insertProduct(ProductVo product, String[] size, String[] color) {
		if(product.getName() != null && product.getCode() != null && product.getGender() != null && product.getPrice() != 0 && size.length != 0 && color.length != 0) {
			int cnt = 1;
			String code;
			for(String s : size) {
				for(String c : color) {
					OptionVo option = new OptionVo();
					if(cnt > 10)
						code = "0" + Integer.toString(cnt);
					else
						code = "00" + Integer.toString(cnt);
					option.setColor(c);
					option.setSize(s);
					option.setProductCode(product.getCode());
					option.setOptionCode(product.getCode() + code);
					System.out.println(option);
					cnt++;
				}
			}
		}
	}

	@Override
	public ArrayList<ProductOptionVo> getProductOptionList(String productCode, RootCri rootCri) {
		return rootDao.getProductOptionList(productCode, rootCri);
	}

	@Override
	public void updateAmount(String[] optionCode, int[] amount) {
		for(int i = 0; i < optionCode.length; i++ ) {
			rootDao.updateAmount(optionCode[i], amount[i]);
		}
		
	}
	
	@Override
	public boolean isProductCode(String code) {
		ProductVo product = rootDao.getProductCode(code);
		if(product == null)
			return true;
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

}
