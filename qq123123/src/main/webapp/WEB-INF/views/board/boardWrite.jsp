<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>boardWrite</title>
</head>
<script type="text/javascript">

	$j(document).ready(function(){
		
		$j("#submit").on("click",function(){
			var $frm = $j('.boardWrite :input');
			var param = $frm.serialize();
			
			$j.ajax({
			    url : "/board/boardWriteAction.do",
			    dataType: "json",
			    type: "POST",
			    data : param,
			    success: function(data, textStatus, jqXHR)
			    {
			    	
					alert("작성완료");
					
					alert("메세지:"+data.success);
					
					location.href = "/board/boardList.do?pageNo=1";
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("실패");
			    }
			});
		});
		
		$j("#writeAdd").on("click",function(){
		
			var html = "";
			html += "<tbody>";
			html += "<tr>";
			html += "<td width='120' align='center'>Type</td>";
			html += "<td width='400'>";
			html += "<select name='boardType'>";
			html += "<c:forEach items='${codeIdList}' var='list2'>";
			html += "<option value='${list2.codeId}'>${list2.codeName}</option>";
			html += "</c:forEach>";
			html += "</select>";
			html += "</td>";
			html += "</tr>";
			html += "<tr>";
			html += "<td width='120' align='center'>Title</td>";
			html += "<td width='400'>";
			html += "<input name='boardTitle' type='text' size='50' value='${board.boardTitle}'> ";
			html += "</td>";
			html += "</tr>";
			html += "<tr>";
			html += "<td height='300' align='center'>Comment</td>";
			html += "<td valign='top'>";
			html += "<textarea name='boardComment'  rows='20' cols='55'>${board.boardComment}</textarea>";
			html += "</td>";
			html += "</tr>";
			html += "</tbody>";

			
			$j('#myTable > tbody:last').after(html);
			
		});
		
		$j("#writeDel").bind("click", function(){
            var clickRow = $j(this).parent().parent();

            clickRow.remove();

        });
		
		
	});
	

</script>
<body>
<form class="boardWrite">
	<table align="center" width="520">
		<tr>
			<td align="right">
			<input id="submit" type="button" value="작성">
			<input id="writeAdd" type="button" value="행추가">
			<input id="writeDel" type="button" value="행삭제">
			</td>
		</tr>
		<tr>
			<td>
				<table border ="1" id="myTable" class="table"> 
				<tbody id="tbody">
					<tr>
						<td width="120" align="center">
						Type
						</td>
						<td width="400">
						<select name="boardType">
							<c:forEach items="${codeIdList}" var="list2">
								<option value="${list2.codeId}">${list2.codeName}</option>
							</c:forEach>
						</select>
						</td>
					</tr>
					<tr>
						<td width="120" align="center">
						Title
						</td>
						<td width="400">
						<input name="boardTitle" type="text" size="50" value="${board.boardTitle}"> 
						</td>
					</tr>
					<tr>
						<td height="300" align="center">
						Comment
						</td>
						<td valign="top">
						<textarea name="boardComment"  rows="20" cols="55">${board.boardComment}</textarea>
						</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td align="center">
						Writer
						</td>
						<td>
						<input type="hidden" name="creator" value="${user.userId}">
						${user.userName}
						</td>
					</tr>
				</tfoot>
				</table>
			</td>
		</tr>
		<tr>
			<td align="right">
				<a href="/board/boardList.do">List</a>
			</td>
		</tr>
	</table>
</form>	
</body>
</html>