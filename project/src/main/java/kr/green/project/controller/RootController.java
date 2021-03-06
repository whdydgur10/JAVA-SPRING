package kr.green.project.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.green.project.pagination.RootCri;
import kr.green.project.service.ProductService;
import kr.green.project.service.RootService;
import kr.green.project.utils.UploadFile;
import kr.green.project.vo.CategoryVo;
import kr.green.project.vo.ContentremarkVo;
import kr.green.project.vo.OptionVo;
import kr.green.project.vo.ProductVo;
import kr.green.project.vo.ProductenrollmentVo;
import kr.green.project.vo.PurchaseVo;
import kr.green.project.vo.RefundVo;
import kr.green.project.vo.UserVo;

@Controller
public class RootController {

	@Autowired
	RootService roots;
	@Autowired
	ProductService pros;
	/*
	 * private String uploadPath =
	 * "D:\\조용혁\\JAVA-SPRING\\project\\src\\main\\webapp\\resources\\img\\enrollment\\";
	 */
	private String uploadPath = "/cyongh126/tomcat/webapps/ROOT/resources/img/enrollment/";
	
	@RequestMapping(value= "/root/page", method = RequestMethod.GET)
	public ModelAndView rootGet(ModelAndView mv, HttpServletRequest h){
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		if(user.getAuth() == 0) 
			mv.setViewName("redirect:/");
		else
			mv.setViewName("/root/page");
	    return mv;
	}
	
	@RequestMapping(value= "/root/page", method = RequestMethod.POST)
	public ModelAndView rootPost(ModelAndView mv,String mainCategory, String middleCategory, String[] subCategory ){
		for(String tmp : subCategory) {
			roots.insertCategory(mainCategory, middleCategory, tmp);
		}
		mv.setViewName("/root/page");
	    return mv;
	}
	
	@RequestMapping(value= "/root/product/register", method = RequestMethod.GET)
	public ModelAndView rootProductRegisterGet(ModelAndView mv, HttpServletRequest h){
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		if(user.getAuth() == 0) 
			mv.setViewName("redirect:/");
		else
			mv.setViewName("/root/product/register");
	    return mv;
	}
	
	@RequestMapping("/root/codeCheck")
	@ResponseBody
	public Map<Object, Object> codecheck(@RequestBody ProductVo product){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    map.put("codeCheck", roots.isProductCode(product));
	    return map;
	}
	
	@RequestMapping(value= "/root/product/register", method = RequestMethod.POST)
	public ModelAndView rootProductRegisterPost(ModelAndView mv, HttpServletRequest h, ProductVo product, String[] size, String[] color){
		roots.insertProduct(product, size, color);
		mv.setViewName("redirect:/root/page");
	    return mv;
	}
	
	@RequestMapping(value= "/root/product/amount", method = RequestMethod.GET)
	public ModelAndView rootProductAmountGet(ModelAndView mv, HttpServletRequest h, String productCode, RootCri rootCri, String group, String order){
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		if(user.getAuth() == 0) 
			mv.setViewName("redirect:/");
		else {
			mv.addObject("rootPage", roots.getRootPage(productCode, rootCri));
			mv.addObject("group", group);
			mv.addObject("order", order);
			mv.addObject("productCode", productCode);
			mv.addObject("productList", roots.getProductOptionList(productCode, rootCri));
			mv.setViewName("/root/product/amount");
		}
	    return mv;
	}
	
	@RequestMapping(value= "/root/product/amount", method = RequestMethod.POST)
	public ModelAndView rootProductAmountPost(ModelAndView mv, HttpServletRequest h, String[] optionCode, int[] amount){
		roots.updateAmount(optionCode, amount);
		mv.setViewName("redirect:/root/product/amount");
	    return mv;
	}
	
	@RequestMapping(value= "/root/product/update", method = RequestMethod.GET)
	public ModelAndView rootProductUpdateGet(ModelAndView mv, HttpServletRequest h, String productCode){
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		if(user.getAuth() == 0) 
			mv.setViewName("redirect:/");
		else {
			mv.addObject("size", roots.getOptionSize(productCode));
			mv.addObject("color", roots.getOptionColor(productCode));
			mv.addObject("product", roots.getProduct(productCode));
			mv.setViewName("/root/product/update");
		}
	    return mv;
	}
	
