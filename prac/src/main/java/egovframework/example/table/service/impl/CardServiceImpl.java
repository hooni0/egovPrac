package egovframework.example.table.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.table.service.CardService;
import egovframework.example.table.service.CardVO;

@Service
public class CardServiceImpl implements CardService {
	
	private static final Logger logger = LoggerFactory.getLogger(CardServiceImpl.class);
	
	private final CardMapper cardMapper;
	
	@Autowired
	public CardServiceImpl(CardMapper cardMapper) {
		this.cardMapper = cardMapper;
	}
	
	@Override
	public Map<String, Object> cardNewsList(String searchKey, String searchValue, int currentPage) {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		if(searchValue != null) {
			switch (searchKey) {
				case "cardId": {
					searchKey = "id";
					break;
				}
				case "cardTitle": {
					searchKey = "title";
					break;
				}
			}
			paramMap.put("searchKey", searchKey);
			paramMap.put("searchValue", searchValue);
		}
		
		// 한 페이지에 보여질 갯수
		int rowPerPage = 10;
		
		// 시작될 행의 인덱스 계산
		int startIdx = (currentPage - 1) * rowPerPage;
		
		// 마지막 페이지 계산
		double rowsCnt = cardMapper.getCardCnt(paramMap);
		logger.info("rowsCnt: {}", rowsCnt);
		
		int lastPage = (int) Math.ceil(rowsCnt / rowPerPage);
		
		int startPageNum = 1;
		int endPageNum = (lastPage < 5) ? lastPage : 5;
		
		// 동적페이지 (7page부터)
		if(lastPage > 5 && currentPage > 3) {
			startPageNum = currentPage - 2;
			endPageNum = currentPage + 2;
			if(endPageNum >= lastPage) {
				startPageNum = lastPage - 4;
				endPageNum = lastPage;
			}
		}
		//*************
		paramMap.put("startIdx", startIdx);
		paramMap.put("rowPerPage", rowPerPage);
		
		List<Map<String, Object>> cardNewsList = cardMapper.selectCardList(paramMap);
		//logger.info("cardNewsList: {}", cardNewsList);
		
		paramMap.clear();
		paramMap.put("startIdx", startIdx);
		paramMap.put("cardNewsList", cardNewsList);
		paramMap.put("lastPage", lastPage);
		paramMap.put("startPageNum", startPageNum);
		paramMap.put("endPageNum", endPageNum);
		logger.info("paramMap: {}", paramMap);
		
		return paramMap;
	}
	
	@Override
	public CardVO cardUpdateList(String cardId) {
		
		CardVO cardUpdateList = cardMapper.cardUpdateList(cardId);
		logger.info("cardUpdateList: {}", cardUpdateList);
		
		return cardUpdateList;
	}
	
	@Override
	public int cardUpdate(CardVO cardVO) {
		
		int result = cardMapper.cardUpdate(cardVO);
		logger.info("result: {}", result);
		
		return result;
	}
	
	@Override
	public int cardDelete(CardVO cardVO) {
		
		int result = cardMapper.cardDelete(cardVO);
		logger.info("result: {}", result);
		
		return result;
	}
	
	@Override
	public int cardInsert(CardVO cardVO) {
		
		int result = cardMapper.cardInsert(cardVO);
		logger.info("result: {}", result);
		
		return result;
	}
	
	@Override
	public int fileInsert(Map<String, Object> param) {
		
		int result = cardMapper.fileInsert(param);
		
		return result;
	}

}
