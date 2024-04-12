package egovframework.example.table.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.example.table.service.CardVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface CardMapper {
	
	public List<Map<String, Object>> selectCardList(Map<String, Object> paramMap);
	
	public CardVO cardUpdateList(String cardId);
	
	public int cardUpdate(CardVO cardVO);
	
	public int cardDelete(CardVO cardVO);
	
	public int cardInsert(CardVO cardVO);
	
	public int getCardCnt(Map<String, Object> paramMap);
	
	public int fileInsert(Map<String, Object> paramMap);

}