	@RequestMapping("/deleteSize")
	@ResponseBody
	public Map<Object, Object> deleteSize(@RequestBody OptionVo option){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    String size = option.getSize();
	    String productCode = option.getProductCode();
	    roots.deleteSize(size, productCode);
	    return map;
	}
	
	@RequestMapping("/deleteColor")
	@ResponseBody
	public Map<Object, Object> deleteColor(@RequestBody OptionVo option){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    String color = option.getColor();
	    String productCode = option.getProductCode();
	    roots.deleteColor(color, productCode);
	    return map;
	}
	
	@RequestMapping(value= "/root/product/update", method = RequestMethod.POST)
	public ModelAndView rootProductUpdatePost(ModelAndView mv, HttpServletRequest h, ProductVo product, String[] size, String[] color){
		product.setModify(roots.getProduct(product.getCode()).getModify() + 1);
		roots.updateProduct(product);
		roots.insertProduct(product, size, color);
		mv.setViewName("redirect:/root/page");
	    return mv;
	}
	
	@RequestMapping(value= "/root/product/enrollment", method = RequestMethod.GET)
	public ModelAndView rootProductEnrollmentGet(ModelAndView mv, HttpServletRequest h, String productCode){
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		if(user.getAuth() == 0) 
			mv.setViewName("redirect:/");
		else {
			mv.addObject("product", roots.getProduct(productCode));
			mv.setViewName("/root/product/enrollment");
		}
	    return mv;
	}
	
	@RequestMapping("/enrollment/codeCheck")
	@ResponseBody
	public Map<Object, Object> enrollmentCodecheck(@RequestBody String code){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    map.put("codeCheck", roots.isEnrollmentProduct(code));
	    return map;
	}
	
	@RequestMapping("/enrollment/contentCheck")
	@ResponseBody
	public Map<Object, Object> enrollmentContentCheck(@RequestBody String code){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    map.put("contentCheck", roots.isEnrollmentContent(code));
	    return map;
	}
	
	@RequestMapping("/enrollment/middleCategory")
	@ResponseBody
	public Map<Object, Object> enrollmentMiddleCategory(@RequestBody String mainCategory){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    map.put("middleCategory", roots.getMiddleCategoryList(mainCategory));
	    return map;
	}
	
	@RequestMapping("/enrollment/subCategory")
	@ResponseBody
	public Map<Object, Object> enrollmentSubCategory(@RequestBody CategoryVo category){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    map.put("subCategory", roots.getSubCategoryList(category));
	    return map;
	}
	
	@RequestMapping("/enrollment/categoryNum")
	@ResponseBody
	public Map<Object, Object> enrollmentCategoryNum(@RequestBody CategoryVo category){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    map.put("categoryNum", roots.getcategoryNum(category));
	    return map;
	}
	
	@RequestMapping("/enrollment/register")
	@ResponseBody
	public Map<Object, Object> enrollmentRegister(@RequestBody ProductenrollmentVo enrollment){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    roots.insertEnrollment(enrollment);
	    return map;
	}

	@RequestMapping(value= "/root/product/enrollmentContent", method = RequestMethod.GET)
	public ModelAndView rootProductEnrollmentContentGet(ModelAndView mv, HttpServletRequest h, String productCode){
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		if(user.getAuth() == 0) 
			mv.setViewName("redirect:/");
		else {
			mv.addObject("enrollment", roots.getEnrollmentString(productCode));
			mv.addObject("product", roots.getProduct(productCode));
			mv.addObject("colorList", roots.getOptionColor(productCode));
			mv.addObject("sizeList", roots.getOptionSize(productCode));
			mv.setViewName("/root/product/enrollmentContent");
		}
	    return mv;
	}
	
	@RequestMapping("/enrollment/size")
	@ResponseBody
	public Map<Object, Object> enrollmentSize(@RequestBody OptionVo option){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    ArrayList<OptionVo> list = roots.getOptionSizeColor(option.getProductCode(), option.getColor());
	    ArrayList<String> list2 = new ArrayList<String>();
	    String str1 = " <option value=\"";
	    String str2 = "\">";
	    String str3 = "\"disabled=\"disabled\">";
	    String str4 = "</option>";
	    String str5 = "(품절)</option>";
	    for(OptionVo tmp : list) {
	    	if(tmp.getAmount() == 0)
	    		list2.add(str1 + tmp.getSize() + str3 + tmp.getSize() + str5);
	    	else
	    		list2.add(str1 + tmp.getSize() + str2 + tmp.getSize() + str4);
	    }
	    map.put("option", list2);
	    return map;
	}
	
