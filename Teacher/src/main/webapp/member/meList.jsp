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
		tr{opacity: 0.7;}
	</style>	
</head>
<body>
	<div class="container">
		<h2>회원 목록</h2>
		<p>회원 목록을 보여 주는 페이지입니다.</p>		
		<table class="table table-hover">
			<thead class="table-dark">
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
				<tr><td colspan="9" align="right">${requestScope.pageInfo.pagingStatus}</td></tr>
				<c:forEach var="bean" items="${datalist}">
				<c:choose>
					<c:when test="${bean.marriage eq '결혼'}">
						<tr class="table-primary">
					</c:when>
					<c:when test="${bean.marriage eq '이혼'}">
						<tr class="table-success">
					</c:when>
					<c:otherwise>
						<tr class="table-danger">
					</c:otherwise>
				</c:choose> 
				
					<td align="center">${bean.id}</td>
					<td>
						<a href="<%=notWithFormTag%>meDetail&id=${bean.id}">${bean.name}</a>						
					</td>
					<td>${bean.password}</td>

					<c:if test="${bean.gender eq 'male'}">
						<td>남자</td>
					</c:if>	
					<c:if test="${bean.gender eq 'female'}">
						<td>여자</td>
					</c:if>
										
					<td>${bean.birth}</td>
					<td>${bean.marriage}</td>
					<td>${bean.salary}</td>
					<td>${bean.address}</td>
					<td>${bean.manager}</td>					
				</tr>
				</c:forEach>
			</tbody>
		</table>	
		${requestScope.pageInfo.pagingHtml} 	 
	</div>	 
</body>
</html>