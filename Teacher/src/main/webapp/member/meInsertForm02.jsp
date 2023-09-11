<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./../common/bootstrap5.jsp" %>
<%@ include file="./../common/common.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript">
  		$(document).ready(function(){
  	  		/* $('#birth').datepicker(); */
  	  		$('#birth').datepicker({dateFormat: "yy/mm/dd"});   	  	 	
  		});
  		
  		function validCheck(){/* form validation check */
  			var id = $('#id').val();
  			if(id.length < 4 || id.length > 10){
  				swal('아이디는 4자리 이상 10자리 이하로 입력해 주세요.');
  				$('#id').focus();
  				return false ; /* false이면 이벤트 전파 방지 */
  			}
  			
  			var name = $('#name').val();  			
  			if(name.length < 3 || name.length > 15){  				
  				$('#name').focus();
  				swal('이름은 3자리 이상 15자리 이하로 입력해 주세요.');
  				return false ;
  			}
  			
  			var password = $('#password').val();  			
  			if(password.length < 5 || password.length > 12){
  				swal('비밀 번호는 5자리 이상 12자리 이하로 입력해 주세요.');
  				$('#password').focus();
  				return false ;
  			}    
  			
  			var regex = /^[a-z]\S{4,11}$/; /* 정규 표현식 */
  			var result = regex.test(password) ;

  			if(result == false){
  				swal('비밀 번호의 첫글자는 반드시 소문자이어야 합니다.');  				
  				return false ;
  			}
  			
  			if(password.indexOf('@') <= 0 && password.indexOf('#') <= 0 && password.indexOf('$') <= 0){
  				swal('특수 문자 @#% 중에 최소 1개가 포함이 되어야 합니다.');  				
  				return false ;
  			}
  			
			var radioList = $('input[type="radio"]:checked') ;
  			if(radioList.length == 0){
  				swal('성별은 반드시 선택이 되어야 합니다.');
  				return false ; 
  			}

  			var checkList = $('input[type="checkbox"]:checked');
  			if(checkList.length < 2){
  				swal('취미는 최소 2개 이상 반드시 선택이 되어야 합니다.');
  				return false ; 
  			}  	
  			
  			/* jqueryUI 플러그인 date picker */
  			var birth = $('#birth').val();
  			var regex = /^\d{4}\/[01]\d{1}\/[0123]\d{1}$/ ;
  			var result = regex.test(birth);
  			
  			if(result == false){
  				swal('생일은 반드시 yyyy/mm/dd 형식으로 입력해 주세요.');  				
  				return false ;
  			}   			
  		}
  	</script>
  	<style type="text/css">
  		/* box model에 대한 공부가 필요합니다. */
  		.container{margin-top: 10px;}
  		.input-group{margin: 7px;}
  		.input-group-text{
  			display: block;
  			margin-left: auto;
  			margin-right: auto;
  		}
  		#buttonset{margin-top: 15px;}
  		.radio_gender, .checkbox_hobby{font-size: 1.1rem;} /* 주위 글꼴의 1.1배 */
  	</style>
</head>
<body>
	<div class="container">
		<h2>회원 가입</h2>
		<p>회원 가입하는 페이지 입니다.</p>
		<form action="">
			<div class="input-group">
				<span class="input-group-text">아이디</span>
				<input class="form-control" type="text" id="id" name="id">				
			</div>
			<div class="input-group">
				<span class="input-group-text">이름</span>
				<input class="form-control" type="text" id="name" name="name">				
			</div>
			<div class="input-group">
				<span class="input-group-text">비밀 번호</span>
				<input class="form-control" type="password" id="password" name="password">				
			</div>
			
			<div class="input-group">
				<span class="input-group-text">성별</span>
				<div class="form-control">
					<label class="radio-inline radio_gender"> 
						&nbsp;<input type="radio" id="gender1" name="gender" value="male">남자
					</label>
					<label class="radio-inline radio_gender"> 
						&nbsp;<input type="radio" id="gender2" name="gender" value="female">여자
					</label>
				</div>
			</div>
			
			<div class="input-group">
				<span class="input-group-text">취미</span>
				<div class="form-control">
					<label class="checkbox-inline checkbox_hobby"> 
		 				&nbsp;<input type="checkbox" id="hobby1" name="hobby" value="탁구">&nbsp;탁구
					</label>
					<label class="checkbox-inline checkbox_hobby"> 
						&nbsp;<input type="checkbox" id="hobby2" name="hobby" value="농구">&nbsp;농구
					</label>
					<label class="checkbox-inline checkbox_hobby"> 
						&nbsp;<input type="checkbox" id="hobby3" name="hobby" value="야구">&nbsp;야구
					</label>
					<label class="checkbox-inline checkbox_hobby"> 
						&nbsp;<input type="checkbox" id="hobby4" name="hobby" value="축구">&nbsp;축구
					</label>					
				</div>				
			</div>			
			
			<div class="input-group">
				<span class="input-group-text">생일</span>
				<input class="form-control" type="datetime" id="birth" name="birth">				
			</div>
			<div class="input-group">
				<span class="input-group-text">결혼 여부</span>
				<input class="form-control" type="text" id="marriage" name="marriage">				
			</div>				
			<div class="input-group">
				<span class="input-group-text">급여</span>
				<input class="form-control" type="number" id="salary" name="salary">				
			</div>
			<div class="input-group">
				<span class="input-group-text">주소</span>
				<input class="form-control" type="text" id="address" name="address">				
			</div>
			<div class="input-group">
				<span class="input-group-text">매니저</span>
				<input class="form-control" type="text" id="manager" name="manager">				
			</div>			
			<div id="buttonset" class="input-group">
				<button type="submit" class="btn btn-primary" onclick="return validCheck();"> 
					등록
				</button>
				&nbsp;&nbsp;&nbsp;
				<button type="reset" class="btn btn-primary">초기화</button>				
			</div>
		</form>
	</div>
</body>
</html>