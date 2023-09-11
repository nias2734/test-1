<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/common/common.jsp" %>
<%@ include file="/common/bootstrap5.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript">
		$(document).ready(function() {	
			var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
			var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
				return new bootstrap.Tooltip(tooltipTriggerEl)
			});		
		});
	</script>
</head>
<body>
	<br/>
	<div class="container">
		<h2>로그인 페이지</h2>
		<p>로그인을 위한 페이지입니다.</p>
		<form action="<%=withFormTag%>" method="post">
			<input type="hidden" name="command" value="meLogin"> 
			<div> 
				<label for="id" class="form-label">아이디 :</label> 
				<input type="text" class="form-control" id="id" name="id" 
					placeholder="아이디를 입력해 주세요."
					data-bs-toggle="tooltip" title="아이디는 3글자 이상 10글자 이하이어야 합니다."
					data-bs-placement="top" value="kim">
			</div>
			<div>
				<label for="password" class="form-label">비밀 번호 :</label> 
				<input class="form-control" type="password" 
					id="password" name="password" value="abc123">
			</div>
			
			<!-- contextual class : btn-primary, btn-info, btn-danger -->
			<button type="submit" class="btn btn-primary">로그인</button> 
			<a type="button" href="meInsertForm.jsp" class="btn btn-info">회원 가입</a>							
		</form>
	</div>
</body>
</html>