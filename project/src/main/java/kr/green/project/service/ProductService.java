package kr.green.project.service;

import kr.green.project.vo.ProductVo;

public interface ProductService {

	void insertProduct(ProductVo product, String[] size, String[] color);

}
