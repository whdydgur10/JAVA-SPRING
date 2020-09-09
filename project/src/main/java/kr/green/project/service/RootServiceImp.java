package kr.green.project.service;

import java.io.IOException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.green.project.dao.InformationDao;
import kr.green.project.dao.RootDao;
import kr.green.project.dto.ProductOptionDto;
import kr.green.project.pagination.RootCri;
import kr.green.project.pagination.RootPage;
import kr.green.project.utils.DeleteFile;
import kr.green.project.utils.UploadFile;
import kr.green.project.vo.CategoryVo;
import kr.green.project.vo.ContentremarkVo;
import kr.green.project.vo.ContentsizeVo;
import kr.green.project.vo.OptionVo;
import kr.green.project.vo.ProductVo;
import kr.green.project.vo.ProductenrollmentVo;

@Service
public class RootServiceImp implements RootService {
	
	@Autowired
	RootDao rootDao;
	@Autowired
	InformationDao infoDao;
	private String uploadPathEnroll = "D:\\조용혁\\JAVA-SPRING\\project\\src\\main\\webapp\\resources\\img\\enrollment";
	
	@Override
	public void insertProduct(ProductVo product, String[] size, String[] color) {
		if(product.getName() != null && product.getCode() != null && product.getGender() != null && product.getPrice() != 0 && size.length != 0 && color.length != 0) {
			ProductVo product2 = rootDao.getProductCode(product.getCode());
			int cnt = 1;
			int num = product2.getModify();
			String code;
			for(String s : size) {
				for(String c : color) {
					OptionVo option = new OptionVo();
					if(rootDao.getOption(product.getCode(), s, c) == null) {
						if(s.equals("MS") || s.equals("ms"))
							option.setSizeNum(0);
						else if(s.equals("S") || s.equals("s"))
							option.setSizeNum(1);
						else if(s.equals("M") || s.equals("m"))
							option.setSizeNum(2);
						else if(s.equals("L") || s.equals("l"))
							option.setSizeNum(3);
						else if(s.equals("XL") || s.equals("xl"))
							option.setSizeNum(4);
						else if(s.equals("2XL") || s.equals("2xl"))
							option.setSizeNum(5);
						else if(s.equals("3XL") || s.equals("3xl"))
							option.setSizeNum(6);
						else if(s.equals("FREE") || s.equals("free"))
							option.setSizeNum(9);
						else
							option.setSizeNum(Integer.parseInt(s));
						option.setSize(s);
						if(cnt > 9 && num == 0)
							code = "0" + Integer.toString(cnt);
						else if(cnt <= 9 && num == 0)
							code = "00" + Integer.toString(cnt);
						else if(cnt > 9 && num != 0)
							code = Integer.toString(1 * num) + Integer.toString(cnt);
						else if(cnt <= 9 && num != 0)
							code = Integer.toString(1 * num) + "0" + Integer.toString(cnt);
						else 
							code = Integer.toString(cnt);
						option.setColor(c);
						option.setProductCode(product.getCode());
						option.setOptionCode(product.getCode() + code);
						rootDao.insertOption(option);
						cnt++;
					}
				}
			}
		}
	}

	@Override
	public ArrayList<ProductOptionDto> getProductOptionList(String productCode, RootCri rootCri) {
		return rootDao.getProductOptionList(productCode, rootCri);
	}

	@Override
	public void updateAmount(String[] optionCode, int[] amount) {
		for(int i = 0; i < optionCode.length; i++ ) {
			if(amount[i] != 0)
				rootDao.updateAmount(optionCode[i], amount[i]);
		}
		
	}
	
	@Override
	public boolean isProductCode(ProductVo product) {
		ProductVo product2 = rootDao.getProductCode(product.getCode());
		if(product2 == null) {
			System.out.println(product);
			rootDao.insertProduct(product);
			return true;
		}
		else
			return false;
	}

	@Override
	public ProductVo getProduct(String productCode) {
		return rootDao.getProductCode(productCode);
	}

	@Override
	public ArrayList<OptionVo> getOptionSize(String productCode) {
		ArrayList<OptionVo> list = rootDao.getOptionSize(productCode);
		return list;
	}

