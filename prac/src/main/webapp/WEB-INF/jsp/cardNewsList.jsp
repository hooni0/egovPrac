<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title><%= request.getAttribute("title") %></title>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>
    <script type="text/javaScript" language="javascript" defer="defer">
        
	    function card_id(id) {
	    	document.listForm.cardId.value = id;
	    	document.listForm.action = "<c:url value='/cardUpdateView.do'/>";
           	document.listForm.submit();
	    }
	    
	    function cardInsert(){
	    	document.listForm.action = "<c:url value='/cardInsertView.do'/>";
           	document.listForm.submit();
	    }
	    
	    function cardSearch(){
	    	document.listForm.action = "<c:url value='/cardNewsList.do'/>";
           	document.listForm.submit();
	    }
	    
	    function fileUploadList(id) {
	    	document.listForm.cardId.value = id;
	    	document.listForm.action = "<c:url value='/fileUploadList.do'/>";
           	document.listForm.submit();
	    }
	    
	    function fileUpload(id) {
	    	document.listForm.cardId.value = id;
	    	document.listForm.action = "<c:url value='/fileUploadView.do'/>";
           	document.listForm.submit();
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
	<form:form id="listForm" name="listForm" method="post">
        <input type="hidden" name="cardId" />
		<div id="content_pop" style="width: 680px;">
			<div id="search">
				<ul>
					<li>
        				<select name="searchKey" class="use">
        					<option value="cardId">ID</option>
        					<option value="cardTitle">TITLE</option>
        				</select>
        				<input type="text" name="searchValue" class="txt"/>
        				<a id="myBtn" href="javascript:cardSearch();">검색</a>
						<a id="myBtn" href="javascript:cardInsert();">등록</a>
					</li>
				</ul>
			</div>
	       	<div id="table">
			    <table width="100%" border="1px solid">
			    	<colgroup>
			    		<col width="20" />
			    		<col width="30" />
			    		<col width="50" />
			    		<col width="180" />
			    		<col width="180" />
			    		<col width="130" />
			    		<col width="90" />
			    	</colgroup>
					    <tr>
					        <th>No</th>
					        <th>아이디</th>
					        <th>해시태그</th>
					        <th>썸네일</th>
					        <th>제목</th>
					        <th>날짜</th>
					        <th colspan="2">파일 업로드</th>
					    </tr>
				    <c:forEach var="list" items="${cardNewsList}" varStatus="status">
						<tr id="myTr">
			    			<td align="center"><c:out value="${status.count+startIdx}"></c:out></td>
				    		<td align="center"><a id="cardId" href="javascript:card_id('<c:out value="${list.cardId}"></c:out>')"><c:out value="${list.cardId}"></c:out></a></td>
				    		<td align="center"><c:out value="${list.hashTags}"></c:out></td>
				    		<td align="center"><c:out value="${list.thumbNail}"></c:out></td>
				    		<td align="center"><c:out value="${list.cardTitle}"></c:out></td>
				    		<td align="center"><c:out value="${list.date}"></c:out></td>
				    		<td align="center"><a id="myBtn" href="javascript:fileUploadList('<c:out value="${list.cardId}"></c:out>')">목록</a></td>
				    		<td align="center" style="width:80px;"><a id="myBtn" href="javascript:fileUpload('<c:out value="${list.cardId}"></c:out>')">업로드</a></td>
				    	</tr>			    	
				    </c:forEach>
				    <tfoot style="text-align: center; height: 35px;">
				    	<tr>
				    		<td colspan="8">
				    			<a id="myBtn" href="<c:url value='/cardNewsList.do?searchKey=${searchKey}&searchValue=${searchValue}'/>">[맨처음으로]</a>
				    			
				    			<c:choose>
				    				<c:when test="${currentPage > 1}">
				    					<a id="myBtn" href="<c:url value='/cardNewsList.do?currentPage=${currentPage-1}&searchKey=${searchKey}&searchValue=${searchValue}'/>">
						    				[이전]
						    			</a>
				    				</c:when>
				    				<c:when test="${currentPage <= 1}">
				    					<label id="myLabel">[이전]</label>
				    				</c:when>
				    			</c:choose>
				    			
				    			|
				    			<c:forEach var="i" begin="${startPageNum}" end="${endPageNum}">
				    				<c:choose>
					    				<c:when test="${currentPage != i}">
					    					<a id="myBtn" href="<c:url value='/cardNewsList.do?currentPage=${i}&searchKey=${searchKey}&searchValue=${searchValue}'/>">
							    				${i}
							    			</a>
					    				</c:when>
					    				<c:when test="${currentPage == i}">
					    					<label>${i}</label>
					    				</c:when>
					    			</c:choose>
				    			</c:forEach>
				    			|
				    			
				    			<c:choose>
				    				<c:when test="${currentPage < lastPage}">
				    					<a id="myBtn" href="<c:url value='/cardNewsList.do?currentPage=${currentPage+1}&searchKey=${searchKey}&searchValue=${searchValue}'/>">
						    				[다음]
						    			</a>
				    				</c:when>
				    				<c:when test="${currentPage >= lastPage}">
				    					<label id="myLabel">[다음]</label>
				    				</c:when>
				    			</c:choose>
				    			
				    			<a id="myBtn" href="<c:url value='/cardNewsList.do?currentPage=${lastPage}&searchKey=${searchKey}&searchValue=${searchValue}'/>">[맨마지막으로]</a>
				    		</td>
				    	</tr>
				    </tfoot>
				</table>
				
	       	</div>
		</div>
	</form:form>
	
</body>
</html>
