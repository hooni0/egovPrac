package egovframework.example.table.controller;

import java.io.File;
import java.io.FilenameFilter;
import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import egovframework.example.table.service.CardService;
import egovframework.example.table.service.CardVO;
import egovframework.example.table.service.DefaultVO;
import egovframework.example.table.service.FileService;
import egovframework.example.table.service.FileVO;
import egovframework.example.table.service.TableService;
import egovframework.example.table.service.TableVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.bind.annotation.CommandMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class TableController {
	
	private static final Logger logger = LoggerFactory.getLogger(TableController.class);
	
	private final CardService cardService;
	private final FileService fileService;
	
	@Autowired
	public TableController(CardService cardService, FileService fileService) {
		this.cardService = cardService;
		this.fileService = fileService;
	}
	
	/* service */
	@Resource(name = "tableService")
	private TableService tableService;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	@RequestMapping(value="/table.do")
	public String tableList(ModelMap model) throws Exception {
		
		List<TableVO> companyList = tableService.selectCompanyList();
		model.addAttribute("companyList", companyList);
		
		return "table";
	}
	
	@RequestMapping(value="/company.do")
	public String companyList(@ModelAttribute("searchVO") DefaultVO searchVO,
							  ModelMap model) throws Exception {
		
		/** EgovPropertyService.sample */
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));
		
		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		List<TableVO> companyList = tableService.companyList(searchVO);
		model.addAttribute("companyList", companyList);
		
		int totCnt = tableService.companyListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		logger.info("paginationInfo: {}", paginationInfo);
		
		return "company";
	}
	
	/**
	 * 리스트화면
	 * @param model
	 * @param currentPage
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/cardNewsList.do")
	@SuppressWarnings("unchecked")
	public String cardNewsList(Model model,
								@RequestParam(value="searchKey", required=false, defaultValue="") String searchKey,
								@RequestParam(value="searchValue", required=false) String searchValue,
								@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) throws Exception {
		
		model.addAttribute("title", "카드뉴스리스트");
		model.addAttribute("currentPage", currentPage);
		
		logger.info("searchKey: {}", searchKey);
		logger.info("searchValue: {}", searchValue);
		model.addAttribute("searchKey", searchKey);
		model.addAttribute("searchValue", searchValue);
		
		// 검색 조건
		Map<String, Object> resultMap = cardService.cardNewsList(searchKey, searchValue, currentPage);
		
		List<Map<String, Object>> cardNewsList = (List<Map<String, Object>>) resultMap.get("cardNewsList");
		model.addAttribute("cardNewsList", cardNewsList);
		
		// 페이징
		int startIdx = (int) resultMap.get("startIdx");
		int lastPage = (int) resultMap.get("lastPage");
		int startPageNum = (int) resultMap.get("startPageNum");
		int endPageNum = (int) resultMap.get("endPageNum");
		model.addAttribute("startIdx", startIdx);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("startPageNum", startPageNum);
		model.addAttribute("endPageNum", endPageNum);
		
		return "cardNewsList";
	}
	
	/**
	 * 수정화면
	 * @param model
	 * @param cardVO
	 * @param cardId
	 * @return
	 */
	@RequestMapping(value="/cardUpdateView.do")
	public String cardUpdateView(Model model, CardVO cardVO,
								 @RequestParam(value="cardId") String cardId) {
		
		model.addAttribute("title", "카드수정화면");
		logger.info("cardId: {}", cardId);
		
		CardVO cardUpdateList = cardService.cardUpdateList(cardId);
		model.addAttribute("cardUpdateList", cardUpdateList);
		
		return "cardUpdateView";
	}
	
	/**
	 * 수정처리
	 * @param cardVO
	 * @return
	 */
	@RequestMapping(value="/cardUpdate.do")
	public String cartUpdate(CardVO cardVO) {
		
		cardService.cardUpdate(cardVO);
		
		return "redirect:/cardNewsList.do";
	}
	
	/**
	 * 삭제처리
	 * @param cardVO
	 * @return
	 */
	@RequestMapping(value="/cardDelete.do")
	public String cardDelete(CardVO cardVO) {
		
		cardService.cardDelete(cardVO);
		
		return "redirect:/cardNewsList.do";
	}

	/**
	 * 등록화면
	 * @param model
	 * @param cardVO
	 * @return
	 */
	@RequestMapping(value="/cardInsertView.do")
	public String cardInsertView(Model model, CardVO cardVO) {
		
		model.addAttribute("title", "카드등록화면");
		model.addAttribute("cardVO", cardVO);
		
		return "cardInsertView";
	}
	
	/**
	 * 등록처리
	 * @param cardVO
	 * @return
	 */
	@RequestMapping(value="/cardInsert.do")
	public String cardInsert(CardVO cardVO) {
		
		cardService.cardInsert(cardVO);
		
		return "redirect:/cardNewsList.do";
	}
	
	@RequestMapping(value="/fileUploadList.do")
	public String fileUploadList(Model model,
								 FileVO fileVO) {
		
		model.addAttribute("title", "파일업로드리스트");
		
		//logger.info("cardId: {}", fileVO.getCardId());
		
		List<FileVO> fileList = fileService.fileList(fileVO.getCardId());
		model.addAttribute("fileList", fileList);
		
		return "fileUploadList";
	}
	
	@RequestMapping(value="/fileUploadView.do")
	public String fileUploadView(Model model, FileVO fileVO) {
		
		model.addAttribute("title", "파일업로드화면");
		model.addAttribute("fileVO", fileVO);
		//logger.info("cardId: {}", fileVO.getCardId());
		
		return "fileUpload";
	}
	
	@ResponseBody
	@RequestMapping(value="/fileUpload.do")
	public void fileUpload(MultipartFile file, FileVO fileVO) throws IOException, SerialException, SQLException {
		
		logger.info("-----------");
		logger.info("Upload File Name: " + file.getOriginalFilename());
		logger.info("Upload File Size: " + file.getSize());
		logger.info("cardId: " + fileVO.getCardId());
		
		Map<String, Object> param = new HashMap<String, Object>();
		String fileName = file.getOriginalFilename();
		byte[] bytes;
		
		bytes = file.getBytes();
		
		Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);
		logger.info("length: {}", blob.length());
		param.put("file", blob);
		param.put("fileName", fileName);
		param.put("fileSize", blob.length());
		param.put("cardId", fileVO.getCardId());
		
		fileService.fileInsert(param);
		//fileService.insertFile(fileVO);
		
	}
	
	@RequestMapping(value="/fileDownload.do", method=RequestMethod.GET)
	public void fileDownload(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		fileService.fileDownload(request, response);
		
	}
	
	/*
	@RequestMapping(value="/fileUploadMnv.do")
	public ModelAndView fileUploadMnv(
			@RequestPart(value = "file") FileVO vo,
			@RequestParam MultipartFile file) {
		ModelAndView mnv = new ModelAndView("jsonView");
		
		mnv.setViewName("/fileUpload");
	
		return mnv;
	}
	*/
	
	/*
	@Value("${file.path")
	private String file_Path;
	
	@RequestMapping(value="/fileDownload.do")
	public ResponseEntity<InputStreamResource> fileDownload(@RequestParam("fileNo") String fileNo) {
		logger.info("fileVO.getFileNo(): {}", fileNo);
		
		
		return null;
	}
	*/
}
