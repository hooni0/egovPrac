package egovframework.example.table.service.impl;

import java.util.List;

import egovframework.example.table.service.DefaultVO;
import egovframework.example.table.service.TableVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("TableMapper")
public interface TableMapper {
	
	List<TableVO> selectCompanyList() throws Exception;
	
	List<TableVO> companyList(DefaultVO searchVO) throws Exception;
	
	int companyListTotCnt(DefaultVO searchVO) throws Exception;
	
	
}
