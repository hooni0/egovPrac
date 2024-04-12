package egovframework.example.table.service;

import java.util.Map;

public interface CardService {
	
	/*List<CardVO> cardNewsList(String searchKey, String searchValue, int currentPage);*/
	Map<String, Object> cardNewsList(String searchKey, String searchValue, int currentPage);
	
	CardVO cardUpdateList(String cardId);
	
	int cardUpdate(CardVO cardVO);
	
	int cardDelete(CardVO cardVO);
	
	int cardInsert(CardVO cardVO);
	
	int fileInsert(Map<String, Object> param);
	
}
