package kr.green.project.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.project.dto.PurchaselistEnrollDto;
import kr.green.project.dto.ReviewPurchaseOptionDto;
import kr.green.project.pagination.ProductCri;
import kr.green.project.vo.ReviewVo;

public interface ReviewDao {

	ArrayList<PurchaselistEnrollDto> getPurchaselistReview(@Param("purchaseNum")int purchaseNum);

	void insertReview(@Param("review")ReviewVo review, @Param("id")String id);

	int getReviewNum(String id);

	void insertReviewFile(@Param("num")int num, @Param("fileName")String fileName);

	void updatePurchaselistReview(@Param("num")int num, @Param("listNum")int listNum);

	ArrayList<ReviewVo> getReview(@Param("enrollNum")int num);

	int getReviewCount(@Param("enrollNum")int num);

	String getOptionCodeTolist(@Param("num")int num);

	ReviewPurchaseOptionDto getReviewOption(@Param("num")int num, @Param("optionCode")String optionCode, @Param("pri")ProductCri pri);

	ArrayList<String> getReviewfile(@Param("num")int num);

}
