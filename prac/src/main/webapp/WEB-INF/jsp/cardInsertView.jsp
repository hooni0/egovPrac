<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>
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
  	
    	function cardList() {
			document.InsertForm.action = "<c:url value='/cardNewsList.do'/>";
			document.InsertForm.submit();
    	}
    	
    	function cardInsert() {
			document.InsertForm.action = "<c:url value='/cardInsert.do'/>";
			document.InsertForm.submit();
    	}
    	
    </script>
    <style>
		label {
			
		}   
		#myBtn, #myInsertBtn {
			background-color: gray;
			color: white;
			
			border: 1px;
    		border-radius: 5px;
    		
			text-align: center;
			
			padding: 6px;
		}
		#myBtn:hover, #myInsertBtn:hover {
		    cursor: pointer;
		    color: yellow;
		    font-weight: bold;
		}
    </style>
</head>

<body>
	<form:form commandName="cardVO" id="InsertForm" name="InsertForm">
		<div id="content_pop">
	       	<div id="table">
			    <table width="500px" border="1px solid">
				    <tr>
				        <td class="tbtd_caption">
				        	<label for="hashTags">해시태그</label>
			        	</td>
				        <td class="tbtd_content">
				        	<form:input path="hashTags" />
				        </td>
				    </tr>
				    <tr>
				        <td class="tbtd_caption">
				        	<label for="thumbNail">썸네일</label>
			        	</td>
				        <td class="tbtd_content">
				        	<form:textarea path="thumbNail" rows="10" cols="50"/>
				        </td>
				    </tr>
				    <tr>
				        <td class="tbtd_caption">
				        	<label for="cardTitle">제목</label>
			        	</td>
				        <td class="tbtd_content">
				        	<form:textarea path="cardTitle" rows="10" cols="50"/>
				        </td>
				    </tr>
				    
				</table>
	       	</div>
	       	<div id="sysbtn">
	       		<ul>
	       			<li>
	       				<a id="myBtn" href="javascript:cardList();">목록</a>
	       			</li>
	       		</ul>
	       		<ul>
	       			<li>
	       				<a id="myInsertBtn" href="javascript:cardInsert();">등록</a>
	       			</li>
	       		</ul>
	       		<ul>
	       			<li>
	       				<a id="myBtn" href="javascript:document.InsertForm.reset();">재설정</a>
	       			</li>
	       		</ul>
	       	</div>
		</div>
	</form:form>
</body>
</html>
