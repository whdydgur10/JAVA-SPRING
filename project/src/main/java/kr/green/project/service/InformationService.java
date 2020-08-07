package kr.green.project.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import kr.green.project.vo.AddressVo;
import kr.green.project.vo.UserInformVo;

public interface InformationService {

	UserInformVo getUserInform(String id);

	boolean isPw(String pw, String id );

	ArrayList<AddressVo> getAddressList(HttpServletRequest h);

	boolean comparePw(String pw, String id);

}
