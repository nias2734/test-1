<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./../common/bootstrap5.jsp" %>
<%@ include file="./../common/common.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h2>회원 목록</h2>
		<p>회원 목록을 보여 주는 페이지입니다.</p>		
		<table class="table table-hover">
			<!-- table-hover, table-striped, table-condensed  -->
			<thead>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>비밀 번호</th>
					<th>성별</th>
					<th>생일</th>
					<th>결혼 여부</th>
					<th>급여</th>
					<th>주소</th>
					<th>매니저</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td align="center">hong</td>
					<td>홍길동</td>
					<td>abc123</td>
					<td>남자</td>
					<td>2023/03/01</td>
					<td>미혼</td>
					<td>1,000</td>
					<td>마포</td>
					<td>kim9</td>
				</tr>
				<tr>
					<td align="center">park</td>
					<td>박영희</td>
					<td>def456</td>
					<td>여자</td>
					<td>2023/08/15</td>
					<td>결혼</td>
					<td>2,000</td>
					<td>용산</td>
					<td>soon</td>
				</tr>	
				<tr>
					<td align="center">kang</td>
					<td>강우식</td>
					<td>abc123</td>
					<td>남자</td>
					<td>2023/03/01</td>
					<td>미혼</td>
					<td>1,000</td>
					<td>마포</td>
					<td>kim9</td>
				</tr>
				<tr>
					<td align="center">choi</td>
					<td>최문숙</td>
					<td>def456</td>
					<td>여자</td>
					<td>2023/08/15</td>
					<td>결혼</td>
					<td>2,000</td>
					<td>용산</td>
					<td>soon</td>
				</tr>
			</tbody>
		</table>
		<!-- 
			ol : ordered list
			ul : unordered list
			li : list
		 -->		 
		<ul class="pagination">
			<li class="page-item">
				<a class="page-link" href="#">이전</a>				
			</li>
			<li class="page-item">
				<a class="page-link" href="#">1</a>				
			</li>
			<li class="page-item active">
				<a class="page-link" href="#">2</a>				
			</li>
			<li class="page-item">
				<a class="page-link" href="#">3</a>				
			</li>
			<li class="page-item disabled">
				<a class="page-link" href="#">4</a>				
			</li>
			<li class="page-item">
				<a class="page-link" href="#">5</a>				
			</li>
			<li class="page-item">
				<a class="page-link" href="#">다음</a>				
			</li>			
		</ul>	
	</div>	 
</body>
</html>