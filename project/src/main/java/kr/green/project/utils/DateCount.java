package kr.green.project.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kr.green.project.dao.ProductDao;
import kr.green.project.vo.ShoppingbasketVo;

@Component
public class DateCount {

	@Autowired
	ProductDao proDao;
	
	@Scheduled(cron="0 * * * * ?")
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
			System.out.println(diffDays);
		}
	}
}
