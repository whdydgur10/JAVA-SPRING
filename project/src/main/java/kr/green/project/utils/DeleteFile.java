package kr.green.project.utils;

import java.io.File;

public class DeleteFile {

	private String filePath = "D:\\조용혁\\JAVA-SPRING\\project\\src\\main\\webapp\\resources\\img\\";
	
	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public void deleteFile() {
        
        // 파일의 경로 + 파일명
        
        
        File deleteFile = new File(filePath);
 
        // 파일이 존재하는지 체크 존재할경우 true, 존재하지않을경우 false
        if(deleteFile.exists()) {
            
            // 파일을 삭제합니다.
            deleteFile.delete(); 
            
        }
    }
}