	@RequestMapping("/enrollment/amount")
	@ResponseBody
	public Map<Object, Object> enrollmentAmount(@RequestBody OptionVo option){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    OptionVo option2 = roots.getOption(option.getProductCode(), option.getSize(), option.getColor());
	    if(option.getPurchase() < option2.getAmount())
	    	map.put("more",true);
	    else
	    	map.put("more",false);
	    return map;
	}
	
	@RequestMapping("/enrollment/finalPrice")
	@ResponseBody
	public Map<Object, Object> enrollmentIncFinalPrice(@RequestBody OptionVo option){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    ProductenrollmentVo enrollment = roots.getEnrollmentString(option.getProductCode());
	    map.put("price",String.format("%,d", enrollment.getFinalPrice() * (option.getPurchase())));
	    return map;
	}
	
	@RequestMapping("/enrollment/colorBox")
	@ResponseBody
	public Map<Object, Object> enrollmentColorBox(@RequestBody String code){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    ArrayList<OptionVo> list = roots.getOptionColor(code);
	    ArrayList<String> list2 = new ArrayList<String>();
	    String str1 = "<span class=\"";
	    String str2 = "\" style=\"display:inline-block;width:20px;height:20px;border:1px solid black;margin-right:15px;\"></span>";
	    for(OptionVo tmp : list) {
	    	list2.add(str1 + tmp.getColor() + str2);
	    }
	    map.put("color",list2);
	    return map;
	}
	
	@RequestMapping(value= "/root/product/enrollmentContent", method = RequestMethod.POST)
	public ModelAndView rootProductEnrollmentContentPost(ModelAndView mv, HttpServletRequest h,String productCode, MultipartFile[] thumbnailImage, MultipartFile[] contentImage, ContentremarkVo contentremark, int enrollmentNum, String contentSizeText, String[] contentSize, String[] contentLength
			,	String[] contentShoulder, String[] contentChest, String[] contentSleeve, String mainTitle, String subTitle) throws IOException, Exception{
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		if(user.getAuth() == 0) 
			mv.setViewName("redirect:/");
		else {
			for(MultipartFile tmp : thumbnailImage) {
				if(!(tmp.getOriginalFilename() == "")) {
					String fileName = UploadFile.uploadFile(uploadPath, tmp.getOriginalFilename(),tmp.getBytes(), productCode);
					roots.insertThumnailImage(enrollmentNum, fileName);
				}
			}
			roots.insertContentsize(enrollmentNum, contentShoulder, contentChest, contentSleeve, contentSize, contentLength);
			roots.insertContentSizeText(enrollmentNum, contentSizeText);
			roots.insertContentremark(enrollmentNum, contentremark);
			for(MultipartFile tmp : contentImage) {
				if(!(tmp.getOriginalFilename() == "")) {
					String fileName = UploadFile.uploadFile(uploadPath, tmp.getOriginalFilename(),tmp.getBytes(), productCode);
					roots.insertContentImage(enrollmentNum, fileName);
				}
			}
			roots.insertTitle(enrollmentNum, mainTitle, subTitle);
			mv.setViewName("redirect:/root/page");
		}
	    return mv;
	}
	
	@RequestMapping(value= "/root/product/enrollmentUpdate", method = RequestMethod.GET)
	public ModelAndView rootProductEnrollmentUpdateGet(ModelAndView mv, HttpServletRequest h, String productCode){
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		ProductenrollmentVo enrollment = roots.getEnrollmentString(productCode);
		if(user.getAuth() == 0) 
			mv.setViewName("redirect:/");
		else {
			if(enrollment != null) {
				mv.addObject("enrollment", enrollment);
				mv.addObject("product", roots.getProduct(productCode));
				mv.addObject("colorList", roots.getOptionColor(productCode));
				mv.addObject("sizeList", pros.getContentSize(enrollment.getNum()));
				mv.addObject("remark", pros.getContentRemark(enrollment.getNum()));
				mv.addObject("sizeText", pros.getContentSizeText(enrollment.getNum()));
				mv.addObject("thumbnail", pros.getThumbnailImage(enrollment.getNum()));
				mv.addObject("image", pros.getContentImage(enrollment.getNum()));
				mv.setViewName("/root/product/enrollmentUpdate");
			}else
				mv.setViewName("/root/product/enrollmentUpdate");
		}
	    return mv;
	}
	
