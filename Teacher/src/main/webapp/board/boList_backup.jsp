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
		.container{margin-top: 10px;}
		.rounded-pill{opacity: 0.7;}
	</style>
</head>
<body>
	<div class="container">
		<h2>게시물 목록</h2>
		<p>사용자들이 게시한 게시물 목록을 보여 주는 페이지입니다.</p>	
		<table class="table table-striped">
			<thead>
				<tr>
					<th>글번호</th>
					<th>작성자</th>
					<th>비밀 번호</th>
					<th>글제목</th>
					<th>글내용</th>					
					<th>조회수</th>
					<th>작성 일자</th>					
				</tr>
			</thead>
			<tbody>
				<tr><td colspan="7" align="right">${requestScope.pageInfo.pagingStatus}</td></tr>
				<c:forEach var="bean" items="${requestScope.datalist}"> 
				<tr>
					<td>${bean.no}</td>
					<td>${bean.id}</td>
					<td>${bean.password}</td>
					<td>
						<a href="<%=notWithFormTag%>boDetail&no=${bean.no}">
							<c:forEach var="i" begin="1" end="${bean.depth}" step="1">
								<span class="badge rounded-pill bg-secondary">re</span>
							</c:forEach>
							${bean.subject}
						</a>
					</td>
					<td>${bean.content}</td>
					<td>
						<c:if test="${bean.readhit >= 30}">
							<span class="badge rounded-pill bg-primary">
								${bean.readhit}
							</span>
						</c:if>
						<c:if test="${bean.readhit < 30}">
							<span class="badge rounded-pill bg-danger">
								${bean.readhit}
							</span>
						</c:if>						
					</td>
					<td>${bean.regdate}</td>							
				</tr>
				</c:forEach>				 
			</tbody>
		</table>
		${requestScope.pageInfo.pagingHtml} 
	</div>	 
</body>
</html>