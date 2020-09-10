package kr.green.project.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.project.vo.PurchaselistVo;

public interface reviewDao {

	ArrayList<PurchaselistVo> getPurchaselistReview(@Param("purchaseNum")int purchaseNum);


}
