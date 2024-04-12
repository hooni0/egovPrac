package egovframework.example.table.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface FileService {
	
	List<FileVO> fileList(int cardId);
	
	int fileInsert(Map<String, Object> param);
	
	int insertFile(FileVO fileVO);
	
	public boolean fileDownload(HttpServletRequest request, HttpServletResponse response) throws IOException;
	
}
