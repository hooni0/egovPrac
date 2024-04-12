package egovframework.example.table.service;

public class TableVO {
	
	private String companyId;
	private String companyName;
	private String companyBranch;
	private String companyAddr;
	private String companyEmail;
	private String companyMemo;
	public String getCompanyId() {
		return companyId;
	}
	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getCompanyBranch() {
		return companyBranch;
	}
	public void setCompanyBranch(String companyBranch) {
		this.companyBranch = companyBranch;
	}
	public String getCompanyAddr() {
		return companyAddr;
	}
	public void setCompanyAddr(String companyAddr) {
		this.companyAddr = companyAddr;
	}
	public String getCompanyEmail() {
		return companyEmail;
	}
	public void setCompanyEmail(String companyEmail) {
		this.companyEmail = companyEmail;
	}
	public String getCompanyMemo() {
		return companyMemo;
	}
	public void setCompanyMemo(String companyMemo) {
		this.companyMemo = companyMemo;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("TableVO [companyId=");
		builder.append(companyId);
		builder.append(", companyName=");
		builder.append(companyName);
		builder.append(", companyBranch=");
		builder.append(companyBranch);
		builder.append(", companyAddr=");
		builder.append(companyAddr);
		builder.append(", companyEmail=");
		builder.append(companyEmail);
		builder.append(", companyMemo=");
		builder.append(companyMemo);
		builder.append("]");
		return builder.toString();
	}
	
}
