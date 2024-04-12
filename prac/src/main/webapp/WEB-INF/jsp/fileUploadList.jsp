<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title><%= request.getAttribute("title") %></title>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script type="text/javaScript" language="javascript" defer="defer">
    
	    function fileDownload(id, no) {
	    	/* 
	    	document.listForm.fileNo.value = id;
			document.listForm.action = "<c:url value='/fileDownload.do'/>";
			document.listForm.submit();
			*/
			const encCardId = encodeURI(id);
			const encFileNo = encodeURI(no);
			$.ajax({
				method: "GET",
				url: "<c:url value='/fileDownload.do'/>",
				success: function(res) {
					window.location = "<c:url value='/fileDownload.do?fileNo=" + encFileNo + "&cardId=" + encCardId + "'/>";
					console.log("다운로드성공");
				},
				error: function(error) {
					console.log(error);
				}
			});
			
		}
	    
	    
    
    </script>
    <style>
    	#myBtn {
			background-color: gray;
			color: white;
			
			border: 1px;
    		border-radius: 5px;
    		
			text-align: center;
			
			padding: 6px;
			margin: 5px;
		}
		#myBtn:hover {
		    cursor: pointer;
		    color: yellow;
		    font-weight: bold;
		}
		#myLabel {
			/* background-color: gray; */
			/* color: white; */
			
			border: 1px;
    		border-radius: 5px;
    		
    		text-align: center;
    		
    		padding: 6px;
			margin: 5px;
		}
		#myTr{
			height: 50px;
		}
		#fileBtn {
			background-color: gray;
			color: white;
			
			border: 1px;
    		border-radius: 5px;
    		
			text-align: center;
			
			padding: 6px;
			margin: 5px;
		}
		#fileBtn:hover {
		    cursor: pointer;
		    color: yellow;
		    font-weight: bold;
		}
    </style>
</head>

<body>
	<%-- <form:form id="listForm" name="listForm" method="post"> --%>
	<!-- <input type="hidden" id="fileNo" name="fileNo"></input>
	<input type="hidden" id="fileNm" name="fileNm"></input> -->
		<div id="content_pop" style="width: 680px;">
			<div id="search">
				<ul>
					<li>
						<a id="myBtn" href="/prac/cardNewsList.do">목록</a>
					</li>
				</ul>
			</div>
	       	<div id="table">
			    <table width="100%" border="1px solid">
			    	<colgroup>
			    		<col width="20" />
			    		<col width="30" />
			    		<col width="350" />
			    		<col width="50" />
			    		<col width="30" />
			    		<col width="150" />
			    		<col width="80" />
			    	</colgroup>
					    <tr>
					        <th>No</th>
					        <th>파일번호</th>
					        <th>파일이름</th>
					        <th>파일크기</th>
					        <th>삭제여부</th>
					        <th>등록일시</th>
					        <th>다운로드</th>
					    </tr>
				    	<c:choose>
				    		<c:when test="${fn:length(fileList)== 0}">
				    			<tr id="myTr">
				    				<td align="center" colspan="7">업로드한 파일이 없습니다.</td>
				    			</tr>
				    		</c:when>
				    		<c:otherwise>
					    		<c:forEach var="list" items="${fileList}" varStatus="status">
					    			<tr id="myTr">
					    				<td align="center"><c:out value="${status.count}"></c:out></td>
					    				<td align="center"><c:out value="${list.fileNo}"></c:out></td>
					    				<td align="center"><c:out value="${list.fileNm}"></c:out></td>
					    				<td align="center"><c:out value="${list.fileSize}"></c:out></td>
					    				<td align="center"><c:out value="${list.delAt}"></c:out></td>
					    				<td align="center"><c:out value="${list.regDate}"></c:out></td>
					    				<td align="center"><a id="myBtn" href="javascript:fileDownload('${list.cardId}', '${list.fileNo}');">다운로드</a></td>
					    			</tr>
				    			</c:forEach>
				    		</c:otherwise>
				    	</c:choose>
				</table>
	       	</div>
		</div>
	<%-- </form:form> --%>
	
</body>
</html>
