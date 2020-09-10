package kr.green.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.project.dao.ProductDao;
import kr.green.project.dao.reviewDao;
import kr.green.project.vo.PurchaseVo;
import kr.green.project.vo.PurchaselistVo;

@Service
public class reviewServiceImp implements reviewService {

	@Autowired
	ProductDao proDao;
	@Autowired
	reviewDao revDao;
	
	public PurchaseVo getPurchaseTonum(int purchaseNum) {
		return proDao.getPurchaseTonum(purchaseNum);
	}

	@Override
	public ArrayList<PurchaselistVo> getPurchaselistReview(int purchaseNum) {
		return revDao.getPurchaselistReview(purchaseNum);
	}
	
}
