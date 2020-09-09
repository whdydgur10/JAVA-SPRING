package kr.green.project.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kr.green.project.dao.InformationDao;
import kr.green.project.dao.ProductDao;
import kr.green.project.vo.PurchaseVo;
import kr.green.project.vo.PurchaselistVo;
import kr.green.project.vo.ShoppingbasketVo;

@Component
public class DateCount {

	
	@Autowired
	ProductDao proDao;
	@Autowired
	InformationDao infoDao;
	
	@Scheduled(cron="30 * * * * ?")
	// 초      분       시      일      월     요일   연도
	//0~59 0~59 0~23 1~31 1~12 0~6 생략가능
	//0:(일)~6:(토) ?:생략 *:모든조건 시작시간/단위: 시작시간~ 시작범위-끝범위: 시작~끝 L:마지막 W:가까운 평일 #:몇주째
	public void count() throws ParseException{
		SimpleDateFormat  dateForm = new SimpleDateFormat("yyyy-MM-dd");
		String today = dateForm.format(new Date());
		Date todate_date = dateForm.parse(today);
		ArrayList<ShoppingbasketVo> basketList = proDao.getShoppingBasketList();
		for(ShoppingbasketVo tmp : basketList) {
			Date data_date = dateForm.parse(tmp.getBasketDate());
			long diff = todate_date.getTime() - data_date.getTime();
			// 시간차이를 시간,분,초를 곱한 값으로 나누면 하루 단위가 나옴
			long diffDays = diff / (24 * 60 * 60 * 1000);
			if(diffDays > 7) {
				infoDao.deleteShoppingBasket(tmp.getShoppingNum());
				proDao.updateIncOptionPurchase(tmp.getOptionCode(), tmp.getPurchase());
			}
				
		}
		ArrayList<PurchaseVo> purchaseList = proDao.getPurchaseListAccount();
		for(PurchaseVo tmp : purchaseList) {
			Date data_date = dateForm.parse(tmp.getOrderDate());
			long diff = todate_date.getTime() - data_date.getTime();
			// 시간차이를 시간,분,초를 곱한 값으로 나누면 하루 단위가 나옴
			long diffDays = diff / (24 * 60 * 60 * 1000);
			if(diffDays > 5) {
				ArrayList<PurchaselistVo> list = proDao.getPurchaseList(tmp.getNum());
				for(PurchaselistVo l : list) {
					proDao.updateIncOptionPurchase(l.getOptionCode(), l.getPurchase());
				}
				proDao.deletePurchase(tmp.getNum());
			}
		}
	}
}