	@RequestMapping("/enrollment/updateImage")
	@ResponseBody 
	public  Map<Object, Object> enrollmentUpdateImage(@RequestBody MultipartFile fileData, String img, String code, int imageNum, String table) throws IOException, Exception{
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    roots.updateImage(fileData, img, code, imageNum, table);
	    String image = roots.getImage(imageNum, table);
	    String str = "<%=request.getContextPath()%>/resources/img/";
	    map.put("image", str + image);
	    return map;
	}
	
	@RequestMapping("/enrollment/deleteImage")
	public  Map<Object, Object> enrollmentDeleteImage(String img, int imageNum, String table) throws IOException, Exception{
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    roots.deleteImage(img, imageNum, table);
	    return map;
	}
//	html에 map.put으로 정보를 주려면 @ResponseBody / @RequestBody가 있어야함
	@RequestMapping(value= "/root/product/enrollmentUpdate", method = RequestMethod.POST)
	public ModelAndView rootProductEnrollmentUpdatePost(ModelAndView mv, HttpServletRequest h,String productCode, MultipartFile[] thumbnailImage, MultipartFile[] contentImage, ContentremarkVo contentremark, int enrollmentNum, String contentSizeText, String[] contentSize, String[] contentLength
			,	String[] contentShoulder, String[] contentChest, String[] contentSleeve, ProductenrollmentVo enroll) throws IOException, Exception{
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		if(user.getAuth() == 0) 
			mv.setViewName("redirect:/");
		else {
			for(MultipartFile tmp : thumbnailImage) {
				if(!(tmp.getOriginalFilename() == "")) {
					String fileName = UploadFile.uploadFile(uploadPath, tmp.getOriginalFilename(),tmp.getBytes(), productCode);
					roots.insertThumnailImage(enrollmentNum, fileName);
				}
			}
			roots.updateContentsize(enrollmentNum, contentShoulder, contentChest, contentSleeve, contentSize, contentLength);
			roots.updateContentSizeText(enrollmentNum, contentSizeText);
			roots.updateContentremark(enrollmentNum, contentremark);
			for(MultipartFile tmp : contentImage) {
				if(!(tmp.getOriginalFilename() == "")) {
					String fileName = UploadFile.uploadFile(uploadPath, tmp.getOriginalFilename(),tmp.getBytes(), productCode);
					roots.insertContentImage(enrollmentNum, fileName);
				}
			}
			roots.updateEnrollment(enroll);
			mv.setViewName("redirect:/root/page");
		}
	    return mv;
	}
	
	@RequestMapping("/root/enrollCheck")
	@ResponseBody 
	public  Map<Object, Object> rootEnrollCheck(@RequestBody String productCode){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    map.put("inform",roots.searchEnroll(productCode));
	    return map;
	}
	
	@RequestMapping("/root/deleteEnroll")
	@ResponseBody 
	public  Map<Object, Object> rootDeleteEnroll(@RequestBody String enrollNum){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    roots.deleteEnroll(enrollNum);
	    return map;
	}
	
	@RequestMapping(value= "/root/product/consumerList", method = RequestMethod.GET)
	public ModelAndView rootProductConsumerListGet(ModelAndView mv, HttpServletRequest h, RootCri rri) throws ParseException{
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		if(user.getAuth() == 0) 
			mv.setViewName("redirect:/");
		else {
			mv.addObject("rri", rri);
			mv.addObject("userList", roots.getUserList(rri));
			mv.setViewName("/root/product/consumerList");
		}
	    return mv;
	}
	
