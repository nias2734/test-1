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
		<h2>게시물 목록</h2>
		<p>사용자들이 게시한 목록을 보여 주는 페이지</p>	
		<table class="table table-striped">
			<thead>
				<tr>
					<th>글번호</th>
					<th>작성자</th>
					<th>비밀 번호</th>
					<th>글제목</th>
					<th>글내용</th>
					<th>작성 일자</th>
					<th>조회수</th>					
				</tr>
			</thead>
			<tbody>
				<tr>
					<td align="center">1</td>
					<td>김철수</td>
					<td>abc</td>
					<td>자바 공부</td>
					<td>자바 어려워요ㅜㅜ</td>
					<td>2023/02/10</td>
					<td>
						<span class="badge">11</span>
					</td>
				</tr>
				<tr>
					<td align="center">2</td>
					<td>박영희</td>
					<td>def</td>
					<td>파이썬 공부</td>
					<td>판다스 입문</td>
					<td>2023/03/01</td>
					<td>
						<span class="badge">22</span>
					</td>
				</tr>
				<tr>
					<td align="center">3</td>
					<td>이순신</td>
					<td>ghi</td>
					<td>오라클</td>
					<td>데이터 베이스 입문</td>
					<td>2023/02/25</td>
					<td>
						<span class="badge">33</span>
					</td>
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