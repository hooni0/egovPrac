package egovframework.example.table.service;

import java.util.List;

public interface TableService {
	
	List<TableVO> selectCompanyList() throws Exception;
	
	List<TableVO> companyList(DefaultVO searchVO) throws Exception;
	
	int companyListTotCnt(DefaultVO searchVO) throws Exception;

}