	@RequestMapping("/consumerList")
	@ResponseBody 
	public  Map<Object, Object> consumerList(@RequestBody RootCri rri) throws ParseException{
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    ArrayList<UserVo> list = roots.getUserList(rri);
	    ArrayList<String> user = new ArrayList<String>();
	    String str = null;
	    String nul = "";
	    for(UserVo tmp : list) {
	    	if(tmp.getAuth() != 1) {
	    		if(!tmp.getBirthday().equals("")) {
		    		str = "<tr><td><a>" + tmp.getId() + "</a></td><td>" + tmp.getName() + "</td><td>" + tmp.getPhone() + "</td><td>" + tmp.getBirthday() + "</td><td>" + tmp.getGender() + "</td><td>" + tmp.getEmail() + "</td><td>" + tmp.getPoint() + "</td><td><select class=\"isDel\"><option selected>";
		    		if(tmp.getIsDel().equals("Y")) {
		    			str = str + tmp.getIsDel() + "</option><option>N</option></td><td>" + tmp.getIsDelDate() + "</td><td><input type=\"text\" class=\"comment\" value=\"" + tmp.getComment() + "\"></td></tr>";
		    		}else {
		    			str = str + tmp.getIsDel() + "</option><option>Y</option></td><td>" + nul + "</td><td><input type=\"text\" class=\"comment\" value=\"" + tmp.getComment() + "\"></td></tr>";
		    		}
		    	}else {
		    		str = "<tr><td><a>" + tmp.getId() + "</a></td><td>" + tmp.getName() + "</td><td>" + tmp.getPhone() + "</td><td>" + nul + "</td><td>" + tmp.getGender() + "</td><td>" + tmp.getEmail() + "</td><td>" + tmp.getPoint() + "<td/><td><select class=\"isDel\"><option selected>";
		    		if(tmp.getIsDel().equals("Y")) {
		    			str = str + tmp.getIsDel() + "</option><option>N</option></td><td>" + tmp.getIsDelDate() + "</td><td><input type=\"text\" class=\"comment\" value=\"" + tmp.getComment() + "\"></td></tr>";
		    		}else {
		    			str = str + tmp.getIsDel() + "</option><option>Y</option></td><td>" + nul + "</td><td><input type=\"text\" class=\"comment\" value=\"" + tmp.getComment() + "\"></td></tr>";
		    		}
		    	}
		    	user.add(str);
	    	}	
	    }
	    map.put("list", user);
	    return map;
	}
	
	@RequestMapping("/changeConsumer")
	@ResponseBody 
	public  Map<Object, Object> changeConsumer(@RequestBody UserVo user){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    roots.updateConsumer(user);
	    return map;
	}
	
	@RequestMapping(value= "/root/product/consumerInform", method = RequestMethod.GET)
	public ModelAndView rootProductConsumerInformGet(ModelAndView mv, HttpServletRequest h, String id){
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		if(user.getAuth() == 0) 
			mv.setViewName("redirect:/");
		else {
			System.out.println(id);
			mv.setViewName("/root/product/consumerInform");
		}
	    return mv;
	}
	
	@RequestMapping(value= "/root/product/delivery", method = RequestMethod.GET)
	public ModelAndView rootProductDeliveryGet(ModelAndView mv, HttpServletRequest h, RootCri rri) throws ParseException{
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		if(user.getAuth() == 0) 
			mv.setViewName("redirect:/");
		else {
			mv.addObject("rri", rri);
			mv.addObject("purchaselist", roots.getPurchaseListDelivery(rri));
			mv.addObject("RootPage", roots.getDeliveryPage(rri));
			mv.setViewName("/root/product/delivery");
		}
	    return mv;
	}
	
	@RequestMapping("/insertInvoice")
	@ResponseBody
	public  Map<Object, Object> insertInvoice(@RequestBody PurchaseVo purchase){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    roots.insertInvoice(purchase);
	    return map;
	}
	
	@RequestMapping("/updateInvoice")
	@ResponseBody
	public  Map<Object, Object> updateInvoice(@RequestBody PurchaseVo purchase){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    roots.updateInvoice(purchase);
	    return map;
	}
	
	@RequestMapping("/updateSituation")
	@ResponseBody
	public  Map<Object, Object> updateSituation(@RequestBody PurchaseVo purchase){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    roots.updateSituation(purchase);
	    return map;
	}
	