	@Override
	public ArrayList<OptionVo> getOptionColor(String productCode) {
		ArrayList<OptionVo> list = rootDao.getOptionColor(productCode);
		return list;
	}

	@Override
	public RootPage getRootPage(String productCode, RootCri rootCri) {
		RootPage rootPage = new RootPage();
		rootPage.setRootCri(rootCri);
		rootPage.setTotalCount(rootDao.countOption(productCode, rootCri));
		return rootPage;
	}

	@Override
	public void deleteSize(String size, String productCode) {
		rootDao.deleteSize(size, productCode);
	}

	@Override
	public void deleteColor(String color, String productCode) {
		rootDao.deleteColor(color, productCode);
	}

	@Override
	public void updateProduct(ProductVo product) {
		rootDao.updateProduct(product);
		
	}

	@Override
	public int isEnrollmentProduct(String code) {
		if(rootDao.getProductCode(code) == null)
			return 1;
		else
			if(rootDao.getEnrollment(code) == null)
				return 2;
		return 0;
	}

	@Override
	public void insertCategory(String mainCategory, String middleCategory, String subCategory) {
		CategoryVo category = new CategoryVo();
		category.setMainCategory(mainCategory);
		category.setMiddleCategory(middleCategory);
		category.setSubCategory(subCategory);
		rootDao.insertCategory(category);
		
	}

	@Override
	public String[] getMiddleCategoryList(String category) {
		return rootDao.getMiddleCategoryList(category);
	}

	@Override
	public String[] getSubCategoryList(CategoryVo category) {
		return rootDao.getSubCategoryList(category);
	}

	@Override
	public void insertEnrollment(ProductenrollmentVo enrollment) {
		ProductVo product = rootDao.getProductCode(enrollment.getProductCode());
		enrollment.setFinalPrice(product.getPrice() - enrollment.getDiscount());
		enrollment.setDiscountPercent((int)((double)(enrollment.getDiscount()) / (double)product.getPrice() * 100));
		rootDao.insertEnrollment(enrollment);
	}

	@Override
	public int getEnrollmentNum(String productCode) {
		System.out.println(productCode);
		return rootDao.getEnrollmentNum(productCode);
	}

	@Override
	public ProductenrollmentVo getEnrollment(int num) {
		return rootDao.getProductenrollment(num);
	}

	@Override
	public int getcategoryNum(CategoryVo category) {
		return rootDao.getCategoryNum(category);
	}

	@Override
	public ProductenrollmentVo getEnrollmentString(String productCode) {
		return rootDao.getEnrollment(productCode);
	}

	@Override
	public ArrayList<OptionVo> getOptionSizeColor(String productCode, String color) {
		return rootDao.getOptionSizeColor(productCode, color);
	}

	@Override
	public OptionVo getOption(String productCode, String size, String color) {
		return rootDao.getOption(productCode, size, color);
	}

	@Override
	public void insertTitle(int enrollmentNum, String mainTitle, String subTitle) {
		ProductenrollmentVo enrollment = rootDao.getProductenrollment(enrollmentNum);
		ProductVo product = rootDao.getProductCode(enrollment.getProductCode());
		enrollment.setMainTitle(mainTitle);
		enrollment.setSubTitle(subTitle);
		if(subTitle.equals(""))
			enrollment.setSubTitle(product.getName());
		rootDao.insertTitle(enrollment, enrollmentNum);
	}

	@Override
	public void insertThumnailImage(int enrollmentNum, String fileName) {
		rootDao.insertThumnailImage(enrollmentNum, fileName);
	}

	@Override
	public void insertContentImage(int enrollmentNum, String fileName) {
		rootDao.insertContentImage(enrollmentNum, fileName);
	}

	@Override
	public void insertContentremark(int enrollmentNum, ContentremarkVo contentremark) {
		rootDao.insertContentremark(enrollmentNum, contentremark);
	}

