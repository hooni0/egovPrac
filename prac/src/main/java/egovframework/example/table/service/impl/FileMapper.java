package egovframework.example.table.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.example.table.service.FileVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface FileMapper {
	
	public List<FileVO> fileList(int cardId);
	
	public int fileInsert(Map<String, Object> param);
	
	public int insertFile(FileVO fileVO);
	
	public FileVO selectFileInfo(Map<String, Object> param);

}
