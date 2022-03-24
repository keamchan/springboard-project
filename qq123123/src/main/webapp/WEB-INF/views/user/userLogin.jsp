<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Login</title>
</head>
<script type="text/javascript">


$j(document).ready(function(){
	
	$j("#submit").on("click",function(){
		var $frm = $j('.userLogin :input');
		var param = $frm.serialize();
		
		$j.ajax({
		    url : "/user/userLoginAction.do",
		    dataType: "json",
		    type: "POST",
		    data : param,
		    success: function(data, textStatus, jqXHR)
		    {

				
				if(data.msg == 1){
					alert("�α��� �Ϸ�");
					location.href = "/board/boardList.do?pageNo=1";
				}else if(data.msg == 2){
					alert("��й�ȣ�� Ʋ�Ƚ��ϴ�");
				}else{
					alert("�������� �ʴ� ���̵��Դϴ�");
				}
				
				
		    },
		    error: function (jqXHR, textStatus, errorThrown)
		    {
		    	alert("�α��� ����");
		    }
		});
	});
});

	

</script>
<body>
<form class="userLogin">
	<table align="center">
		<tr>
			<td>
				<table border="1" width="300px" align="center">
					<tr>
						<td width="80px" align="center">id</td>
						<td><input id="userId" name="userId" type="text" size="15" /></td>
					</tr>
					<tr>
						<td align="center">pw</td>
						<td><input id="userPw" name="userPw" type="password" size="15" /></td>
					</tr>
				</table>	
			</td>		
		<tr>
			<td align="right"><input id="submit" type="button" value="login"></td>
		</tr>
	</table>
</form>
</body>
</html>