	@Override
	public void insertContentsize(int enrollmentNum, String[] contentShoulder, String[] contentChest, String[] contentSleeve,
			String[] contentSize, String[] contentLength) {
		for(int i = 0; i < contentShoulder.length; i++) {
			ContentsizeVo size = new ContentsizeVo();
			size.setContentChest(contentChest[i]);
			size.setContentLength(contentLength[i]);
			size.setContentShoulder(contentShoulder[i]);
			size.setContentSize(contentSize[i]);
			size.setContentSleeve(contentSleeve[i]);
			size.setEnrollmentNum(enrollmentNum);
			rootDao.insertContentsize(enrollmentNum, size);
		}
		
	}

	@Override
	public void insertContentSizeText(int enrollmentNum, String contentSizeText) {
		rootDao.insertContentSizeText(enrollmentNum, contentSizeText);
		
	}
	
	@Override
	public void updateImage(MultipartFile fileData, String img, String code, int imageNum, String table) throws IOException, Exception {
	    DeleteFile delete = new DeleteFile();
	    String path = delete.getFilePath();
	    delete.setFilePath(path + img);
	    delete.deleteFile();
	    String fileName = UploadFile.uploadFile(uploadPathEnroll, fileData.getOriginalFilename(),fileData.getBytes(), code);
	    rootDao.updateImage(imageNum, fileName, table);
	}

	@Override
	public String getImage(int imageNum, String table) {
		return rootDao.getImage(imageNum, table);
	}

	@Override
	public void deleteImage(String img, int imageNum, String table) {
		DeleteFile delete = new DeleteFile();
	    String path = delete.getFilePath();
	    delete.setFilePath(path + img);
	    delete.deleteFile();
		rootDao.deleteImage(imageNum, table);
	}

	@Override
	public void updateContentsize(int enrollmentNum, String[] contentShoulder, String[] contentChest,
			String[] contentSleeve, String[] contentSize, String[] contentLength) {
		for(int i = 0; i < contentShoulder.length; i++) {
			rootDao.updateContentsize(enrollmentNum, contentChest[i], contentLength[i], contentShoulder[i], contentSize[i], contentSleeve[i]);
		}
		
	}

	@Override
	public void updateContentSizeText(int enrollmentNum, String contentSizeText) {
		rootDao.updateContentSizeText(enrollmentNum, contentSizeText);
	}

	@Override
	public void updateContentremark(int enrollmentNum, ContentremarkVo contentremark) {
		rootDao.updateContentremark(enrollmentNum, contentremark);
	}

	@Override
	public String searchEnroll(String productCode) {
		String list;
		ProductenrollmentVo enroll = rootDao.getIsEnrollment(productCode);
		if(enroll != null) {
			ProductVo product = rootDao.getProductCode(productCode);
			CategoryVo category = infoDao.getCategory(enroll.getCategoryNum());
			String gender = "남성";
			if(category.getMainCategory().equals("M"))
				gender = "남성";
			else if(category.getMainCategory().equals("W"))
				gender = "여성";
			else if(category.getMainCategory().equals("MW"))
				gender = "공용";
			String str1 = "<label for=\"mainTitle\">등록글 제목</label><span id=\"mainTitle\">" + enroll.getMainTitle();
			String str2 = "</span><label for=\"productName\">상품 이름</label><span id=\"productName\">" + product.getName();
			String str3 = "</span><label for=\"type\">분류</label><span id=\"type\">" + gender + "/" + category.getMiddleCategory() + "/" + category.getSubCategory() + "</span>";
			String str4 = "<input type=\"hidden\" id=\"enrollNum\" value=\""+ enroll.getNum() +"\">";
			list = str1 + str2 + str3 + str4;
			return list;
		}
		return null;
	}

	@Override
	public void deleteEnroll(String enrollNum) {
		rootDao.deleteEnroll(enrollNum);
	}

	@Override
	public void updateEnrollment(ProductenrollmentVo enroll) {
		ProductVo product = rootDao.getProductCode(enroll.getProductCode());
		enroll.setFinalPrice(product.getPrice() - enroll.getDiscount());
		enroll.setDiscountPercent((int)((double)(enroll.getDiscount()) / (double)product.getPrice() * 100));
		rootDao.updateEnrollment(enroll);
	}
} 