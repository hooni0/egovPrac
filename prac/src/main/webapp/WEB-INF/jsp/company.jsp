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
    
	    function fn_egov_link_page(pageNo){
	    	document.listForm.pageIndex.value = pageNo;
	    	document.listForm.action = "<c:url value='/company.do'/>";
	       	document.listForm.submit();
	    }
	    
	    function fn_egov_select(id) {
        	document.listForm.selectedId.value = id;
           	document.listForm.action = "<c:url value='#'/>";
           	document.listForm.submit();
        }
	    
    </script>
    <style>
    
	  </style>
</head>

<body style="text-align:center; margin:0 auto; display:inline; padding-top:100px;">
	<form:form commandName="searchVO" id="listForm" name="listForm" method="post">
		<div id="content_pop">
			<div id="title">
	       		<ul>
	       			<li><img src="<c:url value='/images/egovframework/example/title_dot.gif'/>" alt=""/>Company List</li>
	       		</ul>
	       	</div>
	       	
	       	<div id="search">
        		<ul>
        			<li>
        			    <label for="searchCondition" style="visibility:hidden;"><spring:message code="search.choose" /></label>
        				<form:select path="searchCondition" cssClass="use">
        					<form:option value="1" label="회사아이디" />
        					<form:option value="0" label="회사이름" />
        				</form:select>
        			</li>
        			<li><label for="searchKeyword" style="visibility:hidden;display:none;"><spring:message code="search.keyword" /></label>
                        <form:input path="searchKeyword" cssClass="txt"/>
                    </li>
        			<li>
        	            <span class="btn_blue_l">
        	                <a href="javascript:fn_egov_selectList();"><spring:message code="button.search" /></a>
        	                <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
        	            </span>
        	        </li>
                </ul>
        	</div>
	       	
	       	<div id="table">
			    <table width="100%" border="0" cellpadding="0" cellspacing="0" summary="회사아이디, 회사이름, 지사, 회사주소, 회사이메일, 메모">
			    	<caption style="visibility:hidden">회사아이디, 회사이름, 지사, 회사주소, 회사이메일, 메모</caption>
        			<colgroup>
        				<col width="40"/>
        				<col width="100"/>
        				<col width="100"/>
        				<col width="100"/>
        				<col width="100"/>
        				<col width="100"/>
        				<col width="600"/>
        			</colgroup>
				    <tr>
				        <th>NO</th>
				        <th>회사아이디</th>
				        <th>회사이름</th>
				        <th>지사</th>
				        <th>회사주소</th>
				        <th>회사이메일</th>
				        <th>메모</th>
				    </tr>
			    	<c:forEach var="list" items="${companyList}" varStatus="status">
		    			<tr>
		    				<td align="center"><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/></td>
					    	<td align="center"><a href="javascript:fn_egov_select('<c:out value="${list.companyId}"/>')"><c:out value="${list.companyId}"/></a>&nbsp;</td>
					    	<td align="center"><c:out value="${list.companyName}"/>&nbsp;</td>
					    	<td align="center"><c:out value="${list.companyBranch}"/>&nbsp;</td>
					    	<td align="center"><c:out value="${list.companyAddr}"/>&nbsp;</td>
					    	<td align="center"><c:out value="${list.companyEmail}"/>&nbsp;</td>
					    	<td align="center"><c:out value="${list.companyMemo}"/>&nbsp;</td>
					    </tr>	    	
			    	</c:forEach>
				</table>
	       	</div>
	       	
	       	<!-- /List -->
	       	<div id="paging">
	       		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
	       		<form:hidden path="pageIndex" />
	       	</div>
	       	
	       	<div id="sysbtn">
        	  <ul>
        	      <li>
        	          <span class="btn_blue_l">
        	              <a href="#"><spring:message code="button.create" /></a>
                          <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
                      </span>
                  </li>
              </ul>
        	</div>
        	
		</div>
	</form:form>
</body>
</html>
