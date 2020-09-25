package kr.green.project.utils;

import java.io.File;

import org.springframework.util.FileCopyUtils;

public class UploadFile {

	public static String uploadFile(String uploadPath, String originalName, byte[] 	
			fileData, String code)throws Exception{
		String savedName = originalName;
		String savedPath = calcPath(uploadPath, code);
		File target = new File(uploadPath + savedPath, savedName);
		FileCopyUtils.copy(fileData, target);
		String uploadFileName = makeIcon(uploadPath, savedPath, savedName);
		return uploadFileName;
	}
	
	private static String calcPath(String uploadPath, String code) {
		makeDir(uploadPath, code);
		return code;
 
	}
	private static void makeDir(String uploadPath, String... paths) {
		if(new File(paths[paths.length-1]).exists())
			return;
		for(String path : paths) {
			File dirPath = new File(uploadPath + path);
			if( !dirPath.exists())
				dirPath.mkdir();
		}
	}
	private static String makeIcon(String uploadPath, String path, String fileName)
        	throws Exception{
		String iconName = uploadPath + path + File.separator + fileName;
		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
}
