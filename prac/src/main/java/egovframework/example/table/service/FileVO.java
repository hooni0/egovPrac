package egovframework.example.table.service;

import com.mysql.jdbc.Blob;

public class FileVO {
	
	private int cardId;
	private String fileNo;
    private String fileNm;
    private byte[] fileCntn;
    private String fileSize;
    private String delAt;
    private String regId;
    private String regDate;
    
	public int getCardId() {
		return cardId;
	}
	public void setCardId(int cardId) {
		this.cardId = cardId;
	}
	public String getFileNo() {
		return fileNo;
	}
	public void setFileNo(String fileNo) {
		this.fileNo = fileNo;
	}
	public String getFileNm() {
		return fileNm;
	}
	public void setFileNm(String fileNm) {
		this.fileNm = fileNm;
	}
	public byte[] getFileCntn() {
		return fileCntn;
	}
	public void setFileCntn(byte[] fileCntn) {
		this.fileCntn = fileCntn;
	}
	public String getFileSize() {
		return fileSize;
	}
	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}
	public String getDelAt() {
		return delAt;
	}
	public void setDelAt(String delAt) {
		this.delAt = delAt;
	}
	public String getRegId() {
		return regId;
	}
	public void setRegId(String regId) {
		this.regId = regId;
	}
	public String getregDate() {
		return regDate;
	}
	public void setregDate(String regDate) {
		this.regDate = regDate;
	}
    
    

}
