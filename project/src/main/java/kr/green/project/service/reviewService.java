package kr.green.project.service;

import java.util.ArrayList;

import kr.green.project.vo.PurchaseVo;
import kr.green.project.vo.PurchaselistVo;

public interface reviewService {

	PurchaseVo getPurchaseTonum(int purchaseNum);

	ArrayList<PurchaselistVo> getPurchaselistReview(int purchaseNum);


}
