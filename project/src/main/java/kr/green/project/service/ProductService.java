package kr.green.project.service;

import java.util.ArrayList;

import kr.green.project.dto.EnrollmentThumbnailDto;
import kr.green.project.pagination.ProductCri;
import kr.green.project.pagination.ProductPage;
import kr.green.project.vo.ContentimageVo;
import kr.green.project.vo.ContentremarkVo;
import kr.green.project.vo.ContentsizeVo;
import kr.green.project.vo.ContentsizetextVo;
import kr.green.project.vo.ThumbnailVo;

public interface ProductService {

	ContentremarkVo getContentRemark(int num);

	ArrayList<ContentsizeVo> getContentSize(int num);

	ContentsizetextVo getContentSizeText(int num);

	ArrayList<ThumbnailVo> getThumbnailImage(int num);

	ArrayList<ContentimageVo> getContentImage(int num);

	ArrayList<EnrollmentThumbnailDto> getProductEnrollmentList(ProductCri cri);

	ProductPage getProductPage(ProductCri cri);
	

}
