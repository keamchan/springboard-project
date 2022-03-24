<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>boardView</title>
</head>
<script type="text/javascript">
	$j(document).ready(function(){
		$j("#deleteBtn").on("click",function(){
			var $frm = $j('.boardDelete :input');
			var param = $frm.serialize();
			
			$j.ajax({
					url : "/board/boardDelete.do" ,
				    dataType: "json",
				    type: "POST",
				    data : param,
				    success: function(data, textStatus, jqXHR)
				    {
				    	
				    	console.log("ajax작동확인");
				    	
				    	var result = data.success;
				    	
				    	if(result == "Y"){
				    		
				    		alert("삭제완료");
						
							location.href = "/board/boardList.do?pageNo=1";
				    	}else{
				    		alert("이미 삭제된 게시글입니다");
							
							location.href = "/board/boardList.do?pageNo=1";
				    	}
						
				    },
				    error: function (jqXHR, textStatus, errorThrown)
				    {
				    	alert("실패");
				    }
			});
		});
	});
</script>
<body>
<form class="boardDelete">
<input name="boardNum" type="hidden" size="50" value="${board.boardNum}"> 

<table align="center">
	<tr>
		<td>
			<table border ="1">
				<tr>
					<td width="120" align="center">
					Title
					</td>
					<td width="400">
					${board.boardTitle}
					</td>
				</tr>
				<tr>
					<td height="300" align="center">
					Comment
					</td>
					<td>
					${board.boardComment}
					</td>
				</tr>
				<tr>
					<td align="center">
					Writer
					</td>
					<td>
					<c:if test="${empty board.userName}">
					SYSTEM
					</c:if>
					<c:if test="${!empty board.userName}">
					${board.userName}
					</c:if>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<input type="button" onclick="location.href='/board/${boardType}/${boardNum}/boardUpdateView.do'" value="수정"></input>
			<input type="button" id="deleteBtn" value="삭제"></input>

		</td>
		<td align="right">
			<a href="/board/boardList.do">List</a>
		</td>
	</tr>
</table>
</form>	
</body>
</html>