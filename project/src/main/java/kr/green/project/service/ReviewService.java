package kr.green.project.service;

import java.io.IOException;
import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import kr.green.project.dto.PurchaselistEnrollDto;
import kr.green.project.dto.ReviewPurchaseOptionDto;
import kr.green.project.pagination.ProductCri;
import kr.green.project.pagination.ProductPage;
import kr.green.project.vo.PurchaseVo;
import kr.green.project.vo.ReviewVo;

public interface ReviewService {

	PurchaseVo getPurchaseTonum(int purchaseNum);

	ArrayList<PurchaselistEnrollDto> getPurchaselistReview(int purchaseNum);

	void insertReview(ReviewVo review, int listNum, MultipartFile[] file, String id) throws IOException, Exception;

	ArrayList<ReviewPurchaseOptionDto> getReview(int num, ProductCri pri);

	int getReviewCount(int num);

	ProductPage getProductPage(ProductCri pri, int num);


}
