<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>게시판</title>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>
    <script type="text/javaScript" language="javascript" defer="defer">
        
    </script>
    <style>
    
	  </style>
</head>

<body>
	<div id="content_pop">
		<div id="title">
       		<ul>
       			<li><img src="<c:url value='/images/egovframework/example/title_dot.gif'/>" alt=""/>Company List</li>
       		</ul>
       	</div>
       	<div id="table">
		    <table width="100%" border="1px solid">
			    <thead>
				    <tr>
				        <th>회사아이디</th>
				        <th>회사이름</th>
				        <th>지사</th>
				        <th>회사주소</th>
				        <th>회사이메일</th>
				        <th>메모</th>
				    </tr>
			    </thead>
			    <tbody>
			    	<c:forEach var="list" items="${companyList}" varStatus="status">
		    			<tr>
					    	<td align="center"><c:out value="${list.companyId}"/>&nbsp;</td>
					    	<td align="center"><c:out value="${list.companyName}"/>&nbsp;</td>
					    	<td align="center"><c:out value="${list.companyBranch}"/>&nbsp;</td>
					    	<td align="center"><c:out value="${list.companyAddr}"/>&nbsp;</td>
					    	<td align="center"><c:out value="${list.companyEmail}"/>&nbsp;</td>
					    	<td align="center"><c:out value="${list.companyMemo}"/>&nbsp;</td>
					    </tr>	    	
			    	</c:forEach>
			    </tbody>
			</table>
       	</div>
       	
       	<!-- /List -->
       	<%-- <div id="paging">
       		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
       		<form:hidden path="pageIndex" />
       	</div> --%>
	</div>
</body>
</html>
