package egovframework.example.table.service.impl;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;

import com.mysql.jdbc.Blob;

import egovframework.example.table.service.FileService;
import egovframework.example.table.service.FileVO;

@Service
public class FileServiceImpl implements FileService {
	
	private static final Logger logger = LoggerFactory.getLogger(FileServiceImpl.class);
	
	private final FileMapper fileMapper;
	
	@Autowired
	public FileServiceImpl(FileMapper fileMapper) {
		this.fileMapper = fileMapper;
	}

	@Override
	public List<FileVO> fileList(int cardId) {
		
		List<FileVO> fileList = fileMapper.fileList(cardId);
		logger.info("fileList: {}", fileList);
		
		return fileList;
	}

	@Override
	public int fileInsert(Map<String, Object> param) {
		
		int result = fileMapper.fileInsert(param);
		logger.info("result: {}", result);
		
		return result;
	}

	@Override
	public int insertFile(FileVO fileVO) {
		
		int result = fileMapper.insertFile(fileVO);
		logger.info("result: {}", result);
		
		return result;
	}

	@Override
	public boolean fileDownload(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		//(1) 기본 ajax요청 시 응답
        String fileNo = request.getParameter("fileNo");
        String cardId = request.getParameter("cardId");
        
        if (fileNo == null || fileNo.equals("") || cardId == null || cardId.equals("")) {
            return false;
        }
		
		logger.info("---------");
		logger.info("response: {}", request.getParameter("fileNo"));
		logger.info("response: {}", request.getParameter("cardId"));
        
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("cardId", cardId);
        param.put("fileNo", fileNo);
        
        FileVO fileVO = fileMapper.selectFileInfo(param);
        
        logger.info("fileNm: {}", fileVO.getFileNm());
        logger.info("fileSize: {}", fileVO.getFileSize());
        
        //(3) ContentType설정
        response.setContentType(MediaType.APPLICATION_OCTET_STREAM_VALUE);
        //response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(fileVO.getFileNm(),"UTF-8")+"\";");
        String encodedFileName = URLEncoder.encode(fileVO.getFileNm(),"UTF-8").replace("+", "%20");
        response.setHeader("Content-Disposition", "attachment; fileName=\"" + encodedFileName + "\";");
        response.setHeader("Content-Transfer-Encoding", "binary");
        
        //(4) 파일읽어 응답하기
        /*
        byte[] fileByte = FileUtils.readFileToByteArray(new File(fileVO.getFileNm()));
        response.getOutputStream().write(fileByte);
        response.getOutputStream().flush();
        response.getOutputStream().close();
        */
        
        //(4) Byte 데이터를  응답하기
        byte[] fileData = fileVO.getFileCntn(); // 예시: fileVO에서 Blob 데이터를 가져오는 메서드명은 getFileData()로 가정합니다.
        if (fileData != null && fileData.length > 0) {
            response.getOutputStream().write(fileData);
            response.getOutputStream().flush();
            response.getOutputStream().close();
        } else {
            // Blob 데이터가 없을 경우에 대한 처리
            // 예를 들어, 로깅 또는 사용자에게 알림을 보낼 수 있습니다.
        }
        
		return true;
	}
	

}
