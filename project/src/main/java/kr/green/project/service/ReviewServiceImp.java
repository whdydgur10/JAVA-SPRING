package kr.green.project.service;

import java.io.IOException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.green.project.dao.ProductDao;
import kr.green.project.dao.ReviewDao;
import kr.green.project.dto.PurchaselistEnrollDto;
import kr.green.project.dto.ReviewPurchaseOptionDto;
import kr.green.project.pagination.ProductCri;
import kr.green.project.pagination.ProductPage;
import kr.green.project.utils.UploadFile;
import kr.green.project.vo.PurchaseVo;
import kr.green.project.vo.ReviewVo;

@Service
public class ReviewServiceImp implements ReviewService {

	@Autowired
	ProductDao proDao;
	@Autowired
	ReviewDao revDao;
	private String uploadPathreview = "D:\\조용혁\\JAVA-SPRING\\project\\src\\main\\webapp\\resources\\img\\review\\";
	
	public PurchaseVo getPurchaseTonum(int purchaseNum) {
		return proDao.getPurchaseTonum(purchaseNum);
	}

	@Override
	public ArrayList<PurchaselistEnrollDto> getPurchaselistReview(int purchaseNum) {
		return revDao.getPurchaselistReview(purchaseNum);
	}

	@Override
	public void insertReview(ReviewVo review, int listNum, MultipartFile[] file, String id) throws IOException, Exception {
		revDao.insertReview(review, id);
		int num = revDao.getReviewNum(id);
		for(MultipartFile tmp : file) {
			if(!tmp.getOriginalFilename().equals("")) {
				String fileName = UploadFile.uploadFile(uploadPathreview, tmp.getOriginalFilename(),tmp.getBytes(), Integer.toString(num));
				revDao.insertReviewFile(num, fileName);
			}
		}
		revDao.updatePurchaselistReview(num, listNum);
	}

	@Override
	public ArrayList<ReviewPurchaseOptionDto> getReview(int num, ProductCri pri) {
		ArrayList<ReviewVo> list = revDao.getReview(num);
		ArrayList<ReviewPurchaseOptionDto> list2 = new ArrayList<ReviewPurchaseOptionDto>();
		for(ReviewVo tmp : list) {
			ReviewPurchaseOptionDto dto = revDao.getReviewOption(num, revDao.getOptionCodeTolist(tmp.getNum()),pri);
			dto.setImage(revDao.getReviewfile(dto.getNum()));
			list2.add(dto);
		}
		return list2;
	}

	@Override
	public int getReviewCount(int num) {
		return revDao.getReviewCount(num);
	}

	@Override
	public ProductPage getProductPage(ProductCri pri,int num) {
		ProductPage pageMaker = new ProductPage();
		pageMaker.setCri(pri);
		pageMaker.setTotalCount(revDao.getReviewCount(num));
		return pageMaker;
	}
	
}