	@RequestMapping(value= "/root/product/refund", method = RequestMethod.GET)
	public ModelAndView rootProductRefundGet(ModelAndView mv, HttpServletRequest h, RootCri rri) throws ParseException{
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		if(user.getAuth() == 0) 
			mv.setViewName("redirect:/");
		else {
			mv.addObject("rri", rri);
			mv.addObject("refundlist", roots.getRefund(rri));
			mv.addObject("RootPage", roots.getRefundPage(rri));
			mv.setViewName("/root/product/refund");
		}
	    return mv;
	}
	
	@RequestMapping("/updateRefund")
	@ResponseBody
	public  Map<Object, Object> updateRefund(@RequestBody RefundVo refund){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    roots.updateRefund(refund);
	    return map;
	}
	
	@RequestMapping(value= "/root/product/sales", method = RequestMethod.GET)
	public ModelAndView rootProductSalesGet(ModelAndView mv, HttpServletRequest h, Date[] date) throws ParseException{
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		Date tmp = new Date();
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		String today;
		if(user.getAuth() == 0) 
			mv.setViewName("redirect:/");
		else {
			if(date == null) {
				today = transFormat.format(tmp);
			}else
				today = transFormat.format(date[3]);
			mv.addObject("today", today);
			mv.setViewName("/root/product/sales");
		}
	    return mv;
	}
	
	@RequestMapping("/salesMonth")
	@ResponseBody
	public  Map<Object, Object> salesMonth(){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    map.put("month",roots.getSalesMonth());
	    return map;
	}
	
	@RequestMapping("/salesDay")
	@ResponseBody
	public  Map<Object, Object> salesDay(@RequestBody Date newDate) throws ParseException{
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    ArrayList<String> list = new ArrayList<String>();
	    SimpleDateFormat md = new SimpleDateFormat("MM-dd");
		SimpleDateFormat ymd = new SimpleDateFormat("yyyy-MM-dd");
		String[] tmp = (ymd.format(newDate).split("-"));
		Calendar cal = Calendar.getInstance();
		cal.setTime(newDate);
		for(int i = 0; i < 7; i++) {
			String date = md.format(cal.getTime());
			cal.add(Calendar.DATE, +1);
			list.add(date);
		}
		list.add(tmp[0]);
	    map.put("day",roots.getSalesDay(newDate));
	    map.put("date", list);
	    return map;
	}
	
	@RequestMapping(value= "/root/product/account", method = RequestMethod.GET)
	public ModelAndView rootProductAccountGet(ModelAndView mv, HttpServletRequest h) throws ParseException{
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		RootCri rri = new RootCri();
		if(user.getAuth() == 0) 
			mv.setViewName("redirect:/");
		else {
			mv.addObject("account", roots.getPurchaseAccount(rri));
			mv.addObject("rootPage", roots.getProductAccountPage(rri));
			mv.setViewName("/root/product/account");
		}
	    return mv;
	}
	
	@RequestMapping("/updateDeposit")
	@ResponseBody
	public  Map<Object, Object> updateDeposit(@RequestBody PurchaseVo purchase){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    roots.updateDeposit(purchase);
	    return map;
	}
	
	@RequestMapping(value= "/root/product/expenditure", method = RequestMethod.GET)
	public ModelAndView rootProductExpenditureGet(ModelAndView mv, HttpServletRequest h, RootCri rri){
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		if(user.getAuth() == 0) 
			mv.setViewName("redirect:/");
		else {
			Date tmp = new Date();
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy");
			mv.addObject("today", transFormat.format(tmp));
			mv.addObject("expenditure", roots.getExpenditure(rri));
			mv.addObject("rri", rri);
			mv.setViewName("/root/product/expenditure");
		}
	    return mv;
	}

	@RequestMapping("/insertExpenditure")
	@ResponseBody
	public  Map<Object, Object> insertExpenditure(MultipartHttpServletRequest request){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    roots.insertExpenditure(request);
	    return map;
	}
	
	@RequestMapping(value= "/root/product/imageTest", method = RequestMethod.GET)
	public ModelAndView rootProductImageTestGet(ModelAndView mv, HttpServletRequest h, RootCri rri){
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		if(user.getAuth() == 0) 
			mv.setViewName("redirect:/");
		else {
			mv.setViewName("/root/product/imageTest");
		}
	    return mv;
	}
}
