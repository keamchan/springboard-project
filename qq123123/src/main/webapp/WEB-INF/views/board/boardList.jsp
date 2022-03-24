<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>list</title>
</head>
<script type="text/javascript">
	$j(document).ready(function(){
		
		//ajax���� boardList
		$j("#submit").on("click",function(){
			var $frm = $j('#boardSeletListForm').val();
			var param = $frm.serialize();
			
			$j.ajax({
			    url : "/board/boardList.do",
			    dataType: "json",
			    type: "POST",
			    data : param,
			    success: function(data, textStatus, jqXHR)
			    {
			    	resultHtml(data);
			    	console.log("ajax ��� ���� 111111111111111")
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("����");
			    }
			});
		});
		
		
		function resultHtml(data){
			var html = "";
			
			$j.each(data, function(){
					$j.each(value, function(){
						html += "<tr>";
						html += "<td align='center'>" + value.codeName + "</td>";
						html += "<td>" + value.boardNum + "</td>";
						html += "<td>"
						html += "<a href =" + "/board/" + value.boardType + "/" + value.boardNum + "/" + "boardView.do?pageNo=" + ${pageNo} + ">" + value.boardTitle + "</a>";
						html += "</td>";
						html += "</tr>";
				
				});
			});
			
			$j("#display").empty();
			$j("#display").append(html);
		}
		
		// ��ü üũ�ڽ� Ŭ��
		$j("#selectAll").click(function(){
			if($j("#selectAll").prop("checked")){
				$j(".category").prop("checked", true);
			} else {
				$j(".category").prop("checked", false);
			}
		});
		
		//��ü üũ�ڽ� ����
		$j(".category").click(function(){
			if($j("input[name='boardType']:checked").length == 4){
				$j("#selectAll").prop("checked", true);
			} else {
				$j("#selectAll").prop("checked", false);
			}
		});
		
// 		$j("#checkBtn").on('click',function(){
// 			var boardTypeArr = [];
// 			$j("input[name=boardType]:checked").each(function(){
// 				boardTypeArr.push($j(this).val());
// 			});
// 			var boardTypeStr = boardTypeArr.join(",");
// 			$j("input[name=boardTypeList]").attr('value', boardTypeStr);
// 			//console.log(boardTypeStr);
// 		});
		
	});
</script>
<body>
<table  align="center">
	<tr>
		<td>
		<c:if test="${empty user}">
		<a href="/user/userLogin.do">login</a>  <a href="/user/userJoin.do">join</a>
		</c:if>
		<c:if test="${!empty user}">
		${user.userName}
		</c:if>
		</td>
		<td align="right">
			total : ${totalCnt}
		</td>
	</tr>
	<tr>
		<td>
			<table id="boardTable" border = "1">
				<tr id="display">
					<td width="80" align="center">
						Type
					</td>
					<td width="40" align="center">
						No
					</td>
					<td width="300" align="center">
						Title
					</td>
				</tr>
				<c:forEach items="${boardList}" var="list">
					<tr>
						<td align="center">
							${list.codeName}
						</td>
						<td>
							${list.boardNum}
						</td>
						<td>
							<a href = "/board/${list.boardType}/${list.boardNum}/boardView.do?pageNo=${pageNo}">${list.boardTitle}</a>
						</td>
					</tr>	
				</c:forEach>
			</table>
		</td>
	</tr>
	<tr>
		<td align="right">
			<a href ="/board/boardWrite.do">�۾���</a>
			<c:if test="${!empty user}">
				<a href="/user/userLogout.do">logout</a>
			</c:if>
		</td>
	</tr>
	<tr>
		<td>
			<form id="boardSeletListForm">
				 <label value="��ü"><input type="checkbox" class="category" name="selectAll" id="selectAll">��ü</label>
				 <c:forEach items="${codeIdList}" var="list2">
		 		<label><input type="checkbox" class="category" name="boardType" value="${list2.codeId}">${list2.codeName}</label>
		 		</c:forEach>
				 <input type="hidden" id="boardTypeBx" name="boardTypeList">
				 <button type="submit" id="checkBtn">��ȸ</button>
			</form>
		</td>
	</tr>
</table>	
</body>
</html>