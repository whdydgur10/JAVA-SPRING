package kr.green.project.service;

import javax.swing.text.html.Option;

import org.springframework.stereotype.Service;

import kr.green.project.vo.OptionVo;
import kr.green.project.vo.ProductVo;

@Service
public class ProductServiceImp implements ProductService {

	@Override
	public void insertProduct(ProductVo product, String[] size, String[] color) {
		for(String s : size) {
			for(String c : color) {
				OptionVo option = new OptionVo();
				option.setColor(c);
				option.setSize(s);
				option.setProductCode(product.getCode());
				System.out.println(option);
			}
		}
		
		
		
	}

}
