<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/bootstrap5.jsp" %>
<%@ include file="./../common/common.jsp" %>
<%@page import="com.shopping.model.bean.Board"%>
<%@page import="com.shopping.model.dao.BoardDao"%>	
<%
	BoardDao dao = new BoardDao();
	List<Board> lists = dao.getDataList();	
	
	request.setAttribute("datalist", lists);
%>	    
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
		<p>사용자들이 게시한 목록을 보여 주는 페이지</p>	
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
				<c:forEach var="bean" items="${requestScope.datalist}"> 
				<tr>
					<td>${bean.no}</td>
					<td>${bean.id}</td>
					<td>${bean.password}</td>
					<td>
						<c:forEach var="i" begin="1" end="${bean.depth}" step="1">
							<span class="badge rounded-pill bg-secondary">re</span>
						</c:forEach>
						${bean.subject}
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
	</div>	 
</body>
</html>