<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>join</title>
<style>
	.idCheck1{
		color : green;
		font-size:4pt;
	}

	.idCheck2{
		color : red;
		font-size:4pt;
	}
	
		.pwCheck1{
		color : green;
		font-size:4pt;
	}

	.pwCheck2{
		color : red;
		font-size:4pt;
	}
</style>
</head>
<script type="text/javascript" charset="UTF-8" >

	$j(document).ready(function(){
		
		$j('input').on("input", function() {
			var text = $j('input').val();
  			$j(this).val( $j(this).val().replace(/ /gi, '') );
		});

		$j('#userId').on("input", function() {
			var text = $j('#userId').val();
			$j(this).val( $j(this).val().replace(/[\u3131-\u314e|\u314f-\u3163|\uac00-\ud7a3]/gi,"") );
		});
		
		$j('#userName').on("input", function() {
			var text = $j('#userName').val();
			$j(this).val( $j(this).val().replace(/[a-z]/gi,"").substr(0, 5) );
			$j(this).val( $j(this).val().replace(/[0-9]/gi,"").substr(0, 5) );
// 			$j('#userName').val(text.substr(0, 5));
	    });

		
		$j('#userPhone2').on("input", function() {
			var text = $j('#userPhone2').val();
			$j(this).val( $j(this).val().replace(/[a-z]/gi,"") );
			$j(this).val( $j(this).val().replace(/[\u3131-\u314e|\u314f-\u3163|\uac00-\ud7a3]/gi,"") );
		});
		
		$j('#userPhone3').on("input", function() {
			var text = $j('#userPhone3').val();
			$j(this).val( $j(this).val().replace(/[a-z]/gi,"") );
			$j(this).val( $j(this).val().replace(/[\u3131-\u314e|\u314f-\u3163|\uac00-\ud7a3]/gi,"") );
		});
		
		$j('#userAddr1').on("input", function() {
			var text = $j('#userAddr1').val();
			$j(this).val( $j(this).val().replace(/[a-z]/gi,"").substr(0, 7) );
			$j(this).val( $j(this).val().replace(/[\u3131-\u314e|\u314f-\u3163|\uac00-\ud7a3]/gi,"").substr(0, 7) );
			$j(this).val( $j(this).val().replace(/([0-9]{3})([0-9]{3})/,"$1-$2").substr(0, 7) );
		});
		
		$j('#userPwCh').on("input", function() {
			var pw = $j("#userPw").val();
			if(pw.length >= 6 && $j('#userPwCh').val() == $j('#userPw').val()){
				$j(".pwCheck1").html("비밀번호와 비밀번호 확인이 일치합니다.");
				$j(".pwCheck2").css("display", "none");
				$j(".pwCheck1").css("display","inline-block");
			}else if(pw.length < 6){
				$j(".pwCheck2").html("비밀번호를 6자리 이상 입력해주세요.");
				$j(".pwCheck1").css("display", "none");
				$j(".pwCheck2").css("display","inline-block");
			}else if($j('#userPwCh').val() != $j('#userPw').val()){
					$j(".pwCheck2").html("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
					$j(".pwCheck1").css("display", "none");
					$j(".pwCheck2").css("display","inline-block");
			} 
			
		});
		
		
		$j("#submit").on("click",function(){	
			
			if($j("#isIdCheck").val()==""){
				alert("아이디 중복체크가 필요합니다");
				$j("#userId").focus();
				return false;
			}
			
			if($j("#userId").val()==""){
				alert("아이디를 입력해주세요.");
				$j("#userId").focus();
				return false;
			}
			if($j("#userPw").val()==""){
				alert("비밀번호를 입력해주세요.");
				$j("#userPw").focus();
				return false;
			}
			if($j("#userPwCh").val()==""){
				alert("비밀번호 확인을 입력해주세요.");
				$j("#userPwCh").focus();
				return false;
			}
			
			if($j("#userPw").val()!=$j("#userPwCh").val()){
				alert("비밀번호확인이 일치하지 않습니다");
				$j("#userPwCh").focus();
				return false;
			}
			
			var pw = $j("#userPw").val();
		    if(pw.length < 6 || pw.length > 12){            
		        alert("비밀번호는 숫자 6~12글자를 입력해야합니다");
		        $j("#userPw").focus();
		        return false;
		    }  
			if($j("#userName").val()==""){
				alert("성명을 입력해주세요.");
				$j("#userName").focus();
				return false;
			}

			var ph2 = $j("#userPhone2").val();
		    if(ph2.length != 4){            
		        alert("전화번호 숫자 4자리를 입력해주세요");
		        $j("#userPhone2").focus();
		        return false;
		    }  
		    
			var ph3 = $j("#userPhone3").val();
		    if(ph3.length != 4){            
		        alert("전화번호 숫자 4자리를 입력해주세요");
		        $j("#userPhone3").focus();
		        return false;
		    }  
		    
			if($j("#userPhone3").val()==""){
				alert("비밀번호를 입력해주세요.");
				$j("#userPass").focus();
				return false;
			}
			
			var postNoRegex = /^[0-9]{3}[-]+[0-9]{3}$/;
		    if($j('#userAddr1').val() != ""){
			    if(!postNoRegex.test($j('#userAddr1').val())){
			        alert("우편번호를 '***-***'형식에 맞게 입력해야합니다");
			        $j("#userAddr1").focus();
			        return false;
			    }
		    }
		    
// 			var addrReg = new RegExp("\[0-9]{3}(-[0-9]{3})?");
// 			if(addrReg.test($j("#userAddr1"))== false){            
// 		        alert("우편번호를 올바르게 입력해야합니다");
// 		        $j("#userAddr1").focus();
// 		        return false;
// 		    } 

			
			var $frm = $j('.userJoin :input');
			var param = $frm.serialize();
			
			$j.ajax({
			    url : "/user/userJoinAction.do",
			    dataType: "json",
			    type: "POST",
			    data : param,
			    success: function(data, textStatus, jqXHR)
			    {	
			    	if(data.success == 1){
					
					alert("회원가입 완료");
					
 					location.href = "/board/boardList.do?pageNo=1";
 					
			    	}else if(data.duplCheck == 1){
			    		alert("아이디 중복검사를 실행해주세요");
			    	}
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("실패");
			    }
			});
		});
		
		
		$j("#idCheck").on("click",function(){
			
			$j.ajax({
			    url : "/user/userIdDuplCheck.do",
			    dataType: "json",
			    type: "POST",
			    data : {userId : $j("#userId").val()},
			    success: function(data, textStatus, jqXHR)
			    {
					if($j("#userId").val()==""){
						alert("아이디를 입력해주세요.");
						$j("#userId").focus();
						return false;
					}else{
				    	if(data==0){
							$j(".idCheck1").html("사용 가능한 아이디입니다.");
							$j(".idCheck2").css("display", "none");
							$j(".idCheck1").css("display","inline-block");
							$j("#isIdCheck").val("Y");
				    	} else if(data == 1) {
				    		$j(".idCheck2").html("아이디가 이미 존재합니다.");
							$j(".idCheck2").css("display","inline-block");
							$j(".idCheck1").css("display", "none");
				    	}
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
<form class="userJoin">
	<table align="center">
		<tr>
			<td>
			<a href ="/board/boardList.do">List</a>
				<table border="1">
					<tr>
						<td>
							id
						</td>
						<td>
							<input type="text" id="userId" name="userId" size="15" maxlength="15" autofocus />
							<input type="hidden" id="isIdCheck" name="isIdCheck" />
							<input type="button" id="idCheck" value="중복확인"></input>
							<div>
								<span class="idCheck1"></span>
								<span class="idCheck2"></span>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							pw
						</td>
						<td>
							<input type="password" id="userPw" name="userPw" maxlength="12" size="15" />
						</td>
					</tr>
					<tr>
						<td>
							pw check
						</td>
						<td>
							<input type="password" id="userPwCh" name="userPwCh" maxlength="12" size="15" />
							<div>
								<span class="pwCheck1"></span>
								<span class="pwCheck2"></span>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							name
						</td>
						<td>
							<input type="text" id="userName" name="userName" maxlength="5" size="15" />
						</td>
					</tr>
					<tr>
						<td>
							phone
						</td>
						<td>
							<select name="userPhone1">
								<c:forEach items="${userPhoneList}" var="list2">
									<option value="${list2.codeName}">${list2.codeName}</option>
								</c:forEach>
							</select> -
			         		<input id="userPhone2" name="userPhone2" type="text" size="3" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"> -
			         		<input id="userPhone3" name="userPhone3" type="text" size="3" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
						</td>
					</tr>
					<tr>
						<td>
							postNo
						</td>
						<td>
							<input id="userAddr1" name="userAddr1" type="text" size="15" maxlength="7" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');" placeholder="***-***">
						</td>
					</tr>
					<tr>
						<td>
							address
						</td>
						<td>
							<input id="userAddr2" name="userAddr2" type="text" size="15" maxlength="30">
						</td>
					</tr>
					<tr>
						<td>
							company
						</td>
						<td>
							<input id="userCompany" name="userCompany" type="text" size="15" maxlength="30">
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td align="right"><input id="submit" type="button" value="join"></td>
		</tr>
	</table>
</form>
</body>
</html>