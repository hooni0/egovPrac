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
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script type="text/javaScript" language="javascript" defer="defer">
  	
    	function cardList() {
			document.InsertForm.action = "<c:url value='/cardNewsList.do'/>";
			document.InsertForm.submit();
    	}
    	
    	function fileUpload() {
			document.InsertForm.submit();
    	}
    	
    	 /* window.onload =  function() {
    		$('#myInsertBtn').on("click",  function(e){
    			
    		    
    		    const files = $('#file')[0].files; //file 목록
    		    const data = {
    		    		'cardId'    : $('input[name=cardId]').val()
    		    	}
				
    		    const formData = new FormData();
    		    const json = JSON.stringify(data);
    		    const blob = new Blob([json], { type: 'application/json' });

    		    formData.append("file", blob);

    		    for(let i = 0; i<files.length; i++) {
    		     	formData.append("multipart", files[i]); 
    		    }

    		    try {
    		    	 
    		    	 $.ajax({
     		            url:"<c:url value='/fileUpload.do'/>",
     		            method:"post",
     		            cache : false,
     		            dataType : 'json',
     		           	contentType: false,
     		          	processData: false,
     		            data : formData,
     		          	beforeSend: function (xhr) {
     		              xhr.setRequestHeader("Content-type","multipart/form-data");
	     		          },
     		            success:function(resp){
     		                console.log("업로드 성공", resp);
     		            },
     		            error:function(){
     		                console.log("업로드 실패");
     		            }
     		        });
    		    	 
    		    	 
    		    	 
    		    	 
    		    } catch (error) {
    		    	console.error("error:", error);
    		    }
    		    
    		});
        } */
        
        window.onload = function() {
        	$('#myInsertBtn').on("click",  function(e){
        		console.log($('#file')[0].files.length);
        		
        		if($('#file')[0].files.length > 0){
        			
        			if($('#file')[0].files[0].size < 2000000) {
        				const formData = new FormData($('#InsertForm')[0]);
        		       	const files = $('#file')[0].files;
        		       /* 
        		       	for(let i = 0; i<files.length; i++) {
    	       		     	formData.append("multipart", files[i]); 
    	       		    }
        		       	 */
        		       	/* value 확인하기 */
        		       	for (let value of formData.values()) {
        		       	      console.log(value);
        		       	}
        		       	 
        		        $.ajax({
        		            url:"<c:url value='/fileUpload.do'/>",
        		            enctype: 'multipart/form-data',
        		            method:"post",
        		            cache : false,
        		            //dataType : 'json',
        		            contentType: false,
         		          	processData: false,
        		            data : formData,
        		            success:function(resp){
        		                console.log("업로드 성공", resp);
        		            },
        		            error:function(){
        		                console.log("업로드 실패");
        		            }
        		        });
        			} else {
            			alert('파일크기는 2MB를 넘을 수 없습니다.');
            		}
        		} else {
        			alert('파일을 선택해주세요.');
        		} 
            });
        }
        
        
        
    </script>
    <style>
		label {
			
		}   
		.myBtn, #myInsertBtn {
			background-color: gray;
			color: white;
			
			border: 1px;
    		border-radius: 5px;
    		
			text-align: center;
			
			padding: 6px;
		}
		.myBtn:hover, #myInsertBtn:hover {
		    cursor: pointer;
		    color: yellow;
		    font-weight: bold;
		}
    </style>
</head>

<body>
	<form id="InsertForm" name="InsertForm" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
		<input type="hidden" id="cardId" name="cardId" value="${fileVO.cardId }"></input>
		<div id="content_pop">
	       	<div id="table">
			    <table width="500px" border="1px solid">
				    
				    <tr>
				        <td class="tbtd_caption">
				        	<label for="file">파일업로드</label>
			        	</td>
				        <td class="tbtd_content">
				        	<input id="file" name="file" type="file" style="height:30px"></input>
				        </td>
				    </tr>
				    
				</table>
	       	</div>
	       
	       	<div id="sysbtn">
	       		<ul>
	       			<li>
	       				<a class="myBtn" href="javascript:cardList();">목록</a>
	       			</li>
	       		</ul>
	       		<ul>
	       			<li>
	       				<button type="button" id="myInsertBtn">업로드</button>
	       			</li>
	       		</ul>
	       		<ul>
	       			<li>
	       				<a class="myBtn" href="javascript:document.InsertForm.reset();">재설정</a>
	       			</li>
	       		</ul>
	       	</div>
		</div>
	</form>
</body>
</html>
