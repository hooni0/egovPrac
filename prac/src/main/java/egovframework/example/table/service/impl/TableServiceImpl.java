package egovframework.example.table.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.example.table.service.DefaultVO;
import egovframework.example.table.service.TableService;
import egovframework.example.table.service.TableVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

@Service("tableService")
public class TableServiceImpl extends EgovAbstractServiceImpl implements TableService {
	
	private static final Logger logger = LoggerFactory.getLogger(TableServiceImpl.class);

	@Resource(name="TableMapper")
	private TableMapper tableDAO;
	
	@Resource(name="egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;
	
	@Override
	public List<TableVO> selectCompanyList() throws Exception{
		
		List<TableVO> companyList = tableDAO.selectCompanyList();
		logger.info("companyList: {}", companyList);
		
		return companyList;
	}
	
	@Override
	public List<TableVO> companyList(DefaultVO searchVO) throws Exception{
		
		List<TableVO> companyList = tableDAO.companyList(searchVO);
		logger.info("companyList: {}", companyList);
		
		return companyList;
	}
	
	@Override
	public int companyListTotCnt(DefaultVO searchVO) throws Exception{
		
		int companyListTotCnt = tableDAO.companyListTotCnt(searchVO);
		logger.info("totcnt: {}", companyListTotCnt);
		
		return companyListTotCnt;
	}
	
}
