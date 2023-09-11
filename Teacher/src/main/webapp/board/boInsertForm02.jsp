<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./../common/bootstrap5.jsp" %>
<%@ include file="./../common/common.jsp" %>
        
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
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
  	</style>
  	<script type="text/javascript">
  		$(document).ready(function(){
  	  		/* $('#regdate').datepicker(); */
  	  		$('#regdate').datepicker({dateFormat: "yy/mm/dd"});  	  	 
  		});
  		
  		function validCheck(){/* 폼 유효성 검사 */
  			var subject = $('#subject').val();
  			if(subject.length < 3 || subject.length > 20){
  				alert('글 제목은 3글자 이상 20글자 이하이어야 합니다.');
  				$('#subject').focus() ;
  				return false ;
  			}
  			
  			var content = $('#content').val();
  			if(content.length < 5 || content.length > 30){
  				alert('글 내용은 5글자 이상 30글자 이하이어야 합니다.');
  				$('#content').focus() ;
  				return false ;
  			}
  			
  			var regdate = $('#regdate').val();
  			
  			var regex = /^\d{4}[\/-][01]\d{1}[\/-][0123]\d{1}$/ ;
  			var result = regex.test(regdate) ;
  			
  			if(result == false){
  				alert('날짜 형식은 반드시 yyyy/mm/dd 형식 또는 yyyy-mm-dd으로 작성해 주세요.');
  				$('#regdate').focus() ;
  				return false ;
  			}
  		}
  	</script>  	
</head>
<body>
	<div class="container">
		<h2>게시물 등록</h2>
		<p>사용자들이 게시물을 등록하는 페이지입니다.</p>
		
		<form>
			<div class="input-group">
				<span class="input-group-text col-md-2">게시물 번호</span> 
				<input id="no" name="no" type="number" class="form-control" placeholder="">
			</div> 
			<div class="input-group">
				<span class="input-group-text col-md-2">작성자</span> 
				<input id="id" name="id" type="text" class="form-control" placeholder="">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">글제목</span> 
				<input id="subject" name="subject" type="text" class="form-control" placeholder="">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">글내용</span> 
				<input id="content" name="content" type="text" class="form-control" placeholder="">
			</div>  
			<div class="input-group">
				<span class="input-group-text col-md-2">등록 일자</span> 
				<input id="regdate" name="regdate" type="datetime" class="form-control" placeholder="">
			</div>
			<div id="buttonset" class="input-group">
				<button type="submit" class="btn btn-primary btn-lg"
					onclick="return validCheck();">
					등록 
				</button>
				&nbsp;&nbsp;&nbsp;
				<button type="reset" class="btn btn-secondary btn-lg">초기화</button>
			</div>
		</form>
	</div>
</body>
</html>